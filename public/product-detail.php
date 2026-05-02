<?php

require_once __DIR__ . '/../app/bootstrap.php';

if (is_post()) {
    ConsumerMiddleware::handle();
    require_csrf();

    $productId = (int) ($_POST['product_id'] ?? 0);
    $quantity = (float) ($_POST['quantity'] ?? 0);

    $cartService = new CartService();
    $result = $cartService->addItem((int) currentUserId(), $productId, $quantity);

    if ($result['success']) {
        flash_success($result['message']);
    } else {
        flash_error($result['message']);
    }

    redirect('product-detail.php?id=' . $productId);
}

$controller = new ProductController();

$productId = (int) ($_GET['id'] ?? 0);
$data = $controller->publicDetailData($productId);

$product = $data['product'] ?? null;
$user = currentUser();

$pageTitle = $product ? ($product['title'] ?? 'Ürün Detayı') : 'Ürün Bulunamadı';
$bodyClass = 'page-product-detail';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('detail_unit_label')) {
    function detail_unit_label(string $unit): string
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

if (!function_exists('detail_status_label')) {
    function detail_status_label(string $status): string
    {
        return match ($status) {
            'active' => 'Aktif',
            'draft' => 'Taslak',
            'sold_out' => 'Stokta Yok',
            'paused' => 'Pasif',
            default => 'Bilinmiyor',
        };
    }
}

if (!function_exists('detail_status_badge')) {
    function detail_status_badge(string $status): string
    {
        return match ($status) {
            'active' => 'badge-success',
            'sold_out' => 'badge-warning',
            'paused', 'draft' => 'badge-muted',
            default => 'badge-muted',
        };
    }
}

if (!function_exists('detail_old_value')) {
    function detail_old_value(string $key, string $default = ''): string
    {
        if (!function_exists('old')) {
            return $default;
        }

        $value = old($key);

        if ($value === null || $value === '') {
            return $default;
        }

        return (string) $value;
    }
}
?>

<main class="container">
    <?php if (!$product): ?>
        <section class="card empty-state">
            <h1>Ürün bulunamadı</h1>

            <p>
                Aradığın ürün silinmiş, pasifleştirilmiş veya hiç oluşturulmamış olabilir.
            </p>

            <a class="btn" href="<?= e(url('products.php')) ?>">
                Ürünlere Dön
            </a>
        </section>
    <?php else: ?>
        <?php
            $productId = (int) ($product['id'] ?? $productId);
            $producerId = (int) ($product['producer_id'] ?? 0);

            $unit = detail_unit_label($product['unit_type'] ?? 'kg');
            $status = $product['status'] ?? 'active';
            $producerName = $product['store_name'] ?: ($product['producer_name'] ?? 'Üretici');
            $images = $product['images'] ?? [];
            $coverImage = $product['cover_image']['image_path'] ?? null;
            $stockQuantity = (float) ($product['stock_quantity'] ?? 0);

            $roleConsumer = defined('ROLE_CONSUMER') ? ROLE_CONSUMER : 'consumer';
            $productActiveStatus = defined('PRODUCT_STATUS_ACTIVE') ? PRODUCT_STATUS_ACTIVE : 'active';

            $isConsumerUser = $user && (($user['role'] ?? '') === $roleConsumer);
            $consumerId = $isConsumerUser ? (int) currentUserId() : 0;

            $isFavorited = !empty($data['isFavorited'])
                || !empty($data['is_favorited'])
                || !empty($product['is_favorited']);

            $reviews = $product['reviews'] ?? ($data['reviews'] ?? []);

            $reviewableOrderItems = [];

            if (class_exists('ReviewService')) {
                $reviewService = new ReviewService();

                $reviews = $reviewService->getVisibleByProductId($productId, 30);

                if ($isConsumerUser) {
                    $reviewableOrderItems = $reviewService->getReviewableOrderItemsForProduct($consumerId, $productId);
                }
            }

            $questions = [];

            if (class_exists('ProductQuestionService')) {
                $questionService = new ProductQuestionService();

                if (method_exists($questionService, 'getPublicQuestionsByProductId')) {
                    $questions = $questionService->getPublicQuestionsByProductId($productId);
                }
            }

            $reviewStoreUrl = url('consumer/orders.php?review_order_item_id=0');
            $questionStoreUrl = url('api/product-question-store.php');
        ?>

        <section class="detail-layout">
            <div class="card">
                <?php if ($coverImage): ?>
                    <img
                        class="product-image-large"
                        src="<?= e(url($coverImage)) ?>"
                        alt="<?= e($product['title'] ?? 'Ürün') ?>"
                    >
                <?php else: ?>
                    <div class="product-image-large placeholder">
                        Ürün Fotoğrafı
                    </div>
                <?php endif; ?>

                <?php if (!empty($images)): ?>
                    <div class="image-thumbs">
                        <?php foreach ($images as $image): ?>
                            <img
                                src="<?= e(url($image['image_path'])) ?>"
                                alt="<?= e($product['title'] ?? 'Ürün') ?>"
                            >
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>

            <aside class="card product-info">
                <span class="badge <?= e(detail_status_badge($status)) ?>">
                    <?= e(detail_status_label($status)) ?>
                </span>

                <?php if (!empty($product['is_preorder_enabled'])): ?>
                    <span class="badge badge-info">
                        Ön Siparişe Açık
                    </span>
                <?php endif; ?>

                <h1><?= e($product['title'] ?? 'Ürün') ?></h1>

                <p class="producer-name">
                    <?= e($producerName) ?>
                    ·
                    <?= e($product['province_name'] ?? '-') ?>
                    /
                    <?= e($product['district_name'] ?? '-') ?>
                </p>

                <p class="description">
                    <?= nl2br(e($product['description'] ?? 'Bu ürün için açıklama girilmemiş.')) ?>
                </p>

                <div class="price-box">
                    <?= e(formatMoney($product['price'] ?? 0)) ?> / <?= e($unit) ?>
                </div>

                <div class="meta-grid">
                    <div>
                        <strong>Stok</strong>
                        <span><?= e((string) $stockQuantity) ?> <?= e($unit) ?></span>
                    </div>

                    <div>
                        <strong>Hasat</strong>
                        <span>
                            <?= !empty($product['harvest_date'])
                                ? e(date('d.m.Y', strtotime($product['harvest_date'])))
                                : '-'
                            ?>
                        </span>
                    </div>

                    <div>
                        <strong>Puan</strong>
                        <span>
                            ⭐ <?= e((string) ($product['average_rating'] ?? '0.00')) ?>
                            /
                            <?= e((string) ($product['rating_count'] ?? 0)) ?> yorum
                        </span>
                    </div>

                    <div>
                        <strong>Kategori</strong>
                        <span><?= e($product['category_name'] ?? '-') ?></span>
                    </div>
                </div>

                <?php if (!empty($product['is_preorder_enabled'])): ?>
                    <div class="preorder-box">
                        <strong>Ön Sipariş Bilgisi</strong>

                        <p>
                            Son tarih:
                            <?= !empty($product['preorder_deadline'])
                                ? e(date('d.m.Y', strtotime($product['preorder_deadline'])))
                                : '-'
                            ?>
                        </p>

                        <p>
                            Minimum miktar:
                            <?= e((string) ($product['min_preorder_quantity'] ?? '-')) ?>
                            <?= e($unit) ?>
                        </p>
                    </div>
                <?php endif; ?>

                <div class="detail-actions">
                    <?php if (!$user): ?>
                        <a class="btn" href="<?= e(url('login.php')) ?>">
                            Sepete Eklemek İçin Giriş Yap
                        </a>
                    <?php elseif ($isConsumerUser): ?>
                        <?php if ($status === $productActiveStatus && $stockQuantity > 0): ?>
                            <form method="POST" action="<?= e(url('product-detail.php?id=' . $productId)) ?>" class="add-cart-form">
                                <?= csrf_field() ?>

                                <input type="hidden" name="product_id" value="<?= e((string) $productId) ?>">

                                <label for="quantity">
                                    Miktar
                                </label>

                                <div class="quantity-row">
                                    <input
                                        type="number"
                                        id="quantity"
                                        name="quantity"
                                        step="0.01"
                                        min="0.01"
                                        max="<?= e((string) $stockQuantity) ?>"
                                        value="1"
                                        required
                                    >

                                    <span><?= e($unit) ?></span>
                                </div>

                                <button class="btn" type="submit">
                                    Sepete Ekle
                                </button>
                            </form>
                        <?php elseif (!empty($product['is_preorder_enabled'])): ?>
                            <button class="btn" type="button" disabled>
                                Ön Sipariş Yakında Aktif
                            </button>
                        <?php else: ?>
                            <button class="btn" type="button" disabled>
                                Stokta Yok
                            </button>
                        <?php endif; ?>

                        <form method="POST" action="<?= e(url('api/favorite-toggle.php')) ?>">
                            <?= csrf_field() ?>

                            <input type="hidden" name="product_id" value="<?= e((string) $productId) ?>">
                            <input type="hidden" name="return_to" value="product-detail.php?id=<?= e((string) $productId) ?>">

                            <button class="btn btn-secondary" type="submit">
                                <?= $isFavorited ? 'Favoriden Çıkar' : 'Favoriye Ekle' ?>
                            </button>
                        </form>
                    <?php else: ?>
                        <button class="btn" type="button" disabled>
                            Sadece Tüketiciler Satın Alabilir
                        </button>
                    <?php endif; ?>

                    <a class="btn btn-secondary" href="<?= e(url('producer-detail.php?id=' . $producerId)) ?>">
                        Üretici Profili
                    </a>

                    <a class="btn btn-secondary" href="<?= e(url('products.php')) ?>">
                        Ürünlere Dön
                    </a>
                </div>
            </aside>
        </section>

        <section class="card reviews-box" id="reviews">
            <div class="section-title-row">
                <div>
                    <h2>Yorumlar</h2>
                    <p>Bu ürünü teslim alan tüketicilerin değerlendirmeleri.</p>
                </div>
            </div>

            <?php if ($isConsumerUser): ?>
                <?php if (!empty($reviewableOrderItems)): ?>
                    <div class="inline-form-box">
                        <h3>Bu Ürüne Yorum Yaz</h3>

                        <div id="product-review-message" class="ajax-message" hidden></div>

                        <form
                            method="POST"
                            action="<?= e($reviewStoreUrl) ?>"
                            id="product-review-form"
                            class="ajax-form"
                        >
                            <?= csrf_field() ?>

                            <input type="hidden" name="product_id" value="<?= e((string) $productId) ?>">

                            <?php if (count($reviewableOrderItems) === 1): ?>
                                <input
                                    type="hidden"
                                    name="order_item_id"
                                    value="<?= e((string) $reviewableOrderItems[0]['order_item_id']) ?>"
                                >

                                <p class="helper-text">
                                    Sipariş No:
                                    <strong><?= e($reviewableOrderItems[0]['order_no'] ?? '-') ?></strong>
                                </p>
                            <?php else: ?>
                                <div class="form-group">
                                    <label for="review_order_item_id">Yorum yapılacak sipariş</label>

                                    <select id="review_order_item_id" name="order_item_id" required>
                                        <option value="">Sipariş seç</option>

                                        <?php foreach ($reviewableOrderItems as $reviewableItem): ?>
                                            <option value="<?= e((string) $reviewableItem['order_item_id']) ?>">
                                                <?= e($reviewableItem['order_no'] ?? 'Sipariş') ?>
                                                -
                                                <?= !empty($reviewableItem['order_created_at'])
                                                    ? e(date('d.m.Y', strtotime($reviewableItem['order_created_at'])))
                                                    : ''
                                                ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            <?php endif; ?>

                            <div class="form-group">
                                <label for="product-review-rating">Puan</label>

                                <select id="product-review-rating" name="rating" required>
                                    <option value="">Puan seç</option>
                                    <option value="5">5 - Çok iyi</option>
                                    <option value="4">4 - İyi</option>
                                    <option value="3">3 - Orta</option>
                                    <option value="2">2 - Kötü</option>
                                    <option value="1">1 - Çok kötü</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="product-review-comment">Yorum</label>

                                <textarea
                                    id="product-review-comment"
                                    name="comment"
                                    rows="4"
                                    maxlength="1000"
                                    placeholder="Ürünün tazeliği, paketleme ve teslimat deneyimini yaz..."
                                ></textarea>
                            </div>

                            <button class="btn" type="submit" id="product-review-submit">
                                Yorumu Gönder
                            </button>
                        </form>
                    </div>
                <?php else: ?>
                    <div class="inline-info-box">
                        Bu ürüne yorum yazabilmek için ürünü satın almış ve siparişinin teslim edilmiş olması gerekir.
                    </div>
                <?php endif; ?>
            <?php elseif (!$user): ?>
                <div class="inline-info-box">
                    Yorum yazmak için
                    <a href="<?= e(url('login.php')) ?>">giriş yapmalısın</a>.
                </div>
            <?php endif; ?>

            <?php if (empty($reviews)): ?>
                <p id="empty-reviews-text">
                    Bu ürün için henüz görünür yorum yok.
                </p>
            <?php else: ?>
                <div class="review-list" id="review-list">
                    <?php foreach ($reviews as $review): ?>
                        <article class="review-item">
                            <strong>
                                <?= e($review['consumer_name'] ?? 'Tüketici') ?>
                                ·
                                ⭐ <?= e((string) ($review['rating'] ?? 0)) ?>
                            </strong>

                            <p><?= nl2br(e($review['comment'] ?? '')) ?></p>

                            <span>
                                <?= !empty($review['created_at'])
                                    ? e(date('d.m.Y H:i', strtotime($review['created_at'])))
                                    : ''
                                ?>
                            </span>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </section>

        <section class="card questions-box" id="questions">
            <div class="section-title-row">
                <div>
                    <h2>Satıcıya Sorular</h2>
                    <p>Ürünle ilgili merak ettiklerini üreticiye sorabilirsin.</p>
                </div>
            </div>

            <?php if ($isConsumerUser): ?>
                <div class="inline-form-box">
                    <h3>Satıcıya Soru Sor</h3>

                    <div id="product-question-message" class="ajax-message" hidden></div>

                    <form
                        method="POST"
                        action="<?= e($questionStoreUrl) ?>"
                        id="product-question-form"
                        class="ajax-form"
                    >
                        <?= csrf_field() ?>

                        <input type="hidden" name="product_id" value="<?= e((string) $productId) ?>">
                        <input type="hidden" name="producer_id" value="<?= e((string) $producerId) ?>">

                        <div class="form-group">
                            <label for="product-question-text">Sorun</label>

                            <textarea
                                id="product-question-text"
                                name="question"
                                rows="4"
                                maxlength="1000"
                                placeholder="Örneğin: Ürün ne zaman hasat edildi? Kargo hangi gün çıkar?"
                                required
                            ></textarea>
                        </div>

                        <button class="btn" type="submit" id="product-question-submit">
                            Soruyu Gönder
                        </button>
                    </form>
                </div>
            <?php elseif (!$user): ?>
                <div class="inline-info-box">
                    Satıcıya soru sormak için
                    <a href="<?= e(url('login.php')) ?>">giriş yapmalısın</a>.
                </div>
            <?php elseif ($producerId === (int) currentUserId()): ?>
                <div class="inline-info-box">
                    Bu ürün sana ait. Gelen soruları üretici panelinden cevaplayacaksın.
                </div>
            <?php endif; ?>

            <?php if (empty($questions)): ?>
                <p id="empty-questions-text">
                    Bu ürün için henüz soru sorulmamış.
                </p>
            <?php else: ?>
                <div class="question-list" id="question-list">
                    <?php foreach ($questions as $question): ?>
                        <article class="question-item">
                            <div class="question-content">
                                <strong>
                                    <?= e($question['consumer_name'] ?? 'Tüketici') ?> sordu:
                                </strong>

                                <p><?= nl2br(e($question['question'] ?? '')) ?></p>

                                <span>
                                    <?= !empty($question['created_at'])
                                        ? e(date('d.m.Y H:i', strtotime($question['created_at'])))
                                        : ''
                                    ?>
                                </span>
                            </div>

                            <?php if (!empty($question['answer'])): ?>
                                <div class="answer-content">
                                    <strong><?= e($producerName) ?> cevapladı:</strong>

                                    <p><?= nl2br(e($question['answer'])) ?></p>

                                    <span>
                                        <?= !empty($question['answered_at'])
                                            ? e(date('d.m.Y H:i', strtotime($question['answered_at'])))
                                            : ''
                                        ?>
                                    </span>
                                </div>
                            <?php else: ?>
                                <div class="answer-pending">
                                    Üretici cevabı bekleniyor.
                                </div>
                            <?php endif; ?>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </section>
    <?php endif; ?>
</main>

<style>
    .detail-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
    }

    .product-image-large {
        width: 100%;
        min-height: 420px;
        max-height: 520px;
        border-radius: 16px;
        object-fit: cover;
        display: block;
    }

    .product-image-large.placeholder {
        background: #e8f3e9;
        color: #2f7d3d;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }

    .image-thumbs {
        margin-top: 14px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 10px;
    }

    .image-thumbs img {
        width: 100%;
        height: 80px;
        object-fit: cover;
        border-radius: 10px;
    }

    .product-info h1 {
        margin: 14px 0 8px;
        color: #245c2f;
        font-size: 36px;
    }

    .producer-name,
    .description,
    .reviews-box p,
    .questions-box p,
    .preorder-box p,
    .empty-state p,
    .section-title-row p,
    .helper-text {
        color: #526052;
        line-height: 1.6;
    }

    .price-box {
        margin: 20px 0;
        font-size: 28px;
        font-weight: bold;
        color: #245c2f;
    }

    .meta-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px;
        margin-bottom: 22px;
    }

    .meta-grid div,
    .preorder-box {
        padding: 14px;
        border-radius: 12px;
        background: #f8fbf6;
    }

    .meta-grid strong,
    .meta-grid span {
        display: block;
    }

    .meta-grid strong,
    .preorder-box strong {
        color: #245c2f;
        margin-bottom: 5px;
    }

    .meta-grid span {
        color: #526052;
    }

    .badge {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        margin-right: 6px;
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

    .badge-muted {
        background: #edf1ea;
        color: #526052;
    }

    .detail-actions {
        margin-top: 18px;
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
        align-items: flex-start;
    }

    .add-cart-form {
        width: 100%;
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
        display: grid;
        gap: 10px;
        margin-bottom: 8px;
    }

    .add-cart-form label,
    .ajax-form label {
        color: #245c2f;
        font-weight: bold;
    }

    .quantity-row {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .quantity-row input {
        width: 130px;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
    }

    .quantity-row span {
        color: #526052;
        font-weight: bold;
    }

    button:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    .reviews-box,
    .questions-box {
        margin-top: 22px;
    }

    .reviews-box h2,
    .questions-box h2,
    .empty-state h1 {
        margin-top: 0;
        color: #245c2f;
    }

    .section-title-row {
        display: flex;
        justify-content: space-between;
        gap: 16px;
        align-items: flex-start;
        border-bottom: 1px solid #edf1ea;
        margin-bottom: 18px;
        padding-bottom: 14px;
    }

    .section-title-row h2,
    .section-title-row p {
        margin-bottom: 0;
    }

    .inline-form-box,
    .inline-info-box {
        padding: 16px;
        border-radius: 14px;
        background: #f8fbf6;
        margin-bottom: 18px;
    }

    .inline-form-box h3 {
        margin-top: 0;
        color: #245c2f;
    }

    .ajax-form {
        display: grid;
        gap: 14px;
    }

    .form-group {
        display: grid;
        gap: 7px;
    }

    .ajax-form select,
    .ajax-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .ajax-message {
        margin-bottom: 14px;
        padding: 12px 14px;
        border-radius: 10px;
        font-weight: 600;
    }

    .ajax-message.success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .ajax-message.error {
        background: #fdeaea;
        color: #9b111e;
    }

    .review-list,
    .question-list {
        display: grid;
        gap: 14px;
    }

    .review-item,
    .question-item {
        padding: 16px;
        border-radius: 12px;
        background: #f8fbf6;
    }

    .review-item strong,
    .question-item strong {
        color: #245c2f;
    }

    .review-item span,
    .question-item span {
        color: #718071;
        font-size: 14px;
    }

    .answer-content {
        margin-top: 14px;
        padding: 14px;
        border-radius: 12px;
        background: #eef8ef;
        border-left: 4px solid #2f7d3d;
    }

    .answer-pending {
        margin-top: 14px;
        color: #718071;
        font-size: 14px;
        font-weight: bold;
    }

    .empty-state {
        text-align: center;
        padding: 36px;
    }

    @media (max-width: 900px) {
        .detail-layout {
            grid-template-columns: 1fr;
        }

        .product-image-large {
            min-height: 260px;
        }

        .meta-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const currentUserName = <?= json_encode($user['full_name'] ?? 'Tüketici', JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?>;

        function showMessage(element, type, message) {
            if (!element) {
                return;
            }

            element.hidden = false;
            element.className = 'ajax-message ' + type;
            element.textContent = message;
        }

        function clearMessage(element) {
            if (!element) {
                return;
            }

            element.hidden = true;
            element.className = 'ajax-message';
            element.textContent = '';
        }

        function escapeHtml(value) {
            return String(value || '')
                .replaceAll('&', '&amp;')
                .replaceAll('<', '&lt;')
                .replaceAll('>', '&gt;')
                .replaceAll('"', '&quot;')
                .replaceAll("'", '&#039;');
        }

        const reviewForm = document.getElementById('product-review-form');

        if (reviewForm) {
            const reviewMessage = document.getElementById('product-review-message');
            const reviewSubmit = document.getElementById('product-review-submit');
            const reviewList = document.getElementById('review-list');
            const emptyReviewsText = document.getElementById('empty-reviews-text');

            reviewForm.addEventListener('submit', async function (event) {
                event.preventDefault();

                clearMessage(reviewMessage);

                if (reviewSubmit) {
                    reviewSubmit.disabled = true;
                    reviewSubmit.textContent = 'Gönderiliyor...';
                }

                try {
                    const formData = new FormData(reviewForm);
                    const rating = formData.get('rating');
                    const comment = formData.get('comment');

                    const response = await fetch(reviewForm.action, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                    const result = await response.json();

                    if (!result.success) {
                        throw new Error(result.message || 'Yorum gönderilemedi.');
                    }

                    showMessage(reviewMessage, 'success', result.message || 'Yorum başarıyla gönderildi.');

                    if (emptyReviewsText) {
                        emptyReviewsText.remove();
                    }

                    let targetReviewList = reviewList;

                    if (!targetReviewList) {
                        targetReviewList = document.createElement('div');
                        targetReviewList.id = 'review-list';
                        targetReviewList.className = 'review-list';
                        document.getElementById('reviews').appendChild(targetReviewList);
                    }

                    const article = document.createElement('article');
                    article.className = 'review-item';
                    article.innerHTML = `
                        <strong>${escapeHtml(currentUserName)} · ⭐ ${escapeHtml(rating)}</strong>
                        <p>${escapeHtml(comment).replaceAll('\n', '<br>')}</p>
                        <span>Az önce</span>
                    `;

                    targetReviewList.prepend(article);

                    reviewForm.reset();

                    const orderSelect = reviewForm.querySelector('select[name="order_item_id"]');

                    if (orderSelect && orderSelect.value) {
                        orderSelect.querySelector('option[value="' + orderSelect.value + '"]')?.remove();
                    }

                    const hiddenOrderItem = reviewForm.querySelector('input[name="order_item_id"][type="hidden"]');

                    if (hiddenOrderItem) {
                        reviewForm.style.display = 'none';
                    }

                    if (orderSelect && orderSelect.options.length <= 1) {
                        reviewForm.style.display = 'none';
                    }
                } catch (error) {
                    showMessage(reviewMessage, 'error', error.message || 'Yorum gönderilirken bir hata oluştu.');
                } finally {
                    if (reviewSubmit) {
                        reviewSubmit.disabled = false;
                        reviewSubmit.textContent = 'Yorumu Gönder';
                    }
                }
            });
        }

        const questionForm = document.getElementById('product-question-form');

        if (questionForm) {
            const questionMessage = document.getElementById('product-question-message');
            const questionSubmit = document.getElementById('product-question-submit');
            const questionList = document.getElementById('question-list');
            const emptyQuestionsText = document.getElementById('empty-questions-text');

            questionForm.addEventListener('submit', async function (event) {
                event.preventDefault();

                clearMessage(questionMessage);

                if (questionSubmit) {
                    questionSubmit.disabled = true;
                    questionSubmit.textContent = 'Gönderiliyor...';
                }

                try {
                    const formData = new FormData(questionForm);
                    const question = formData.get('question');

                    const response = await fetch(questionForm.action, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'X-Requested-With': 'XMLHttpRequest',
                            'Accept': 'application/json'
                        }
                    });

                    const result = await response.json();

                    if (!result.success) {
                        throw new Error(result.message || 'Soru gönderilemedi.');
                    }

                    showMessage(questionMessage, 'success', result.message || 'Sorun üreticiye gönderildi.');

                    if (emptyQuestionsText) {
                        emptyQuestionsText.remove();
                    }

                    let targetQuestionList = questionList;

                    if (!targetQuestionList) {
                        targetQuestionList = document.createElement('div');
                        targetQuestionList.id = 'question-list';
                        targetQuestionList.className = 'question-list';
                        document.getElementById('questions').appendChild(targetQuestionList);
                    }

                    const article = document.createElement('article');
                    article.className = 'question-item';
                    article.innerHTML = `
                        <div class="question-content">
                            <strong>${escapeHtml(currentUserName)} sordu:</strong>
                            <p>${escapeHtml(question).replaceAll('\n', '<br>')}</p>
                            <span>Az önce</span>
                        </div>
                        <div class="answer-pending">
                            Üretici cevabı bekleniyor.
                        </div>
                    `;

                    targetQuestionList.prepend(article);

                    questionForm.reset();
                } catch (error) {
                    showMessage(
                        questionMessage,
                        'error',
                        error.message || 'Soru gönderilirken bir hata oluştu. Bir sonraki adımda soru API dosyasını ekleyeceğiz.'
                    );
                } finally {
                    if (questionSubmit) {
                        questionSubmit.disabled = false;
                        questionSubmit.textContent = 'Soruyu Gönder';
                    }
                }
            });
        }
    });
</script>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>