<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!isLoggedIn()) {
    json_response([
        'success' => false,
        'message' => 'Stok bildirimi için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    json_response([
        'success' => false,
        'message' => 'Stok bildirimi işlemini sadece tüketici hesapları yapabilir.',
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

$userId = (int) currentUserId();
$productId = (int) ($_POST['product_id'] ?? 0);

if ($productId <= 0) {
    json_response([
        'success' => false,
        'message' => 'Geçerli bir ürün ID değeri gönderilmelidir.',
    ], 422);
}

try {
    $product = Product::findById($productId);

    if (!$product || !empty($product['deleted_at'])) {
        json_response([
            'success' => false,
            'message' => 'Ürün bulunamadı.',
        ], 404);
    }

    if ((float) ($product['stock_quantity'] ?? 0) > 0) {
        json_response([
            'success' => false,
            'message' => 'Bu ürün zaten stokta.',
        ], 422);
    }

    $stmt = db()->prepare("
        SELECT id, status
        FROM restock_alerts
        WHERE user_id = :user_id
          AND product_id = :product_id
          AND status = 'waiting'
        LIMIT 1
    ");

    $stmt->execute([
        'user_id' => $userId,
        'product_id' => $productId,
    ]);

    $existingAlert = $stmt->fetch();

    if ($existingAlert) {
        json_response([
            'success' => true,
            'message' => 'Bu ürün için stok bildiriminiz zaten aktif.',
            'data' => [
                'product_id' => $productId,
                'alert_created' => false,
                'status' => 'waiting',
            ],
        ]);
    }

    $stmt = db()->prepare("
        INSERT INTO restock_alerts (
            user_id,
            product_id,
            status
        ) VALUES (
            :user_id,
            :product_id,
            'waiting'
        )
    ");

    $stmt->execute([
        'user_id' => $userId,
        'product_id' => $productId,
    ]);

    json_response([
        'success' => true,
        'message' => 'Stok bildirimi oluşturuldu. Ürün tekrar stoğa girince bilgilendirileceksiniz.',
        'data' => [
            'product_id' => $productId,
            'alert_created' => true,
            'status' => 'waiting',
        ],
    ]);
} catch (Throwable $e) {
    json_response([
        'success' => false,
        'message' => 'Stok bildirimi oluşturulurken bir hata oluştu. restock_alerts tablosunu kontrol edin.',
    ], 500);
}