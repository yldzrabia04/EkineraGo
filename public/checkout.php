<?php

require_once __DIR__ . '/../app/bootstrap.php';

require_once APP_PATH . '/Services/CartService.php';
require_once APP_PATH . '/Services/WalletService.php';
require_once APP_PATH . '/Services/ShippingService.php';
require_once APP_PATH . '/Services/CheckoutService.php';

ConsumerMiddleware::handle();

$checkoutService = new CheckoutService();
$userId = (int) currentUserId();

if (is_post()) {
    require_csrf();

    $result = $checkoutService->checkout($userId, $_POST);

    if ($result['success']) {
        flash_success($result['message']);
        redirect('consumer/orders.php');
    }

    flash_error($result['message']);
    redirect('checkout.php');
}

$preview = $checkoutService->preview($userId);
$previewData = $preview['data'] ?? [];

$items = $previewData['items'] ?? [];
$producerGroups = $previewData['producer_groups'] ?? [];
$cartTotal = (float) ($previewData['cart_total'] ?? 0);
$walletBalance = (float) ($previewData['wallet_balance'] ?? 0);
$canCheckout = !empty($previewData['can_checkout']);
$stockCheck = $previewData['stock_check'] ?? [
    'success' => true,
    'message' => '',
];

$pageTitle = 'Checkout';
$bodyClass = 'page-checkout';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('checkout_unit_label')) {
    function checkout_unit_label(string $unit): string
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
        <h1>Checkout</h1>

        <p>
            Sepetindeki ürünler üretici bazlı ayrı siparişlere dönüştürülür.
            Ödeme sanal bakiyenden düşülür.
        </p>
    </section>

    <?php if (empty($items)): ?>
        <section class="card empty-state">
            <h2>Checkout için sepet boş</h2>

            <p>
                Satın alma adımına geçmeden önce sepete ürün eklemelisin.
            </p>

            <a class="btn" href="<?= e(url('products.php')) ?>">
                Ürünleri İncele
            </a>
        </section>
    <?php else: ?>
        <section class="checkout-layout">
            <div class="checkout-main">
                <section class="card">
                    <h2>Teslimat ve Not</h2>

                    <p class="muted">
                        Demo sürümde adres bilgisi kullanıcı profilinden alınacaktır.
                        Bu alana sipariş notu ekleyebilirsin.
                    </p>

                    <form id="checkoutForm" method="POST" action="<?= e(url('checkout.php')) ?>">
                        <?= csrf_field() ?>

                        <div class="form-group">
                            <label for="customer_note">Sipariş Notu</label>
                            <textarea
                                id="customer_note"
                                name="customer_note"
                                rows="4"
                                placeholder="Üreticiye iletmek istediğin not..."
                            ></textarea>
                        </div>
                    </form>
                </section>

                <section class="card producer-orders-card">
                    <h2>Oluşacak Siparişler</h2>

                    <p class="muted">
                        Sepette farklı üreticiler varsa her üretici için ayrı sipariş oluşturulur.
                    </p>

                    <div class="producer-order-list">
                        <?php foreach ($producerGroups as $group): ?>
                            <article class="producer-order-box">
                                <div class="producer-order-heading">
                                    <strong><?= e($group['producer_name'] ?? 'Üretici') ?></strong>
                                    <span><?= e(formatMoney($group['subtotal'] ?? 0)) ?></span>
                                </div>

                                <div class="order-item-list">
                                    <?php foreach (($group['items'] ?? []) as $item): ?>
                                        <?php
                                            $unit = checkout_unit_label($item['unit_type'] ?? 'kg');
                                            $quantity = (float) ($item['quantity'] ?? 0);
                                            $price = (float) ($item['price'] ?? 0);
                                        ?>

                                        <div class="order-item">
                                            <span>
                                                <?= e($item['title'] ?? 'Ürün') ?>
                                                ·
                                                <?= e((string) $quantity) ?>
                                                <?= e($unit) ?>
                                            </span>

                                            <strong>
                                                <?= e(formatMoney($price * $quantity)) ?>
                                            </strong>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            </article>
                        <?php endforeach; ?>
                    </div>
                </section>
            </div>

            <aside class="card checkout-summary">
                <h2>Ödeme Özeti</h2>

                <div class="summary-row">
                    <span>Sanal Bakiye</span>
                    <strong><?= e(formatMoney($walletBalance)) ?></strong>
                </div>

                <div class="summary-row">
                    <span>Sepet Toplamı</span>
                    <strong><?= e(formatMoney($cartTotal)) ?></strong>
                </div>

                <div class="summary-row">
                    <span>Kalan Bakiye</span>
                    <strong><?= e(formatMoney($walletBalance - $cartTotal)) ?></strong>
                </div>

                <div class="summary-total">
                    <span>Ödenecek</span>
                    <strong><?= e(formatMoney($cartTotal)) ?></strong>
                </div>

                <?php if (!$stockCheck['success']): ?>
                    <div class="checkout-warning">
                        <?= e($stockCheck['message']) ?>
                    </div>
                <?php endif; ?>

                <?php if ($walletBalance < $cartTotal): ?>
                    <div class="checkout-warning">
                        Sanal bakiyen yetersiz. Önce bakiye yüklemelisin.
                    </div>

                    <a class="btn" href="<?= e(url('consumer/wallet.php')) ?>">
                        Bakiye Yükle
                    </a>
                <?php else: ?>
                    <button
                        class="btn"
                        type="submit"
                        form="checkoutForm"
                        <?= $canCheckout ? '' : 'disabled' ?>
                        onclick="return confirm('Satın alma işlemini onaylıyor musun?');"
                    >
                        Satın Al
                    </button>
                <?php endif; ?>

                <a class="btn btn-secondary" href="<?= e(url('cart.php')) ?>">
                    Sepete Dön
                </a>
            </aside>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .checkout-main h2,
    .checkout-summary h2,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .muted,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .checkout-layout {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 22px;
        align-items: start;
    }

    .checkout-main {
        display: grid;
        gap: 22px;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #245c2f;
    }

    .form-group textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .producer-order-list {
        display: grid;
        gap: 16px;
    }

    .producer-order-box {
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
    }

    .producer-order-heading,
    .order-item,
    .summary-row,
    .summary-total {
        display: flex;
        justify-content: space-between;
        gap: 12px;
    }

    .producer-order-heading {
        color: #245c2f;
        margin-bottom: 12px;
        font-size: 18px;
    }

    .order-item {
        padding: 9px 0;
        border-top: 1px solid #edf1ea;
        color: #526052;
    }

    .order-item strong {
        color: #245c2f;
        white-space: nowrap;
    }

    .summary-row,
    .summary-total {
        padding: 13px 0;
        border-bottom: 1px solid #edf1ea;
    }

    .summary-total {
        font-size: 20px;
        color: #245c2f;
        border-bottom: none;
        margin-bottom: 14px;
    }

    .checkout-summary .btn {
        width: 100%;
        text-align: center;
        margin-top: 10px;
    }

    .checkout-warning {
        padding: 12px;
        border-radius: 10px;
        background: #fff5d6;
        color: #8a6200;
        font-weight: bold;
        margin: 12px 0;
    }

    button:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 900px) {
        .checkout-layout {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>