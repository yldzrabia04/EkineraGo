<?php

class CartController
{
    public function index(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Sepetim';
        $bodyClass = 'page-cart';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Sepetim</h1>';
        echo '<p>CartController çalışıyor. Gerçek sepet listeleme CartService bağlanınca aktif olacak.</p>';
        echo '<a class="btn" href="' . e(url('products.php')) . '">Ürünlere Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function add(): void
    {
        ConsumerMiddleware::handle();

        if (!is_post()) {
            json_response([
                'success' => false,
                'message' => 'Sadece POST isteği kabul edilir.',
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

        if ($productId <= 0 || $quantity <= 0) {
            json_response([
                'success' => false,
                'message' => 'Geçerli ürün ve miktar bilgisi gönderilmelidir.',
            ], 422);
        }

        json_response([
            'success' => true,
            'message' => 'CartController add metodu çalışıyor. Gerçek kayıt CartService ile bağlanacak.',
            'data' => [
                'product_id' => $productId,
                'quantity' => $quantity,
            ],
        ]);
    }

    public function update(): void
    {
        ConsumerMiddleware::handle();

        if (!is_post()) {
            json_response([
                'success' => false,
                'message' => 'Sadece POST isteği kabul edilir.',
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

        if ($cartItemId <= 0 || $quantity <= 0) {
            json_response([
                'success' => false,
                'message' => 'Geçerli sepet ürünü ve miktar bilgisi gönderilmelidir.',
            ], 422);
        }

        json_response([
            'success' => true,
            'message' => 'CartController update metodu çalışıyor. Gerçek güncelleme CartService ile bağlanacak.',
            'data' => [
                'cart_item_id' => $cartItemId,
                'quantity' => $quantity,
            ],
        ]);
    }

    public function remove(): void
    {
        ConsumerMiddleware::handle();

        if (!is_post()) {
            json_response([
                'success' => false,
                'message' => 'Sadece POST isteği kabul edilir.',
            ], 405);
        }

        if (!verify_csrf()) {
            json_response([
                'success' => false,
                'message' => 'CSRF doğrulaması başarısız.',
            ], 419);
        }

        $cartItemId = (int) ($_POST['cart_item_id'] ?? 0);

        if ($cartItemId <= 0) {
            json_response([
                'success' => false,
                'message' => 'Geçerli sepet ürünü ID değeri gönderilmelidir.',
            ], 422);
        }

        json_response([
            'success' => true,
            'message' => 'CartController remove metodu çalışıyor. Gerçek silme CartService ile bağlanacak.',
            'data' => [
                'cart_item_id' => $cartItemId,
                'removed' => true,
            ],
        ]);
    }
}