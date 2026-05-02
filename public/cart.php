<?php

require_once __DIR__ . '/../app/bootstrap.php';

ConsumerMiddleware::handle();

$cartService = new CartService();
$userId = (int) currentUserId();

if (is_post()) {
    require_csrf();

    $action = $_POST['_action'] ?? '';

    if ($action === 'update') {
        $cartItemId = (int) ($_POST['cart_item_id'] ?? 0);
        $quantity = (float) ($_POST['quantity'] ?? 0);

        $result = $cartService->updateItem($userId, $cartItemId, $quantity);

        if ($result['success']) {
            flash_success($result['message']);
        } else {
            flash_error($result['message']);
        }

        redirect('cart.php');
    }

    if ($action === 'remove') {
        $cartItemId = (int) ($_POST['cart_item_id'] ?? 0);

        $result = $cartService->removeItem($userId, $cartItemId);

        if ($result['success']) {
            flash_success($result['message']);
        } else {
            flash_error($result['message']);
        }

        redirect('cart.php');
    }

    if ($action === 'clear') {
        $result = $cartService->clearCart($userId);

        if ($result['success']) {
            flash_success($result['message']);
        } else {
            flash_error($result['message']);
        }

        redirect('cart.php');
    }

    flash_error('Geçersiz sepet işlemi.');
    redirect('cart.php');
}

$cart = $cartService->getActiveCart($userId);
$items = $cart['items'] ?? [];
$producerGroups = $cart['producer_groups'] ?? [];
$cartTotal = (float) ($cart['total'] ?? 0);

$pageTitle = 'Sepetim';
$bodyClass = 'page-cart';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('cart_unit_label')) {
    function cart_unit_label(string $unit): string
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
        <div>
            <h1>Sepetim</h1>

            <p>
                Sepetindeki ürünleri üretici bazlı görüntüleyebilir, miktarları güncelleyebilir
                ve checkout adımına geçebilirsin.
            </p>
        </div>

        <?php if (!empty($items)): ?>
            <form method="POST" action="<?= e(url('cart.php')) ?>" onsubmit="return confirm('Sepeti temizlemek istediğine emin misin?');">
                <?= csrf_field() ?>
                <input type="hidden" name="_action" value="clear">
                <button class="btn btn-secondary" type="submit">
                    Sepeti Temizle
                </button>
            </form>
        <?php endif; ?>
    </section>

    <?php if (empty($items)): ?>
        <section class="card empty-state">
            <h2>Sepetin boş</h2>

            <p>
                Yerel üreticilerin ürünlerini inceleyip sepete ekleyerek alışverişe başlayabilirsin.
            </p>

            <a class="btn" href="<?= e(url('products.php')) ?>">
                Ürünleri İncele
            </a>
        </section>
    <?php else: ?>
        <section class="cart-layout">
            <div class="cart-groups">
                <?php foreach ($producerGroups as $group): ?>
                    <section class="card cart-group">
                        <div class="group-heading">
                            <div>
                                <h2><?= e($group['producer_name'] ?? 'Üretici') ?></h2>

                                <p>
                                    Bu üreticiden seçilen ürünler checkout sırasında ayrı siparişe dönüşür.
                                </p>
                            </div>

                            <strong>
                                <?= e(formatMoney($group['subtotal'] ?? 0)) ?>
                            </strong>
                        </div>

                        <div class="cart-item-list">
                            <?php foreach ($group['items'] as $item): ?>
                                <?php
                                    $unit = cart_unit_label($item['unit_type'] ?? 'kg');
                                    $quantity = (float) ($item['quantity'] ?? 0);
                                    $price = (float) ($item['price'] ?? 0);
                                    $itemTotal = $price * $quantity;
                                ?>

                                <article class="cart-item">
                                    <div>
                                        <strong><?= e($item['title'] ?? 'Ürün') ?></strong>

                                        <p>
                                            <?= e(formatMoney($price)) ?> / <?= e($unit) ?>
                                            ·
                                            Stok:
                                            <?= e((string) ($item['stock_quantity'] ?? 0)) ?>
                                            <?= e($unit) ?>
                                        </p>

                                        <a class="small-link" href="<?= e(url('product-detail.php?id=' . $item['product_id'])) ?>">
                                            Ürün detayına git
                                        </a>
                                    </div>

                                    <form method="POST" action="<?= e(url('cart.php')) ?>" class="quantity-form">
                                        <?= csrf_field() ?>

                                        <input type="hidden" name="_action" value="update">
                                        <input type="hidden" name="cart_item_id" value="<?= e((string) $item['id']) ?>">

                                        <label>
                                            Miktar
                                            <input
                                                type="number"
                                                name="quantity"
                                                step="0.01"
                                                min="0.01"
                                                value="<?= e((string) $quantity) ?>"
                                            >
                                        </label>

                                        <button class="table-button" type="submit">
                                            Güncelle
                                        </button>
                                    </form>

                                    <div class="item-total">
                                        <strong><?= e(formatMoney($itemTotal)) ?></strong>

                                        <form method="POST" action="<?= e(url('cart.php')) ?>" onsubmit="return confirm('Bu ürünü sepetten kaldırmak istediğine emin misin?');">
                                            <?= csrf_field() ?>

                                            <input type="hidden" name="_action" value="remove">
                                            <input type="hidden" name="cart_item_id" value="<?= e((string) $item['id']) ?>">

                                            <button class="table-button danger" type="submit">
                                                Kaldır
                                            </button>
                                        </form>
                                    </div>
                                </article>
                            <?php endforeach; ?>
                        </div>
                    </section>
                <?php endforeach; ?>
            </div>

            <aside class="card cart-summary">
                <h2>Sepet Özeti</h2>

                <div class="summary-row">
                    <span>Ürün Sayısı</span>
                    <strong><?= e((string) count($items)) ?></strong>
                </div>

                <div class="summary-row">
                    <span>Üretici Sayısı</span>
                    <strong><?= e((string) count($producerGroups)) ?></strong>
                </div>

                <div class="summary-total">
                    <span>Toplam</span>
                    <strong><?= e(formatMoney($cartTotal)) ?></strong>
                </div>

                <a class="btn" href="<?= e(url('checkout.php')) ?>">
                    Checkout'a Git
                </a>

                <a class="btn btn-secondary" href="<?= e(url('products.php')) ?>">
                    Ürünlere Dön
                </a>
            </aside>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: center;
    }

    .page-heading h1,
    .cart-group h2,
    .cart-summary h2,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .group-heading p,
    .cart-item p,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .cart-layout {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 22px;
        align-items: start;
    }

    .cart-groups {
        display: grid;
        gap: 22px;
    }

    .group-heading {
        display: flex;
        justify-content: space-between;
        gap: 16px;
        align-items: flex-start;
        border-bottom: 1px solid #edf1ea;
        padding-bottom: 14px;
        margin-bottom: 14px;
    }

    .group-heading strong {
        color: #245c2f;
        font-size: 20px;
        white-space: nowrap;
    }

    .cart-item-list {
        display: grid;
        gap: 12px;
    }

    .cart-item {
        display: grid;
        grid-template-columns: 1.3fr .8fr .5fr;
        gap: 16px;
        align-items: center;
        padding: 14px 0;
        border-bottom: 1px solid #edf1ea;
    }

    .cart-item:last-child {
        border-bottom: none;
    }

    .small-link,
    .table-button {
        color: #2f7d3d;
        font-weight: bold;
        text-decoration: none;
        border: none;
        background: transparent;
        cursor: pointer;
        padding: 0;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    .table-button.danger {
        color: #9b111e;
    }

    .quantity-form label {
        display: grid;
        gap: 6px;
        color: #245c2f;
        font-weight: bold;
    }

    .quantity-form input {
        width: 100%;
        padding: 9px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
    }

    .item-total {
        display: grid;
        gap: 8px;
        justify-items: end;
    }

    .item-total strong {
        color: #245c2f;
    }

    .summary-row,
    .summary-total {
        display: flex;
        justify-content: space-between;
        gap: 12px;
        padding: 13px 0;
        border-bottom: 1px solid #edf1ea;
    }

    .summary-total {
        font-size: 20px;
        color: #245c2f;
        border-bottom: none;
        margin-bottom: 14px;
    }

    .cart-summary .btn {
        width: 100%;
        text-align: center;
        margin-top: 10px;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 1000px) {
        .cart-layout {
            grid-template-columns: 1fr;
        }

        .cart-item {
            grid-template-columns: 1fr;
        }

        .item-total {
            justify-items: start;
        }
    }

    @media (max-width: 768px) {
        .page-heading,
        .group-heading {
            flex-direction: column;
            align-items: flex-start;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>