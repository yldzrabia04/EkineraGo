<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$orderService = new OrderService();
$producerId = (int) currentUserId();

if (is_post()) {
    require_csrf();

    $orderId = (int) ($_POST['order_id'] ?? 0);
    $status = trim($_POST['order_status'] ?? '');

    $result = $orderService->updateStatus($producerId, $orderId, $status);

    if ($result['success']) {
        flash_success($result['message']);
    } else {
        flash_error($result['message']);
    }

    redirect('producer/orders.php');
}

$orders = $orderService->getProducerOrders($producerId);

$pageTitle = 'Gelen Siparişler';
$bodyClass = 'page-producer-orders';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('producer_order_unit_label')) {
    function producer_order_unit_label(string $unit): string
    {
        return match ($unit) {
            'kg' => 'kg',
            'piece' => 'adet',
            'bunch' => 'demet',
            'box' => 'kasa',
            default => $unit,
        };
    }
}
?>

<main class="container">
    <section class="card page-heading">
        <h1>Gelen Siparişler</h1>

        <p>
            Tüketicilerden gelen siparişleri buradan görüntüleyebilir ve sipariş durumlarını güncelleyebilirsin.
        </p>
    </section>

    <?php if (empty($orders)): ?>
        <section class="card empty-state">
            <h2>Henüz gelen sipariş yok</h2>

            <p>
                Ürünlerin satın alındığında siparişler bu sayfada listelenecek.
            </p>

            <a class="btn" href="<?= e(url('producer/products.php')) ?>">
                Ürünlerime Git
            </a>
        </section>
    <?php else: ?>
        <section class="orders-list">
            <?php foreach ($orders as $order): ?>
                <?php
                    $items = $order['items'] ?? [];
                    $shipment = $order['shipment'] ?? null;
                    $orderStatus = $order['order_status'] ?? '';
                    $paymentStatus = $order['payment_status'] ?? '';
                ?>

                <article class="card order-card">
                    <div class="order-header">
                        <div>
                            <h2><?= e($order['order_no'] ?? 'Sipariş') ?></h2>

                            <p>
                                Tüketici:
                                <strong><?= e($order['consumer_name'] ?? 'Tüketici') ?></strong>
                            </p>

                            <p>
                                Tarih:
                                <?= !empty($order['created_at'])
                                    ? e(date('d.m.Y H:i', strtotime($order['created_at'])))
                                    : '-'
                                ?>
                            </p>
                        </div>

                        <div class="order-status-area">
                            <span class="badge <?= e($orderService->statusBadgeClass($orderStatus)) ?>">
                                <?= e($order['order_status_label'] ?? $orderService->statusLabel($orderStatus)) ?>
                            </span>

                            <span class="badge <?= e($orderService->paymentBadgeClass($paymentStatus)) ?>">
                                <?= e($order['payment_status_label'] ?? $orderService->paymentStatusLabel($paymentStatus)) ?>
                            </span>
                        </div>
                    </div>

                    <div class="order-summary-grid">
                        <div>
                            <strong>Toplam</strong>
                            <span><?= e(formatMoney($order['total_amount'] ?? 0)) ?></span>
                        </div>

                        <div>
                            <strong>Ara Toplam</strong>
                            <span><?= e(formatMoney($order['subtotal'] ?? 0)) ?></span>
                        </div>

                        <div>
                            <strong>Kargo</strong>
                            <span><?= e(formatMoney($order['shipping_fee'] ?? 0)) ?></span>
                        </div>

                        <div>
                            <strong>Takip No</strong>
                            <span>
                                <?= e($order['tracking_no'] ?: ($shipment['tracking_no'] ?? '-')) ?>
                            </span>
                        </div>
                    </div>

                    <div class="status-update-box">
                        <form method="POST" action="<?= e(url('producer/orders.php')) ?>" class="status-form">
                            <?= csrf_field() ?>

                            <input type="hidden" name="order_id" value="<?= e((string) $order['id']) ?>">

                            <label for="order_status_<?= e((string) $order['id']) ?>">
                                Sipariş Durumu
                            </label>

                            <select id="order_status_<?= e((string) $order['id']) ?>" name="order_status">
                                <option value="<?= ORDER_STATUS_PENDING ?>" <?= $orderStatus === ORDER_STATUS_PENDING ? 'selected' : '' ?>>
                                    Sipariş Alındı
                                </option>
                                <option value="<?= ORDER_STATUS_CONFIRMED ?>" <?= $orderStatus === ORDER_STATUS_CONFIRMED ? 'selected' : '' ?>>
                                    Onaylandı
                                </option>
                                <option value="<?= ORDER_STATUS_PREPARING ?>" <?= $orderStatus === ORDER_STATUS_PREPARING ? 'selected' : '' ?>>
                                    Hazırlanıyor
                                </option>
                                <option value="<?= ORDER_STATUS_SHIPPED ?>" <?= $orderStatus === ORDER_STATUS_SHIPPED ? 'selected' : '' ?>>
                                    Kargoya Verildi
                                </option>
                                <option value="<?= ORDER_STATUS_DELIVERED ?>" <?= $orderStatus === ORDER_STATUS_DELIVERED ? 'selected' : '' ?>>
                                    Teslim Edildi
                                </option>
                                <option value="<?= ORDER_STATUS_CANCELLED ?>" <?= $orderStatus === ORDER_STATUS_CANCELLED ? 'selected' : '' ?>>
                                    İptal Edildi
                                </option>
                            </select>

                            <button class="btn" type="submit">
                                Durumu Güncelle
                            </button>
                        </form>
                    </div>

                    <div class="order-items">
                        <h3>Ürünler</h3>

                        <?php if (empty($items)): ?>
                            <p class="muted">Bu sipariş için ürün kalemi bulunamadı.</p>
                        <?php else: ?>
                            <div class="order-item-list">
                                <?php foreach ($items as $item): ?>
                                    <?php
                                        $unit = producer_order_unit_label($item['unit_type_snapshot'] ?? 'kg');
                                        $quantity = (float) ($item['quantity'] ?? 0);
                                        $unitPrice = (float) ($item['unit_price'] ?? 0);
                                        $totalPrice = (float) ($item['total_price'] ?? ($quantity * $unitPrice));
                                    ?>

                                    <div class="order-item">
                                        <div>
                                            <strong><?= e($item['product_title_snapshot'] ?? 'Ürün') ?></strong>

                                            <p>
                                                <?= e((string) $quantity) ?>
                                                <?= e($unit) ?>
                                                ·
                                                <?= e(formatMoney($unitPrice)) ?>
                                                /
                                                <?= e($unit) ?>
                                            </p>
                                        </div>

                                        <strong><?= e(formatMoney($totalPrice)) ?></strong>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>
                    </div>

                    <?php if ($shipment): ?>
                        <div class="shipment-box">
                            <strong>Kargo Bilgisi</strong>

                            <p>
                                Firma:
                                <?= e($shipment['cargo_company'] ?: 'Demo Kargo') ?>
                            </p>

                            <p>
                                Durum:
                                <?= e($shipment['shipment_status'] ?? '-') ?>
                            </p>

                            <p>
                                Takip No:
                                <?= e($shipment['tracking_no'] ?? '-') ?>
                            </p>
                        </div>
                    <?php endif; ?>
                </article>
            <?php endforeach; ?>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .order-card h2,
    .order-items h3,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .order-header p,
    .order-item p,
    .shipment-box p,
    .empty-state p,
    .muted {
        color: #526052;
        line-height: 1.5;
    }

    .orders-list {
        display: grid;
        gap: 22px;
    }

    .order-header {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: flex-start;
        border-bottom: 1px solid #edf1ea;
        padding-bottom: 16px;
        margin-bottom: 16px;
    }

    .order-status-area {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
        justify-content: flex-end;
    }

    .badge {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        white-space: nowrap;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .badge-warning {
        background: #fff5d6;
        color: #8a6200;
    }

    .badge-info {
        background: #e8f1ff;
        color: #1f4e8c;
    }

    .badge-danger {
        background: #ffe8e8;
        color: #9b111e;
    }

    .badge-muted {
        background: #edf1ea;
        color: #526052;
    }

    .order-summary-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 14px;
        margin-bottom: 20px;
    }

    .order-summary-grid div {
        padding: 14px;
        border-radius: 12px;
        background: #f8fbf6;
    }

    .order-summary-grid strong,
    .order-summary-grid span {
        display: block;
    }

    .order-summary-grid strong {
        color: #245c2f;
        margin-bottom: 5px;
    }

    .order-summary-grid span {
        color: #526052;
        overflow-wrap: anywhere;
    }

    .status-update-box {
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
        margin-bottom: 20px;
    }

    .status-form {
        display: grid;
        grid-template-columns: 1fr 1fr auto;
        gap: 12px;
        align-items: end;
    }

    .status-form label {
        color: #245c2f;
        font-weight: bold;
    }

    .status-form select {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
    }

    .order-item-list {
        display: grid;
        gap: 12px;
    }

    .order-item {
        display: flex;
        justify-content: space-between;
        gap: 16px;
        align-items: center;
        padding: 14px;
        border-radius: 12px;
        background: #f8fbf6;
    }

    .order-item strong {
        color: #245c2f;
    }

    .shipment-box {
        margin-top: 18px;
        padding: 14px;
        border-radius: 12px;
        background: #f8fbf6;
    }

    .shipment-box strong {
        color: #245c2f;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 900px) {
        .order-header {
            flex-direction: column;
        }

        .order-status-area {
            justify-content: flex-start;
        }

        .order-summary-grid,
        .status-form {
            grid-template-columns: 1fr;
        }

        .order-item {
            align-items: flex-start;
            flex-direction: column;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>