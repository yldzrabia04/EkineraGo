<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!isLoggedIn()) {
    json_response([
        'success' => false,
        'message' => 'Sepete ürün eklemek için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    json_response([
        'success' => false,
        'message' => 'Sepete ürün ekleme işlemini sadece tüketici hesapları yapabilir.',
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
$quantity = (float) ($_POST['quantity'] ?? 0);

$cartService = new CartService();
$result = $cartService->addItem((int) currentUserId(), $productId, $quantity);

json_response($result, !empty($result['success']) ? 200 : 422);