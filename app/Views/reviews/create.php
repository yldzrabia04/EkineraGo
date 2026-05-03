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
$product = null;
$coverImage = null;

if ($orderItemId > 0 && class_exists('OrderItem')) {
    $orderItem = OrderItem::findById($orderItemId);
}

if ($orderItem && class_exists('Order')) {
    $order = Order::findById((int) $orderItem['order_id']);
}

$productId = isset($reviewData['product_id']) && $reviewData['product_id'] !== null
    ? (int) $reviewData['product_id']
    : (int) ($orderItem['product_id'] ?? 0);

if ($productId > 0 && class_exists('Product')) {
    $product = Product::findById($productId);
}

if ($productId > 0 && class_exists('ProductImage')) {
    $coverImage = ProductImage::getCoverByProductId($productId);
}

if (!$coverImage && $productId > 0 && function_exists('db')) {
    try {
        $stmt = db()->prepare("
            SELECT image_path
            FROM product_images
            WHERE product_id = :product_id
            ORDER BY is_cover DESC, sort_order ASC, id ASC
            LIMIT 1
        ");
        $stmt->execute(['product_id' => $productId]);
        $coverImage = $stmt->fetch() ?: null;
    } catch (Throwable $exception) {
        $coverImage = null;
    }
}

$productTitle = $reviewData['product_title']
    ?? $reviewData['product_title_snapshot']
    ?? $orderItem['product_title_snapshot']
    ?? $product['title']
    ?? 'Ürün';

$orderNo = $reviewData['order_no']
    ?? $order['order_no']
    ?? '-';

$producerName = $product['store_name']
    ?? $product['producer_name']
    ?? $reviewData['producer_name']
    ?? 'Üretici';

$locationText = trim(implode(' / ', array_filter([
    $product['province_name'] ?? null,
    $product['district_name'] ?? null,
])));

$quantity = isset($orderItem['quantity']) ? (float) $orderItem['quantity'] : null;
$unitType = $orderItem['unit_type_snapshot'] ?? $product['unit_type'] ?? 'kg';
$unitPrice = isset($orderItem['unit_price']) ? (float) $orderItem['unit_price'] : null;
$totalPrice = isset($orderItem['total_price']) ? (float) $orderItem['total_price'] : null;

$formErrors = function_exists('errors') ? errors() : [];
$formAction = url('consumer/orders.php?review_order_item_id=' . $orderItemId);
$ordersUrl = url('consumer/orders.php');
$productUrl = $productId > 0 ? url('product-detail.php?id=' . $productId . '#reviews') : $ordersUrl;

$pageTitle = 'Yorum Yap';
$bodyClass = 'page-review-create';
$oldRating = (int) old('rating');
$oldComment = (string) old('comment');

if (!function_exists('review_create_image_url')) {
    function review_create_image_url(?string $path): string
    {
        $path = trim((string) $path);

        if ($path === '') {
            return '';
        }

        $path = str_replace('\\', '/', $path);

        if (preg_match('~^(https?:)?//|^data:image/~i', $path)) {
            return $path;
        }

        $path = ltrim($path, '/');

        if (strpos($path, 'public/') === 0) {
            $path = substr($path, 7);
        }

        if (strpos($path, 'uploads/') === 0) {
            return function_exists('url') ? url($path) : '/' . $path;
        }

        if (function_exists('upload_url')) {
            return upload_url($path);
        }

        return function_exists('url') ? url('uploads/' . $path) : '/uploads/' . $path;
    }
}

if (!function_exists('review_create_format_money')) {
    function review_create_format_money($amount): string
    {
        if (function_exists('formatMoney')) {
            return formatMoney((float) $amount);
        }

        if (function_exists('format_money')) {
            return format_money((float) $amount);
        }

        return number_format((float) $amount, 2, ',', '.') . ' TL';
    }
}

if (!function_exists('review_create_format_quantity')) {
    function review_create_format_quantity(?float $quantity): string
    {
        if ($quantity === null) {
            return '-';
        }

        $formatted = number_format($quantity, 2, ',', '.');
        return rtrim(rtrim($formatted, '0'), ',');
    }
}

$productImagePath = $coverImage['image_path']
    ?? $product['cover_image']
    ?? $reviewData['cover_image']
    ?? '';

$productImageUrl = review_create_image_url($productImagePath);

require APP_PATH . '/Views/layouts/header.php';
?>

<main class="container review-create-page">
    <section class="review-hero card">
        <div>
            <span class="review-eyebrow">EkineraGo yorum sistemi</span>
            <h1>Ürünü Değerlendir</h1>
            <p>
                Teslim edilen sipariş ürünleri için puan ve yorum oluşturabilirsin.
                Deneyimin diğer tüketicilere yol gösterir, üreticinin de kendini geliştirmesine destek olur.
            </p>
        </div>

        <div class="review-hero-icon" aria-hidden="true">★</div>
    </section>

    <?php if (!$canReview['success']): ?>
        <section class="card empty-state review-empty-state">
            <div class="empty-icon">🌿</div>
            <h2>Yorum yapılamıyor</h2>
            <p><?= e($canReview['message'] ?? 'Bu ürün için yorum yapılamaz.') ?></p>

            <a class="btn" href="<?= e($ordersUrl) ?>">
                Siparişlerime Dön
            </a>
        </section>
    <?php else: ?>
        <section class="review-layout">
            <aside class="card review-product-card">
                <a class="review-product-image-wrap" href="<?= e($productUrl) ?>" aria-label="<?= e($productTitle) ?> ürün detayına git">
                    <?php if ($productImageUrl !== ''): ?>
                        <img
                            src="<?= e($productImageUrl) ?>"
                            alt="<?= e($productTitle) ?> fotoğrafı"
                            class="review-product-image"
                            loading="lazy"
                        >
                    <?php else: ?>
                        <div class="review-product-placeholder">
                            <span>🌱</span>
                            <strong>Ürün Fotoğrafı</strong>
                        </div>
                    <?php endif; ?>
                </a>

                <div class="review-product-content">
                    <span class="badge badge-success">Teslim Edildi</span>
                    <h2><?= e($productTitle) ?></h2>

                    <div class="review-producer-line">
                        <span>Üretici</span>
                        <strong><?= e($producerName) ?></strong>
                    </div>

                    <?php if ($locationText !== ''): ?>
                        <div class="review-producer-line">
                            <span>Konum</span>
                            <strong><?= e($locationText) ?></strong>
                        </div>
                    <?php endif; ?>

                    <div class="review-info-list">
                        <div class="review-info-item">
                            <span>Sipariş No</span>
                            <strong><?= e($orderNo) ?></strong>
                        </div>

                        <div class="review-info-item">
                            <span>Sipariş Ürünü ID</span>
                            <strong><?= e((string) $orderItemId) ?></strong>
                        </div>

                        <?php if ($quantity !== null): ?>
                            <div class="review-info-item">
                                <span>Miktar</span>
                                <strong><?= e(review_create_format_quantity($quantity) . ' ' . $unitType) ?></strong>
                            </div>
                        <?php endif; ?>

                        <?php if ($unitPrice !== null): ?>
                            <div class="review-info-item">
                                <span>Birim Fiyat</span>
                                <strong><?= e(review_create_format_money($unitPrice)) ?></strong>
                            </div>
                        <?php endif; ?>

                        <?php if ($totalPrice !== null): ?>
                            <div class="review-info-item review-info-total">
                                <span>Ürün Toplamı</span>
                                <strong><?= e(review_create_format_money($totalPrice)) ?></strong>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </aside>

            <section class="card review-form-card">
                <div class="review-form-head">
                    <div>
                        <span class="review-eyebrow">Yorum Bilgileri</span>
                        <h2>Deneyimini Paylaş</h2>
                    </div>
                    <span class="review-mini-badge">1 dakikada tamamlanır</span>
                </div>

                <form
                    method="POST"
                    action="<?= e($formAction) ?>"
                    class="review-form"
                    id="review-create-form"
                >
                    <?= csrf_field() ?>

                    <input type="hidden" name="order_item_id" value="<?= e((string) $orderItemId) ?>">
                    <input type="hidden" name="review_order_item_id" value="<?= e((string) $orderItemId) ?>">

                    <div class="form-group rating-form-group">
                        <label id="rating-label">Puan</label>

                        <input
                            type="hidden"
                            id="rating"
                            name="rating"
                            value="<?= e($oldRating > 0 ? (string) $oldRating : '') ?>"
                            required
                        >

                        <div
                            class="star-rating"
                            role="radiogroup"
                            aria-labelledby="rating-label"
                        >
                            <?php for ($star = 1; $star <= 5; $star++): ?>
                                <button
                                    type="button"
                                    class="star-button <?= $oldRating >= $star ? 'is-active' : '' ?>"
                                    data-value="<?= e((string) $star) ?>"
                                    role="radio"
                                    aria-checked="<?= $oldRating === $star ? 'true' : 'false' ?>"
                                    aria-label="<?= e((string) $star) ?> yıldız"
                                >
                                    ★
                                </button>
                            <?php endfor; ?>
                        </div>

                        <div class="rating-feedback" id="rating-feedback">
                            <?= $oldRating > 0 ? e($oldRating . ' yıldız seçildi') : 'Puan vermek için yıldızlara tıkla.' ?>
                        </div>

                        <?php if (!empty($formErrors['rating'])): ?>
                            <div class="field-error"><?= e($formErrors['rating'][0]) ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="form-group">
                        <label for="comment">Yorum</label>

                        <textarea
                            id="comment"
                            name="comment"
                            rows="7"
                            maxlength="1000"
                            placeholder="Ürün tazeliği, paketleme, teslimat ve üretici deneyimini yaz..."
                        ><?= e($oldComment) ?></textarea>

                        <div class="textarea-help">
                            <span id="comment-counter"><?= e((string) mb_strlen($oldComment, 'UTF-8')) ?></span>/1000 karakter
                        </div>

                        <?php if (!empty($formErrors['comment'])): ?>
                            <div class="field-error"><?= e($formErrors['comment'][0]) ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="review-tip-box">
                        <strong>İpucu:</strong>
                        Ürünün tazeliği, paketleme kalitesi ve üretici iletişimi hakkında kısa bir bilgi yazman yeterli.
                    </div>

                    <div class="form-actions review-actions-bottom">
                        <button class="btn review-submit-btn" type="submit" id="review-submit-button">
                            Yorumu Gönder
                        </button>

                        <a class="btn btn-secondary" href="<?= e($ordersUrl) ?>">
                            Siparişlerime Dön
                        </a>
                    </div>
                </form>
            </section>
        </section>
    <?php endif; ?>
</main>

<style>
    .review-create-page {
        padding-top: 28px;
        padding-bottom: 44px;
    }

    .review-hero {
        position: relative;
        overflow: hidden;
        margin-bottom: 26px;
        padding: 30px 34px;
        border: 1px solid rgba(43, 111, 57, .10);
        background:
            radial-gradient(circle at top right, rgba(126, 203, 142, .22), transparent 34%),
            linear-gradient(135deg, #ffffff 0%, #f7fbf3 100%);
        box-shadow: 0 18px 45px rgba(31, 82, 43, .08);
    }

    .review-eyebrow {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        margin-bottom: 9px;
        color: #2f7d3d;
        font-size: 13px;
        font-weight: 800;
        letter-spacing: .04em;
        text-transform: uppercase;
    }

    .review-eyebrow::before {
        content: '';
        width: 9px;
        height: 9px;
        border-radius: 999px;
        background: #7ecb8e;
        box-shadow: 0 0 0 6px rgba(126, 203, 142, .16);
    }

    .review-hero h1,
    .review-layout h2,
    .review-empty-state h2 {
        margin: 0;
        color: #14532d;
        line-height: 1.15;
    }

    .review-hero h1 {
        font-size: clamp(30px, 4vw, 44px);
        letter-spacing: -.02em;
    }

    .review-hero p,
    .review-product-card p,
    .review-empty-state p {
        max-width: 780px;
        margin: 12px 0 0;
        color: #526052;
        line-height: 1.65;
    }

    .review-hero-icon {
        position: absolute;
        right: 34px;
        top: 26px;
        width: 74px;
        height: 74px;
        display: grid;
        place-items: center;
        border-radius: 24px;
        background: #fff8e3;
        color: #f2b233;
        font-size: 42px;
        box-shadow: 0 18px 38px rgba(242, 178, 51, .20);
        transform: rotate(8deg);
    }

    .review-layout {
        display: grid;
        grid-template-columns: minmax(280px, 380px) minmax(0, 1fr);
        gap: 26px;
        align-items: start;
    }

    .review-product-card,
    .review-form-card {
        border: 1px solid rgba(43, 111, 57, .10);
        box-shadow: 0 18px 45px rgba(31, 82, 43, .08);
    }

    .review-product-card {
        padding: 0;
        overflow: hidden;
        position: sticky;
        top: 18px;
    }

    .review-product-image-wrap {
        display: block;
        width: 100%;
        aspect-ratio: 4 / 3;
        background: #e8f3e9;
        text-decoration: none;
        overflow: hidden;
    }

    .review-product-image {
        width: 100%;
        height: 100%;
        display: block;
        object-fit: cover;
        transition: transform .25s ease;
    }

    .review-product-image-wrap:hover .review-product-image {
        transform: scale(1.035);
    }

    .review-product-placeholder {
        height: 100%;
        display: grid;
        place-items: center;
        gap: 8px;
        color: #2f7d3d;
        text-align: center;
        background:
            linear-gradient(135deg, rgba(255, 255, 255, .50), transparent),
            #e8f3e9;
    }

    .review-product-placeholder span {
        font-size: 42px;
    }

    .review-product-placeholder strong {
        font-size: 16px;
    }

    .review-product-content {
        padding: 22px;
    }

    .review-product-content h2 {
        margin-top: 12px;
        font-size: 28px;
        letter-spacing: -.01em;
    }

    .badge {
        display: inline-flex;
        align-items: center;
        width: fit-content;
        padding: 7px 12px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 800;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .review-producer-line {
        display: grid;
        gap: 3px;
        margin-top: 14px;
        padding: 13px 14px;
        border-radius: 16px;
        background: #f7fbf3;
        border: 1px solid #e3eedf;
    }

    .review-producer-line span,
    .review-info-item span {
        color: #6b7668;
        font-size: 13px;
        font-weight: 700;
    }

    .review-producer-line strong,
    .review-info-item strong {
        color: #1f4d2b;
        font-size: 15px;
    }

    .review-info-list {
        display: grid;
        gap: 10px;
        margin-top: 16px;
    }

    .review-info-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 12px 0;
        border-bottom: 1px dashed #dbe7d7;
    }

    .review-info-item:last-child {
        border-bottom: 0;
    }

    .review-info-total {
        margin-top: 2px;
        padding: 13px 14px;
        border: 0;
        border-radius: 16px;
        background: #14532d;
    }

    .review-info-total span,
    .review-info-total strong {
        color: #ffffff;
    }

    .review-form-card {
        padding: 28px;
    }

    .review-form-head {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: flex-start;
        margin-bottom: 24px;
        padding-bottom: 20px;
        border-bottom: 1px solid #edf3ea;
    }

    .review-form-head h2 {
        font-size: 30px;
        letter-spacing: -.01em;
    }

    .review-mini-badge {
        flex: 0 0 auto;
        padding: 8px 12px;
        border-radius: 999px;
        background: #f7fbf3;
        color: #2f7d3d;
        font-size: 13px;
        font-weight: 800;
        border: 1px solid #e3eedf;
    }

    .review-form label {
        display: block;
        margin-bottom: 9px;
        color: #14532d;
        font-size: 16px;
        font-weight: 800;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .review-form textarea {
        width: 100%;
        min-height: 180px;
        padding: 15px 16px;
        border: 1px solid #d5dccf;
        border-radius: 18px;
        background: #fff;
        color: #263326;
        font-family: inherit;
        font-size: 15px;
        line-height: 1.6;
        resize: vertical;
        transition: border-color .18s ease, box-shadow .18s ease;
    }

    .review-form textarea:focus {
        outline: none;
        border-color: #7ecb8e;
        box-shadow: 0 0 0 4px rgba(126, 203, 142, .18);
    }

    .rating-form-group {
        margin-bottom: 24px;
    }

    .star-rating {
        display: flex;
        align-items: center;
        gap: 12px;
        flex-wrap: wrap;
        margin-top: 10px;
    }

    .star-button {
        width: 56px;
        height: 56px;
        border: 1px solid #dfe8dc;
        border-radius: 999px;
        background: #ffffff;
        color: #cdd5c9;
        font-size: 35px;
        line-height: 1;
        cursor: pointer;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        transition:
            transform .18s ease,
            box-shadow .18s ease,
            background .18s ease,
            color .18s ease,
            border-color .18s ease;
    }

    .star-button:hover,
    .star-button.is-active,
    .star-button.is-preview {
        color: #f2bf4d;
        background: #fff8e3;
        border-color: #f2bf4d;
        box-shadow: 0 12px 28px rgba(242, 191, 77, .26);
        transform: translateY(-2px) scale(1.05);
    }

    .star-button:focus-visible {
        outline: 3px solid rgba(47, 125, 61, .24);
        outline-offset: 3px;
    }

    .rating-feedback {
        margin-top: 11px;
        color: #526052;
        font-size: 15px;
        font-weight: 700;
    }

    .textarea-help {
        display: flex;
        justify-content: flex-end;
        margin-top: 7px;
        color: #6b7668;
        font-size: 13px;
        font-weight: 700;
    }

    .field-error {
        margin-top: 8px;
        padding: 10px 12px;
        border-radius: 12px;
        background: #fdeaea;
        color: #9b111e;
        font-size: 14px;
        font-weight: 700;
    }

    .review-tip-box {
        margin-top: 6px;
        padding: 14px 16px;
        border: 1px solid #e3eedf;
        border-radius: 18px;
        background: #f7fbf3;
        color: #526052;
        line-height: 1.55;
    }

    .review-tip-box strong {
        color: #14532d;
    }

    .form-actions {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
        margin-top: 24px;
    }

    .review-actions-bottom {
        position: sticky;
        bottom: 0;
        z-index: 5;
        margin-left: -28px;
        margin-right: -28px;
        margin-bottom: -28px;
        padding: 18px 28px;
        border-top: 1px solid #edf3ea;
        background: rgba(255, 255, 255, .92);
        backdrop-filter: blur(10px);
        border-radius: 0 0 18px 18px;
    }

    .review-submit-btn {
        min-width: 210px;
        font-size: 17px;
        font-weight: 900;
        padding: 15px 24px;
        box-shadow: 0 10px 22px rgba(47, 125, 61, .20);
    }

    .review-submit-btn:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    .review-empty-state {
        max-width: 680px;
        margin: 0 auto;
        padding: 42px 34px;
        text-align: center;
        border: 1px solid rgba(43, 111, 57, .10);
        box-shadow: 0 18px 45px rgba(31, 82, 43, .08);
    }

    .empty-icon {
        width: 72px;
        height: 72px;
        display: grid;
        place-items: center;
        margin: 0 auto 16px;
        border-radius: 24px;
        background: #e8f3e9;
        font-size: 36px;
    }

    @media (max-width: 980px) {
        .review-layout {
            grid-template-columns: 1fr;
        }

        .review-product-card {
            position: static;
        }

        .review-product-image-wrap {
            aspect-ratio: 16 / 8;
        }
    }

    @media (max-width: 700px) {
        .review-create-page {
            padding-top: 18px;
        }

        .review-hero,
        .review-form-card {
            padding: 22px;
        }

        .review-hero-icon {
            display: none;
        }

        .review-form-head {
            display: block;
        }

        .review-mini-badge {
            display: inline-flex;
            margin-top: 12px;
        }

        .star-button {
            width: 47px;
            height: 47px;
            font-size: 30px;
        }

        .review-actions-bottom {
            position: static;
            margin: 24px 0 0;
            padding: 0;
            border-top: 0;
            background: transparent;
            backdrop-filter: none;
        }

        .form-actions {
            flex-direction: column;
            align-items: stretch;
        }

        .review-submit-btn,
        .form-actions .btn {
            width: 100%;
            justify-content: center;
            text-align: center;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('review-create-form');

        if (!form) {
            return;
        }

        const ratingInput = document.getElementById('rating');
        const ratingButtons = Array.from(document.querySelectorAll('.star-button'));
        const ratingFeedback = document.getElementById('rating-feedback');
        const comment = document.getElementById('comment');
        const commentCounter = document.getElementById('comment-counter');
        const submitButton = document.getElementById('review-submit-button');

        function ratingText(value) {
            const texts = {
                1: '1 yıldız seçildi - Çok kötü',
                2: '2 yıldız seçildi - Kötü',
                3: '3 yıldız seçildi - Orta',
                4: '4 yıldız seçildi - İyi',
                5: '5 yıldız seçildi - Çok iyi'
            };

            return texts[value] || 'Puan vermek için yıldızlara tıkla.';
        }

        function paintStars(value, className) {
            ratingButtons.forEach(function (button) {
                const buttonValue = Number(button.dataset.value);
                const isFilled = buttonValue <= value;

                button.classList.remove('is-active', 'is-preview');

                if (isFilled) {
                    button.classList.add(className || 'is-active');
                }

                button.setAttribute('aria-checked', buttonValue === value ? 'true' : 'false');
            });

            if (ratingFeedback) {
                ratingFeedback.textContent = ratingText(value);
            }
        }

        function setRating(value) {
            if (!ratingInput) {
                return;
            }

            ratingInput.value = String(value);
            paintStars(value, 'is-active');
        }

        function updateCounter() {
            if (!comment || !commentCounter) {
                return;
            }

            commentCounter.textContent = String(comment.value.length);
        }

        ratingButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                setRating(Number(button.dataset.value));
            });

            button.addEventListener('mouseenter', function () {
                paintStars(Number(button.dataset.value), 'is-preview');
            });

            button.addEventListener('mouseleave', function () {
                paintStars(Number(ratingInput.value || 0), 'is-active');
            });

            button.addEventListener('keydown', function (event) {
                const currentValue = Number(ratingInput.value || 0);
                let nextValue = currentValue;

                if (event.key === 'ArrowRight' || event.key === 'ArrowUp') {
                    nextValue = Math.min(5, currentValue + 1);
                }

                if (event.key === 'ArrowLeft' || event.key === 'ArrowDown') {
                    nextValue = Math.max(1, currentValue - 1);
                }

                if (event.key === 'Enter' || event.key === ' ') {
                    nextValue = Number(button.dataset.value);
                }

                if (nextValue !== currentValue) {
                    event.preventDefault();
                    setRating(nextValue);

                    const nextButton = ratingButtons[nextValue - 1];

                    if (nextButton) {
                        nextButton.focus();
                    }
                }
            });
        });

        paintStars(Number(ratingInput.value || 0), 'is-active');
        updateCounter();

        if (comment) {
            comment.addEventListener('input', updateCounter);
        }

        form.addEventListener('submit', function (event) {
            if (ratingInput && !ratingInput.value) {
                event.preventDefault();
                setRating(0);

                if (ratingFeedback) {
                    ratingFeedback.textContent = 'Lütfen yıldız seçerek puan ver.';
                    ratingFeedback.style.color = '#9b111e';
                }

                return;
            }

            if (submitButton) {
                submitButton.disabled = true;
                submitButton.textContent = 'Gönderiliyor...';
            }
        });
    });
</script>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>
<?php if (function_exists('clear_old')) clear_old(); ?>