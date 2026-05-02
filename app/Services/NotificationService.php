<?php

class NotificationService
{
    public function getUserNotifications(int $userId): array
    {
        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | SELECT * FROM notifications WHERE user_id = :user_id ORDER BY created_at DESC
        */

        return [
            [
                'id' => 1,
                'user_id' => $userId,
                'type' => 'order_status_changed',
                'title' => 'Sipariş durumun güncellendi',
                'message' => 'EKG-20260502-DEMO1 numaralı siparişin hazırlanıyor durumuna alındı.',
                'is_read' => false,
                'created_at' => '2026-05-02 14:30:00',
            ],
            [
                'id' => 2,
                'user_id' => $userId,
                'type' => 'restock_alert',
                'title' => 'Favori ürününde stok var',
                'message' => 'Kumluca Domatesi tekrar stokta.',
                'is_read' => true,
                'created_at' => '2026-05-02 12:10:00',
            ],
        ];
    }

    public function create(int $userId, string $type, string $title, string $message, array $data = []): array
    {
        if ($userId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir kullanıcı ID değeri gönderilmelidir.',
            ];
        }

        if (trim($type) === '' || trim($title) === '' || trim($message) === '') {
            return [
                'success' => false,
                'message' => 'Bildirim tipi, başlığı ve mesajı zorunludur.',
            ];
        }

        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda notifications tablosuna kayıt atılacak.
        */

        return [
            'success' => true,
            'message' => 'Bildirim oluşturuldu. Demo servis cevabıdır.',
            'data' => [
                'id' => random_int(1000, 9999),
                'user_id' => $userId,
                'type' => $type,
                'title' => $title,
                'message' => $message,
                'data_json' => $data,
                'is_read' => false,
                'created_at' => date('Y-m-d H:i:s'),
            ],
        ];
    }

    public function markAsRead(int $userId, int $notificationId): array
    {
        if ($notificationId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir bildirim ID değeri gönderilmelidir.',
            ];
        }

        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | 1. Bildirim current user’a ait mi kontrol edilecek.
        | 2. is_read = 1 yapılacak.
        | 3. read_at = NOW() atanacak.
        */

        return [
            'success' => true,
            'message' => 'Bildirim okundu olarak işaretlendi. Demo servis cevabıdır.',
            'data' => [
                'user_id' => $userId,
                'notification_id' => $notificationId,
                'is_read' => true,
                'read_at' => date('Y-m-d H:i:s'),
            ],
        ];
    }

    public function markAllAsRead(int $userId): array
    {
        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | UPDATE notifications SET is_read = 1, read_at = NOW()
        | WHERE user_id = :user_id AND is_read = 0
        */

        return [
            'success' => true,
            'message' => 'Tüm bildirimler okundu olarak işaretlendi. Demo servis cevabıdır.',
            'data' => [
                'user_id' => $userId,
            ],
        ];
    }

    public function unreadCount(int $userId): int
    {
        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | SELECT COUNT(*) FROM notifications WHERE user_id = :user_id AND is_read = 0
        */

        return 1;
    }
}