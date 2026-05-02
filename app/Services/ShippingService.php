<?php

class ShippingService
{
    public function createDemoShipment(int $orderId): array
    {
        return [
            'id' => random_int(1000, 9999),
            'order_id' => $orderId,
            'cargo_company' => 'Demo Kargo',
            'tracking_no' => generateTrackingNo(),
            'shipment_status' => 'not_shipped',
            'shipped_at' => null,
            'delivered_at' => null,
            'created_at' => date('Y-m-d H:i:s'),
        ];
    }

    public function statusLabel(string $status): string
    {
        return match ($status) {
            'not_shipped' => 'Henüz Kargoya Verilmedi',
            'shipped' => 'Kargoya Verildi',
            'in_transit' => 'Yolda',
            'delivered' => 'Teslim Edildi',
            'cancelled' => 'İptal Edildi',
            default => 'Bilinmiyor',
        };
    }

    public function generateTrackingNoForOrder(): string
    {
        return generateTrackingNo();
    }

    public function calculateShippingFee(array $producerGroup, array $address = []): float
    {
        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | 1. producer_shipping_regions tablosundan üreticinin gönderim bölgesi aranacak.
        | 2. İl/ilçe bazlı kargo ücreti hesaplanacak.
        | 3. Kampanya veya minimum sipariş tutarı varsa kargo ücretsiz olabilir.
        */

        return 0.00;
    }

    public function canShipToAddress(int $producerId, array $address): bool
    {
        /*
        |--------------------------------------------------------------------------
        | TODO
        |--------------------------------------------------------------------------
        | Gerçek implementasyonda:
        | producer_shipping_regions üzerinden il/ilçe kontrolü yapılacak.
        */

        return true;
    }
}