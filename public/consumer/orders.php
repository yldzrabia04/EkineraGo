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
            'g' => 'g',
            'piece' => 'adet',
            'bunch' => 'demet',
            'box' => 'kasa',
            default => $unit,
        };
    }
}

if (!function_exists('consumer_order_money')) {
    function consumer_order_money(float $amount): string
    {
        if (function_exists('formatMoney')) {
            return formatMoney($amount);
        }

        return number_format($amount, 2, ',', '.') . ' TL';
    }
}

if (!function_exists('consumer_order_date')) {
    function consumer_order_date(?string $date): string
    {
        if (!$date) {
            return '-';
        }

        $timestamp = strtotime($date);

        if (!$timestamp) {
            return $date;
        }

        return date('d.m.Y H:i', $timestamp);
    }
}

if (!function_exists('consumer_order_producer_name')) {
    function consumer_order_producer_name(array $order): string
    {
        if (!empty($order['store_name'])) {
            return $order['store_name'];
        }

        if (!empty($order['producer_name'])) {
            return $order['producer_name'];
        }

        return 'Üretici';
    }
}

if (!function_exists('consumer_order_status_class')) {
    function consumer_order_status_class(OrderService $orderService, string $status): string
    {
        if (method_exists($orderService, 'statusBadgeClass')) {
            return $orderService->statusBadgeClass($status);
        }

        return 'badge-muted';
    }
}

if (!function_exists('consumer_order_payment_class')) {
    function consumer_order_payment_class(OrderService $orderService, string $status): string
    {
        if (method_exists($orderService, 'paymentBadgeClass')) {
            return $orderService->paymentBadgeClass($status);
        }

        return 'badge-muted';
    }
}

if (!function_exists('consumer_order_status_label')) {
    function consumer_order_status_label(OrderService $orderService, array $order, string $status): string
    {
        if (!empty($order['order_status_label'])) {
            return $order['order_status_label'];
        }

        if (method_exists($orderService, 'statusLabel')) {
            return $orderService->statusLabel($status);
        }

        return $status ?: 'Durum Yok';
    }
}

if (!function_exists('consumer_order_payment_label')) {
    function consumer_order_payment_label(OrderService $orderService, array $order, string $status): string
    {
        if (!empty($order['payment_status_label'])) {
            return $order['payment_status_label'];
        }

        if (method_exists($orderService, 'paymentStatusLabel')) {
            return $orderService->paymentStatusLabel($status);
        }

        return $status ?: 'Ödeme Yok';
    }
}


if (!function_exists('consumer_order_id')) {
    function consumer_order_id(array $order): int
    {
        return (int) ($order['id'] ?? $order['order_id'] ?? 0);
    }
}

if (!function_exists('consumer_order_is_neighborhood')) {
    function consumer_order_is_neighborhood(array $order): bool
    {
        return ($order['order_type'] ?? '') === 'neighborhood_basket'
            || !empty($order['neighborhood'])
            || !empty($order['neighborhood_basket_id']);
    }
}

if (!function_exists('consumer_order_personal_amount')) {
    function consumer_order_personal_amount(array $order): float
    {
        $neighborhood = $order['neighborhood'] ?? null;

        if (is_array($neighborhood)) {
            if (isset($neighborhood['my_payment_amount'])) {
                return (float) $neighborhood['my_payment_amount'];
            }

            if (isset($neighborhood['my_quantity'], $neighborhood['discounted_unit_price'])) {
                return (float) $neighborhood['my_quantity'] * (float) $neighborhood['discounted_unit_price'];
            }
        }

        return (float) ($order['total_amount'] ?? 0);
    }
}

if (!function_exists('consumer_order_fetch_items')) {
    function consumer_order_fetch_items(int $orderId): array
    {
        if ($orderId <= 0) {
            return [];
        }

        try {
            $statement = db()->prepare("\n                SELECT *\n                FROM order_items\n                WHERE order_id = :order_id\n                ORDER BY id ASC\n            ");

            $statement->execute([
                'order_id' => $orderId,
            ]);

            return $statement->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }
    }
}

if (!function_exists('consumer_order_fetch_shipment')) {
    function consumer_order_fetch_shipment(int $orderId): ?array
    {
        if ($orderId <= 0) {
            return null;
        }

        try {
            $statement = db()->prepare("\n                SELECT *\n                FROM shipments\n                WHERE order_id = :order_id\n                ORDER BY id DESC\n                LIMIT 1\n            ");

            $statement->execute([
                'order_id' => $orderId,
            ]);

            $shipment = $statement->fetch(PDO::FETCH_ASSOC);

            return $shipment ?: null;
        } catch (Throwable $e) {
            return null;
        }
    }
}

if (!function_exists('consumer_order_fetch_neighborhood_contexts')) {
    function consumer_order_fetch_neighborhood_contexts(int $userId): array
    {
        if ($userId <= 0) {
            return [];
        }

        try {
            $statement = db()->prepare("\n                SELECT\n                    o.id AS order_id,\n                    nb.id AS basket_id,\n                    nb.title AS basket_title,\n                    nb.creator_user_id,\n                    nb.producer_id,\n                    nb.product_id,\n                    nb.target_quantity,\n                    nb.current_quantity,\n                    nb.unit_type AS basket_unit_type,\n                    nb.status AS basket_status,\n                    nb.discount_percent_snapshot,\n                    nb.unit_price_snapshot,\n                    nb.discounted_unit_price_snapshot,\n                    nbm.id AS basket_member_id,\n                    nbm.quantity AS my_quantity,\n                    nbm.status AS my_member_status,\n                    nbp.amount AS my_payment_amount,\n                    nbp.status AS my_payment_status,\n                    creator.full_name AS creator_name,\n                    product.title AS product_title\n                FROM neighborhood_basket_members nbm\n                INNER JOIN neighborhood_baskets nb ON nb.id = nbm.basket_id\n                INNER JOIN orders o ON o.id = nb.order_id\n                INNER JOIN users creator ON creator.id = nb.creator_user_id\n                INNER JOIN products product ON product.id = nb.product_id\n                LEFT JOIN neighborhood_basket_payments nbp ON nbp.basket_member_id = nbm.id\n                WHERE nbm.user_id = :user_id\n                  AND nb.order_id IS NOT NULL\n                ORDER BY o.created_at DESC\n            ");

            $statement->execute([
                'user_id' => $userId,
            ]);

            $rows = $statement->fetchAll(PDO::FETCH_ASSOC);
        } catch (Throwable $e) {
            return [];
        }

        $contexts = [];
        $basketIds = [];

        foreach ($rows as $row) {
            $orderId = (int) ($row['order_id'] ?? 0);
            $basketId = (int) ($row['basket_id'] ?? 0);

            if ($orderId <= 0 || $basketId <= 0) {
                continue;
            }

            $contexts[$orderId] = [
                'order_id' => $orderId,
                'basket_id' => $basketId,
                'basket_title' => $row['basket_title'] ?? 'Mahalle Sepeti',
                'creator_user_id' => (int) ($row['creator_user_id'] ?? 0),
                'creator_name' => $row['creator_name'] ?? 'Kullanıcı',
                'target_quantity' => (float) ($row['target_quantity'] ?? 0),
                'current_quantity' => (float) ($row['current_quantity'] ?? 0),
                'unit_type' => $row['basket_unit_type'] ?? 'kg',
                'basket_status' => $row['basket_status'] ?? 'ordered',
                'discount_percent' => (float) ($row['discount_percent_snapshot'] ?? 0),
                'unit_price' => (float) ($row['unit_price_snapshot'] ?? 0),
                'discounted_unit_price' => (float) ($row['discounted_unit_price_snapshot'] ?? 0),
                'my_quantity' => (float) ($row['my_quantity'] ?? 0),
                'my_member_status' => $row['my_member_status'] ?? '',
                'my_payment_amount' => isset($row['my_payment_amount']) ? (float) $row['my_payment_amount'] : null,
                'my_payment_status' => $row['my_payment_status'] ?? null,
                'product_title' => $row['product_title'] ?? 'Ürün',
                'members' => [],
            ];

            $basketIds[$basketId] = $basketId;
        }

        if (!$contexts || !$basketIds) {
            return $contexts;
        }

        try {
            $placeholders = implode(',', array_fill(0, count($basketIds), '?'));
            $memberStatement = db()->prepare("\n                SELECT\n                    nbm.basket_id,\n                    nbm.user_id,\n                    nbm.quantity,\n                    nbm.status,\n                    u.full_name\n                FROM neighborhood_basket_members nbm\n                INNER JOIN users u ON u.id = nbm.user_id\n                WHERE nbm.basket_id IN ($placeholders)\n                ORDER BY nbm.created_at ASC\n            ");

            $memberStatement->execute(array_values($basketIds));
            $memberRows = $memberStatement->fetchAll(PDO::FETCH_ASSOC);

            $basketIdToOrderId = [];

            foreach ($contexts as $orderId => $context) {
                $basketIdToOrderId[(int) $context['basket_id']] = $orderId;
            }

            foreach ($memberRows as $memberRow) {
                $basketId = (int) ($memberRow['basket_id'] ?? 0);
                $orderId = $basketIdToOrderId[$basketId] ?? 0;

                if ($orderId <= 0 || !isset($contexts[$orderId])) {
                    continue;
                }

                $contexts[$orderId]['members'][] = [
                    'user_id' => (int) ($memberRow['user_id'] ?? 0),
                    'full_name' => $memberRow['full_name'] ?? 'Kullanıcı',
                    'quantity' => (float) ($memberRow['quantity'] ?? 0),
                    'status' => $memberRow['status'] ?? '',
                ];
            }
        } catch (Throwable $e) {
            // Katılımcı listesi okunamazsa siparişi yine de gösteriyoruz.
        }

        return $contexts;
    }
}

if (!function_exists('consumer_order_fetch_order_by_id')) {
    function consumer_order_fetch_order_by_id(int $orderId): ?array
    {
        if ($orderId <= 0) {
            return null;
        }

        try {
            $statement = db()->prepare("\n                SELECT\n                    o.*,\n                    producer.full_name AS producer_name,\n                    pp.store_name\n                FROM orders o\n                INNER JOIN users producer ON producer.id = o.producer_id\n                LEFT JOIN producer_profiles pp ON pp.user_id = producer.id\n                WHERE o.id = :order_id\n                LIMIT 1\n            ");

            $statement->execute([
                'order_id' => $orderId,
            ]);

            $order = $statement->fetch(PDO::FETCH_ASSOC);

            if (!$order) {
                return null;
            }

            $order['items'] = consumer_order_fetch_items($orderId);
            $order['shipment'] = consumer_order_fetch_shipment($orderId);

            return $order;
        } catch (Throwable $e) {
            return null;
        }
    }
}

if (!function_exists('consumer_order_merge_neighborhood_orders')) {
    function consumer_order_merge_neighborhood_orders(array $orders, int $userId): array
    {
        $contexts = consumer_order_fetch_neighborhood_contexts($userId);

        if (!$contexts) {
            return $orders;
        }

        $existingOrderIds = [];

        foreach ($orders as $index => $order) {
            $orderId = consumer_order_id($order);

            if ($orderId > 0) {
                $existingOrderIds[$orderId] = true;
            }

            if ($orderId > 0 && isset($contexts[$orderId])) {
                $orders[$index]['neighborhood'] = $contexts[$orderId];
                $orders[$index]['order_type'] = $orders[$index]['order_type'] ?? 'neighborhood_basket';
            }
        }

        foreach ($contexts as $orderId => $context) {
            if (isset($existingOrderIds[$orderId])) {
                continue;
            }

            $order = consumer_order_fetch_order_by_id($orderId);

            if (!$order) {
                continue;
            }

            $order['neighborhood'] = $context;
            $order['order_type'] = $order['order_type'] ?? 'neighborhood_basket';
            $orders[] = $order;
        }

        usort($orders, function (array $a, array $b): int {
            return strtotime((string) ($b['created_at'] ?? '')) <=> strtotime((string) ($a['created_at'] ?? ''));
        });

        return $orders;
    }
}

$orders = consumer_order_merge_neighborhood_orders($orders, $userId);

$deliveredStatus = defined('ORDER_STATUS_DELIVERED') ? ORDER_STATUS_DELIVERED : 'delivered';

$totalSpent = 0;
$activeOrderCount = 0;
$deliveredOrderCount = 0;
$neighborhoodOrderCount = 0;

foreach ($orders as $order) {
    $isNeighborhoodOrder = consumer_order_is_neighborhood($order);

    if ($isNeighborhoodOrder) {
        $neighborhoodOrderCount++;
    }

    $totalSpent += consumer_order_personal_amount($order);

    $orderStatus = $order['order_status'] ?? '';

    if ($orderStatus === $deliveredStatus) {
        $deliveredOrderCount++;
    } elseif (!in_array($orderStatus, ['cancelled', 'canceled'], true)) {
        $activeOrderCount++;
    }
}
?>

<main class="consumer-orders-page">
    <section class="orders-hero">
        <div class="orders-hero-bg orders-blob-one"></div>
        <div class="orders-hero-bg orders-blob-two"></div>

        <div class="orders-hero-inner">
            <nav class="orders-breadcrumb" aria-label="Sayfa yolu">
                <a href="<?= e(url('index.php')) ?>">Ana Sayfa</a>
                <span>/</span>
                <a href="<?= e(url('consumer/dashboard.php')) ?>">Tüketici Paneli</a>
                <span>/</span>
                <strong>Siparişlerim</strong>
            </nav>

            <div class="orders-hero-content">
                <div class="orders-hero-copy">
                    <span class="orders-eyebrow">
                        Sipariş Takibi
                    </span>

                    <h1>Siparişlerim</h1>

                    <p>
                        Oluşturduğun siparişleri, Mahalle Sepeti toplu alımlarındaki kişisel payını,
                        ödeme durumunu ve takip numaralarını buradan düzenli şekilde izleyebilirsin.
                    </p>

                    <?php if (!empty($orders)): ?>
                        <div class="orders-hero-stats">
                            <span>📦 <?= e((string) count($orders)) ?> sipariş</span>
                            <span>🚚 <?= e((string) $activeOrderCount) ?> aktif</span>
                            <span>✅ <?= e((string) $deliveredOrderCount) ?> teslim edildi</span>
                            <span>🧺 <?= e((string) $neighborhoodOrderCount) ?> mahalle sepeti</span>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="orders-hero-card">
                    <div class="hero-card-icon">📦</div>

                    <h2>Sipariş sürecini tek ekrandan takip et</h2>

                    <p>
                        Üretici, ödeme, kargo, ürün ve Mahalle Sepeti katılım detayları her sipariş kartında ayrı ayrı gösterilir.
                    </p>

                    <div class="hero-mini-list">
                        <span>💳 Ödeme durumu</span>
                        <span>🚚 Kargo takibi</span>
                        <span>⭐ Yorum işlemi</span>
                        <span>🧺 Toplu alım payı</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="orders-shell">
        <?php if (empty($orders)): ?>
            <section class="orders-empty-card glass-card">
                <div class="empty-icon">🧺</div>

                <span class="orders-eyebrow light">Henüz Sipariş Yok</span>

                <h2>Henüz sipariş oluşturmadın.</h2>

                <p>
                    Ürünleri inceleyip sepete ekledikten sonra checkout adımından ilk siparişini oluşturabilir veya Mahalle Sepeti davetlerine katılarak toplu alım siparişlerini burada takip edebilirsin.
                </p>

                <div class="empty-actions">
                    <a class="orders-btn orders-btn-primary" href="<?= e(url('products.php')) ?>">
                        Ürünleri İncele
                    </a>

                    <a class="orders-btn orders-btn-light" href="<?= e(url('consumer/dashboard.php')) ?>">
                        Panele Dön
                    </a>
                </div>
            </section>
        <?php else: ?>
            <section class="orders-top glass-card">
                <div>
                    <span class="section-kicker">Genel Özet</span>
                    <h2>Sipariş geçmişin</h2>
                    <p>Aktif, teslim edilen ve geçmiş siparişlerini buradan kontrol edebilirsin.</p>
                </div>

                <div class="orders-top-total">
                    <span>Kişisel Toplam</span>
                    <strong><?= e(consumer_order_money($totalSpent)) ?></strong>
                </div>
            </section>

            <section class="orders-list">
                <?php foreach ($orders as $order): ?>
                    <?php
                        $items = $order['items'] ?? [];
                        $shipment = $order['shipment'] ?? null;
                        $orderStatus = $order['order_status'] ?? '';
                        $paymentStatus = $order['payment_status'] ?? '';
                        $producerName = consumer_order_producer_name($order);

                        $trackingNo = $order['tracking_no']
                            ?? ($shipment['tracking_no'] ?? '');

                        $orderNo = $order['order_no'] ?? 'Sipariş';
                        $orderId = consumer_order_id($order);
                        $neighborhood = $order['neighborhood'] ?? null;
                        $isNeighborhoodOrder = consumer_order_is_neighborhood($order);
                        $personalAmount = consumer_order_personal_amount($order);
                        $orderIcon = $isNeighborhoodOrder ? '🧺' : '📦';
                        $basketDetailUrl = is_array($neighborhood) && !empty($neighborhood['basket_id'])
                            ? url('neighborhood-baskets.php?action=show&id=' . (int) $neighborhood['basket_id'])
                            : null;
                    ?>

                    <article class="order-card glass-card">
                        <div class="order-header">
                            <div class="order-title-area">
                                <span class="order-icon"><?= e($orderIcon) ?></span>

                                <div>
                                    <h2><?= e($orderNo) ?></h2>

                                    <?php if ($isNeighborhoodOrder): ?>
                                        <span class="order-type-inline">🧺 Mahalle Sepeti Toplu Siparişi</span>
                                    <?php endif; ?>

                                    <p>
                                        Üretici:
                                        <strong><?= e($producerName) ?></strong>
                                    </p>

                                    <p>
                                        Tarih:
                                        <?= e(consumer_order_date($order['created_at'] ?? null)) ?>
                                    </p>
                                </div>
                            </div>

                            <div class="order-status-area">
                                <?php if ($isNeighborhoodOrder): ?>
                                    <span class="order-badge badge-neighborhood">
                                        🧺 Mahalle Sepeti
                                    </span>
                                <?php endif; ?>

                                <span class="order-badge <?= e(consumer_order_status_class($orderService, $orderStatus)) ?>">
                                    <?= e(consumer_order_status_label($orderService, $order, $orderStatus)) ?>
                                </span>

                                <span class="order-badge <?= e(consumer_order_payment_class($orderService, $paymentStatus)) ?>">
                                    <?= e(consumer_order_payment_label($orderService, $order, $paymentStatus)) ?>
                                </span>
                            </div>
                        </div>

                        <div class="order-summary-grid">
                            <div>
                                <span><?= $isNeighborhoodOrder ? 'Kişisel Payın' : 'Toplam' ?></span>
                                <strong><?= e(consumer_order_money($personalAmount)) ?></strong>
                            </div>

                            <div>
                                <span>Ara Toplam</span>
                                <strong><?= e(consumer_order_money((float) ($order['subtotal'] ?? 0))) ?></strong>
                            </div>

                            <div>
                                <span>Kargo</span>
                                <strong><?= e(consumer_order_money((float) ($order['shipping_fee'] ?? 0))) ?></strong>
                            </div>

                            <div>
                                <span>Takip No</span>
                                <strong><?= e($trackingNo ?: '-') ?></strong>
                            </div>
                        </div>

                        <?php if ($isNeighborhoodOrder && is_array($neighborhood)): ?>
                            <?php
                                $targetQuantity = (float) ($neighborhood['target_quantity'] ?? 0);
                                $currentQuantity = (float) ($neighborhood['current_quantity'] ?? 0);
                                $progressPercent = $targetQuantity > 0
                                    ? min(100, round(($currentQuantity / $targetQuantity) * 100))
                                    : 0;
                                $basketUnit = consumer_order_unit_label((string) ($neighborhood['unit_type'] ?? 'kg'));
                                $myQuantity = (float) ($neighborhood['my_quantity'] ?? 0);
                                $myPaymentStatus = $neighborhood['my_payment_status'] ?? null;
                                $members = $neighborhood['members'] ?? [];
                            ?>

                            <div class="neighborhood-order-box">
                                <div class="neighborhood-order-heading">
                                    <span>🧺</span>

                                    <div>
                                        <h3><?= e($neighborhood['basket_title'] ?? 'Mahalle Sepeti') ?></h3>
                                        <p>
                                            Bu sipariş Mahalle Sepeti toplu alımından oluşturuldu.
                                            Senin payın:
                                            <strong>
                                                <?= e(number_format($myQuantity, 2, ',', '.')) ?>
                                                <?= e($basketUnit) ?>
                                            </strong>
                                        </p>
                                    </div>
                                </div>

                                <div class="neighborhood-progress-info">
                                    <span>Toplanan miktar</span>
                                    <strong>
                                        <?= e(number_format($currentQuantity, 2, ',', '.')) ?> /
                                        <?= e(number_format($targetQuantity, 2, ',', '.')) ?>
                                        <?= e($basketUnit) ?>
                                    </strong>
                                </div>

                                <div class="neighborhood-progress-bar">
                                    <span style="width: <?= e((string) $progressPercent) ?>%;"></span>
                                </div>

                                <div class="neighborhood-order-grid">
                                    <div>
                                        <span>Sepet ürünü</span>
                                        <strong><?= e($neighborhood['product_title'] ?? 'Ürün') ?></strong>
                                    </div>

                                    <div>
                                        <span>İndirim</span>
                                        <strong>%<?= e(number_format((float) ($neighborhood['discount_percent'] ?? 0), 2, ',', '.')) ?></strong>
                                    </div>

                                    <div>
                                        <span>İndirimli fiyat</span>
                                        <strong>
                                            <?= e(consumer_order_money((float) ($neighborhood['discounted_unit_price'] ?? 0))) ?> /
                                            <?= e($basketUnit) ?>
                                        </strong>
                                    </div>

                                    <div>
                                        <span>Ödeme durumun</span>
                                        <strong>
                                            <?php if ($myPaymentStatus === 'paid'): ?>
                                                Ödendi
                                            <?php elseif ($myPaymentStatus === 'pending'): ?>
                                                Beklemede
                                            <?php elseif ($myPaymentStatus): ?>
                                                <?= e($myPaymentStatus) ?>
                                            <?php else: ?>
                                                Kayıt yok
                                            <?php endif; ?>
                                        </strong>
                                    </div>
                                </div>

                                <?php if ($members): ?>
                                    <div class="neighborhood-member-strip">
                                        <?php foreach ($members as $member): ?>
                                            <span>
                                                <?= e($member['full_name'] ?? 'Kullanıcı') ?>:
                                                <strong>
                                                    <?= e(number_format((float) ($member['quantity'] ?? 0), 2, ',', '.')) ?>
                                                    <?= e($basketUnit) ?>
                                                </strong>
                                            </span>
                                        <?php endforeach; ?>
                                    </div>
                                <?php endif; ?>

                                <?php if ($basketDetailUrl): ?>
                                    <a class="orders-btn orders-btn-light neighborhood-detail-btn" href="<?= e($basketDetailUrl) ?>">
                                        Mahalle Sepeti Detayını Gör
                                    </a>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                        <div class="order-items">
                            <div class="order-section-title">
                                <span>🧺</span>

                                <div>
                                    <h3>Ürünler</h3>
                                    <p>Bu siparişe ait ürün kalemleri.</p>
                                </div>
                            </div>

                            <?php if (empty($items)): ?>
                                <div class="soft-empty">
                                    Bu sipariş için ürün kalemi bulunamadı.
                                </div>
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
                                            <div class="order-item-main">
                                                <span class="item-leaf">🌱</span>

                                                <div>
                                                    <strong><?= e($item['product_title_snapshot'] ?? 'Ürün') ?></strong>

                                                    <p>
                                                        <?= e((string) $quantity) ?>
                                                        <?= e($unit) ?>
                                                        ·
                                                        <?= e(consumer_order_money($unitPrice)) ?>
                                                        /
                                                        <?= e($unit) ?>
                                                    </p>
                                                </div>
                                            </div>

                                            <div class="order-item-actions">
                                                <strong><?= e(consumer_order_money($totalPrice)) ?></strong>

                                                <?php if ($isDelivered && !$hasReview): ?>
                                                    <a class="small-link" href="<?= e($reviewCreateUrl) ?>">
                                                        Yorum Yap
                                                    </a>
                                                <?php elseif ($isDelivered && $hasReview): ?>
                                                    <span class="review-done">
                                                        Yorum Yapıldı
                                                    </span>

                                                    <a class="small-link secondary-link" href="<?= e($reviewViewUrl) ?>">
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
                                <div class="shipment-title">
                                    <span>🚚</span>
                                    <strong>Kargo Bilgisi</strong>
                                </div>

                                <div class="shipment-grid">
                                    <div>
                                        <span>Firma</span>
                                        <strong><?= e($shipment['cargo_company'] ?: 'Demo Kargo') ?></strong>
                                    </div>

                                    <div>
                                        <span>Durum</span>
                                        <strong><?= e($shipment['shipment_status'] ?? '-') ?></strong>
                                    </div>

                                    <div>
                                        <span>Takip No</span>
                                        <strong><?= e($shipment['tracking_no'] ?? '-') ?></strong>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                    </article>
                <?php endforeach; ?>
            </section>
        <?php endif; ?>
    </section>
</main>

<style>
    :root {
        --orders-green-950: #102f1a;
        --orders-green-900: #163d22;
        --orders-green-800: #245c2f;
        --orders-green-700: #2f7d3d;
        --orders-green-600: #3f9650;
        --orders-green-100: #eaf6e8;
        --orders-green-50: #f6fbf4;
        --orders-cream: #fffaf1;
        --orders-yellow: #f2bf4d;
        --orders-red: #9b111e;
        --orders-text: #1e2b21;
        --orders-muted: #687669;
        --orders-border: rgba(47, 125, 61, .14);
        --orders-shadow: 0 24px 70px rgba(31, 79, 43, .12);
        --orders-radius-lg: 28px;
    }

    body.page-consumer-orders {
        background:
            radial-gradient(circle at 14% 12%, rgba(196, 231, 177, .48), transparent 28%),
            radial-gradient(circle at 88% 16%, rgba(242, 191, 77, .16), transparent 24%),
            linear-gradient(180deg, #f8fbf2 0%, #f3f8ed 48%, #ffffff 100%);
    }

    .consumer-orders-page {
        overflow: hidden;
    }

    .orders-hero {
        position: relative;
        min-height: 390px;
        padding: 34px 18px 94px;
        background:
            radial-gradient(circle at 82% 18%, rgba(242, 191, 77, .30), transparent 26%),
            radial-gradient(circle at 12% 78%, rgba(255, 255, 255, .16), transparent 24%),
            linear-gradient(135deg, rgba(36, 92, 47, .97), rgba(47, 125, 61, .87));
        color: #ffffff;
    }

    .orders-hero::after {
        content: '';
        position: absolute;
        inset: auto 0 -1px;
        height: 90px;
        background: linear-gradient(180deg, rgba(246, 251, 244, 0), #f6fbf4 82%);
        pointer-events: none;
    }

    .orders-hero-inner,
    .orders-shell {
        width: min(1180px, calc(100% - 32px));
        margin: 0 auto;
    }

    .orders-hero-inner {
        position: relative;
        z-index: 2;
    }

    .orders-hero-bg {
        position: absolute;
        border-radius: 999px;
        filter: blur(2px);
        opacity: .45;
        pointer-events: none;
    }

    .orders-blob-one {
        width: 230px;
        height: 230px;
        right: 10%;
        top: 42px;
        background: rgba(242, 191, 77, .28);
    }

    .orders-blob-two {
        width: 150px;
        height: 150px;
        left: 8%;
        bottom: 36px;
        background: rgba(255, 255, 255, .20);
    }

    .orders-breadcrumb {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 9px;
        font-size: 14px;
        margin-bottom: 32px;
        color: rgba(255, 255, 255, .76);
    }

    .orders-breadcrumb a {
        color: #ffffff;
        text-decoration: none;
        font-weight: 800;
    }

    .orders-breadcrumb strong {
        color: #ffffff;
        font-weight: 900;
    }

    .orders-hero-content {
        display: grid;
        grid-template-columns: minmax(0, 1.25fr) minmax(320px, .75fr);
        gap: 24px;
        align-items: center;
    }

    .orders-eyebrow,
    .section-kicker {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 8px 13px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 900;
        letter-spacing: .04em;
        text-transform: uppercase;
    }

    .orders-eyebrow {
        background: rgba(255, 255, 255, .16);
        border: 1px solid rgba(255, 255, 255, .28);
        color: #ffffff;
    }

    .orders-eyebrow.light,
    .section-kicker {
        background: var(--orders-green-100);
        color: var(--orders-green-800);
        border-color: transparent;
    }

    .orders-hero-copy h1 {
        margin: 17px 0 12px;
        font-size: clamp(36px, 5vw, 62px);
        line-height: 1.03;
        letter-spacing: -.045em;
    }

    .orders-hero-copy p {
        max-width: 700px;
        margin: 0;
        color: rgba(255, 255, 255, .86);
        font-size: 17px;
        line-height: 1.7;
    }

    .orders-hero-stats {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 18px;
    }

    .orders-hero-stats span {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 9px 12px;
        border-radius: 999px;
        background: rgba(255, 255, 255, .16);
        border: 1px solid rgba(255, 255, 255, .24);
        color: #ffffff;
        font-size: 13px;
        font-weight: 900;
    }

    .orders-hero-card {
        padding: 22px;
        border-radius: 30px;
        background: rgba(255, 255, 255, .14);
        border: 1px solid rgba(255, 255, 255, .28);
        box-shadow: 0 22px 58px rgba(16, 47, 26, .22);
        backdrop-filter: blur(18px);
    }

    .hero-card-icon {
        width: 60px;
        height: 60px;
        display: grid;
        place-items: center;
        border-radius: 20px;
        background: rgba(255, 255, 255, .18);
        font-size: 28px;
        margin-bottom: 16px;
    }

    .orders-hero-card h2 {
        margin: 0 0 10px;
        font-size: 25px;
        letter-spacing: -.03em;
    }

    .orders-hero-card p {
        margin: 0;
        color: rgba(255, 255, 255, .82);
        line-height: 1.6;
    }

    .hero-mini-list {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 16px;
    }

    .hero-mini-list span {
        display: inline-flex;
        padding: 8px 10px;
        border-radius: 999px;
        background: rgba(255, 255, 255, .16);
        border: 1px solid rgba(255, 255, 255, .20);
        font-size: 12px;
        font-weight: 900;
    }

    .orders-shell {
        position: relative;
        z-index: 3;
        margin-top: -64px;
        padding-bottom: 54px;
    }

    .glass-card {
        background: rgba(255, 255, 255, .92);
        border: 1px solid rgba(255, 255, 255, .72);
        border-radius: var(--orders-radius-lg);
        box-shadow: var(--orders-shadow);
        backdrop-filter: blur(16px);
    }

    .orders-top {
        margin-bottom: 22px;
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 18px;
    }

    .orders-top h2,
    .order-card h2,
    .orders-empty-card h2 {
        margin: 10px 0 6px;
        color: var(--orders-green-900);
        letter-spacing: -.03em;
    }

    .orders-top p,
    .order-header p,
    .order-section-title p,
    .order-item p,
    .orders-empty-card p {
        margin: 0;
        color: var(--orders-muted);
        line-height: 1.6;
    }

    .orders-top-total {
        display: grid;
        justify-items: end;
        gap: 4px;
        min-width: 180px;
    }

    .orders-top-total span {
        color: var(--orders-muted);
        font-size: 13px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: .04em;
    }

    .orders-top-total strong {
        color: var(--orders-green-800);
        font-size: 28px;
        line-height: 1;
    }

    .orders-list {
        display: grid;
        gap: 22px;
    }

    .order-card {
        padding: 20px;
    }

    .order-header {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: flex-start;
        border-bottom: 1px solid rgba(47, 125, 61, .10);
        padding-bottom: 16px;
        margin-bottom: 16px;
    }

    .order-title-area {
        display: flex;
        gap: 13px;
        align-items: flex-start;
    }

    .order-icon {
        width: 48px;
        height: 48px;
        display: grid;
        place-items: center;
        border-radius: 17px;
        background: var(--orders-green-100);
        flex: 0 0 auto;
        font-size: 22px;
    }

    .order-title-area h2 {
        margin-top: 0;
        font-size: 28px;
    }

    .order-title-area strong {
        color: var(--orders-green-900);
    }

    .order-status-area {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
        justify-content: flex-end;
    }

    .order-badge {
        display: inline-flex;
        align-items: center;
        padding: 8px 11px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 900;
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


    .badge-neighborhood {
        background: #fff5d6;
        color: #7a5400;
    }

    .order-type-inline {
        display: inline-flex;
        width: fit-content;
        margin: 0 0 6px;
        padding: 7px 10px;
        border-radius: 999px;
        background: #fff5d6;
        color: #7a5400;
        font-size: 13px;
        font-weight: 950;
    }

    .order-summary-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 14px;
        margin-bottom: 20px;
    }

    .order-summary-grid div {
        padding: 15px;
        border-radius: 18px;
        background: #fbfdf8;
        border: 1px solid var(--orders-border);
    }

    .order-summary-grid span,
    .order-summary-grid strong {
        display: block;
    }

    .order-summary-grid span {
        color: var(--orders-muted);
        font-size: 12px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: .04em;
        margin-bottom: 7px;
    }

    .order-summary-grid strong {
        color: var(--orders-green-900);
        overflow-wrap: anywhere;
    }


    .neighborhood-order-box {
        margin: 18px 0 20px;
        padding: 18px;
        border-radius: 24px;
        background: #fffaf1;
        border: 1px solid rgba(242, 191, 77, .35);
    }

    .neighborhood-order-heading {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        margin-bottom: 14px;
    }

    .neighborhood-order-heading > span {
        width: 44px;
        height: 44px;
        display: grid;
        place-items: center;
        border-radius: 16px;
        background: #ffffff;
        flex: 0 0 auto;
        font-size: 22px;
    }

    .neighborhood-order-heading h3 {
        margin: 0 0 5px;
        color: #7a5400;
        font-size: 22px;
        letter-spacing: -.02em;
    }

    .neighborhood-order-heading p {
        margin: 0;
        color: #7a6a42;
        line-height: 1.6;
    }

    .neighborhood-progress-info {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 8px;
        color: #7a5400;
        font-weight: 900;
    }

    .neighborhood-progress-bar {
        width: 100%;
        height: 12px;
        overflow: hidden;
        border-radius: 999px;
        background: #f3e1a8;
        margin-bottom: 14px;
    }

    .neighborhood-progress-bar span {
        display: block;
        height: 100%;
        border-radius: inherit;
        background: linear-gradient(90deg, #b88400, #f2bf4d);
    }

    .neighborhood-order-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 10px;
    }

    .neighborhood-order-grid div {
        padding: 12px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid rgba(242, 191, 77, .24);
    }

    .neighborhood-order-grid span {
        display: block;
        color: #8a6200;
        font-size: 12px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: .04em;
        margin-bottom: 6px;
    }

    .neighborhood-order-grid strong {
        color: #7a5400;
        overflow-wrap: anywhere;
    }

    .neighborhood-member-strip {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin-top: 14px;
    }

    .neighborhood-member-strip span {
        display: inline-flex;
        gap: 5px;
        padding: 8px 10px;
        border-radius: 999px;
        background: #ffffff;
        color: #7a6a42;
        border: 1px solid rgba(242, 191, 77, .24);
        font-size: 13px;
        font-weight: 850;
    }

    .neighborhood-member-strip strong {
        color: #7a5400;
    }

    .neighborhood-detail-btn {
        margin-top: 14px;
    }

    .order-items {
        margin-top: 4px;
    }

    .order-section-title {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        margin-bottom: 14px;
    }

    .order-section-title > span {
        width: 42px;
        height: 42px;
        display: grid;
        place-items: center;
        border-radius: 15px;
        background: var(--orders-green-100);
        flex: 0 0 auto;
    }

    .order-section-title h3 {
        margin: 0 0 4px;
        color: var(--orders-green-900);
        font-size: 22px;
        letter-spacing: -.02em;
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
        padding: 15px;
        border-radius: 20px;
        background: #fbfdf8;
        border: 1px solid var(--orders-border);
        transition: transform .18s ease, box-shadow .18s ease;
    }

    .order-item:hover {
        transform: translateY(-2px);
        box-shadow: 0 16px 34px rgba(31, 79, 43, .10);
    }

    .order-item-main {
        display: flex;
        gap: 12px;
        align-items: center;
        min-width: 0;
    }

    .item-leaf {
        width: 42px;
        height: 42px;
        display: grid;
        place-items: center;
        border-radius: 15px;
        background: var(--orders-green-100);
        flex: 0 0 auto;
    }

    .order-item-main strong {
        display: block;
        color: var(--orders-green-900);
        font-size: 16px;
    }

    .order-item-main p {
        margin-top: 5px;
    }

    .order-item-actions {
        display: grid;
        gap: 8px;
        justify-items: end;
        min-width: 140px;
        text-align: right;
    }

    .order-item-actions strong {
        color: var(--orders-green-800);
        font-size: 18px;
    }

    .small-link {
        color: var(--orders-green-700);
        font-weight: 900;
        text-decoration: none;
        white-space: nowrap;
    }

    .small-link:hover {
        text-decoration: underline;
    }

    .secondary-link {
        font-size: 13px;
    }

    .review-done {
        display: inline-block;
        padding: 7px 10px;
        border-radius: 999px;
        background: #e7f7e8;
        color: #236b2c;
        font-size: 13px;
        font-weight: 900;
        white-space: nowrap;
    }

    .muted-action {
        color: #718071;
        font-size: 14px;
        text-align: right;
        font-weight: 800;
    }

    .shipment-box {
        margin-top: 18px;
        padding: 16px;
        border-radius: 22px;
        background: #fff8df;
        border: 1px solid rgba(242, 191, 77, .35);
    }

    .shipment-title {
        display: flex;
        align-items: center;
        gap: 9px;
        margin-bottom: 13px;
        color: #7a5400;
    }

    .shipment-title span {
        width: 36px;
        height: 36px;
        display: grid;
        place-items: center;
        border-radius: 13px;
        background: #ffffff;
    }

    .shipment-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }

    .shipment-grid div {
        padding: 13px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid rgba(242, 191, 77, .24);
    }

    .shipment-grid span,
    .shipment-grid strong {
        display: block;
    }

    .shipment-grid span {
        color: #8a6200;
        font-size: 12px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: .04em;
        margin-bottom: 6px;
    }

    .shipment-grid strong {
        color: #7a5400;
        overflow-wrap: anywhere;
    }

    .soft-empty {
        padding: 16px;
        border-radius: 18px;
        background: #fbfdf8;
        border: 1px dashed rgba(47, 125, 61, .24);
        color: var(--orders-muted);
        font-weight: 800;
    }

    .orders-empty-card {
        max-width: 720px;
        margin: 0 auto;
        padding: 42px;
        text-align: center;
    }

    .empty-icon {
        width: 78px;
        height: 78px;
        margin: 0 auto 14px;
        display: grid;
        place-items: center;
        border-radius: 25px;
        background: var(--orders-green-100);
        font-size: 36px;
    }

    .orders-empty-card h2 {
        margin-top: 18px;
        font-size: 34px;
    }

    .orders-empty-card p {
        max-width: 520px;
        margin: 0 auto 22px;
    }

    .empty-actions {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 10px;
    }

    .orders-btn {
        min-height: 46px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        padding: 12px 18px;
        border: 0;
        border-radius: 15px;
        text-decoration: none;
        font-weight: 900;
        cursor: pointer;
        transition: transform .18s ease, box-shadow .18s ease, background .18s ease;
        font-family: inherit;
        font-size: 14px;
    }

    .orders-btn:hover {
        transform: translateY(-2px);
    }

    .orders-btn-primary {
        background: linear-gradient(135deg, var(--orders-green-700), var(--orders-green-900));
        color: #ffffff;
        box-shadow: 0 16px 32px rgba(47, 125, 61, .24);
    }

    .orders-btn-light {
        background: var(--orders-green-50);
        color: var(--orders-green-800);
        border: 1px solid var(--orders-border);
    }

    @media (max-width: 1100px) {
        .orders-hero-content {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 900px) {
        .orders-top,
        .order-header {
            flex-direction: column;
            align-items: flex-start;
        }

        .orders-top-total {
            justify-items: start;
        }

        .order-status-area {
            justify-content: flex-start;
        }

        .order-summary-grid,
        .shipment-grid,
        .neighborhood-order-grid {
            grid-template-columns: 1fr 1fr;
        }

        .order-item {
            align-items: flex-start;
            flex-direction: column;
        }

        .order-item-actions {
            justify-items: start;
            text-align: left;
        }
    }

    @media (max-width: 720px) {
        .orders-hero {
            min-height: 440px;
            padding-top: 24px;
        }

        .orders-hero-inner,
        .orders-shell {
            width: min(100% - 22px, 1180px);
        }

        .orders-breadcrumb {
            font-size: 13px;
            margin-bottom: 24px;
        }

        .orders-hero-copy p {
            font-size: 15px;
        }

        .orders-shell {
            margin-top: -52px;
        }

        .orders-top,
        .order-card,
        .orders-hero-card,
        .orders-empty-card {
            padding: 14px;
            border-radius: 23px;
        }

        .order-title-area {
            flex-direction: column;
        }

        .order-summary-grid,
        .shipment-grid,
        .neighborhood-order-grid {
            grid-template-columns: 1fr;
        }

        .order-item-main {
            align-items: flex-start;
        }

        .orders-empty-card h2 {
            font-size: 28px;
        }

        .empty-actions .orders-btn {
            width: 100%;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>