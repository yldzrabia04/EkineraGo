<?php

class Shipment
{
    public static function create(array $data): int
    {
        $stmt = db()->prepare("
            INSERT INTO shipments (
                order_id,
                cargo_company,
                tracking_no,
                shipment_status,
                shipped_at,
                delivered_at
            ) VALUES (
                :order_id,
                :cargo_company,
                :tracking_no,
                :shipment_status,
                :shipped_at,
                :delivered_at
            )
        ");

        $stmt->execute([
            'order_id' => $data['order_id'],
            'cargo_company' => $data['cargo_company'] ?? null,
            'tracking_no' => $data['tracking_no'] ?? generateTrackingNo(),
            'shipment_status' => $data['shipment_status'] ?? 'not_shipped',
            'shipped_at' => $data['shipped_at'] ?? null,
            'delivered_at' => $data['delivered_at'] ?? null,
        ]);

        return (int) db()->lastInsertId();
    }

    public static function findByOrderId(int $orderId): ?array
    {
        $stmt = db()->prepare("
            SELECT *
            FROM shipments
            WHERE order_id = :order_id
            LIMIT 1
        ");

        $stmt->execute([
            'order_id' => $orderId,
        ]);

        $shipment = $stmt->fetch();

        return $shipment ?: null;
    }

    public static function updateStatus(int $shipmentId, string $status): void
    {
        $allowedStatuses = [
            'not_shipped',
            'shipped',
            'in_transit',
            'delivered',
            'cancelled',
        ];

        if (!in_array($status, $allowedStatuses, true)) {
            throw new InvalidArgumentException('Geçersiz kargo durumu.');
        }

        $extraSql = '';

        if ($status === 'shipped') {
            $extraSql = ', shipped_at = COALESCE(shipped_at, NOW())';
        }

        if ($status === 'delivered') {
            $extraSql = ', delivered_at = COALESCE(delivered_at, NOW())';
        }

        $stmt = db()->prepare("
            UPDATE shipments
            SET shipment_status = :shipment_status,
                updated_at = NOW()
                {$extraSql}
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $shipmentId,
            'shipment_status' => $status,
        ]);
    }

    public static function updateTrackingNo(int $shipmentId, string $trackingNo): void
    {
        $stmt = db()->prepare("
            UPDATE shipments
            SET tracking_no = :tracking_no,
                updated_at = NOW()
            WHERE id = :id
            LIMIT 1
        ");

        $stmt->execute([
            'id' => $shipmentId,
            'tracking_no' => $trackingNo,
        ]);
    }
}