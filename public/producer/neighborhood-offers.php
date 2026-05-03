<?php

require_once __DIR__ . '/../../app/bootstrap.php';

$user = currentUser();

if (!$user) {
    redirect('login.php');
}

if (($user['role'] ?? '') !== ROLE_PRODUCER) {
    redirect('index.php');
}

$pageTitle = 'Toplu Alım İlanları';
$bodyClass = 'page-producer-neighborhood-offers';

$producerId = (int) ($user['id'] ?? currentUserId());

$errors = [];
$successMessage = null;

function neighborhood_offer_date_to_datetime(?string $value): ?string
{
    $value = trim((string) $value);

    if ($value === '') {
        return null;
    }

    return $value . ' 00:00:00';
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $formAction = $_POST['form_action'] ?? 'create';

    if (function_exists('verify_csrf') && !verify_csrf()) {
        $errors[] = 'Güvenlik doğrulaması başarısız oldu. Sayfayı yenileyip tekrar deneyin.';
    }

    if (!$errors && $formAction === 'create') {
        $productId = (int) ($_POST['product_id'] ?? 0);
        $title = trim((string) ($_POST['title'] ?? ''));
        $description = trim((string) ($_POST['description'] ?? ''));
        $minQuantity = (float) ($_POST['min_quantity'] ?? 0);
        $discountPercent = (float) ($_POST['discount_percent'] ?? 0);
        $startsAt = neighborhood_offer_date_to_datetime($_POST['starts_at'] ?? null);
        $endsAt = neighborhood_offer_date_to_datetime($_POST['ends_at'] ?? null);
        $status = $_POST['status'] ?? 'active';

        if ($productId <= 0) {
            $errors[] = 'Lütfen bir ürün seçin.';
        }

        if ($title === '') {
            $errors[] = 'İlan başlığı boş bırakılamaz.';
        }

        if ($minQuantity <= 0) {
            $errors[] = 'Minimum miktar 0’dan büyük olmalıdır.';
        }

        if ($discountPercent <= 0 || $discountPercent > 90) {
            $errors[] = 'İndirim oranı 0’dan büyük ve 90’dan küçük/eşit olmalıdır.';
        }

        if (!in_array($status, ['active', 'passive'], true)) {
            $status = 'active';
        }

        $product = null;

        if (!$errors) {
            try {
                $productStatement = db()->prepare("
                    SELECT id, title, unit_type
                    FROM products
                    WHERE id = :id
                      AND producer_id = :producer_id
                      AND status != 'deleted'
                    LIMIT 1
                ");

                $productStatement->execute([
                    'id' => $productId,
                    'producer_id' => $producerId,
                ]);

                $product = $productStatement->fetch(PDO::FETCH_ASSOC);

                if (!$product) {
                    $errors[] = 'Seçilen ürün size ait değil veya bulunamadı.';
                }
            } catch (Throwable $e) {
                $errors[] = 'Ürün kontrol edilirken bir hata oluştu: ' . $e->getMessage();
            }
        }

        if (!$errors && $product) {
            try {
                $insertStatement = db()->prepare("
                    INSERT INTO neighborhood_basket_offers (
                        producer_id,
                        product_id,
                        title,
                        description,
                        min_quantity,
                        discount_percent,
                        unit_type,
                        starts_at,
                        ends_at,
                        status
                    ) VALUES (
                        :producer_id,
                        :product_id,
                        :title,
                        :description,
                        :min_quantity,
                        :discount_percent,
                        :unit_type,
                        :starts_at,
                        :ends_at,
                        :status
                    )
                ");

                $insertStatement->execute([
                    'producer_id' => $producerId,
                    'product_id' => $productId,
                    'title' => $title,
                    'description' => $description !== '' ? $description : null,
                    'min_quantity' => $minQuantity,
                    'discount_percent' => $discountPercent,
                    'unit_type' => $product['unit_type'] ?? 'kg',
                    'starts_at' => $startsAt,
                    'ends_at' => $endsAt,
                    'status' => $status,
                ]);

                $successMessage = 'Toplu alım ilanı başarıyla oluşturuldu.';
            } catch (Throwable $e) {
                $errors[] = 'Toplu alım ilanı oluşturulurken bir hata oluştu: ' . $e->getMessage();
            }
        }
    }

    if (!$errors && $formAction === 'toggle') {
        $offerId = (int) ($_POST['offer_id'] ?? 0);

        try {
            $offerStatement = db()->prepare("
                SELECT id, status
                FROM neighborhood_basket_offers
                WHERE id = :id
                  AND producer_id = :producer_id
                LIMIT 1
            ");

            $offerStatement->execute([
                'id' => $offerId,
                'producer_id' => $producerId,
            ]);

            $offer = $offerStatement->fetch(PDO::FETCH_ASSOC);

            if (!$offer) {
                $errors[] = 'İlan bulunamadı.';
            } else {
                $newStatus = $offer['status'] === 'active' ? 'passive' : 'active';

                $updateStatement = db()->prepare("
                    UPDATE neighborhood_basket_offers
                    SET status = :status
                    WHERE id = :id
                      AND producer_id = :producer_id
                ");

                $updateStatement->execute([
                    'status' => $newStatus,
                    'id' => $offerId,
                    'producer_id' => $producerId,
                ]);

                $successMessage = $newStatus === 'active'
                    ? 'İlan aktif hale getirildi.'
                    : 'İlan pasif hale getirildi.';
            }
        } catch (Throwable $e) {
            $errors[] = 'İlan durumu güncellenirken bir hata oluştu: ' . $e->getMessage();
        }
    }

    if (!$errors && $formAction === 'delete') {
        $offerId = (int) ($_POST['offer_id'] ?? 0);

        try {
            $deleteStatement = db()->prepare("
                UPDATE neighborhood_basket_offers
                SET status = 'deleted'
                WHERE id = :id
                  AND producer_id = :producer_id
            ");

            $deleteStatement->execute([
                'id' => $offerId,
                'producer_id' => $producerId,
            ]);

            $successMessage = 'İlan silindi.';
        } catch (Throwable $e) {
            $errors[] = 'İlan silinirken bir hata oluştu: ' . $e->getMessage();
        }
    }
}

$products = [];
$offers = [];

try {
    $productStatement = db()->prepare("
        SELECT id, title, price, unit_type, stock_quantity, status
        FROM products
        WHERE producer_id = :producer_id
          AND status != 'deleted'
        ORDER BY created_at DESC
    ");

    $productStatement->execute([
        'producer_id' => $producerId,
    ]);

    $products = $productStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $products = [];
    $errors[] = 'Ürünler alınırken bir hata oluştu: ' . $e->getMessage();
}

try {
    $offerStatement = db()->prepare("
        SELECT
            nbo.*,
            p.title AS product_title,
            p.price AS product_price,
            p.stock_quantity
        FROM neighborhood_basket_offers nbo
        INNER JOIN products p ON p.id = nbo.product_id
        WHERE nbo.producer_id = :producer_id
          AND nbo.status != 'deleted'
        ORDER BY nbo.created_at DESC
    ");

    $offerStatement->execute([
        'producer_id' => $producerId,
    ]);

    $offers = $offerStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $offers = [];
    $errors[] = 'Toplu alım ilanları alınırken bir hata oluştu: ' . $e->getMessage();
}

require APP_PATH . '/Views/layouts/header.php';

?>

<main class="producer-offers-page">
    <section class="producer-offers-hero">
        <div class="container">
            <a class="back-link" href="<?= e(url('producer/dashboard.php')) ?>">
                ← Üretici paneline dön
            </a>

            <div class="producer-offers-hero-card">
                <span class="mini-title">Mahalle Sepeti Üretici Alanı</span>

                <h1>Toplu alım indirimi oluştur</h1>

                <p>
                    Ürünlerin için toplu alım indirimi tanımlayabilirsin. Tüketiciler bu ilanları görerek
                    mahalle sepeti başlatır. Örneğin: “100 kg ve üzeri domateste %10 indirim”.
                </p>
            </div>
        </div>
    </section>

    <section class="producer-offers-content">
        <div class="container producer-offers-layout">

            <div class="producer-offers-main">

                <?php if ($successMessage): ?>
                    <div class="alert alert-success">
                        <?= e($successMessage) ?>
                    </div>
                <?php endif; ?>

                <?php if ($errors): ?>
                    <div class="alert alert-error">
                        <?php foreach ($errors as $error): ?>
                            <div><?= e($error) ?></div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>

                <form class="offer-form-card" action="<?= e(url('producer/neighborhood-offers.php')) ?>" method="post">
                    <?php if (function_exists('csrf_field')): ?>
                        <?= csrf_field() ?>
                    <?php endif; ?>

                    <input type="hidden" name="form_action" value="create">

                    <div class="form-card-heading">
                        <span>🏷️</span>
                        <div>
                            <h2>Yeni toplu alım ilanı</h2>
                            <p>
                                İndirimi üretici belirler. Tüketici bu ilana bağlı Mahalle Sepeti başlatır.
                            </p>
                        </div>
                    </div>

                    <div class="form-grid">
                        <div class="form-field form-field-full">
                            <label for="product_id">Ürün seç</label>

                            <select id="product_id" name="product_id" required>
                                <option value="">Ürün seçiniz</option>

                                <?php foreach ($products as $product): ?>
                                    <option value="<?= e((string) $product['id']) ?>">
                                        <?= e($product['title']) ?>
                                        —
                                        <?= e(number_format((float) $product['price'], 2, ',', '.')) ?> TL /
                                        <?= e($product['unit_type']) ?>
                                        —
                                        Stok: <?= e((string) $product['stock_quantity']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>

                            <?php if (!$products): ?>
                                <small class="field-help">
                                    Henüz ürününüz yok. Önce ürün eklemeniz gerekiyor.
                                </small>
                            <?php endif; ?>
                        </div>

                        <div class="form-field form-field-full">
                            <label for="title">İlan başlığı</label>
                            <input
                                type="text"
                                id="title"
                                name="title"
                                placeholder="Örn: Salçalık domateste toplu alım indirimi"
                                required
                            >
                        </div>

                        <div class="form-field">
                            <label for="min_quantity">Minimum miktar</label>
                            <input
                                type="number"
                                id="min_quantity"
                                name="min_quantity"
                                min="1"
                                step="0.01"
                                placeholder="100"
                                required
                            >
                        </div>

                        <div class="form-field">
                            <label for="discount_percent">İndirim oranı (%)</label>
                            <input
                                type="number"
                                id="discount_percent"
                                name="discount_percent"
                                min="1"
                                max="90"
                                step="0.01"
                                placeholder="10"
                                required
                            >
                        </div>

                        <div class="form-field">
                            <label for="starts_at">Başlangıç tarihi</label>
                            <input type="date" id="starts_at" name="starts_at">
                        </div>

                        <div class="form-field">
                            <label for="ends_at">Bitiş tarihi</label>
                            <input type="date" id="ends_at" name="ends_at">
                        </div>

                        <div class="form-field">
                            <label for="status">Durum</label>
                            <select id="status" name="status">
                                <option value="active">Aktif</option>
                                <option value="passive">Pasif</option>
                            </select>
                        </div>

                        <div class="form-field form-field-full">
                            <label for="description">Açıklama</label>
                            <textarea
                                id="description"
                                name="description"
                                rows="4"
                                placeholder="Örn: Salça yapmak isteyen mahalle grupları için geçerlidir. Minimum 100 kg toplu alımda indirim uygulanır."
                            ></textarea>
                        </div>
                    </div>

                    <div class="form-submit-row">
                        <button class="primary-btn" type="submit" <?= !$products ? 'disabled' : '' ?>>
                            Toplu Alım İlanı Oluştur
                        </button>
                    </div>
                </form>

                <div class="offer-list-card">
                    <div class="list-heading">
                        <div>
                            <h2>Mevcut toplu alım ilanların</h2>
                            <p>Aktif ilanlar tüketici tarafındaki Mahalle Sepeti sayfasında gösterilecek.</p>
                        </div>

                        <span class="offer-count">
                            <?= e((string) count($offers)) ?> ilan
                        </span>
                    </div>

                    <?php if (!$offers): ?>
                        <div class="empty-state">
                            <span>🧺</span>
                            <h3>Henüz toplu alım ilanı yok</h3>
                            <p>
                                İlk ilanını oluşturduğunda tüketiciler bu ilana bağlı Mahalle Sepeti başlatabilecek.
                            </p>
                        </div>
                    <?php else: ?>
                        <div class="offer-list">
                            <?php foreach ($offers as $offer): ?>
                                <?php
                                    $productPrice = (float) ($offer['product_price'] ?? 0);
                                    $discountPercent = (float) ($offer['discount_percent'] ?? 0);
                                    $discountedPrice = $productPrice - (($productPrice * $discountPercent) / 100);
                                ?>

                                <article class="offer-item">
                                    <div class="offer-item-main">
                                        <div class="offer-status-row">
                                            <span class="status-badge status-<?= e($offer['status']) ?>">
                                                <?= $offer['status'] === 'active' ? 'Aktif' : 'Pasif' ?>
                                            </span>

                                            <span class="offer-product">
                                                <?= e($offer['product_title']) ?>
                                            </span>
                                        </div>

                                        <h3><?= e($offer['title']) ?></h3>

                                        <?php if (!empty($offer['description'])): ?>
                                            <p><?= e($offer['description']) ?></p>
                                        <?php endif; ?>

                                        <div class="offer-meta-grid">
                                            <div>
                                                <span>Minimum miktar</span>
                                                <strong>
                                                    <?= e((string) $offer['min_quantity']) ?>
                                                    <?= e($offer['unit_type']) ?>
                                                </strong>
                                            </div>

                                            <div>
                                                <span>İndirim</span>
                                                <strong>%<?= e((string) $offer['discount_percent']) ?></strong>
                                            </div>

                                            <div>
                                                <span>Normal fiyat</span>
                                                <strong>
                                                    <?= e(number_format($productPrice, 2, ',', '.')) ?> TL
                                                </strong>
                                            </div>

                                            <div>
                                                <span>İndirimli fiyat</span>
                                                <strong>
                                                    <?= e(number_format($discountedPrice, 2, ',', '.')) ?> TL
                                                </strong>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="offer-actions">
                                        <form action="<?= e(url('producer/neighborhood-offers.php')) ?>" method="post">
                                            <?php if (function_exists('csrf_field')): ?>
                                                <?= csrf_field() ?>
                                            <?php endif; ?>

                                            <input type="hidden" name="form_action" value="toggle">
                                            <input type="hidden" name="offer_id" value="<?= e((string) $offer['id']) ?>">

                                            <button class="secondary-btn" type="submit">
                                                <?= $offer['status'] === 'active' ? 'Pasif Yap' : 'Aktif Yap' ?>
                                            </button>
                                        </form>

                                        <form
                                            action="<?= e(url('producer/neighborhood-offers.php')) ?>"
                                            method="post"
                                            onsubmit="return confirm('Bu ilanı silmek istediğine emin misin?');"
                                        >
                                            <?php if (function_exists('csrf_field')): ?>
                                                <?= csrf_field() ?>
                                            <?php endif; ?>

                                            <input type="hidden" name="form_action" value="delete">
                                            <input type="hidden" name="offer_id" value="<?= e((string) $offer['id']) ?>">

                                            <button class="danger-btn" type="submit">
                                                Sil
                                            </button>
                                        </form>
                                    </div>
                                </article>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>
                </div>

            </div>

            <aside class="producer-offers-side">
                <div class="side-card">
                    <span class="side-icon">🍅</span>

                    <h2>Örnek ilan</h2>

                    <p>
                        Salçalık domates için 100 kg ve üzeri %10 indirim tanımlayabilirsin.
                        Tüketiciler bu ilana bağlı mahalle sepeti oluşturur.
                    </p>

                    <div class="side-example">
                        <div>
                            <span>Ürün</span>
                            <strong>Domates</strong>
                        </div>

                        <div>
                            <span>Minimum</span>
                            <strong>100 kg</strong>
                        </div>

                        <div>
                            <span>İndirim</span>
                            <strong>%10</strong>
                        </div>
                    </div>
                </div>

                <div class="side-card">
                    <span class="side-icon">👥</span>

                    <h2>Tüketici ne yapacak?</h2>

                    <p>
                        Tüketici aktif ilanını görecek, mahalle sepeti başlatacak,
                        e-posta ile kişileri davet edecek ve toplam miktarı takip edecek.
                    </p>
                </div>
            </aside>

        </div>
    </section>
</main>

<style>
    .producer-offers-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.34), transparent 34%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
        padding-top: 24px;
        padding-bottom: 58px;
    }

    .producer-offers-hero {
        padding: 72px 0 20px;
    }

    .back-link {
        display: inline-flex;
        margin-bottom: 16px;
        color: #3f8f46;
        text-decoration: none;
        font-weight: 900;
    }

    .back-link:hover {
        color: #245c2f;
    }

    .producer-offers-hero-card,
    .offer-form-card,
    .offer-list-card,
    .side-card,
    .alert {
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .producer-offers-hero-card {
        padding: 32px;
    }

    .mini-title {
        display: inline-flex;
        padding: 8px 15px;
        border-radius: 999px;
        background: #eef8ec;
        color: #3f8f46;
        font-size: 13px;
        font-weight: 950;
        letter-spacing: 0.06em;
        text-transform: uppercase;
        margin-bottom: 14px;
    }

    .producer-offers-hero-card h1 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(32px, 5vw, 54px);
        line-height: 1.06;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .producer-offers-hero-card p {
        max-width: 860px;
        margin: 16px 0 0;
        color: #647064;
        font-size: 17px;
        line-height: 1.7;
    }

    .producer-offers-content {
        padding-top: 12px;
    }

    .producer-offers-layout {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 330px;
        gap: 22px;
        align-items: start;
    }

    .producer-offers-main {
        display: grid;
        gap: 18px;
    }

    .offer-form-card,
    .offer-list-card,
    .side-card,
    .alert {
        padding: 24px;
    }

    .alert {
        font-weight: 800;
    }

    .alert-success {
        color: #245c2f;
        background: #eef8ec;
    }

    .alert-error {
        color: #9b3434;
        background: #fff1f1;
        border-color: #ffdada;
    }

    .form-card-heading {
        display: flex;
        align-items: flex-start;
        gap: 14px;
        margin-bottom: 20px;
    }

    .form-card-heading > span,
    .side-icon {
        width: 48px;
        height: 48px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 18px;
        background: #eef8ec;
        font-size: 24px;
        flex: 0 0 auto;
    }

    .form-card-heading h2,
    .list-heading h2,
    .side-card h2 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 24px;
        letter-spacing: -0.035em;
    }

    .form-card-heading p,
    .list-heading p,
    .side-card p {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    .form-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 16px;
    }

    .form-field {
        display: grid;
        gap: 8px;
    }

    .form-field-full {
        grid-column: 1 / -1;
    }

    .form-field label {
        color: #245c2f;
        font-weight: 900;
        font-size: 14px;
    }

    .form-field input,
    .form-field select,
    .form-field textarea {
        width: 100%;
        box-sizing: border-box;
        border: 1px solid #d9ead3;
        background: #ffffff;
        color: #263326;
        border-radius: 16px;
        padding: 13px 14px;
        font: inherit;
        outline: none;
        transition: 0.18s ease;
    }

    .form-field textarea {
        resize: vertical;
        min-height: 110px;
    }

    .form-field input:focus,
    .form-field select:focus,
    .form-field textarea:focus {
        border-color: #78b978;
        box-shadow: 0 0 0 4px rgba(120, 185, 120, 0.18);
    }

    .field-help {
        color: #7b887b;
        line-height: 1.5;
    }

    .form-submit-row {
        display: flex;
        justify-content: flex-end;
        margin-top: 18px;
    }

    .primary-btn,
    .secondary-btn,
    .danger-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 42px;
        padding: 0 18px;
        border-radius: 999px;
        border: none;
        text-decoration: none;
        font-weight: 900;
        cursor: pointer;
        transition: 0.2s ease;
        white-space: nowrap;
    }

    .primary-btn {
        background: #245c2f;
        color: #ffffff;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.20);
    }

    .primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .primary-btn:disabled {
        opacity: 0.55;
        cursor: not-allowed;
        transform: none;
    }

    .secondary-btn {
        background: #eef8ec;
        color: #245c2f;
        border: 1px solid #d9ead3;
    }

    .secondary-btn:hover {
        background: #dff1dc;
    }

    .danger-btn {
        background: #fff1f1;
        color: #9b3434;
        border: 1px solid #ffdada;
    }

    .danger-btn:hover {
        background: #ffe5e5;
    }

    .list-heading {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 18px;
        margin-bottom: 18px;
    }

    .offer-count {
        display: inline-flex;
        padding: 8px 14px;
        border-radius: 999px;
        background: #eef8ec;
        color: #245c2f;
        font-weight: 900;
        white-space: nowrap;
    }

    .empty-state {
        text-align: center;
        padding: 38px 18px;
        border-radius: 22px;
        background: #f8fcf5;
        border: 1px dashed #cfe6c9;
    }

    .empty-state span {
        font-size: 38px;
    }

    .empty-state h3 {
        margin: 10px 0 6px;
        color: #245c2f;
    }

    .empty-state p {
        margin: 0 auto;
        max-width: 520px;
        color: #647064;
        line-height: 1.6;
    }

    .offer-list {
        display: grid;
        gap: 14px;
    }

    .offer-item {
        display: grid;
        grid-template-columns: minmax(0, 1fr) auto;
        gap: 18px;
        padding: 18px;
        border-radius: 24px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .offer-status-row {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-wrap: wrap;
        margin-bottom: 10px;
    }

    .status-badge {
        display: inline-flex;
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 950;
    }

    .status-active {
        background: #e0f4dc;
        color: #245c2f;
    }

    .status-passive {
        background: #f2f2f2;
        color: #6f786f;
    }

    .offer-product {
        color: #647064;
        font-weight: 850;
    }

    .offer-item h3 {
        margin: 0 0 8px;
        color: #245c2f;
        font-size: 21px;
    }

    .offer-item p {
        margin: 0 0 14px;
        color: #647064;
        line-height: 1.6;
    }

    .offer-meta-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 10px;
    }

    .offer-meta-grid div {
        padding: 12px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid #edf5e9;
    }

    .offer-meta-grid span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 850;
        margin-bottom: 5px;
    }

    .offer-meta-grid strong {
        display: block;
        color: #245c2f;
        font-size: 14px;
    }

    .offer-actions {
        display: flex;
        align-items: flex-start;
        gap: 8px;
        flex-wrap: wrap;
    }

    .producer-offers-side {
        display: grid;
        gap: 18px;
        position: sticky;
        top: 96px;
    }

    .side-icon {
        margin-bottom: 14px;
    }

    .side-example {
        display: grid;
        gap: 10px;
        margin-top: 16px;
    }

    .side-example div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 11px 0;
        border-bottom: 1px solid #e1f0dc;
        color: #647064;
        font-weight: 800;
    }

    .side-example div:last-child {
        border-bottom: 0;
    }

    .side-example strong {
        color: #245c2f;
    }

    @media (max-width: 1050px) {
        .producer-offers-layout {
            grid-template-columns: 1fr;
        }

        .producer-offers-side {
            position: static;
        }
    }

    @media (max-width: 760px) {
        .form-grid,
        .offer-meta-grid {
            grid-template-columns: 1fr;
        }

        .offer-item {
            grid-template-columns: 1fr;
        }

        .offer-actions {
            justify-content: flex-start;
        }

        .list-heading {
            flex-direction: column;
        }

        .offer-form-card,
        .offer-list-card,
        .side-card,
        .producer-offers-hero-card {
            padding: 20px;
            border-radius: 22px;
        }

        .producer-offers-hero {
            padding-top: 44px;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>