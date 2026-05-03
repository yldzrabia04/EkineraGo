<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$pageTitle = 'Mahalle Sepetlerim';
$bodyClass = 'page-consumer-neighborhood-baskets';

$user = currentUser();
$userId = (int) currentUserId();
$userEmail = strtolower((string) ($user['email'] ?? ''));

$myBaskets = [];
$pendingInvitations = [];
$pageError = null;

$stats = [
    'total' => 0,
    'created' => 0,
    'joined' => 0,
    'pending_invites' => 0,
    'ready' => 0,
];

if (!function_exists('consumer_nb_status_label')) {
    function consumer_nb_status_label(string $status): string
    {
        return match ($status) {
            'open' => 'Katılıma açık',
            'ready_to_order' => 'Siparişe hazır',
            'ordered' => 'Sipariş oluşturuldu',
            'cancelled' => 'İptal edildi',
            'expired' => 'Süresi doldu',
            default => $status,
        };
    }
}

if (!function_exists('consumer_nb_status_class')) {
    function consumer_nb_status_class(string $status): string
    {
        return match ($status) {
            'open' => 'status-open',
            'ready_to_order' => 'status-ready',
            'ordered' => 'status-ordered',
            'cancelled' => 'status-cancelled',
            'expired' => 'status-expired',
            default => 'status-open',
        };
    }
}

if (!function_exists('consumer_nb_money')) {
    function consumer_nb_money(float $amount): string
    {
        return number_format($amount, 2, ',', '.') . ' TL';
    }
}

if (!function_exists('consumer_nb_quantity')) {
    function consumer_nb_quantity(float $quantity): string
    {
        return number_format($quantity, 2, ',', '.');
    }
}

try {
    $basketStatement = db()->prepare("
        SELECT
            nb.id,
            nb.producer_id,
            nb.product_id,
            nb.creator_user_id,
            nb.title,
            nb.province_id,
            nb.district_id,
            nb.neighborhood_id,
            nb.target_quantity,
            nb.current_quantity,
            nb.unit_type,
            nb.status,
            nb.expires_at,
            nb.order_id,
            nb.created_at,
            nb.updated_at,

            COALESCE(nb.basket_type, 'group') AS basket_type,
            COALESCE(nb.visibility, 'private') AS visibility,
            COALESCE(nb.creator_note, '') AS creator_note,
            COALESCE(nb.discount_percent_snapshot, 0) AS discount_percent_snapshot,
            COALESCE(nb.unit_price_snapshot, p.price) AS unit_price_snapshot,
            COALESCE(nb.discounted_unit_price_snapshot, p.price) AS discounted_unit_price_snapshot,

            p.title AS product_title,
            p.price AS product_price,
            p.stock_quantity,

            creator.full_name AS creator_name,
            producer.full_name AS producer_full_name,
            COALESCE(pp.store_name, producer.full_name) AS producer_name,

            pr.name AS province_name,
            d.name AS district_name,
            n.name AS neighborhood_name,

            nbm.id AS member_id,
            nbm.quantity AS my_quantity,
            nbm.status AS my_member_status,

            (
                SELECT COUNT(*)
                FROM neighborhood_basket_members nbm_count
                WHERE nbm_count.basket_id = nb.id
                  AND nbm_count.status IN ('active', 'paid')
            ) AS member_count

        FROM neighborhood_baskets nb
        INNER JOIN products p ON p.id = nb.product_id
        INNER JOIN users creator ON creator.id = nb.creator_user_id
        INNER JOIN users producer ON producer.id = nb.producer_id
        LEFT JOIN producer_profiles pp ON pp.user_id = producer.id
        LEFT JOIN provinces pr ON pr.id = nb.province_id
        LEFT JOIN districts d ON d.id = nb.district_id
        LEFT JOIN neighborhoods n ON n.id = nb.neighborhood_id
        LEFT JOIN neighborhood_basket_members nbm
            ON nbm.basket_id = nb.id
           AND nbm.user_id = :member_user_id
        WHERE nb.creator_user_id = :creator_user_id
           OR nbm.id IS NOT NULL
        ORDER BY
            CASE nb.status
                WHEN 'ready_to_order' THEN 1
                WHEN 'open' THEN 2
                WHEN 'ordered' THEN 3
                WHEN 'cancelled' THEN 4
                WHEN 'expired' THEN 5
                ELSE 6
            END,
            COALESCE(nb.updated_at, nb.created_at) DESC
    ");

    $basketStatement->execute([
        'member_user_id' => $userId,
        'creator_user_id' => $userId,
    ]);

    $myBaskets = $basketStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $myBaskets = [];
    $pageError = 'Mahalle sepetleri alınırken hata oluştu: ' . $e->getMessage();
}

try {
    $invitationStatement = db()->prepare("
        SELECT
            nbi.id AS invitation_id,
            nbi.basket_id,
            nbi.invited_email,
            nbi.invited_user_id,
            nbi.token,
            nbi.status AS invitation_status,
            nbi.expires_at AS invitation_expires_at,
            nbi.created_at AS invitation_created_at,

            nb.title AS basket_title,
            nb.target_quantity,
            nb.current_quantity,
            nb.unit_type,
            nb.status AS basket_status,
            nb.expires_at AS basket_expires_at,

            COALESCE(nb.discount_percent_snapshot, 0) AS discount_percent_snapshot,
            COALESCE(nb.unit_price_snapshot, p.price) AS unit_price_snapshot,
            COALESCE(nb.discounted_unit_price_snapshot, p.price) AS discounted_unit_price_snapshot,

            p.title AS product_title,

            creator.full_name AS creator_name,
            COALESCE(pp.store_name, producer.full_name) AS producer_name,

            pr.name AS province_name,
            d.name AS district_name

        FROM neighborhood_basket_invitations nbi
        INNER JOIN neighborhood_baskets nb ON nb.id = nbi.basket_id
        INNER JOIN products p ON p.id = nb.product_id
        INNER JOIN users creator ON creator.id = nb.creator_user_id
        INNER JOIN users producer ON producer.id = nb.producer_id
        LEFT JOIN producer_profiles pp ON pp.user_id = producer.id
        LEFT JOIN provinces pr ON pr.id = nb.province_id
        LEFT JOIN districts d ON d.id = nb.district_id
        WHERE nbi.status = 'pending'
          AND (
                nbi.invited_user_id = :invited_user_id
                OR LOWER(nbi.invited_email) = :invited_email
          )
          AND (nbi.expires_at IS NULL OR nbi.expires_at >= NOW())
        ORDER BY nbi.created_at DESC
    ");

    $invitationStatement->execute([
        'invited_user_id' => $userId,
        'invited_email' => $userEmail,
    ]);

    $pendingInvitations = $invitationStatement->fetchAll(PDO::FETCH_ASSOC);
} catch (Throwable $e) {
    $pendingInvitations = [];

    if (!$pageError) {
        $pageError = 'Mahalle sepeti davetleri alınırken hata oluştu: ' . $e->getMessage();
    }
}

$stats['total'] = count($myBaskets);
$stats['pending_invites'] = count($pendingInvitations);

foreach ($myBaskets as $basket) {
    if ((int) $basket['creator_user_id'] === $userId) {
        $stats['created']++;
    } else {
        $stats['joined']++;
    }

    if (($basket['status'] ?? '') === 'ready_to_order') {
        $stats['ready']++;
    }
}

require APP_PATH . '/Views/layouts/header.php';

?>

<main class="consumer-neighborhood-page">

    <section class="consumer-neighborhood-hero">
        <div class="container consumer-neighborhood-hero-inner">

            <div class="hero-copy">
                <a class="back-link" href="<?= e(url('consumer/dashboard.php')) ?>">
                    ← Tüketici paneline dön
                </a>

                <span class="mini-title">Mahalle Sepetlerim</span>

                <h1>Katıldığın ve oluşturduğun toplu alımları takip et.</h1>

                <p>
                    Mahalle Sepetlerinde toplam miktarı, hedefe ne kadar kaldığını,
                    kendi talep miktarını, tahmini ödemen gereken tutarı ve davetlerini buradan görebilirsin.
                </p>

                <div class="hero-actions">
                    <a class="primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Aktif İlanları Gör
                    </a>

                    <a class="secondary-btn" href="<?= e(url('neighborhood-baskets.php?action=create')) ?>">
                        Mahalle Sepeti Oluştur
                    </a>
                </div>
            </div>

            <div class="hero-stats-grid">
                <article>
                    <span>🧺</span>
                    <strong><?= e((string) $stats['total']) ?></strong>
                    <p>Aktif / geçmiş sepet</p>
                </article>

                <article>
                    <span>✨</span>
                    <strong><?= e((string) $stats['created']) ?></strong>
                    <p>Oluşturduğun</p>
                </article>

                <article>
                    <span>👥</span>
                    <strong><?= e((string) $stats['joined']) ?></strong>
                    <p>Katıldığın</p>
                </article>

                <article>
                    <span>📩</span>
                    <strong><?= e((string) $stats['pending_invites']) ?></strong>
                    <p>Bekleyen davet</p>
                </article>
            </div>

        </div>
    </section>

    <section class="consumer-neighborhood-content">
        <div class="container">

            <?php if ($pageError): ?>
                <div class="page-error-box">
                    <span>⚠️</span>
                    <div>
                        <strong>Sayfa açıldı ama veri alınırken hata oluştu.</strong>
                        <p><?= e($pageError) ?></p>
                    </div>
                </div>
            <?php endif; ?>

            <?php if ($pendingInvitations): ?>
                <section class="pending-invites-section">
                    <div class="section-heading">
                        <div>
                            <span>Bekleyen davetler</span>
                            <h2>Katılmanı bekleyen Mahalle Sepetleri</h2>
                        </div>

                        <strong><?= e((string) count($pendingInvitations)) ?> davet</strong>
                    </div>

                    <div class="pending-invite-grid">
                        <?php foreach ($pendingInvitations as $invitation): ?>
                            <?php
                                $targetQuantity = (float) ($invitation['target_quantity'] ?? 0);
                                $currentQuantity = (float) ($invitation['current_quantity'] ?? 0);
                                $progressPercent = $targetQuantity > 0
                                    ? min(100, round(($currentQuantity / $targetQuantity) * 100))
                                    : 0;

                                $locationParts = array_filter([
                                    $invitation['province_name'] ?? null,
                                    $invitation['district_name'] ?? null,
                                ]);

                                $locationText = $locationParts ? implode(' / ', $locationParts) : 'Konum belirtilmemiş';
                            ?>

                            <article class="pending-invite-card">
                                <div class="card-top">
                                    <span class="card-icon">📩</span>

                                    <div>
                                        <h3><?= e($invitation['basket_title']) ?></h3>
                                        <p>
                                            <?= e($invitation['creator_name'] ?? 'Bir kullanıcı') ?>
                                            seni davet etti.
                                        </p>
                                    </div>
                                </div>

                                <div class="mini-info-list">
                                    <div>
                                        <span>Ürün</span>
                                        <strong><?= e($invitation['product_title']) ?></strong>
                                    </div>

                                    <div>
                                        <span>Üretici</span>
                                        <strong><?= e($invitation['producer_name'] ?? 'Üretici') ?></strong>
                                    </div>

                                    <div>
                                        <span>Konum</span>
                                        <strong><?= e($locationText) ?></strong>
                                    </div>

                                    <div>
                                        <span>İndirim</span>
                                        <strong>
                                            %<?= e(number_format((float) $invitation['discount_percent_snapshot'], 2, ',', '.')) ?>
                                        </strong>
                                    </div>
                                </div>

                                <div class="progress-box">
                                    <div>
                                        <span>Toplanan</span>
                                        <strong>
                                            <?= e(consumer_nb_quantity($currentQuantity)) ?>
                                            /
                                            <?= e(consumer_nb_quantity($targetQuantity)) ?>
                                            <?= e($invitation['unit_type']) ?>
                                        </strong>
                                    </div>

                                    <div class="progress-bar">
                                        <span style="width: <?= e((string) $progressPercent) ?>%;"></span>
                                    </div>

                                    <small>
                                        Hedefin %<?= e((string) $progressPercent) ?> kadarı tamamlandı.
                                    </small>
                                </div>

                                <a
                                    class="primary-btn full"
                                    href="<?= e(url('neighborhood-baskets.php?action=accept-invite&token=' . $invitation['token'])) ?>"
                                >
                                    Daveti Gör ve Katıl
                                </a>
                            </article>
                        <?php endforeach; ?>
                    </div>
                </section>
            <?php endif; ?>

            <section class="my-baskets-section">
                <div class="section-heading">
                    <div>
                        <span>Sepetlerim</span>
                        <h2>Oluşturduğun ve katıldığın Mahalle Sepetleri</h2>
                    </div>

                    <strong><?= e((string) count($myBaskets)) ?> sepet</strong>
                </div>

                <?php if (!$myBaskets): ?>
                    <div class="empty-state">
                        <span>🧺</span>
                        <h3>Henüz katıldığın Mahalle Sepeti yok</h3>
                        <p>
                            Üreticilerin toplu alım ilanlarını inceleyerek bir Mahalle Sepeti başlatabilir
                            veya sana gelen davetleri kabul ederek bir sepete katılabilirsin.
                        </p>

                        <a class="primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                            Aktif Toplu Alım İlanlarını Gör
                        </a>
                    </div>
                <?php else: ?>
                    <div class="basket-grid">
                        <?php foreach ($myBaskets as $basket): ?>
                            <?php
                                $targetQuantity = (float) ($basket['target_quantity'] ?? 0);
                                $currentQuantity = (float) ($basket['current_quantity'] ?? 0);
                                $progressPercent = $targetQuantity > 0
                                    ? min(100, round(($currentQuantity / $targetQuantity) * 100))
                                    : 0;

                                $discountedUnitPrice = (float) ($basket['discounted_unit_price_snapshot'] ?? 0);
                                $myQuantity = (float) ($basket['my_quantity'] ?? 0);
                                $myEstimatedTotal = $myQuantity * $discountedUnitPrice;

                                $isCreator = (int) $basket['creator_user_id'] === $userId;
                                $roleLabel = $isCreator ? 'Oluşturdun' : 'Katıldın';

                                $locationParts = array_filter([
                                    $basket['province_name'] ?? null,
                                    $basket['district_name'] ?? null,
                                    $basket['neighborhood_name'] ?? null,
                                ]);

                                $locationText = $locationParts ? implode(' / ', $locationParts) : 'Konum belirtilmemiş';
                                $status = (string) ($basket['status'] ?? 'open');
                            ?>

                            <article class="basket-card">
                                <div class="basket-card-header">
                                    <div class="card-top">
                                        <span class="card-icon">🧺</span>

                                        <div>
                                            <h3><?= e($basket['title']) ?></h3>
                                            <p>
                                                <?= e($basket['producer_name'] ?? 'Üretici') ?>
                                                ·
                                                <?= e($locationText) ?>
                                            </p>
                                        </div>
                                    </div>

                                    <div class="badge-row">
                                        <span class="role-badge">
                                            <?= e($roleLabel) ?>
                                        </span>

                                        <span class="status-badge <?= e(consumer_nb_status_class($status)) ?>">
                                            <?= e(consumer_nb_status_label($status)) ?>
                                        </span>
                                    </div>
                                </div>

                                <div class="basket-product-box">
                                    <span>Ürün</span>
                                    <strong><?= e($basket['product_title']) ?></strong>
                                </div>

                                <div class="progress-box">
                                    <div>
                                        <span>Toplanan miktar</span>
                                        <strong>
                                            <?= e(consumer_nb_quantity($currentQuantity)) ?>
                                            /
                                            <?= e(consumer_nb_quantity($targetQuantity)) ?>
                                            <?= e($basket['unit_type']) ?>
                                        </strong>
                                    </div>

                                    <div class="progress-bar">
                                        <span style="width: <?= e((string) $progressPercent) ?>%;"></span>
                                    </div>

                                    <small>
                                        Hedefin %<?= e((string) $progressPercent) ?> kadarı tamamlandı.
                                    </small>
                                </div>

                                <div class="basket-info-grid">
                                    <div>
                                        <span>Benim miktarım</span>
                                        <strong>
                                            <?php if ($myQuantity > 0): ?>
                                                <?= e(consumer_nb_quantity($myQuantity)) ?>
                                                <?= e($basket['unit_type']) ?>
                                            <?php elseif ($isCreator): ?>
                                                Oluşturan
                                            <?php else: ?>
                                                -
                                            <?php endif; ?>
                                        </strong>
                                    </div>

                                    <div>
                                        <span>Tahmini ödemem</span>
                                        <strong>
                                            <?= $myEstimatedTotal > 0 ? e(consumer_nb_money($myEstimatedTotal)) : '-' ?>
                                        </strong>
                                    </div>

                                    <div>
                                        <span>İndirim</span>
                                        <strong>
                                            %<?= e(number_format((float) $basket['discount_percent_snapshot'], 2, ',', '.')) ?>
                                        </strong>
                                    </div>

                                    <div>
                                        <span>Katılımcı</span>
                                        <strong>
                                            <?= e((string) ($basket['member_count'] ?? 0)) ?> kişi
                                        </strong>
                                    </div>
                                </div>

                                <?php if ($isCreator && $status === 'ready_to_order'): ?>
                                    <div class="ready-alert">
                                        <span>✅</span>
                                        <p>
                                            Bu sepet hedef miktara ulaştı. Detay sayfasından toplu siparişi onaylayabilirsin.
                                        </p>
                                    </div>
                                <?php endif; ?>

                                <div class="basket-actions">
                                    <a
                                        class="primary-btn full"
                                        href="<?= e(url('neighborhood-baskets.php?action=show&id=' . $basket['id'])) ?>"
                                    >
                                        Detayı Gör
                                    </a>
                                </div>
                            </article>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </section>

        </div>
    </section>

</main>

<style>
    .consumer-neighborhood-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.30), transparent 34%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
        padding-bottom: 58px;
    }

    .consumer-neighborhood-hero {
        padding: 38px 0 24px;
    }

    .consumer-neighborhood-hero-inner {
        display: grid;
        grid-template-columns: minmax(0, 1.1fr) minmax(320px, 0.75fr);
        gap: 24px;
        align-items: center;
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

    .hero-copy h1 {
        max-width: 820px;
        margin: 0;
        color: #245c2f;
        font-size: clamp(34px, 5vw, 54px);
        line-height: 1.06;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .hero-copy p {
        max-width: 820px;
        margin: 18px 0 0;
        color: #647064;
        font-size: 18px;
        line-height: 1.7;
    }

    .hero-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-top: 24px;
    }

    .primary-btn,
    .secondary-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 46px;
        padding: 0 20px;
        border-radius: 999px;
        text-decoration: none;
        font-weight: 950;
        border: none;
        cursor: pointer;
        transition: 0.22s ease;
        text-align: center;
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

    .secondary-btn {
        background: #ffffff;
        color: #245c2f;
        border: 1px solid #d9ead3;
    }

    .secondary-btn:hover {
        background: #eef8ec;
        transform: translateY(-2px);
    }

    .full {
        width: 100%;
    }

    .hero-stats-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 14px;
    }

    .hero-stats-grid article,
    .pending-invite-card,
    .basket-card,
    .empty-state,
    .page-error-box {
        border-radius: 28px;
        background: rgba(255, 255, 255, 0.92);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .hero-stats-grid article {
        padding: 20px;
    }

    .hero-stats-grid span {
        display: inline-flex;
        width: 46px;
        height: 46px;
        align-items: center;
        justify-content: center;
        border-radius: 17px;
        background: #eef8ec;
        font-size: 22px;
        margin-bottom: 12px;
    }

    .hero-stats-grid strong {
        display: block;
        color: #245c2f;
        font-size: 30px;
        line-height: 1;
        margin-bottom: 6px;
    }

    .hero-stats-grid p {
        margin: 0;
        color: #647064;
        font-weight: 850;
    }

    .consumer-neighborhood-content {
        padding-top: 14px;
    }

    .page-error-box {
        display: flex;
        gap: 14px;
        align-items: flex-start;
        padding: 18px;
        margin-bottom: 20px;
        border-color: #ffdada;
        background: #fff7f7;
        color: #9b3434;
    }

    .page-error-box > span {
        font-size: 24px;
        flex: 0 0 auto;
    }

    .page-error-box strong {
        display: block;
        margin-bottom: 6px;
    }

    .page-error-box p {
        margin: 0;
        line-height: 1.55;
    }

    .pending-invites-section,
    .my-baskets-section {
        margin-top: 22px;
    }

    .section-heading {
        display: flex;
        align-items: flex-end;
        justify-content: space-between;
        gap: 18px;
        margin-bottom: 18px;
    }

    .section-heading span {
        display: block;
        color: #3f8f46;
        font-size: 13px;
        font-weight: 950;
        letter-spacing: 0.08em;
        text-transform: uppercase;
        margin-bottom: 6px;
    }

    .section-heading h2 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(26px, 4vw, 38px);
        line-height: 1.13;
        letter-spacing: -0.04em;
    }

    .section-heading > strong {
        display: inline-flex;
        padding: 9px 14px;
        border-radius: 999px;
        background: #eef8ec;
        color: #245c2f;
        font-size: 13px;
        font-weight: 950;
        white-space: nowrap;
    }

    .pending-invite-grid,
    .basket-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(310px, 1fr));
        gap: 18px;
    }

    .pending-invite-card,
    .basket-card {
        display: flex;
        flex-direction: column;
        gap: 16px;
        padding: 22px;
    }

    .card-top {
        display: flex;
        align-items: flex-start;
        gap: 14px;
    }

    .card-icon {
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

    .card-top h3 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 22px;
        line-height: 1.2;
    }

    .card-top p {
        margin: 0;
        color: #647064;
        line-height: 1.55;
    }

    .basket-card-header {
        display: grid;
        gap: 12px;
    }

    .badge-row {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .role-badge,
    .status-badge {
        display: inline-flex;
        padding: 7px 11px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 950;
    }

    .role-badge {
        background: #eef8ec;
        color: #245c2f;
    }

    .status-open {
        background: #e8f1ff;
        color: #1f4e8c;
    }

    .status-ready {
        background: #fff5d6;
        color: #8a6200;
    }

    .status-ordered {
        background: #e7f7e8;
        color: #236b2c;
    }

    .status-cancelled,
    .status-expired {
        background: #fff1f1;
        color: #9b3434;
    }

    .mini-info-list,
    .basket-info-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 10px;
    }

    .mini-info-list div,
    .basket-info-grid div,
    .basket-product-box {
        padding: 13px;
        border-radius: 17px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .mini-info-list span,
    .basket-info-grid span,
    .basket-product-box span,
    .progress-box span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 950;
        margin-bottom: 5px;
        letter-spacing: 0.04em;
        text-transform: uppercase;
    }

    .mini-info-list strong,
    .basket-info-grid strong,
    .basket-product-box strong,
    .progress-box strong {
        display: block;
        color: #245c2f;
        font-size: 15px;
    }

    .progress-box {
        display: grid;
        gap: 9px;
    }

    .progress-bar {
        width: 100%;
        height: 13px;
        border-radius: 999px;
        background: #dcefd7;
        overflow: hidden;
    }

    .progress-bar span {
        display: block;
        height: 100%;
        border-radius: inherit;
        background: linear-gradient(90deg, #3f8f46, #8bcf83);
    }

    .progress-box small {
        color: #647064;
        font-weight: 750;
    }

    .ready-alert {
        display: flex;
        gap: 12px;
        align-items: flex-start;
        padding: 14px;
        border-radius: 18px;
        background: #fff5d6;
        border: 1px solid #f3df99;
        color: #745200;
    }

    .ready-alert span {
        flex: 0 0 auto;
        font-size: 22px;
    }

    .ready-alert p {
        margin: 0;
        line-height: 1.55;
        font-weight: 850;
    }

    .basket-actions {
        margin-top: auto;
    }

    .empty-state {
        max-width: 760px;
        margin: 0 auto;
        padding: 34px 24px;
        text-align: center;
    }

    .empty-state > span {
        font-size: 44px;
    }

    .empty-state h3 {
        margin: 12px 0 8px;
        color: #245c2f;
        font-size: 26px;
    }

    .empty-state p {
        max-width: 560px;
        margin: 0 auto 18px;
        color: #647064;
        line-height: 1.65;
    }

    @media (max-width: 980px) {
        .consumer-neighborhood-hero-inner {
            grid-template-columns: 1fr;
        }

        .hero-stats-grid {
            grid-template-columns: repeat(4, minmax(0, 1fr));
        }
    }

    @media (max-width: 760px) {
        .hero-stats-grid,
        .pending-invite-grid,
        .basket-grid {
            grid-template-columns: 1fr;
        }

        .section-heading {
            align-items: flex-start;
            flex-direction: column;
        }

        .hero-actions {
            align-items: stretch;
            flex-direction: column;
        }

        .primary-btn,
        .secondary-btn {
            width: 100%;
        }

        .pending-invite-card,
        .basket-card,
        .empty-state {
            padding: 20px;
            border-radius: 22px;
        }
    }

    @media (max-width: 560px) {
        .mini-info-list,
        .basket-info-grid {
            grid-template-columns: 1fr;
        }

        .hero-copy h1 {
            font-size: clamp(30px, 9vw, 42px);
        }

        .hero-copy p {
            font-size: 16px;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>
