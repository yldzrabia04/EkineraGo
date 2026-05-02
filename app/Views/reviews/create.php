<?php

if (!defined('APP_PATH')) {
    require_once __DIR__ . '/../../bootstrap.php';
}

ConsumerMiddleware::handle();

$orderItemId = (int) ($orderItemId ?? ($_GET['review_order_item_id'] ?? ($_GET['order_item_id'] ?? 0)));

if (is_post()) {
    $controller = new ReviewController();
    $controller->store();
    exit;
}

$consumerId = (int) currentUserId();

if (!isset($reviewCheck)) {
    $reviewService = new ReviewService();
    $reviewCheck = $reviewService->canReview($consumerId, $orderItemId);
}

$canReview = $reviewCheck;
$reviewData = $canReview['data'] ?? [];

$orderItem = null;
$order = null;

if ($orderItemId > 0 && class_exists('OrderItem')) {
    $orderItem = OrderItem::findById($orderItemId);
}

if ($orderItem && class_exists('Order')) {
    $order = Order::findById((int) $orderItem['order_id']);
}

$productTitle = $reviewData['product_title']
    ?? $reviewData['product_title_snapshot']
    ?? $orderItem['product_title_snapshot']
    ?? 'Ürün';

$orderNo = $reviewData['order_no']
    ?? $order['order_no']
    ?? '-';

$productId = isset($reviewData['product_id']) && $reviewData['product_id'] !== null
    ? (int) $reviewData['product_id']
    : (int) ($orderItem['product_id'] ?? 0);

$formErrors = function_exists('errors') ? errors() : [];

/*
|------------------------------------------------------------
| EN KRİTİK DÜZELTME
|------------------------------------------------------------
| Form ayrı bir public/reviews/create.php dosyasına değil,
| bu ekranı açan route'a POST etsin.
*/
$formAction = url('consumer/orders.php?review_order_item_id=' . $orderItemId);

$ordersUrl = url('consumer/orders.php');
$productUrl = $productId > 0
    ? url('product-detail.php?id=' . $productId . '#reviews')
    : $ordersUrl;

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

            <a class="btn" href="<?= e($ordersUrl) ?>">
                Siparişlerime Dön
            </a>
        </section>
    <?php else: ?>
        <section class="review-layout">
            <div class="card product-summary">
                <div class="product-image-placeholder">
                    Ürün Fotoğrafı
                </div>

                <h2><?= e($productTitle) ?></h2>

                <p>
                    Sipariş No:
                    <strong><?= e($orderNo) ?></strong>
                </p>

                <p>
                    Sipariş ürünü ID:
                    <strong><?= e((string) $orderItemId) ?></strong>
                </p>

                <span class="badge badge-success">
                    Teslim Edildi
                </span>
            </div>

            <div class="card">
                <h2>Yorum Bilgileri</h2>

                <div
                    id="review-form-message"
                    class="review-form-message"
                    hidden
                ></div>

                <form
                    method="POST"
                    action="<?= e($formAction) ?>"
                    class="review-form"
                    id="review-create-form"
                >
                    <?= csrf_field() ?>

                    <input type="hidden" name="order_item_id" value="<?= e((string) $orderItemId) ?>">
                    <input type="hidden" name="review_order_item_id" value="<?= e((string) $orderItemId) ?>">

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

                        <div class="textarea-help">
                            En fazla 1000 karakter.
                        </div>

                        <?php if (!empty($formErrors['comment'])): ?>
                            <div class="field-error"><?= e($formErrors['comment'][0]) ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="form-actions">
                        <button class="btn review-submit-btn" type="submit" id="review-submit-button">
                            Yorumu Gönder
                        </button>

                        <a class="btn btn-secondary" href="<?= e($ordersUrl) ?>">
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

    .textarea-help {
        margin-top: 6px;
        font-size: 13px;
        color: #6b7668;
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
        margin-top: 22px;
    }

    .review-submit-btn {
        min-width: 200px;
        font-size: 17px;
        font-weight: 700;
        padding: 14px 22px;
        box-shadow: 0 8px 18px rgba(47, 125, 61, 0.18);
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    .review-form-message {
        margin-bottom: 16px;
        padding: 12px 14px;
        border-radius: 10px;
        font-weight: 600;
    }

    .review-form-message.success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .review-form-message.error {
        background: #fdeaea;
        color: #9b111e;
    }

    @media (max-width: 900px) {
        .review-layout {
            grid-template-columns: 1fr;
        }

        .form-actions {
            flex-direction: column;
            align-items: stretch;
        }

        .review-submit-btn {
            width: 100%;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('review-create-form');

        if (!form) {
            return;
        }

        const messageBox = document.getElementById('review-form-message');
        const submitButton = document.getElementById('review-submit-button');
        const successRedirectUrl = <?= json_encode($productUrl, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?>;

        function showMessage(type, message) {
            if (!messageBox) return;

            messageBox.hidden = false;
            messageBox.className = 'review-form-message ' + type;
            messageBox.textContent = message;
        }

        function clearMessage() {
            if (!messageBox) return;

            messageBox.hidden = true;
            messageBox.className = 'review-form-message';
            messageBox.textContent = '';
        }

        form.addEventListener('submit', async function (event) {
            event.preventDefault();

            clearMessage();

            if (submitButton) {
                submitButton.disabled = true;
                submitButton.textContent = 'Gönderiliyor...';
            }

            try {
                const response = await fetch(form.action, {
                    method: 'POST',
                    body: new FormData(form),
                    headers: {
                        'X-Requested-With': 'XMLHttpRequest',
                        'Accept': 'application/json'
                    }
                });

                const contentType = response.headers.get('content-type') || '';
                let result = null;

                if (contentType.includes('application/json')) {
                    result = await response.json();
                } else {
                    const text = await response.text();
                    console.error('JSON yerine dönen cevap:', text);
                    throw new Error('Sunucu JSON yerine HTML döndürdü. Form route kontrol edilmeli.');
                }

                if (!response.ok || !result.success) {
                    throw new Error(result.message || 'Yorum oluşturulamadı.');
                }

                showMessage('success', result.message || 'Yorum başarıyla oluşturuldu.');

                setTimeout(function () {
                    window.location.href = successRedirectUrl;
                }, 700);
            } catch (error) {
                showMessage('error', error.message || 'Yorum gönderilirken bir hata oluştu.');
            } finally {
                if (submitButton) {
                    submitButton.disabled = false;
                    submitButton.textContent = 'Yorumu Gönder';
                }
            }
        });
    });
</script>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>

<?php if (function_exists('clear_old')) clear_old(); ?>