<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

if (isset($_GET['review_order_item_id'])) {
    $controller = new ReviewController();
    $controller->create();
    exit;
}

$orderService = new OrderService();
$reviewService = new ReviewService();

$userId = (int) currentUserId();

$orders = $orderService->getConsumerOrders($userId);

$pageTitle = 'Siparişlerim';
$bodyClass = 'page-consumer-orders';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('consumer_order_unit_label')) {
    function consumer_order_unit_label(string $unit): string
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

$deliveredStatus = defined('ORDER_STATUS_DELIVERED') ? ORDER_STATUS_DELIVERED : 'delivered';
?>

<main class="container">
    <section class="card page-heading">
        <h1>Siparişlerim</h1>

        <p>
            Oluşturduğun siparişleri, ürün kalemlerini, ödeme durumunu ve takip numaralarını buradan izleyebilirsin.
        </p>
    </section>

    <?php if (empty($orders)): ?>
        <section class="card empty-state">
            <h2>Henüz siparişin yok</h2>

            <p>
                Ürünleri inceleyip sepete ekledikten sonra checkout adımından sipariş oluşturabilirsin.
            </p>

            <a class="btn" href="<?= e(url('products.php')) ?>">
                Ürünleri İncele
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
                    $producerName = $order['store_name'] ?: ($order['producer_name'] ?? 'Üretici');
                ?>

                <article class="card order-card">
                    <div class="order-header">
                        <div>
                            <h2><?= e($order['order_no'] ?? 'Sipariş') ?></h2>

                            <p>
                                Üretici:
                                <strong><?= e($producerName) ?></strong>
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

                    <div class="order-items">
                        <h3>Ürünler</h3>

                        <?php if (empty($items)): ?>
                            <p class="muted">Bu sipariş için ürün kalemi bulunamadı.</p>
                        <?php else: ?>
                            <div class="order-item-list">
                                <?php foreach ($items as $item): ?>
                                    <?php
                                        $unit = consumer_order_unit_label($item['unit_type_snapshot'] ?? 'kg');
                                        $quantity = (float) ($item['quantity'] ?? 0);
                                        $unitPrice = (float) ($item['unit_price'] ?? 0);
                                        $totalPrice = (float) ($item['total_price'] ?? ($quantity * $unitPrice));

                                        $orderItemId = (int) ($item['id'] ?? 0);
                                        $productId = (int) ($item['product_id'] ?? 0);

                                        $isDelivered = $orderStatus === $deliveredStatus;
                                        $hasReview = $orderItemId > 0
                                            ? $reviewService->hasReviewForOrderItem($orderItemId)
                                            : false;

                                        $reviewCreateUrl = url('consumer/orders.php?review_order_item_id=' . $orderItemId);
                                        $reviewViewUrl = $productId > 0
                                            ? url('product-detail.php?id=' . $productId . '#reviews')
                                            : url('consumer/orders.php');
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

                                        <div class="order-item-actions">
                                            <strong><?= e(formatMoney($totalPrice)) ?></strong>

                                            <?php if ($isDelivered && !$hasReview): ?>
                                                <a
                                                    class="small-link"
                                                    href="<?= e($reviewCreateUrl) ?>"
                                                >
                                                    Yorum Yap
                                                </a>
                                            <?php elseif ($isDelivered && $hasReview): ?>
                                                <span class="review-done">
                                                    Yorum Yapıldı
                                                </span>

                                                <a
                                                    class="small-link secondary-link"
                                                    href="<?= e($reviewViewUrl) ?>"
                                                >
                                                    Yorumu Gör
                                                </a>
                                            <?php else: ?>
                                                <span class="muted-action">
                                                    Teslim edilince yorum yapılır
                                                </span>
                                            <?php endif; ?>
                                        </div>
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

    .order-item-actions {
        display: grid;
        gap: 8px;
        justify-items: end;
        min-width: 120px;
    }

    .order-item-actions strong {
        color: #245c2f;
    }

    .small-link {
        color: #2f7d3d;
        font-weight: bold;
        text-decoration: none;
    }

    .small-link:hover {
        text-decoration: underline;
    }

    .secondary-link {
        font-size: 13px;
    }

    .review-done {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        background: #e7f7e8;
        color: #236b2c;
        font-size: 13px;
        font-weight: bold;
        white-space: nowrap;
    }

    .muted-action {
        color: #718071;
        font-size: 14px;
        text-align: right;
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

        .order-summary-grid {
            grid-template-columns: 1fr 1fr;
        }

        .order-item {
            align-items: flex-start;
            flex-direction: column;
        }

        .order-item-actions {
            justify-items: start;
        }
    }

    @media (max-width: 600px) {
        .order-summary-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>