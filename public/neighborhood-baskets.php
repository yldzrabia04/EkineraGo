<?php

require_once __DIR__ . '/../app/bootstrap.php';

$pageTitle = 'Mahalle Sepeti';
$bodyClass = 'page-neighborhood-baskets';

require APP_PATH . '/Views/layouts/header.php';

$user = currentUser();
$userRole = $user['role'] ?? null;
$isConsumer = $user && $userRole === ROLE_CONSUMER;
$isProducer = $user && $userRole === ROLE_PRODUCER;

$action = $_GET['action'] ?? 'index';

if ($action === 'create') {
    require APP_PATH . '/Views/neighborhood-baskets/create.php';
    require APP_PATH . '/Views/layouts/footer.php';
    exit;
}

$activeOffers = [];

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
} catch (Throwable $e) {
    $activeOffers = [];
}

?>

<main class="neighborhood-page">

    <section class="neighborhood-hero-section">
        <div class="container neighborhood-hero-container">

            <div class="neighborhood-hero-content">
                <span class="neighborhood-mini-title">EkineraGo Mahalle Sepeti</span>

                <h1>Komşularınla birleş, üreticiden toplu ve uygun al.</h1>

                <p>
                    Mahalle Sepeti; aynı mahalledeki kullanıcıların veya tek başına yüklü miktarda
                    ürün almak isteyen kişilerin üreticiden daha uygun fiyatla toplu alım yapmasını sağlar.
                    Üretici indirim ilanı oluşturur, tüketici bu ilana bağlı mahalle sepeti başlatır.
                </p>

                <div class="neighborhood-actions">
                    <?php if ($isConsumer): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('neighborhood-baskets.php?action=create')) ?>">
                            Mahalle Sepeti Oluştur
                        </a>

                        <a class="neighborhood-secondary-btn" href="#active-offers">
                            Aktif İlanları Gör
                        </a>
                    <?php elseif ($isProducer): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('producer/neighborhood-offers.php')) ?>">
                            Toplu Alım İlanı Oluştur
                        </a>

                        <a class="neighborhood-secondary-btn" href="#active-offers">
                            Aktif İlanları Gör
                        </a>
                    <?php elseif (!$user): ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('login.php')) ?>">
                            Giriş Yap ve Başlat
                        </a>

                        <a class="neighborhood-secondary-btn" href="<?= e(url('products.php')) ?>">
                            Ürünleri İncele
                        </a>
                    <?php else: ?>
                        <a class="neighborhood-primary-btn" href="<?= e(url('products.php')) ?>">
                            Ürünleri Keşfet
                        </a>
                    <?php endif; ?>
                </div>
            </div>

        </div>
    </section>

    <section class="neighborhood-offers-section" id="active-offers">
        <div class="container">

            <div class="section-heading section-heading-compact">
                <span>Aktif toplu alım ilanları</span>
                <h2>Üreticilerin Mahalle Sepeti indirimleri</h2>
                <p>
                    Üreticilerin belirlediği minimum miktar ve indirim oranlarına göre
                    mahalle sepeti başlatabilirsin.
                </p>
            </div>

            <?php if (!$activeOffers): ?>
                <div class="neighborhood-empty-offers">
                    <span>🏷️</span>
                    <h3>Henüz aktif toplu alım ilanı yok</h3>
                    <p>
                        Üreticiler toplu alım indirimi oluşturduğunda bu alanda görünecek.
                        Örneğin 100 kg üzeri domateste %10 indirim gibi ilanlar burada listelenecek.
                    </p>
                </div>
            <?php else: ?>
                <div class="neighborhood-offer-grid">
                    <?php foreach ($activeOffers as $offer): ?>
                        <?php
                            $productPrice = (float) ($offer['product_price'] ?? 0);
                            $discountPercent = (float) ($offer['discount_percent'] ?? 0);
                            $discountedPrice = $productPrice - (($productPrice * $discountPercent) / 100);

                            $locationParts = array_filter([
                                $offer['province_name'] ?? null,
                                $offer['district_name'] ?? null,
                            ]);

                            $locationText = $locationParts
                                ? implode(' / ', $locationParts)
                                : 'Konum belirtilmemiş';
                        ?>

                        <article class="neighborhood-offer-card">
                            <div class="offer-card-top">
                                <span class="offer-card-icon">🏷️</span>

                                <div>
                                    <h3><?= e($offer['title']) ?></h3>
                                    <p>
                                        <?= e($offer['producer_name'] ?? 'Üretici') ?>
                                        ·
                                        <?= e($locationText) ?>
                                    </p>
                                </div>
                            </div>

                            <?php if (!empty($offer['description'])): ?>
                                <p class="offer-card-description">
                                    <?= e($offer['description']) ?>
                                </p>
                            <?php endif; ?>

                            <div class="offer-card-product">
                                <span>Ürün</span>
                                <strong><?= e($offer['product_title']) ?></strong>
                            </div>

                            <div class="offer-card-meta">
                                <div>
                                    <span>Minimum</span>
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
                                    <strong><?= e(number_format($productPrice, 2, ',', '.')) ?> TL</strong>
                                </div>

                                <div>
                                    <span>İndirimli fiyat</span>
                                    <strong><?= e(number_format($discountedPrice, 2, ',', '.')) ?> TL</strong>
                                </div>
                            </div>

                            <div class="offer-card-actions">
                                <?php if ($isConsumer): ?>
                                    <a
                                        class="offer-start-btn"
                                        href="<?= e(url('neighborhood-baskets.php?action=create&offer_id=' . $offer['id'])) ?>"
                                    >
                                        Mahalle Sepeti Başlat
                                    </a>
                                <?php elseif (!$user): ?>
                                    <a class="offer-start-btn" href="<?= e(url('login.php')) ?>">
                                        Giriş Yap ve Başlat
                                    </a>
                                <?php elseif ($isProducer): ?>
                                    <a class="offer-start-btn offer-start-btn-secondary" href="<?= e(url('producer/neighborhood-offers.php')) ?>">
                                        İlanlarını Yönet
                                    </a>
                                <?php else: ?>
                                    <a class="offer-start-btn" href="<?= e(url('products.php')) ?>">
                                        Ürünleri İncele
                                    </a>
                                <?php endif; ?>
                            </div>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

        </div>
    </section>

    <section class="neighborhood-info-section">
        <div class="container">

            <div class="section-heading">
                <span>Nasıl çalışır?</span>
                <h2>Mahalle Sepeti ile toplu alım süreci</h2>
            </div>

            <div class="neighborhood-step-grid">
                <article class="neighborhood-step-card">
                    <div class="step-number">1</div>
                    <h3>Üretici indirim ilanı açar</h3>
                    <p>
                        Üretici ürün için minimum miktar ve indirim oranı belirler.
                        Örneğin 100 kg üzeri domateste %10 indirim.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">2</div>
                    <h3>Tüketici sepet başlatır</h3>
                    <p>
                        Tüketici aktif toplu alım ilanlarından birini seçerek grup veya bireysel
                        mahalle sepeti oluşturur.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">3</div>
                    <h3>Davetler gönderilir</h3>
                    <p>
                        Grup sepetinde katılacak kişilerin e-posta adresleri girilir.
                        Kabul edenler aynı sepet grubuna dahil olur.
                    </p>
                </article>

                <article class="neighborhood-step-card">
                    <div class="step-number">4</div>
                    <h3>Toplu siparişe dönüşür</h3>
                    <p>
                        Hedef miktara ulaşıldığında sepet toplu siparişe hazır hale gelir.
                        Katılımcılar kendi paylarını takip eder.
                    </p>
                </article>
            </div>

        </div>
    </section>

    <section class="neighborhood-type-section">
        <div class="container neighborhood-type-grid">

            <article class="neighborhood-type-card">
                <div class="type-icon">👥</div>
                <h2>Grup Mahalle Sepeti</h2>
                <p>
                    Salça, turşu, kışlık hazırlık veya toplu aile alışverişi için birkaç kişi birleşir.
                    Sepeti oluşturan kişi davetlilerin e-posta adreslerini girer ve kabul edenler aynı
                    sepeti takip eder.
                </p>
            </article>

            <article class="neighborhood-type-card">
                <div class="type-icon">📦</div>
                <h2>Bireysel Toplu Alım</h2>
                <p>
                    Tek başına yüksek miktarda ürün almak isteyen kullanıcı da Mahalle Sepeti oluşturabilir.
                    Böylece toplu alım indiriminden bireysel olarak yararlanabilir.
                </p>
            </article>

            <article class="neighborhood-type-card">
                <div class="type-icon">🏷️</div>
                <h2>Üretici İndirimi</h2>
                <p>
                    İndirim oranını tüketici değil, üretici belirler. Tüketici üreticinin açtığı
                    aktif toplu alım ilanlarından birini seçerek sepet başlatır.
                </p>
            </article>

        </div>
    </section>

</main>

<style>
    .neighborhood-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.28), transparent 32%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
    }

    .neighborhood-hero-section {
        padding: 34px 0 30px;
    }

    .neighborhood-hero-container {
        max-width: 980px;
        margin: 0 auto;
        text-align: center;
    }

    .neighborhood-mini-title {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 8px 16px;
        margin-bottom: 14px;
        border-radius: 999px;
        background: rgba(255, 255, 255, 0.82);
        border: 1px solid rgba(195, 225, 188, 0.95);
        color: #3f8f46;
        font-size: 13px;
        font-weight: 950;
        letter-spacing: 0.06em;
        text-transform: uppercase;
    }

    .neighborhood-hero-content h1 {
        max-width: 880px;
        margin: 0 auto;
        color: #245c2f;
        font-size: clamp(34px, 5vw, 52px);
        line-height: 1.07;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .neighborhood-hero-content p {
        max-width: 850px;
        margin: 18px auto 0;
        color: #647064;
        font-size: 18px;
        line-height: 1.7;
    }

    .neighborhood-actions {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 14px;
        flex-wrap: wrap;
        margin-top: 24px;
    }

    .neighborhood-primary-btn,
    .neighborhood-secondary-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 0 24px;
        border-radius: 999px;
        text-decoration: none;
        font-weight: 950;
        transition: 0.22s ease;
    }

    .neighborhood-primary-btn {
        background: #245c2f;
        color: #ffffff;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.22);
    }

    .neighborhood-primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .neighborhood-secondary-btn {
        background: #ffffff;
        color: #245c2f;
        border: 1px solid #d9ead3;
    }

    .neighborhood-secondary-btn:hover {
        background: #eef8ec;
        transform: translateY(-2px);
    }

    .neighborhood-offers-section {
        padding: 24px 0 34px;
    }

    .neighborhood-info-section,
    .neighborhood-type-section {
        padding: 28px 0;
    }

    .section-heading {
        text-align: center;
        max-width: 760px;
        margin: 0 auto 22px;
    }

    .section-heading-compact {
        margin-bottom: 24px;
    }

    .section-heading span {
        display: inline-block;
        color: #3f8f46;
        font-size: 14px;
        font-weight: 950;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        margin-bottom: 8px;
    }

    .section-heading h2 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(27px, 4vw, 38px);
        line-height: 1.15;
        letter-spacing: -0.04em;
    }

    .section-heading p {
        max-width: 680px;
        margin: 10px auto 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-empty-offers {
        max-width: 680px;
        margin: 0 auto;
        padding: 34px 24px;
        border-radius: 28px;
        text-align: center;
        background: rgba(255, 255, 255, 0.9);
        border: 1px dashed #cfe6c9;
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.08);
    }

    .neighborhood-empty-offers > span {
        display: inline-flex;
        font-size: 42px;
        margin-bottom: 10px;
    }

    .neighborhood-empty-offers h3 {
        margin: 0 0 8px;
        color: #245c2f;
        font-size: 24px;
    }

    .neighborhood-empty-offers p {
        margin: 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-offer-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
        gap: 18px;
        align-items: stretch;
    }

    .neighborhood-offer-card {
        display: flex;
        flex-direction: column;
        gap: 16px;
        min-height: 100%;
        padding: 24px;
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.94);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .offer-card-top {
        display: flex;
        align-items: flex-start;
        gap: 14px;
    }

    .offer-card-icon {
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

    .offer-card-top h3 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 22px;
        line-height: 1.2;
        text-transform: capitalize;
    }

    .offer-card-top p,
    .offer-card-description {
        margin: 0;
        color: #647064;
        line-height: 1.55;
    }

    .offer-card-description {
        min-height: 48px;
    }

    .offer-card-product {
        padding: 14px;
        border-radius: 18px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .offer-card-product span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 900;
        margin-bottom: 4px;
    }

    .offer-card-product strong {
        color: #245c2f;
        font-size: 17px;
    }

    .offer-card-meta {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 10px;
    }

    .offer-card-meta div {
        padding: 12px;
        border-radius: 16px;
        background: #ffffff;
        border: 1px solid #edf5e9;
    }

    .offer-card-meta span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 900;
        margin-bottom: 5px;
    }

    .offer-card-meta strong {
        display: block;
        color: #245c2f;
        font-size: 14px;
    }

    .offer-card-actions {
        margin-top: auto;
    }

    .offer-start-btn {
        display: inline-flex;
        width: 100%;
        min-height: 46px;
        align-items: center;
        justify-content: center;
        padding: 0 18px;
        border-radius: 999px;
        background: #245c2f;
        color: #ffffff;
        text-decoration: none;
        font-weight: 950;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.18);
        transition: 0.22s ease;
    }

    .offer-start-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .offer-start-btn-secondary {
        background: #3f8f46;
    }

    .neighborhood-step-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 16px;
    }

    .neighborhood-step-card,
    .neighborhood-type-card {
        padding: 24px;
        border-radius: 26px;
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .step-number,
    .type-icon {
        width: 46px;
        height: 46px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 17px;
        background: #eef8ec;
        color: #245c2f;
        font-size: 20px;
        font-weight: 950;
        margin-bottom: 15px;
    }

    .type-icon {
        font-size: 24px;
    }

    .neighborhood-step-card h3,
    .neighborhood-type-card h2 {
        margin: 0 0 10px;
        color: #245c2f;
        font-size: 21px;
    }

    .neighborhood-step-card p,
    .neighborhood-type-card p {
        margin: 0;
        color: #647064;
        line-height: 1.65;
    }

    .neighborhood-type-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 18px;
        padding-bottom: 58px;
    }

    @media (max-width: 980px) {
        .neighborhood-step-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 760px) {
        .neighborhood-type-grid,
        .neighborhood-offer-grid {
            grid-template-columns: 1fr;
        }

        .neighborhood-hero-section {
            padding-top: 28px;
        }

        .neighborhood-hero-content h1 {
            font-size: clamp(31px, 9vw, 42px);
        }
    }

    @media (max-width: 560px) {
        .neighborhood-step-grid {
            grid-template-columns: 1fr;
        }

        .neighborhood-actions {
            align-items: stretch;
            flex-direction: column;
        }

        .neighborhood-primary-btn,
        .neighborhood-secondary-btn {
            width: 100%;
        }

        .neighborhood-step-card,
        .neighborhood-type-card,
        .neighborhood-offer-card {
            padding: 20px;
            border-radius: 22px;
        }

        .neighborhood-hero-content p {
            font-size: 16px;
        }

        .offer-card-meta {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>