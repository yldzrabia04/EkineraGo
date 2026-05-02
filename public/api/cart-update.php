<?php

require_once __DIR__ . '/../../app/bootstrap.php';

if (!isLoggedIn()) {
    json_response([
        'success' => false,
        'message' => 'Sepet işlemi için giriş yapmalısınız.',
    ], 401);
}

if (!isConsumer()) {
    json_response([
        'success' => false,
        'message' => 'Sepet güncelleme işlemini sadece tüketici hesapları yapabilir.',
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

$cartItemId = (int) ($_POST['cart_item_id'] ?? 0);
$quantity = (float) ($_POST['quantity'] ?? 0);

$cartService = new CartService();
$result = $cartService->updateItem((int) currentUserId(), $cartItemId, $quantity);

json_response($result, !empty($result['success']) ? 200 : 422);