<?php

class Notification
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO notifications (
                user_id,
                type,
                title,
                message,
                data_json,
                is_read
            ) VALUES (
                :user_id,
                :type,
                :title,
                :message,
                :data_json,
                :is_read
            )
        ");

        $stmt->execute([
            'user_id' => $data['user_id'],
            'type' => $data['type'],
            'title' => $data['title'],
            'message' => $data['message'],
            'data_json' => !empty($data['data_json'])
                ? json_encode($data['data_json'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES)
                : null,
            'is_read' => !empty($data['is_read']) ? 1 : 0,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function getByUserId(int $userId, int $limit = 30): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM notifications
            WHERE user_id = :user_id
            ORDER BY created_at DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        return $stmt->fetchAll();
    }

    public static function unreadCount(int $userId): int
    {
        $stmt = db()->prepare("
            SELECT COUNT(*) AS total
            FROM notifications
            WHERE user_id = :user_id
              AND is_read = 0
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        $row = $stmt->fetch();

        return (int) ($row['total'] ?? 0);
    }

    public static function markAsRead(int $userId, int $notificationId): void
    {
        $stmt = db()->prepare("
            UPDATE notifications
            SET is_read = 1,
                read_at = NOW()
            WHERE id = :id
              AND user_id = :user_id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $notificationId,
            'user_id' => $userId,
        ]);
    }

    public static function markAllAsRead(int $userId): void
    {
        $stmt = db()->prepare("
            UPDATE notifications
            SET is_read = 1,
                read_at = NOW()
            WHERE user_id = :user_id
              AND is_read = 0
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);
    }

    public static function createOrderStatusChanged(
        int $userId,
        string $orderNo,
        string $status
    ): int {
        return self::create([
            'user_id' => $userId,
            'type' => 'order_status_changed',
            'title' => 'Sipariş durumun güncellendi',
            'message' => $orderNo . ' numaralı siparişin yeni durumu: ' . $status,
            'data_json' => [
                'order_no' => $orderNo,
                'status' => $status,
            ],
        ]);
    }
}