<?php

class FavoriteController
{
    public function index(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Favorilerim';
        $bodyClass = 'page-consumer-favorites';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Favorilerim</h1>';
        echo '<p>FavoriteController çalışıyor. Gerçek favori listesi FavoriteService bağlanınca aktif olacak.</p>';
        echo '<a class="btn" href="' . e(url('products.php')) . '">Ürünlere Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function toggle(): void
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

        if ($productId <= 0) {
            json_response([
                'success' => false,
                'message' => 'Geçerli bir ürün ID değeri gönderilmelidir.',
            ], 422);
        }

        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | FavoriteService bağlandığında burada:
        | 1. favorites tablosunda kayıt var mı bakılacak.
        | 2. Varsa silinecek, yoksa eklenecek.
        | 3. products.favorite_count güncellenecek.
        */

        json_response([
            'success' => true,
            'message' => 'FavoriteController toggle metodu çalışıyor. Gerçek favori işlemi servis bağlanınca aktif olacak.',
            'data' => [
                'product_id' => $productId,
                'is_favorited' => true,
            ],
        ]);
    }
}