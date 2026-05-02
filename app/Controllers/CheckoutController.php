<?php

class CheckoutController
{
    public function index(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Checkout';
        $bodyClass = 'page-checkout';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Checkout</h1>';
        echo '<p>CheckoutController çalışıyor. Gerçek satın alma akışı CheckoutService bağlanınca aktif olacak.</p>';
        echo '<a class="btn" href="' . e(url('cart.php')) . '">Sepete Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function store(): void
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

        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | CheckoutService bağlandığında burada:
        | 1. Aktif sepet çekilecek.
        | 2. Ürünler üretici bazlı gruplanacak.
        | 3. Stok kontrolü yapılacak.
        | 4. Bakiye kontrolü yapılacak.
        | 5. Transaction içinde siparişler oluşturulacak.
        */

        json_response([
            'success' => true,
            'message' => 'CheckoutController store metodu çalışıyor. Gerçek checkout akışı CheckoutService ile bağlanacak.',
        ]);
    }
}