<?php

class Notification
{
    public static function create(array $data): int
    {
        $payload = self::normalizeDataJson($data);

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
            'user_id' => (int) ($data['user_id'] ?? 0),
            'type' => (string) ($data['type'] ?? 'system'),
            'title' => (string) ($data['title'] ?? 'Bildirim'),
            'message' => (string) ($data['message'] ?? ''),
            'data_json' => $payload,
            'is_read' => !empty($data['is_read']) ? 1 : 0,
        ]);

        return (int) db()->lastInsertId();
    }

    private static function normalizeDataJson(array $data): ?string
    {
        $payload = null;

        if (array_key_exists('data_json', $data)) {
            $payload = $data['data_json'];
        } elseif (array_key_exists('data', $data)) {
            $payload = $data['data'];
        }

        if ($payload === null || $payload === '' || $payload === []) {
            return null;
        }

        if (is_string($payload)) {
            $decoded = json_decode($payload, true);

            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                return json_encode($decoded, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
            }

            return $payload;
        }

        if (is_array($payload) || is_object($payload)) {
            return json_encode($payload, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        }

        return null;
    }

    public static function getByUserId(int $userId, int $limit = 30): array
    {
        $limit = max(1, min($limit, 100));

        $stmt = db()->prepare("
            SELECT *
            FROM notifications
            WHERE user_id = :user_id
            ORDER BY created_at DESC, id DESC
            LIMIT {$limit}
        ");

        $stmt->execute([
            'user_id' => $userId,
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
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

        $row = $stmt->fetch(PDO::FETCH_ASSOC);

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
                'link' => 'consumer/orders.php',
            ],
        ]);
    }

    public static function createNeighborhoodBasketInvite(
        int $userId,
        int $basketId,
        int $invitationId,
        string $token,
        string $basketTitle,
        string $inviterName
    ): int {
        return self::create([
            'user_id' => $userId,
            'type' => 'neighborhood_basket_invite',
            'title' => 'Mahalle Sepeti Daveti',
            'message' => $inviterName . ' seni "' . $basketTitle . '" Mahalle Sepetine davet etti.',
            'data_json' => [
                'basket_id' => $basketId,
                'invitation_id' => $invitationId,
                'token' => $token,
                'link' => 'neighborhood-baskets.php?action=accept-invite&token=' . $token,
            ],
        ]);
    }

    public static function createNeighborhoodBasketJoined(
        int $creatorUserId,
        int $basketId,
        string $basketTitle,
        string $memberName,
        float $quantity,
        string $unitType
    ): int {
        return self::create([
            'user_id' => $creatorUserId,
            'type' => 'neighborhood_basket_joined',
            'title' => 'Mahalle Sepetine katılım oldu',
            'message' => $memberName . ' "' . $basketTitle . '" sepetine ' . self::formatQuantity($quantity) . ' ' . $unitType . ' ile katıldı.',
            'data_json' => [
                'basket_id' => $basketId,
                'quantity' => $quantity,
                'unit_type' => $unitType,
                'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
            ],
        ]);
    }

    public static function createNeighborhoodBasketReady(
        int $creatorUserId,
        int $basketId,
        string $basketTitle
    ): int {
        return self::create([
            'user_id' => $creatorUserId,
            'type' => 'neighborhood_basket_ready',
            'title' => 'Mahalle Sepeti hedefe ulaştı',
            'message' => '"' . $basketTitle . '" sepeti minimum miktara ulaştı. Toplu siparişi onaylayabilirsin.',
            'data_json' => [
                'basket_id' => $basketId,
                'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
            ],
        ]);
    }

    public static function createNeighborhoodBasketOrdered(
        int $userId,
        int $basketId,
        int $orderId,
        string $basketTitle,
        float $amount
    ): int {
        return self::create([
            'user_id' => $userId,
            'type' => 'neighborhood_basket_ordered',
            'title' => 'Mahalle Sepeti siparişe dönüştü',
            'message' => '"' . $basketTitle . '" Mahalle Sepeti için toplu sipariş oluşturuldu. Payına düşen tutar: ' . self::formatMoney($amount) . '.',
            'data_json' => [
                'basket_id' => $basketId,
                'order_id' => $orderId,
                'amount' => $amount,
                'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
            ],
        ]);
    }

    public static function createNeighborhoodBasketProducerOrder(
        int $producerId,
        int $basketId,
        int $orderId,
        string $basketTitle,
        float $totalAmount
    ): int {
        return self::create([
            'user_id' => $producerId,
            'type' => 'new_order',
            'title' => 'Yeni Mahalle Sepeti siparişi',
            'message' => '"' . $basketTitle . '" Mahalle Sepeti toplu siparişe dönüştü. Toplam tutar: ' . self::formatMoney($totalAmount) . '.',
            'data_json' => [
                'basket_id' => $basketId,
                'order_id' => $orderId,
                'order_type' => 'neighborhood_basket',
                'total_amount' => $totalAmount,
                'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
            ],
        ]);
    }

    public static function createNeighborhoodBasketGeneric(
        int $userId,
        string $type,
        string $title,
        string $message,
        int $basketId,
        array $extraData = []
    ): int {
        return self::create([
            'user_id' => $userId,
            'type' => $type,
            'title' => $title,
            'message' => $message,
            'data_json' => array_merge([
                'basket_id' => $basketId,
                'link' => 'neighborhood-baskets.php?action=show&id=' . $basketId,
            ], $extraData),
        ]);
    }

    private static function formatMoney(float $amount): string
    {
        return number_format($amount, 2, ',', '.') . ' TL';
    }

    private static function formatQuantity(float $quantity): string
    {
        return number_format($quantity, 2, ',', '.');
    }
}
