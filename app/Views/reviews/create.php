<?php

if (!defined('APP_PATH')) {
    require_once __DIR__ . '/../../bootstrap.php';
}

ConsumerMiddleware::handle();

$orderItemId = (int) ($orderItemId ?? ($_GET['review_order_item_id'] ?? ($_GET['order_item_id'] ?? 0)));

if (is_post()) {
    $controller = new ReviewController();
    $controller->store();
}

$reviewService = new ReviewService();
$canReview = $reviewService->canReview((int) currentUserId(), $orderItemId);

$orderItem = $orderItemId > 0 ? OrderItem::findById($orderItemId) : null;
$order = $orderItem ? Order::findById((int) $orderItem['order_id']) : null;

$formErrors = errors();

$pageTitle = 'Yorum Yap';
$bodyClass = 'page-review-create';

require APP_PATH . '/Views/layouts/header.php';
?>

<main class="container">
    <section class="card page-heading">
        <h1>Ürünü Değerlendir</h1>

        <p>
            Teslim edilen sipariş ürünleri için puan ve yorum oluşturabilirsin.
        </p>
    </section>

    <?php if (!$canReview['success']): ?>
        <section class="card empty-state">
            <h2>Yorum yapılamıyor</h2>

            <p>
                <?= e($canReview['message'] ?? 'Bu ürün için yorum yapılamaz.') ?>
            </p>

            <a class="btn" href="<?= e(url('consumer/orders.php')) ?>">
                Siparişlerime Dön
            </a>
        </section>
    <?php else: ?>
        <section class="review-layout">
            <div class="card product-summary">
                <div class="product-image-placeholder">
                    Ürün Fotoğrafı
                </div>

                <h2><?= e($orderItem['product_title_snapshot'] ?? 'Ürün') ?></h2>

                <p>
                    Sipariş No:
                    <?= e($order['order_no'] ?? '-') ?>
                </p>

                <p>
                    Sipariş ürünü ID:
                    <?= e((string) $orderItemId) ?>
                </p>

                <span class="badge badge-success">
                    Teslim Edildi
                </span>
            </div>

            <div class="card">
                <h2>Yorum Bilgileri</h2>

                <form method="POST" action="<?= e(url('consumer/orders.php?review_order_item_id=' . $orderItemId)) ?>" class="review-form">
                    <?= csrf_field() ?>

                    <input type="hidden" name="order_item_id" value="<?= e((string) $orderItemId) ?>">

                    <div class="form-group">
                        <label for="rating">Puan</label>

                        <select id="rating" name="rating" required>
                            <option value="">Puan seç</option>
                            <option value="5" <?= (string) old('rating') === '5' ? 'selected' : '' ?>>5 - Çok iyi</option>
                            <option value="4" <?= (string) old('rating') === '4' ? 'selected' : '' ?>>4 - İyi</option>
                            <option value="3" <?= (string) old('rating') === '3' ? 'selected' : '' ?>>3 - Orta</option>
                            <option value="2" <?= (string) old('rating') === '2' ? 'selected' : '' ?>>2 - Kötü</option>
                            <option value="1" <?= (string) old('rating') === '1' ? 'selected' : '' ?>>1 - Çok kötü</option>
                        </select>

                        <?php if (!empty($formErrors['rating'])): ?>
                            <div class="field-error"><?= e($formErrors['rating'][0]) ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="form-group">
                        <label for="comment">Yorum</label>

                        <textarea
                            id="comment"
                            name="comment"
                            rows="6"
                            maxlength="1000"
                            placeholder="Ürün tazeliği, paketleme ve üretici deneyimini yaz..."
                        ><?= e((string) old('comment')) ?></textarea>

                        <?php if (!empty($formErrors['comment'])): ?>
                            <div class="field-error"><?= e($formErrors['comment'][0]) ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="form-actions">
                        <button class="btn" type="submit">
                            Yorumu Gönder
                        </button>

                        <a class="btn btn-secondary" href="<?= e(url('consumer/orders.php')) ?>">
                            Siparişlerime Dön
                        </a>
                    </div>
                </form>
            </div>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .review-layout h2,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .product-summary p,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .review-layout {
        display: grid;
        grid-template-columns: 1fr 2fr;
        gap: 22px;
    }

    .product-image-placeholder {
        height: 180px;
        border-radius: 14px;
        background: #e8f3e9;
        color: #2f7d3d;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        margin-bottom: 16px;
    }

    .badge {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .review-form label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #245c2f;
    }

    .form-group {
        margin-bottom: 16px;
    }

    .review-form select,
    .review-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .field-error {
        margin-top: 6px;
        color: #9b111e;
        font-size: 14px;
    }

    .form-actions {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 900px) {
        .review-layout {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>
<?php clear_old(); ?>