<?php

class OrderController
{
    public function consumerIndex(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Siparişlerim';
        $bodyClass = 'page-consumer-orders';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Siparişlerim</h1>';
        echo '<p>OrderController consumerIndex metodu çalışıyor. Gerçek tüketici sipariş listesi OrderService ile bağlanacak.</p>';
        echo '<a class="btn" href="' . e(url('consumer/dashboard.php')) . '">Panele Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function producerIndex(): void
    {
        ProducerMiddleware::handle();

        $pageTitle = 'Gelen Siparişler';
        $bodyClass = 'page-producer-orders';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Gelen Siparişler</h1>';
        echo '<p>OrderController producerIndex metodu çalışıyor. Gerçek üretici sipariş listesi OrderService ile bağlanacak.</p>';
        echo '<a class="btn" href="' . e(url('producer/dashboard.php')) . '">Panele Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function updateStatus(): void
    {
        ProducerMiddleware::handle();

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

        $orderId = (int) ($_POST['order_id'] ?? 0);
        $status = trim($_POST['order_status'] ?? '');

        if ($orderId <= 0 || $status === '') {
            json_response([
                'success' => false,
                'message' => 'Geçerli sipariş ve durum bilgisi gönderilmelidir.',
            ], 422);
        }

        json_response([
            'success' => true,
            'message' => 'OrderController updateStatus metodu çalışıyor. Gerçek durum güncelleme OrderService ile bağlanacak.',
            'data' => [
                'order_id' => $orderId,
                'order_status' => $status,
            ],
        ]);
    }
}