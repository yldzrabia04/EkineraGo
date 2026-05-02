<?php

class OrderItem
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO order_items (
                order_id,
                product_id,
                product_title_snapshot,
                unit_type_snapshot,
                quantity,
                unit_price,
                total_price,
                harvest_date_snapshot
            ) VALUES (
                :order_id,
                :product_id,
                :product_title_snapshot,
                :unit_type_snapshot,
                :quantity,
                :unit_price,
                :total_price,
                :harvest_date_snapshot
            )
        ");

        $stmt->execute([
            'order_id' => $data['order_id'],
            'product_id' => $data['product_id'] ?? null,
            'product_title_snapshot' => $data['product_title_snapshot'],
            'unit_type_snapshot' => $data['unit_type_snapshot'],
            'quantity' => $data['quantity'],
            'unit_price' => $data['unit_price'],
            'total_price' => $data['total_price'],
            'harvest_date_snapshot' => $data['harvest_date_snapshot'] ?? null,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function createFromCartItem(int $orderId, array $cartItem): int
    {
        $quantity = (float) ($cartItem['quantity'] ?? 0);
        $unitPrice = (float) ($cartItem['price'] ?? 0);

        return self::create([
            'order_id' => $orderId,
            'product_id' => $cartItem['product_id'] ?? null,
            'product_title_snapshot' => $cartItem['title'] ?? 'Ürün',
            'unit_type_snapshot' => $cartItem['unit_type'] ?? 'kg',
            'quantity' => $quantity,
            'unit_price' => $unitPrice,
            'total_price' => $quantity * $unitPrice,
            'harvest_date_snapshot' => $cartItem['harvest_date'] ?? null,
        ]);
    }

    public static function getByOrderId(int $orderId): array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM order_items
            WHERE order_id = :order_id
            ORDER BY id ASC
        ");

        $stmt->execute([
            'order_id' => $orderId,
        ]);

        return $stmt->fetchAll();
    }

    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM order_items
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $orderItem = $stmt->fetch();

        return $orderItem ?: null;
    }

    public static function belongsToConsumer(int $orderItemId, int $consumerId): bool
    {
        $stmt = db()->prepare("
            SELECT oi.id
            FROM order_items oi
            JOIN orders o ON o.id = oi.order_id
            WHERE oi.id = :order_item_id
              AND o.consumer_id = :consumer_id
            LIMIT 1
        ");

        $stmt->execute([
            'order_item_id' => $orderItemId,
            'consumer_id' => $consumerId,
        ]);

        return (bool) $stmt->fetch();
    }
}