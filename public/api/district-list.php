<?php

require_once __DIR__ . '/../../app/bootstrap.php';

$provinceId = (int) ($_GET['province_id'] ?? 0);

if ($provinceId <= 0) {
    json_response([
        'success' => false,
        'message' => 'Geçerli bir il ID değeri gönderilmelidir.',
        'data' => [],
    ], 422);
}

try {
    $stmt = db()->prepare("
        SELECT
            id,
            name
        FROM districts
        WHERE province_id = :province_id
        ORDER BY name ASC
    ");

    $stmt->execute([
        'province_id' => $provinceId,
    ]);

    $districts = $stmt->fetchAll();

    json_response([
        'success' => true,
        'message' => 'İlçe listesi getirildi.',
        'data' => $districts,
    ]);
} catch (Throwable $e) {
    json_response([
        'success' => false,
        'message' => 'İlçe listesi alınırken bir hata oluştu. districts tablosunu kontrol edin.',
        'data' => [],
    ], 500);
}