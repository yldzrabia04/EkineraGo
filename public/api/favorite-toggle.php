<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!isLoggedIn()) {
    json_response([
        'success' => false,
        'message' => 'Favori işlemi için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    json_response([
        'success' => false,
        'message' => 'Favori işlemini sadece tüketici hesapları yapabilir.',
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

$productId = (int) ($_POST['product_id'] ?? 0);

if ($productId <= 0) {
    json_response([
        'success' => false,
        'message' => 'Geçerli bir ürün ID değeri gönderilmelidir.',
    ], 422);
}

$product = Product::findById($productId);

if (!$product || ($product['status'] ?? '') === PRODUCT_STATUS_DELETED) {
    json_response([
        'success' => false,
        'message' => 'Ürün bulunamadı.',
    ], 404);
}

try {
    $isFavorited = Favorite::toggle((int) currentUserId(), $productId);
    Product::updateFavoriteCount($productId);

    json_response([
        'success' => true,
        'message' => $isFavorited ? 'Ürün favorilere eklendi.' : 'Ürün favorilerden çıkarıldı.',
        'data' => [
            'product_id' => $productId,
            'is_favorited' => $isFavorited,
            'favorite_count' => Favorite::countByProductId($productId),
        ],
    ]);
} catch (Throwable $e) {
    json_response([
        'success' => false,
        'message' => 'Favori işlemi sırasında bir hata oluştu.',
    ], 500);
}