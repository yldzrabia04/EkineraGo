<?php

class OrderService
{
    public function getConsumerOrders(int $consumerId): array
    {
        if ($consumerId <= 0) {
            return [];
        }

        $orders = Order::getByConsumerId($consumerId);

        foreach ($orders as &$order) {
            $order['items'] = OrderItem::getByOrderId((int) $order['id']);
            $order['shipment'] = Shipment::findByOrderId((int) $order['id']);
            $order['order_status_label'] = $this->statusLabel($order['order_status'] ?? '');
            $order['payment_status_label'] = $this->paymentStatusLabel($order['payment_status'] ?? '');
        }

        unset($order);

        return $orders;
    }

    public function getProducerOrders(int $producerId): array
    {
        if ($producerId <= 0) {
            return [];
        }

        $orders = Order::getByProducerId($producerId);

        foreach ($orders as &$order) {
            $order['items'] = OrderItem::getByOrderId((int) $order['id']);
            $order['shipment'] = Shipment::findByOrderId((int) $order['id']);
            $order['order_status_label'] = $this->statusLabel($order['order_status'] ?? '');
            $order['payment_status_label'] = $this->paymentStatusLabel($order['payment_status'] ?? '');
        }

        unset($order);

        return $orders;
    }

    public function findOrderForConsumer(int $consumerId, int $orderId): ?array
    {
        if ($consumerId <= 0 || $orderId <= 0) {
            return null;
        }

        $order = Order::findById($orderId);

        if (!$order || (int) $order['consumer_id'] !== $consumerId) {
            return null;
        }

        $order['items'] = OrderItem::getByOrderId($orderId);
        $order['shipment'] = Shipment::findByOrderId($orderId);

        return $order;
    }

    public function findOrderForProducer(int $producerId, int $orderId): ?array
    {
        if ($producerId <= 0 || $orderId <= 0) {
            return null;
        }

        $order = Order::findById($orderId);

        if (!$order || (int) $order['producer_id'] !== $producerId) {
            return null;
        }

        $order['items'] = OrderItem::getByOrderId($orderId);
        $order['shipment'] = Shipment::findByOrderId($orderId);

        return $order;
    }

    public function updateStatus(int $producerId, int $orderId, string $status): array
    {
        $allowedStatuses = [
            ORDER_STATUS_PENDING,
            ORDER_STATUS_CONFIRMED,
            ORDER_STATUS_PREPARING,
            ORDER_STATUS_SHIPPED,
            ORDER_STATUS_DELIVERED,
            ORDER_STATUS_CANCELLED,
            ORDER_STATUS_REFUNDED,
        ];

        if ($producerId <= 0) {
            return [
                'success' => false,
                'message' => 'Üretici oturumu bulunamadı.',
            ];
        }

        if ($orderId <= 0) {
            return [
                'success' => false,
                'message' => 'Geçerli bir sipariş ID değeri gönderilmelidir.',
            ];
        }

        if (!in_array($status, $allowedStatuses, true)) {
            return [
                'success' => false,
                'message' => 'Geçersiz sipariş durumu.',
            ];
        }

        $order = Order::findById($orderId);

        if (!$order || (int) $order['producer_id'] !== $producerId) {
            return [
                'success' => false,
                'message' => 'Bu siparişi güncelleme yetkiniz yok.',
            ];
        }

        try {
            db_transaction(function () use ($order, $orderId, $status) {
                Order::updateOrderStatus($orderId, $status);

                $shipment = Shipment::findByOrderId($orderId);

                if ($shipment) {
                    if ($status === ORDER_STATUS_SHIPPED) {
                        Shipment::updateStatus((int) $shipment['id'], 'shipped');
                    }

                    if ($status === ORDER_STATUS_DELIVERED) {
                        Shipment::updateStatus((int) $shipment['id'], 'delivered');
                    }

                    if ($status === ORDER_STATUS_CANCELLED) {
                        Shipment::updateStatus((int) $shipment['id'], 'cancelled');
                    }
                }

                if ($status === ORDER_STATUS_CANCELLED || $status === ORDER_STATUS_REFUNDED) {
                    Order::updatePaymentStatus($orderId, PAYMENT_STATUS_REFUNDED);
                }

                try {
                    Notification::createOrderStatusChanged(
                        (int) $order['consumer_id'],
                        $order['order_no'],
                        $this->statusLabel($status)
                    );
                } catch (Throwable $e) {
                    // Bildirim hatası sipariş durum güncellemesini bozmasın.
                }
            });

            return [
                'success' => true,
                'message' => 'Sipariş durumu güncellendi.',
                'data' => [
                    'order_id' => $orderId,
                    'order_status' => $status,
                    'order_status_label' => $this->statusLabel($status),
                ],
            ];
        } catch (Throwable $e) {
            return [
                'success' => false,
                'message' => 'Sipariş durumu güncellenirken bir hata oluştu.',
            ];
        }
    }

    public function statusLabel(string $status): string
    {
        return match ($status) {
            ORDER_STATUS_PENDING => 'Sipariş Alındı',
            ORDER_STATUS_CONFIRMED => 'Onaylandı',
            ORDER_STATUS_PREPARING => 'Hazırlanıyor',
            ORDER_STATUS_SHIPPED => 'Kargoya Verildi',
            ORDER_STATUS_DELIVERED => 'Teslim Edildi',
            ORDER_STATUS_CANCELLED => 'İptal Edildi',
            ORDER_STATUS_REFUNDED => 'İade Edildi',
            default => 'Bilinmiyor',
        };
    }

    public function paymentStatusLabel(string $status): string
    {
        return match ($status) {
            PAYMENT_STATUS_UNPAID => 'Ödenmedi',
            PAYMENT_STATUS_PAID => 'Ödendi',
            PAYMENT_STATUS_REFUNDED => 'İade Edildi',
            PAYMENT_STATUS_FAILED => 'Başarısız',
            default => 'Bilinmiyor',
        };
    }

    public function statusBadgeClass(string $status): string
    {
        return match ($status) {
            ORDER_STATUS_PENDING => 'badge-info',
            ORDER_STATUS_CONFIRMED => 'badge-info',
            ORDER_STATUS_PREPARING => 'badge-warning',
            ORDER_STATUS_SHIPPED => 'badge-info',
            ORDER_STATUS_DELIVERED => 'badge-success',
            ORDER_STATUS_CANCELLED => 'badge-danger',
            ORDER_STATUS_REFUNDED => 'badge-danger',
            default => 'badge-muted',
        };
    }

    public function paymentBadgeClass(string $status): string
    {
        return match ($status) {
            PAYMENT_STATUS_PAID => 'badge-success',
            PAYMENT_STATUS_UNPAID => 'badge-warning',
            PAYMENT_STATUS_REFUNDED => 'badge-danger',
            PAYMENT_STATUS_FAILED => 'badge-danger',
            default => 'badge-muted',
        };
    }
}