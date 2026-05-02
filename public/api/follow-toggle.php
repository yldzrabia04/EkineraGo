<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!isLoggedIn()) {
    json_response([
        'success' => false,
        'message' => 'Üretici takip işlemi için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    json_response([
        'success' => false,
        'message' => 'Üretici takip işlemini sadece tüketici hesapları yapabilir.',
    ], 403);
}

if (!is_post()) {
    json_response([
        'success' => false,
        'message' => 'Bu endpoint sadece POST isteği kabul eder.',
    ], 405);
}

if (!verify_csrf()) {
    json_response([
        'success' => false,
        'message' => 'CSRF doğrulaması başarısız.',
    ], 419);
}

$consumerId = (int) currentUserId();
$producerId = (int) ($_POST['producer_id'] ?? 0);

if ($producerId <= 0) {
    json_response([
        'success' => false,
        'message' => 'Geçerli bir üretici ID değeri gönderilmelidir.',
    ], 422);
}

if ($producerId === $consumerId) {
    json_response([
        'success' => false,
        'message' => 'Kendi hesabınızı takip edemezsiniz.',
    ], 422);
}

try {
    $stmt = db()->prepare("
        SELECT id, role, status, deleted_at
        FROM users
        WHERE id = :id
        LIMIT 1
    ");

    $stmt->execute([
        'id' => $producerId,
    ]);

    $producer = $stmt->fetch();

    if (
        !$producer ||
        ($producer['role'] ?? '') !== ROLE_PRODUCER ||
        !empty($producer['deleted_at']) ||
        ($producer['status'] ?? '') !== 'active'
    ) {
        json_response([
            'success' => false,
            'message' => 'Üretici bulunamadı veya aktif değil.',
        ], 404);
    }

    $stmt = db()->prepare("
        SELECT consumer_id
        FROM producer_follows
        WHERE consumer_id = :consumer_id
          AND producer_id = :producer_id
        LIMIT 1
    ");

    $stmt->execute([
        'consumer_id' => $consumerId,
        'producer_id' => $producerId,
    ]);

    $exists = (bool) $stmt->fetch();

    if ($exists) {
        $stmt = db()->prepare("
            DELETE FROM producer_follows
            WHERE consumer_id = :consumer_id
              AND producer_id = :producer_id
        ");

        $stmt->execute([
            'consumer_id' => $consumerId,
            'producer_id' => $producerId,
        ]);

        json_response([
            'success' => true,
            'message' => 'Üretici takibi bırakıldı.',
            'data' => [
                'producer_id' => $producerId,
                'is_following' => false,
            ],
        ]);
    }

    $stmt = db()->prepare("
        INSERT INTO producer_follows (
            consumer_id,
            producer_id
        ) VALUES (
            :consumer_id,
            :producer_id
        )
    ");

    $stmt->execute([
        'consumer_id' => $consumerId,
        'producer_id' => $producerId,
    ]);

    try {
        Notification::create([
            'user_id' => $producerId,
            'type' => 'producer_followed',
            'title' => 'Yeni takipçiniz var',
            'message' => 'Bir tüketici üretici profilinizi takip etmeye başladı.',
            'data_json' => [
                'consumer_id' => $consumerId,
            ],
        ]);
    } catch (Throwable $e) {
        // Bildirim hatası takip işlemini bozmasın.
    }

    json_response([
        'success' => true,
        'message' => 'Üretici takip edildi.',
        'data' => [
            'producer_id' => $producerId,
            'is_following' => true,
        ],
    ]);
} catch (Throwable $e) {
    json_response([
        'success' => false,
        'message' => 'Takip işlemi sırasında bir hata oluştu. producer_follows tablosunu kontrol edin.',
    ], 500);
}