<?php

class Order
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO orders (
                order_no,
                consumer_id,
                producer_id,
                address_id,
                order_type,
                subtotal,
                shipping_fee,
                discount_total,
                total_amount,
                payment_method,
                payment_status,
                order_status,
                customer_note,
                producer_note,
                tracking_no
            ) VALUES (
                :order_no,
                :consumer_id,
                :producer_id,
                :address_id,
                :order_type,
                :subtotal,
                :shipping_fee,
                :discount_total,
                :total_amount,
                :payment_method,
                :payment_status,
                :order_status,
                :customer_note,
                :producer_note,
                :tracking_no
            )
        ");

        $stmt->execute([
            'order_no' => $data['order_no'] ?? generateOrderNo(),
            'consumer_id' => $data['consumer_id'],
            'producer_id' => $data['producer_id'],
            'address_id' => $data['address_id'] ?? null,
            'order_type' => $data['order_type'] ?? 'normal',
            'subtotal' => $data['subtotal'] ?? 0,
            'shipping_fee' => $data['shipping_fee'] ?? 0,
            'discount_total' => $data['discount_total'] ?? 0,
            'total_amount' => $data['total_amount'] ?? 0,
            'payment_method' => $data['payment_method'] ?? PAYMENT_METHOD_VIRTUAL_BALANCE,
            'payment_status' => $data['payment_status'] ?? PAYMENT_STATUS_UNPAID,
            'order_status' => $data['order_status'] ?? ORDER_STATUS_PENDING,
            'customer_note' => $data['customer_note'] ?? null,
            'producer_note' => $data['producer_note'] ?? null,
            'tracking_no' => $data['tracking_no'] ?? generateTrackingNo(),
        ]);

        return (int) db()->lastInsertId();
    }

    public static function findById(int $id): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM orders
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $id,
        ]);

        $order = $stmt->fetch();

        return $order ?: null;
    }

    public static function findByOrderNo(string $orderNo): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM orders
            WHERE order_no = :order_no
            LIMIT 1
        ");

        $stmt->execute([
            'order_no' => $orderNo,
        ]);

        $order = $stmt->fetch();

        return $order ?: null;
    }

    public static function getByConsumerId(int $consumerId): array
    {
        $stmt = db()->prepare("
            SELECT
                o.*,
                u.full_name AS producer_name,
                pp.store_name
            FROM orders o
            JOIN users u ON u.id = o.producer_id
            LEFT JOIN producer_profiles pp ON pp.user_id = u.id
            WHERE o.consumer_id = :consumer_id
            ORDER BY o.created_at DESC
        ");

        $stmt->execute([
            'consumer_id' => $consumerId,
        ]);

        return $stmt->fetchAll();
    }

    public static function getByProducerId(int $producerId): array
    {
        $stmt = db()->prepare("
            SELECT
                o.*,
                u.full_name AS consumer_name
            FROM orders o
            JOIN users u ON u.id = o.consumer_id
            WHERE o.producer_id = :producer_id
            ORDER BY o.created_at DESC
        ");

        $stmt->execute([
            'producer_id' => $producerId,
        ]);

        return $stmt->fetchAll();
    }

    public static function updatePaymentStatus(int $orderId, string $paymentStatus): void
    {
        $stmt = db()->prepare("
            UPDATE orders
            SET payment_status = :payment_status,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $orderId,
            'payment_status' => $paymentStatus,
        ]);
    }

    public static function updateOrderStatus(int $orderId, string $orderStatus): void
    {
        $stmt = db()->prepare("
            UPDATE orders
            SET order_status = :order_status,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $orderId,
            'order_status' => $orderStatus,
        ]);
    }

    public static function updateTrackingNo(int $orderId, string $trackingNo): void
    {
        $stmt = db()->prepare("
            UPDATE orders
            SET tracking_no = :tracking_no,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $orderId,
            'tracking_no' => $trackingNo,
        ]);
    }
}