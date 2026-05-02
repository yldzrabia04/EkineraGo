<?php

class WalletController
{
    public function index(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Sanal Bakiye';
        $bodyClass = 'page-consumer-wallet';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Sanal Bakiye</h1>';
        echo '<p>WalletController çalışıyor. Gerçek bakiye işlemleri WalletService bağlanınca aktif olacak.</p>';
        echo '<a class="btn" href="' . e(url('consumer/dashboard.php')) . '">Panele Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function deposit(): void
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

        $amount = (float) ($_POST['amount'] ?? 0);

        if ($amount <= 0) {
            json_response([
                'success' => false,
                'message' => 'Yüklenecek tutar 0’dan büyük olmalıdır.',
            ], 422);
        }

        json_response([
            'success' => true,
            'message' => 'WalletController deposit metodu çalışıyor. Gerçek bakiye yükleme WalletService ile bağlanacak.',
            'data' => [
                'amount' => $amount,
            ],
        ]);
    }
}