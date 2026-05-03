<?php

$user = currentUser();
$userRole = $user['role'] ?? null;
$isConsumer = $user && $userRole === ROLE_CONSUMER;

$selectedOfferId = (int) ($_GET['offer_id'] ?? 0);
$userProvinceId = (int) ($user['province_id'] ?? 0);

$activeOffers = [];
$selectedOffer = null;
$provinces = [];

try {
    $offerStatement = db()->query("
        SELECT
            nbo.id,
            nbo.producer_id,
            nbo.product_id,
            nbo.title,
            nbo.description,
            nbo.min_quantity,
            nbo.discount_percent,
            nbo.unit_type,
            nbo.starts_at,
            nbo.ends_at,
            p.title AS product_title,
            p.price AS product_price,
            p.stock_quantity,
            COALESCE(pp.store_name, u.full_name) AS producer_name,
            pr.name AS province_name,
            d.name AS district_name
        FROM neighborhood_basket_offers nbo
        INNER JOIN products p ON p.id = nbo.product_id
        INNER JOIN users u ON u.id = nbo.producer_id
        LEFT JOIN producer_profiles pp ON pp.user_id = u.id
        LEFT JOIN provinces pr ON pr.id = u.province_id
        LEFT JOIN districts d ON d.id = u.district_id
        WHERE nbo.status = 'active'
          AND p.status = 'active'
          AND (nbo.starts_at IS NULL OR nbo.starts_at <= NOW())
          AND (nbo.ends_at IS NULL OR nbo.ends_at >= NOW())
        ORDER BY nbo.created_at DESC
    ");

    $activeOffers = $offerStatement->fetchAll(PDO::FETCH_ASSOC);

    foreach ($activeOffers as $offer) {
        if ((int) $offer['id'] === $selectedOfferId) {
            $selectedOffer = $offer;
            break;
        }
    }
} catch (Throwable $e) {
    $activeOffers = [];
    $selectedOffer = null;
}

try {
    $provinceStatement = db()->query("
        SELECT id, name
        FROM provinces
        ORDER BY name ASC
    ");

    $provinces = $provinceStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $provinces = [];
}

$selectedProductPrice = $selectedOffer ? (float) ($selectedOffer['product_price'] ?? 0) : 0;
$selectedDiscountPercent = $selectedOffer ? (float) ($selectedOffer['discount_percent'] ?? 0) : 0;
$selectedDiscountedPrice = $selectedProductPrice - (($selectedProductPrice * $selectedDiscountPercent) / 100);

$selectedLocationParts = $selectedOffer ? array_filter([
    $selectedOffer['province_name'] ?? null,
    $selectedOffer['district_name'] ?? null,
]) : [];

$selectedLocationText = $selectedLocationParts ? implode(' / ', $selectedLocationParts) : 'Konum belirtilmemiş';

?>

<main class="neighborhood-create-page">

    <section class="neighborhood-create-hero">
        <div class="container">
            <a class="back-link" href="<?= e(url('neighborhood-baskets.php')) ?>">
                ← Mahalle Sepeti sayfasına dön
            </a>

            <div class="create-hero-card">
                <span class="create-mini-title">Yeni Mahalle Sepeti</span>

                <h1>Toplu alım sepeti başlat</h1>

                <p>
                    Üreticinin açtığı toplu alım indirimlerinden birini seçerek grup mahalle sepeti
                    veya bireysel toplu alım başlatabilirsin. İndirimi üretici belirler; sen sepeti,
                    katılım miktarını ve davetleri yönetirsin.
                </p>
            </div>
        </div>
    </section>

    <section class="neighborhood-create-section">
        <div class="container create-layout">

            <?php if (!$user): ?>

                <div class="create-warning-card">
                    <h2>Giriş yapmalısın</h2>
                    <p>
                        Mahalle Sepeti oluşturmak için önce tüketici hesabınla giriş yapmalısın.
                    </p>

                    <a class="create-primary-btn" href="<?= e(url('login.php')) ?>">
                        Giriş Yap
                    </a>
                </div>

            <?php elseif (!$isConsumer): ?>

                <div class="create-warning-card">
                    <h2>Sadece tüketiciler oluşturabilir</h2>
                    <p>
                        Mahalle Sepeti tüketici tarafında çalışan bir toplu alım özelliğidir.
                        Üretici hesabıyla sepet oluşturamazsın. Üreticiler indirim ilanlarını
                        üretici panelinden oluşturur.
                    </p>

                    <a class="create-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Geri Dön
                    </a>
                </div>

            <?php elseif (!$activeOffers): ?>

                <div class="create-warning-card">
                    <h2>Aktif toplu alım ilanı yok</h2>
                    <p>
                        Mahalle Sepeti başlatabilmek için önce bir üreticinin aktif toplu alım indirimi
                        oluşturması gerekir.
                    </p>

                    <a class="create-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        İlanları Kontrol Et
                    </a>
                </div>

            <?php else: ?>

                <form
                    class="neighborhood-create-form"
                    action="<?= e(url('neighborhood-baskets.php?action=store')) ?>"
                    method="post"
                >
                    <?php if (function_exists('csrf_field')): ?>
                        <?= csrf_field() ?>
                    <?php endif; ?>

                    <div class="form-section-card">
                        <div class="form-section-heading">
                            <span>1</span>
                            <div>
                                <h2>Toplu alım ilanını seç</h2>
                                <p>Bu sepet üreticinin belirlediği indirim ilanına bağlı olacak.</p>
                            </div>
                        </div>

                        <div class="form-grid">
                            <div class="form-field form-field-full">
                                <label for="offer_id">Üretici indirimi</label>

                                <select id="offer_id" name="offer_id" required>
                                    <option value="">Toplu alım ilanı seçiniz</option>

                                    <?php foreach ($activeOffers as $offer): ?>
                                        <option
                                            value="<?= e((string) $offer['id']) ?>"
                                            <?= (int) $offer['id'] === $selectedOfferId ? 'selected' : '' ?>
                                        >
                                            <?= e($offer['title']) ?>
                                            —
                                            <?= e($offer['producer_name'] ?? 'Üretici') ?>
                                            —
                                            Min:
                                            <?= e((string) $offer['min_quantity']) ?>
                                            <?= e($offer['unit_type']) ?>
                                            —
                                            %<?= e((string) $offer['discount_percent']) ?> indirim
                                        </option>
                                    <?php endforeach; ?>
                                </select>

                                <small class="field-help">
                                    Mahalle Sepeti, seçtiğin bu indirim ilanının minimum miktar ve indirim şartlarına göre oluşur.
                                </small>
                            </div>
                        </div>

                        <?php if ($selectedOffer): ?>
                            <div class="selected-offer-box">
                                <div class="selected-offer-top">
                                    <span>🏷️</span>

                                    <div>
                                        <h3><?= e($selectedOffer['title']) ?></h3>
                                        <p>
                                            <?= e($selectedOffer['producer_name'] ?? 'Üretici') ?>
                                            ·
                                            <?= e($selectedLocationText) ?>
                                        </p>
                                    </div>
                                </div>

                                <?php if (!empty($selectedOffer['description'])): ?>
                                    <p class="selected-offer-description">
                                        <?= e($selectedOffer['description']) ?>
                                    </p>
                                <?php endif; ?>

                                <div class="selected-offer-meta">
                                    <div>
                                        <span>Ürün</span>
                                        <strong><?= e($selectedOffer['product_title']) ?></strong>
                                    </div>

                                    <div>
                                        <span>Hedef miktar</span>
                                        <strong>
                                            <?= e((string) $selectedOffer['min_quantity']) ?>
                                            <?= e($selectedOffer['unit_type']) ?>
                                        </strong>
                                    </div>

                                    <div>
                                        <span>İndirim</span>
                                        <strong>%<?= e((string) $selectedOffer['discount_percent']) ?></strong>
                                    </div>

                                    <div>
                                        <span>İndirimli fiyat</span>
                                        <strong>
                                            <?= e(number_format($selectedDiscountedPrice, 2, ',', '.')) ?> TL /
                                            <?= e($selectedOffer['unit_type']) ?>
                                        </strong>
                                    </div>
                                </div>
                            </div>
                        <?php else: ?>
                            <div class="selected-offer-empty">
                                <span>🧺</span>
                                <p>
                                    Mahalle Sepeti oluşturmak için önce yukarıdan bir toplu alım ilanı seç.
                                    İlanı seçerek geldiysen sayfayı yenile veya ilan kartındaki
                                    “Mahalle Sepeti Başlat” butonuna tekrar bas.
                                </p>
                            </div>
                        <?php endif; ?>
                    </div>

                    <div class="form-section-card">
                        <div class="form-section-heading">
                            <span>2</span>
                            <div>
                                <h2>Sepet türünü seç</h2>
                                <p>Grup halinde mi, bireysel toplu alım olarak mı oluşturacağını belirle.</p>
                            </div>
                        </div>

                        <div class="basket-type-grid">
                            <label class="basket-type-option">
                                <input type="radio" name="basket_type" value="group" checked>

                                <span>
                                    <strong>Grup Mahalle Sepeti</strong>
                                    <small>
                                        E-posta ile kişileri davet et. Kabul edenler aynı sepeti takip etsin.
                                    </small>
                                </span>
                            </label>

                            <label class="basket-type-option">
                                <input type="radio" name="basket_type" value="individual">

                                <span>
                                    <strong>Bireysel Toplu Alım</strong>
                                    <small>
                                        Tek başına yüklü miktarda ürün almak için toplu alım talebi oluştur.
                                    </small>
                                </span>
                            </label>
                        </div>
                    </div>

                    <div class="form-section-card">
                        <div class="form-section-heading">
                            <span>3</span>
                            <div>
                                <h2>Sepet bilgilerini gir</h2>
                                <p>Senin almak istediğin miktarı ve teslim bölgesini belirle.</p>
                            </div>
                        </div>

                        <div class="form-grid">
                            <div class="form-field form-field-full">
                                <label for="title">Sepet başlığı</label>
                                <input
                                    type="text"
                                    id="title"
                                    name="title"
                                    placeholder="Örn: Dörtyol salçalık domates grubu"
                                    required
                                >
                            </div>

                            <div class="form-field">
                                <label for="my_quantity">Benim almak istediğim miktar</label>
                                <input
                                    type="number"
                                    id="my_quantity"
                                    name="my_quantity"
                                    min="1"
                                    step="0.01"
                                    placeholder="20"
                                    required
                                >

                                <small class="field-help">
                                    Sepeti oluşturan kişi olarak kendi miktarını yaz.
                                </small>
                            </div>

                            <div class="form-field">
                                <label for="expires_at">Son katılım tarihi</label>
                                <input
                                    type="date"
                                    id="expires_at"
                                    name="expires_at"
                                >
                            </div>

                            <div class="form-field">
                                <label for="province_id">İl</label>

                                <select id="province_id" name="province_id" required>
                                    <option value="">İl seçiniz</option>

                                    <?php foreach ($provinces as $province): ?>
                                        <option
                                            value="<?= e((string) $province['id']) ?>"
                                            <?= $userProvinceId === (int) $province['id'] ? 'selected' : '' ?>
                                        >
                                            <?= e($province['name']) ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>

                            <div class="form-field">
                                <label for="visibility">Görünürlük</label>

                                <select id="visibility" name="visibility">
                                    <option value="private">Sadece davetliler görsün</option>
                                    <option value="public">Herkese açık olsun</option>
                                </select>
                            </div>

                            <div class="form-field form-field-full">
                                <label for="creator_note">Açıklama / not</label>
                                <textarea
                                    id="creator_note"
                                    name="creator_note"
                                    rows="4"
                                    placeholder="Örn: Bu sepet mahallede salça yapmak isteyenler için açılmıştır. Katılmak isteyenler kaç kg almak istediğini yazabilir."
                                ></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-section-card" data-invite-section>
                        <div class="form-section-heading">
                            <span>4</span>
                            <div>
                                <h2>Davet edilecek kişiler</h2>
                                <p>Grup sepeti oluşturuyorsan katılmasını istediğin kişilerin e-posta adreslerini yaz.</p>
                            </div>
                        </div>

                        <div class="form-field form-field-full">
                            <label for="invite_emails">E-posta adresleri</label>

                            <textarea
                                id="invite_emails"
                                name="invite_emails"
                                rows="4"
                                placeholder="ornek1@mail.com, ornek2@mail.com, ornek3@mail.com"
                            ></textarea>

                            <small class="field-help">
                                Birden fazla e-posta adresini virgül veya satır satır yazabilirsin.
                                Bu aşamada davetler veritabanına kaydedilecek; gerçek mail gönderimini sonra bağlayacağız.
                            </small>
                        </div>
                    </div>

                    <div class="form-submit-card">
                        <div>
                            <h2>Hazırsan sepeti başlat</h2>
                            <p>
                                Bir sonraki adımda bu formu veritabanına kaydedeceğiz.
                                Sepet oluşturulunca katılımcılar toplam miktarı takip edebilecek.
                            </p>
                        </div>

                        <button class="create-primary-btn" type="submit" <?= !$selectedOffer ? 'disabled' : '' ?>>
                            Mahalle Sepeti Başlat
                        </button>
                    </div>
                </form>

                <aside class="create-side-card">
                    <span class="side-icon">🧺</span>

                    <?php if ($selectedOffer): ?>
                        <h2>Seçilen ilan özeti</h2>

                        <p>
                            Bu Mahalle Sepeti, üreticinin belirlediği toplu alım indirimiyle oluşturulacak.
                        </p>

                        <div class="side-mini-list">
                            <div>
                                <span>Ürün</span>
                                <strong><?= e($selectedOffer['product_title']) ?></strong>
                            </div>

                            <div>
                                <span>Üretici</span>
                                <strong><?= e($selectedOffer['producer_name'] ?? 'Üretici') ?></strong>
                            </div>

                            <div>
                                <span>Hedef</span>
                                <strong>
                                    <?= e((string) $selectedOffer['min_quantity']) ?>
                                    <?= e($selectedOffer['unit_type']) ?>
                                </strong>
                            </div>

                            <div>
                                <span>İndirim</span>
                                <strong>%<?= e((string) $selectedOffer['discount_percent']) ?></strong>
                            </div>

                            <div>
                                <span>Normal fiyat</span>
                                <strong>
                                    <?= e(number_format($selectedProductPrice, 2, ',', '.')) ?> TL
                                </strong>
                            </div>

                            <div>
                                <span>İndirimli</span>
                                <strong>
                                    <?= e(number_format($selectedDiscountedPrice, 2, ',', '.')) ?> TL
                                </strong>
                            </div>
                        </div>
                    <?php else: ?>
                        <h2>Nasıl başlatılır?</h2>

                        <p>
                            Önce aktif toplu alım ilanlarından birini seç. Sonra grup veya bireysel sepet
                            türünü belirleyip kendi miktarını gir.
                        </p>

                        <div class="side-mini-list">
                            <div>
                                <span>1</span>
                                <strong>İlan seç</strong>
                            </div>

                            <div>
                                <span>2</span>
                                <strong>Miktar gir</strong>
                            </div>

                            <div>
                                <span>3</span>
                                <strong>Davet gönder</strong>
                            </div>
                        </div>
                    <?php endif; ?>
                </aside>

            <?php endif; ?>

        </div>
    </section>

</main>

<style>
    .neighborhood-create-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.35), transparent 34%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
        padding-top: 24px;
        padding-bottom: 58px;
    }

    .neighborhood-create-hero {
        padding: 72px 0 20px;
    }

    .back-link {
        display: inline-flex;
        align-items: center;
        margin-bottom: 16px;
        color: #3f8f46;
        text-decoration: none;
        font-weight: 900;
    }

    .back-link:hover {
        color: #245c2f;
    }

    .create-hero-card {
        padding: 32px;
        border-radius: 30px;
        background: rgba(255, 255, 255, 0.88);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .create-mini-title {
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

    .create-hero-card h1 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(32px, 5vw, 54px);
        line-height: 1.06;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .create-hero-card p {
        max-width: 840px;
        margin: 16px 0 0;
        color: #647064;
        font-size: 17px;
        line-height: 1.7;
    }

    .neighborhood-create-section {
        padding: 12px 0 0;
    }

    .create-layout {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 340px;
        gap: 22px;
        align-items: start;
    }

    .neighborhood-create-form {
        display: grid;
        gap: 18px;
    }

    .form-section-card,
    .form-submit-card,
    .create-side-card,
    .create-warning-card {
        padding: 26px;
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .form-section-heading {
        display: flex;
        gap: 14px;
        align-items: flex-start;
        margin-bottom: 20px;
    }

    .form-section-heading > span {
        width: 42px;
        height: 42px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 16px;
        background: #eef8ec;
        color: #245c2f;
        font-weight: 950;
        flex: 0 0 auto;
    }

    .form-section-heading h2,
    .form-submit-card h2,
    .create-side-card h2,
    .create-warning-card h2 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 24px;
        letter-spacing: -0.035em;
    }

    .form-section-heading p,
    .form-submit-card p,
    .create-side-card p,
    .create-warning-card p {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    .basket-type-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 14px;
    }

    .basket-type-option {
        display: flex;
        gap: 12px;
        align-items: flex-start;
        padding: 18px;
        border-radius: 22px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
        cursor: pointer;
        transition: 0.2s ease;
    }

    .basket-type-option:hover {
        transform: translateY(-2px);
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.10);
    }

    .basket-type-option input {
        margin-top: 4px;
        accent-color: #245c2f;
    }

    .basket-type-option strong {
        display: block;
        color: #245c2f;
        margin-bottom: 5px;
    }

    .basket-type-option small {
        display: block;
        color: #647064;
        line-height: 1.45;
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

    .selected-offer-box,
    .selected-offer-empty {
        margin-top: 18px;
        padding: 20px;
        border-radius: 24px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .selected-offer-top {
        display: flex;
        align-items: flex-start;
        gap: 14px;
        margin-bottom: 14px;
    }

    .selected-offer-top > span {
        width: 46px;
        height: 46px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 17px;
        background: #eef8ec;
        font-size: 24px;
        flex: 0 0 auto;
    }

    .selected-offer-top h3 {
        margin: 0 0 5px;
        color: #245c2f;
        font-size: 22px;
    }

    .selected-offer-top p,
    .selected-offer-description,
    .selected-offer-empty p {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    .selected-offer-description {
        margin-bottom: 14px;
    }

    .selected-offer-meta {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 10px;
    }

    .selected-offer-meta div {
        padding: 12px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid #edf5e9;
    }

    .selected-offer-meta span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 900;
        margin-bottom: 5px;
    }

    .selected-offer-meta strong {
        display: block;
        color: #245c2f;
        font-size: 14px;
    }

    .selected-offer-empty {
        display: flex;
        gap: 14px;
        align-items: flex-start;
    }

    .selected-offer-empty > span {
        font-size: 28px;
        flex: 0 0 auto;
    }

    .form-submit-card {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 18px;
    }

    .create-primary-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 0 22px;
        border: none;
        border-radius: 999px;
        background: #245c2f;
        color: #ffffff;
        text-decoration: none;
        font-weight: 950;
        cursor: pointer;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.22);
        transition: 0.22s ease;
        white-space: nowrap;
    }

    .create-primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .create-primary-btn:disabled {
        opacity: 0.55;
        cursor: not-allowed;
        transform: none;
    }

    .create-side-card {
        position: sticky;
        top: 98px;
    }

    .side-icon {
        width: 54px;
        height: 54px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 20px;
        background: #eef8ec;
        font-size: 28px;
        margin-bottom: 16px;
    }

    .side-mini-list {
        display: grid;
        gap: 10px;
        margin-top: 18px;
    }

    .side-mini-list div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 12px 0;
        border-bottom: 1px solid #e1f0dc;
        color: #647064;
        font-weight: 800;
    }

    .side-mini-list div:last-child {
        border-bottom: 0;
    }

    .side-mini-list strong {
        color: #245c2f;
        text-align: right;
    }

    .create-warning-card {
        grid-column: 1 / -1;
        text-align: center;
    }

    .create-warning-card .create-primary-btn {
        margin-top: 18px;
    }

    @media (max-width: 980px) {
        .create-layout {
            grid-template-columns: 1fr;
        }

        .create-side-card {
            position: static;
        }

        .selected-offer-meta {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 700px) {
        .basket-type-grid,
        .form-grid,
        .selected-offer-meta {
            grid-template-columns: 1fr;
        }

        .form-submit-card {
            align-items: stretch;
            flex-direction: column;
        }

        .create-primary-btn {
            width: 100%;
        }

        .create-hero-card,
        .form-section-card,
        .form-submit-card,
        .create-side-card,
        .create-warning-card {
            padding: 20px;
            border-radius: 22px;
        }

        .neighborhood-create-hero {
            padding-top: 44px;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const offerSelect = document.getElementById('offer_id');
        const inviteSection = document.querySelector('[data-invite-section]');
        const basketTypeInputs = document.querySelectorAll('input[name="basket_type"]');

        if (offerSelect) {
            offerSelect.addEventListener('change', function () {
                if (!this.value) {
                    return;
                }

                const url = new URL(window.location.href);
                url.searchParams.set('action', 'create');
                url.searchParams.set('offer_id', this.value);
                window.location.href = url.toString();
            });
        }

        function updateInviteSection() {
            if (!inviteSection) {
                return;
            }

            const selectedType = document.querySelector('input[name="basket_type"]:checked');

            if (!selectedType) {
                return;
            }

            inviteSection.style.display = selectedType.value === 'group' ? '' : 'none';
        }

        basketTypeInputs.forEach(function (input) {
            input.addEventListener('change', updateInviteSection);
        });

        updateInviteSection();
    });
</script>