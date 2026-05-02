<?php

class NotificationController
{
    public function index(): void
    {
        ConsumerMiddleware::handle();

        $pageTitle = 'Bildirimler';
        $bodyClass = 'page-consumer-notifications';

        require APP_PATH . '/Views/layouts/header.php';

        echo '<main class="container">';
        echo '<section class="card">';
        echo '<h1>Bildirimler</h1>';
        echo '<p>NotificationController çalışıyor. Gerçek bildirim listesi NotificationService bağlanınca aktif olacak.</p>';
        echo '<a class="btn" href="' . e(url('consumer/dashboard.php')) . '">Panele Dön</a>';
        echo '</section>';
        echo '</main>';

        require APP_PATH . '/Views/layouts/footer.php';
    }

    public function markAsRead(): void
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

        $notificationId = (int) ($_POST['notification_id'] ?? 0);

        if ($notificationId <= 0) {
            json_response([
                'success' => false,
                'message' => 'Geçerli bir bildirim ID değeri gönderilmelidir.',
            ], 422);
        }

        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | NotificationService bağlandığında burada:
        | 1. Bildirim currentUserId() kullanıcısına mı ait kontrol edilecek.
        | 2. is_read = 1 yapılacak.
        | 3. read_at = NOW() atanacak.
        */

        json_response([
            'success' => true,
            'message' => 'NotificationController markAsRead metodu çalışıyor. Gerçek güncelleme NotificationService ile bağlanacak.',
            'data' => [
                'notification_id' => $notificationId,
                'is_read' => true,
            ],
        ]);
    }
}