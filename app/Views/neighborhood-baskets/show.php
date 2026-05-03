<?php

$user = currentUser();
$userRole = $user['role'] ?? null;
$currentUserId = $user ? (int) currentUserId() : 0;

$basketId = (int) ($_GET['id'] ?? $_GET['basket_id'] ?? 0);

$basket = null;
$members = [];
$invitations = [];
$errorMessage = null;
$userCanView = false;
$userIsCreator = false;
$userIsProducer = false;
$userIsMember = false;
$userIsInvited = false;

if ($basketId <= 0) {
    $errorMessage = 'Geçerli bir Mahalle Sepeti bulunamadı.';
} else {
    try {
        $basketStatement = db()->prepare("
            SELECT
                nb.*,

                p.title AS product_title,
                p.price AS product_price,
                p.stock_quantity,

                producer.full_name AS producer_full_name,
                producer.email AS producer_email,
                COALESCE(pp.store_name, producer.full_name) AS producer_name,

                creator.full_name AS creator_name,
                creator.email AS creator_email,

                pr.name AS province_name,
                d.name AS district_name,
                n.name AS neighborhood_name,

                nbo.title AS offer_title,
                nbo.description AS offer_description
            FROM neighborhood_baskets nb
            INNER JOIN products p ON p.id = nb.product_id
            INNER JOIN users producer ON producer.id = nb.producer_id
            INNER JOIN users creator ON creator.id = nb.creator_user_id
            LEFT JOIN producer_profiles pp ON pp.user_id = producer.id
            LEFT JOIN provinces pr ON pr.id = nb.province_id
            LEFT JOIN districts d ON d.id = nb.district_id
            LEFT JOIN neighborhoods n ON n.id = nb.neighborhood_id
            LEFT JOIN neighborhood_basket_offers nbo ON nbo.id = nb.offer_id
            WHERE nb.id = :id
            LIMIT 1
        ");

        $basketStatement->execute([
            'id' => $basketId,
        ]);

        $basket = $basketStatement->fetch(PDO::FETCH_ASSOC) ?: null;

        if (!$basket) {
            $errorMessage = 'Bu Mahalle Sepeti bulunamadı.';
        } else {
            $memberStatement = db()->prepare("
                SELECT
                    nbm.id,
                    nbm.basket_id,
                    nbm.user_id,
                    nbm.quantity,
                    nbm.status,
                    nbm.created_at,
                    nbm.updated_at,
                    u.full_name,
                    u.email
                FROM neighborhood_basket_members nbm
                INNER JOIN users u ON u.id = nbm.user_id
                WHERE nbm.basket_id = :basket_id
                ORDER BY nbm.created_at ASC
            ");

            $memberStatement->execute([
                'basket_id' => $basketId,
            ]);

            $members = $memberStatement->fetchAll(PDO::FETCH_ASSOC);

            $invitationStatement = db()->prepare("
                SELECT
                    nbi.id,
                    nbi.basket_id,
                    nbi.invited_email,
                    nbi.invited_user_id,
                    nbi.invited_by_user_id,
                    nbi.token,
                    nbi.status,
                    nbi.accepted_at,
                    nbi.expires_at,
                    nbi.created_at,
                    u.full_name AS invited_user_name
                FROM neighborhood_basket_invitations nbi
                LEFT JOIN users u ON u.id = nbi.invited_user_id
                WHERE nbi.basket_id = :basket_id
                ORDER BY nbi.created_at ASC
            ");

            $invitationStatement->execute([
                'basket_id' => $basketId,
            ]);

            $invitations = $invitationStatement->fetchAll(PDO::FETCH_ASSOC);

            if ($user) {
                $userIsCreator = (int) $basket['creator_user_id'] === $currentUserId;
                $userIsProducer = ($userRole === ROLE_PRODUCER) && ((int) $basket['producer_id'] === $currentUserId);

                foreach ($members as $member) {
                    if ((int) $member['user_id'] === $currentUserId) {
                        $userIsMember = true;
                        break;
                    }
                }

                $currentUserEmail = strtolower((string) ($user['email'] ?? ''));

                foreach ($invitations as $invitation) {
                    $invitedUserId = (int) ($invitation['invited_user_id'] ?? 0);
                    $invitedEmail = strtolower((string) ($invitation['invited_email'] ?? ''));

                    if ($invitedUserId === $currentUserId || ($currentUserEmail !== '' && $currentUserEmail === $invitedEmail)) {
                        $userIsInvited = true;
                        break;
                    }
                }
            }

            $userCanView = ($basket['visibility'] ?? 'private') === 'public'
                || $userIsCreator
                || $userIsProducer
                || $userIsMember
                || $userIsInvited;
        }
    } catch (Throwable $e) {
        $errorMessage = 'Mahalle Sepeti bilgileri alınırken hata oluştu: ' . $e->getMessage();
    }
}

$targetQuantity = $basket ? (float) ($basket['target_quantity'] ?? 0) : 0;
$currentQuantity = $basket ? (float) ($basket['current_quantity'] ?? 0) : 0;
$unitType = $basket['unit_type'] ?? 'kg';

$progressPercent = $targetQuantity > 0
    ? min(100, round(($currentQuantity / $targetQuantity) * 100))
    : 0;

$unitPrice = $basket ? (float) ($basket['unit_price_snapshot'] ?? $basket['product_price'] ?? 0) : 0;
$discountedUnitPrice = $basket ? (float) ($basket['discounted_unit_price_snapshot'] ?? $unitPrice) : 0;
$discountPercent = $basket ? (float) ($basket['discount_percent_snapshot'] ?? 0) : 0;

$totalEstimatedAmount = 0.00;

foreach ($members as $member) {
    if (($member['status'] ?? '') === 'active') {
        $totalEstimatedAmount += ((float) $member['quantity']) * $discountedUnitPrice;
    }
}

$statusLabels = [
    'open' => 'Katılıma açık',
    'ready_to_order' => 'Siparişe hazır',
    'ordered' => 'Sipariş oluşturuldu',
    'cancelled' => 'İptal edildi',
    'expired' => 'Süresi doldu',
];

$statusClass = $basket ? 'status-' . ($basket['status'] ?? 'open') : 'status-open';

$locationParts = [];

if (!empty($basket['province_name'])) {
    $locationParts[] = $basket['province_name'];
}

if (!empty($basket['district_name'])) {
    $locationParts[] = $basket['district_name'];
}

if (!empty($basket['neighborhood_name'])) {
    $locationParts[] = $basket['neighborhood_name'];
}

$locationText = $locationParts ? implode(' / ', $locationParts) : 'Konum belirtilmemiş';

$canApproveOrder = $basket
    && $userIsCreator
    && ($basket['status'] ?? '') === 'ready_to_order'
    && empty($basket['order_id']);

?>

<main class="neighborhood-show-page">

    <section class="show-hero">
        <div class="container show-container">

            <a class="show-back-link" href="<?= e(url('neighborhood-baskets.php')) ?>">
                ← Mahalle Sepeti sayfasına dön
            </a>

            <?php if ($errorMessage): ?>

                <div class="show-warning-card">
                    <span>⚠️</span>
                    <h1>Sepet bulunamadı</h1>
                    <p><?= e($errorMessage) ?></p>

                    <a class="show-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Mahalle Sepeti sayfasına dön
                    </a>
                </div>

            <?php elseif (!$user): ?>

                <div class="show-warning-card">
                    <span>🔐</span>
                    <h1>Giriş yapmalısın</h1>
                    <p>
                        Bu Mahalle Sepeti detayını görmek için önce giriş yapmalısın.
                    </p>

                    <a class="show-primary-btn" href="<?= e(url('login.php')) ?>">
                        Giriş Yap
                    </a>
                </div>

            <?php elseif (!$userCanView): ?>

                <div class="show-warning-card">
                    <span>🔒</span>
                    <h1>Bu sepeti görüntüleyemezsin</h1>
                    <p>
                        Bu Mahalle Sepeti özel olarak oluşturulmuş. Sadece sepet sahibi,
                        katılımcılar, davetliler ve ilgili üretici görebilir.
                    </p>

                    <a class="show-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Geri Dön
                    </a>
                </div>

            <?php else: ?>

                <div class="show-layout">

                    <section class="show-main">

                        <div class="show-title-card">
                            <div class="show-title-top">
                                <span class="show-mini-title">Mahalle Sepeti Detayı</span>

                                <span class="basket-status <?= e($statusClass) ?>">
                                    <?= e($statusLabels[$basket['status']] ?? $basket['status']) ?>
                                </span>
                            </div>

                            <h1><?= e($basket['title']) ?></h1>

                            <p>
                                <?= e($basket['producer_name'] ?? 'Üretici') ?>
                                ·
                                <?= e($locationText) ?>
                            </p>

                            <?php if (!empty($basket['creator_note'])): ?>
                                <div class="creator-note">
                                    <span>Sepet notu</span>
                                    <p><?= e($basket['creator_note']) ?></p>
                                </div>
                            <?php endif; ?>
                        </div>

                        <div class="progress-card">
                            <div class="progress-head">
                                <div>
                                    <span>Toplanan miktar</span>
                                    <strong>
                                        <?= e(number_format($currentQuantity, 2, ',', '.')) ?>
                                        /
                                        <?= e(number_format($targetQuantity, 2, ',', '.')) ?>
                                        <?= e($unitType) ?>
                                    </strong>
                                </div>

                                <div class="progress-percent">
                                    %<?= e((string) $progressPercent) ?>
                                </div>
                            </div>

                            <div class="progress-bar">
                                <span style="width: <?= e((string) $progressPercent) ?>%;"></span>
                            </div>

                            <?php if (($basket['status'] ?? '') === 'ready_to_order'): ?>
                                <p class="progress-message success">
                                    Hedef miktara ulaşıldı. Sepet toplu sipariş onayına hazır.
                                </p>
                            <?php elseif (($basket['status'] ?? '') === 'open'): ?>
                                <p class="progress-message">
                                    Hedef miktara ulaşmak için
                                    <strong>
                                        <?= e(number_format(max(0, $targetQuantity - $currentQuantity), 2, ',', '.')) ?>
                                        <?= e($unitType) ?>
                                    </strong>
                                    daha gerekiyor.
                                </p>
                            <?php else: ?>
                                <p class="progress-message">
                                    Bu sepetin mevcut durumu:
                                    <strong><?= e($statusLabels[$basket['status']] ?? $basket['status']) ?></strong>
                                </p>
                            <?php endif; ?>
                        </div>

                        <div class="info-grid">
                            <article>
                                <span>Ürün</span>
                                <strong><?= e($basket['product_title']) ?></strong>
                            </article>

                            <article>
                                <span>Üretici</span>
                                <strong><?= e($basket['producer_name'] ?? 'Üretici') ?></strong>
                            </article>

                            <article>
                                <span>Sepeti oluşturan</span>
                                <strong><?= e($basket['creator_name'] ?? 'Kullanıcı') ?></strong>
                            </article>

                            <article>
                                <span>Sepet türü</span>
                                <strong>
                                    <?= ($basket['basket_type'] ?? 'group') === 'individual' ? 'Bireysel toplu alım' : 'Grup Mahalle Sepeti' ?>
                                </strong>
                            </article>

                            <article>
                                <span>Normal fiyat</span>
                                <strong>
                                    <?= e(number_format($unitPrice, 2, ',', '.')) ?> TL /
                                    <?= e($unitType) ?>
                                </strong>
                            </article>

                            <article>
                                <span>İndirim</span>
                                <strong>%<?= e(number_format($discountPercent, 2, ',', '.')) ?></strong>
                            </article>

                            <article>
                                <span>İndirimli fiyat</span>
                                <strong>
                                    <?= e(number_format($discountedUnitPrice, 2, ',', '.')) ?> TL /
                                    <?= e($unitType) ?>
                                </strong>
                            </article>

                            <article>
                                <span>Tahmini toplam</span>
                                <strong>
                                    <?= e(number_format($totalEstimatedAmount, 2, ',', '.')) ?> TL
                                </strong>
                            </article>
                        </div>

                        <section class="members-card">
                            <div class="section-title-row">
                                <div>
                                    <span>Katılımcılar</span>
                                    <h2>Kim kaç <?= e($unitType) ?> almak istiyor?</h2>
                                </div>

                                <strong>
                                    <?= e((string) count(array_filter($members, fn ($m) => ($m['status'] ?? '') === 'active'))) ?>
                                    kişi
                                </strong>
                            </div>

                            <?php if (!$members): ?>
                                <div class="empty-box">
                                    <span>👥</span>
                                    <p>Henüz katılımcı yok.</p>
                                </div>
                            <?php else: ?>
                                <div class="member-table">
                                    <div class="member-row member-row-head">
                                        <span>Katılımcı</span>
                                        <span>Miktar</span>
                                        <span>Durum</span>
                                        <span>Tahmini ücret</span>
                                    </div>

                                    <?php foreach ($members as $member): ?>
                                        <?php
                                            $memberQuantity = (float) ($member['quantity'] ?? 0);
                                            $memberAmount = $memberQuantity * $discountedUnitPrice;
                                        ?>

                                        <div class="member-row">
                                            <span>
                                                <strong><?= e($member['full_name'] ?? 'Kullanıcı') ?></strong>
                                                <small><?= e($member['email'] ?? '') ?></small>
                                            </span>

                                            <span>
                                                <?= e(number_format($memberQuantity, 2, ',', '.')) ?>
                                                <?= e($unitType) ?>
                                            </span>

                                            <span>
                                                <?php if (($member['status'] ?? '') === 'active'): ?>
                                                    Aktif
                                                <?php elseif (($member['status'] ?? '') === 'paid'): ?>
                                                    Ödendi
                                                <?php else: ?>
                                                    İptal
                                                <?php endif; ?>
                                            </span>

                                            <span>
                                                <?= e(number_format($memberAmount, 2, ',', '.')) ?> TL
                                            </span>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                        </section>

                        <section class="invitations-card">
                            <div class="section-title-row">
                                <div>
                                    <span>Davetler</span>
                                    <h2>Davet edilen kişiler</h2>
                                </div>

                                <strong><?= e((string) count($invitations)) ?> davet</strong>
                            </div>

                            <?php if (!$invitations): ?>
                                <div class="empty-box">
                                    <span>📩</span>
                                    <p>Bu sepet için davet kaydı bulunmuyor.</p>
                                </div>
                            <?php else: ?>
                                <div class="invite-list">
                                    <?php foreach ($invitations as $invitation): ?>
                                        <article class="invite-item">
                                            <div>
                                                <strong>
                                                    <?= e($invitation['invited_user_name'] ?: $invitation['invited_email']) ?>
                                                </strong>

                                                <span><?= e($invitation['invited_email']) ?></span>
                                            </div>

                                            <span class="invite-status invite-status-<?= e($invitation['status']) ?>">
                                                <?php if ($invitation['status'] === 'pending'): ?>
                                                    Bekliyor
                                                <?php elseif ($invitation['status'] === 'accepted'): ?>
                                                    Kabul edildi
                                                <?php elseif ($invitation['status'] === 'declined'): ?>
                                                    Reddedildi
                                                <?php else: ?>
                                                    Süresi doldu
                                                <?php endif; ?>
                                            </span>
                                        </article>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>
                        </section>

                    </section>

                    <aside class="show-side">

                        <div class="side-card">
                            <span class="side-icon">🧺</span>

                            <h2>Sepet Özeti</h2>

                            <div class="side-list">
                                <div>
                                    <span>Hedef</span>
                                    <strong>
                                        <?= e(number_format($targetQuantity, 2, ',', '.')) ?>
                                        <?= e($unitType) ?>
                                    </strong>
                                </div>

                                <div>
                                    <span>Toplanan</span>
                                    <strong>
                                        <?= e(number_format($currentQuantity, 2, ',', '.')) ?>
                                        <?= e($unitType) ?>
                                    </strong>
                                </div>

                                <div>
                                    <span>İndirimli fiyat</span>
                                    <strong>
                                        <?= e(number_format($discountedUnitPrice, 2, ',', '.')) ?> TL
                                    </strong>
                                </div>

                                <div>
                                    <span>Tahmini toplam</span>
                                    <strong>
                                        <?= e(number_format($totalEstimatedAmount, 2, ',', '.')) ?> TL
                                    </strong>
                                </div>
                            </div>
                        </div>

                        <?php if ($userIsCreator): ?>
                            <div class="side-card">
                                <span class="side-icon">✅</span>

                                <h2>Sepet sahibi işlemleri</h2>

                                <?php if ($canApproveOrder): ?>
                                    <p>
                                        Hedef miktara ulaşıldı. Sonraki adımda bu butonu çalışır hale getirip
                                        toplu siparişi üreticiye göndereceğiz.
                                    </p>

                                    <form action="<?= e(url('neighborhood-baskets.php?action=approve-order')) ?>" method="post">
                                        <?php if (function_exists('csrf_field')): ?>
                                            <?= csrf_field() ?>
                                        <?php endif; ?>

                                        <input type="hidden" name="basket_id" value="<?= e((string) $basketId) ?>">

                                        <button class="show-primary-btn full" type="submit">
                                            Toplu Siparişi Onayla
                                        </button>
                                    </form>
                                <?php elseif (($basket['status'] ?? '') === 'open'): ?>
                                    <p>
                                        Sepet henüz hedef miktara ulaşmadı. Hedefe ulaşınca toplu sipariş onayı burada açılacak.
                                    </p>
                                <?php elseif (($basket['status'] ?? '') === 'ordered'): ?>
                                    <p>
                                        Bu Mahalle Sepeti siparişe dönüştürüldü.
                                    </p>

                                    <?php if (!empty($basket['order_id'])): ?>
                                        <a class="show-secondary-btn full" href="<?= e(url('consumer/orders.php')) ?>">
                                            Siparişlerime Git
                                        </a>
                                    <?php endif; ?>
                                <?php else: ?>
                                    <p>
                                        Bu sepet için şu anda yapılabilecek bir işlem yok.
                                    </p>
                                <?php endif; ?>
                            </div>
                        <?php endif; ?>

                        <?php if ($userIsProducer): ?>
                            <div class="side-card">
                                <span class="side-icon">🚜</span>

                                <h2>Üretici görünümü</h2>

                                <p>
                                    Bu sepet senin ürününe bağlı oluşturuldu. Sepet toplu siparişe dönüşünce
                                    üretici sipariş panelinde görünecek.
                                </p>

                                <a class="show-secondary-btn full" href="<?= e(url('producer/neighborhood-offers.php')) ?>">
                                    Toplu Alım İlanlarım
                                </a>
                            </div>
                        <?php endif; ?>

                    </aside>

                </div>

            <?php endif; ?>

        </div>
    </section>

</main>

<style>
    .neighborhood-show-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.30), transparent 34%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
        padding-bottom: 58px;
    }

    .show-hero {
        padding: 38px 0 0;
    }

    .show-container {
        max-width: 1200px;
    }

    .show-back-link {
        display: inline-flex;
        margin-bottom: 16px;
        color: #3f8f46;
        text-decoration: none;
        font-weight: 900;
    }

    .show-back-link:hover {
        color: #245c2f;
    }

    .show-layout {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 340px;
        gap: 22px;
        align-items: start;
    }

    .show-main {
        display: grid;
        gap: 18px;
    }

    .show-title-card,
    .progress-card,
    .members-card,
    .invitations-card,
    .side-card,
    .show-warning-card {
        border-radius: 30px;
        background: rgba(255, 255, 255, 0.92);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .show-title-card,
    .progress-card,
    .members-card,
    .invitations-card,
    .side-card,
    .show-warning-card {
        padding: 24px;
    }

    .show-title-top {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        flex-wrap: wrap;
        margin-bottom: 12px;
    }

    .show-mini-title {
        display: inline-flex;
        padding: 8px 15px;
        border-radius: 999px;
        background: #eef8ec;
        color: #3f8f46;
        font-size: 13px;
        font-weight: 950;
        letter-spacing: 0.06em;
        text-transform: uppercase;
    }

    .basket-status {
        display: inline-flex;
        padding: 8px 14px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 950;
    }

    .status-open {
        background: #e8f1ff;
        color: #1f4e8c;
    }

    .status-ready_to_order {
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

    .show-title-card h1 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(32px, 5vw, 52px);
        line-height: 1.07;
        letter-spacing: -0.055em;
        font-weight: 950;
    }

    .show-title-card > p {
        margin: 14px 0 0;
        color: #647064;
        font-size: 17px;
        line-height: 1.65;
    }

    .creator-note {
        margin-top: 18px;
        padding: 16px;
        border-radius: 20px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .creator-note span,
    .info-grid span,
    .side-list span,
    .section-title-row span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 950;
        margin-bottom: 5px;
        letter-spacing: 0.04em;
        text-transform: uppercase;
    }

    .creator-note p {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    .progress-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        margin-bottom: 12px;
    }

    .progress-head span {
        display: block;
        color: #7b887b;
        font-size: 13px;
        font-weight: 950;
        margin-bottom: 5px;
    }

    .progress-head strong {
        color: #245c2f;
        font-size: 24px;
    }

    .progress-percent {
        width: 64px;
        height: 64px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 22px;
        background: #eef8ec;
        color: #245c2f;
        font-size: 20px;
        font-weight: 950;
        flex: 0 0 auto;
    }

    .progress-bar {
        width: 100%;
        height: 14px;
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

    .progress-message {
        margin: 13px 0 0;
        color: #647064;
        line-height: 1.6;
        font-weight: 750;
    }

    .progress-message.success {
        color: #245c2f;
        font-weight: 900;
    }

    .info-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 12px;
    }

    .info-grid article {
        padding: 16px;
        border-radius: 20px;
        background: rgba(255, 255, 255, 0.92);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 10px 24px rgba(36, 92, 47, 0.06);
    }

    .info-grid strong {
        display: block;
        color: #245c2f;
        font-size: 15px;
    }

    .section-title-row {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        gap: 16px;
        margin-bottom: 18px;
    }

    .section-title-row h2,
    .side-card h2,
    .show-warning-card h1 {
        margin: 0;
        color: #245c2f;
        font-size: 24px;
        letter-spacing: -0.035em;
    }

    .section-title-row > strong {
        display: inline-flex;
        padding: 8px 13px;
        border-radius: 999px;
        background: #eef8ec;
        color: #245c2f;
        font-size: 13px;
        font-weight: 950;
        white-space: nowrap;
    }

    .empty-box {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 18px;
        border-radius: 20px;
        background: #f8fcf5;
        border: 1px dashed #cfe6c9;
        color: #647064;
        font-weight: 800;
    }

    .empty-box span {
        font-size: 26px;
    }

    .empty-box p {
        margin: 0;
    }

    .member-table {
        display: grid;
        gap: 9px;
    }

    .member-row {
        display: grid;
        grid-template-columns: minmax(0, 1.4fr) 0.8fr 0.7fr 0.9fr;
        gap: 12px;
        align-items: center;
        padding: 14px;
        border-radius: 18px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
        color: #526052;
        font-weight: 800;
    }

    .member-row-head {
        background: #eef8ec;
        color: #245c2f;
        font-size: 13px;
        font-weight: 950;
        text-transform: uppercase;
        letter-spacing: 0.04em;
    }

    .member-row strong {
        display: block;
        color: #245c2f;
        margin-bottom: 3px;
    }

    .member-row small {
        display: block;
        color: #7b887b;
        font-weight: 750;
    }

    .invite-list {
        display: grid;
        gap: 10px;
    }

    .invite-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 14px;
        border-radius: 18px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .invite-item strong {
        display: block;
        color: #245c2f;
        margin-bottom: 4px;
    }

    .invite-item span {
        color: #647064;
        font-weight: 800;
    }

    .invite-status {
        display: inline-flex;
        padding: 7px 11px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 950;
        white-space: nowrap;
    }

    .invite-status-pending {
        background: #fff5d6;
        color: #8a6200;
    }

    .invite-status-accepted {
        background: #e7f7e8;
        color: #236b2c;
    }

    .invite-status-declined,
    .invite-status-expired {
        background: #fff1f1;
        color: #9b3434;
    }

    .show-side {
        display: grid;
        gap: 18px;
        position: sticky;
        top: 98px;
    }

    .side-icon,
    .show-warning-card > span {
        width: 54px;
        height: 54px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 20px;
        background: #eef8ec;
        font-size: 28px;
        margin-bottom: 15px;
    }

    .side-card p,
    .show-warning-card p {
        margin: 12px 0 0;
        color: #647064;
        line-height: 1.65;
    }

    .side-list {
        display: grid;
        gap: 10px;
        margin-top: 16px;
    }

    .side-list div {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        padding: 12px 0;
        border-bottom: 1px solid #e1f0dc;
    }

    .side-list div:last-child {
        border-bottom: 0;
    }

    .side-list strong {
        color: #245c2f;
        text-align: right;
    }

    .show-primary-btn,
    .show-secondary-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 0 20px;
        border: none;
        border-radius: 999px;
        text-decoration: none;
        font-weight: 950;
        cursor: pointer;
        transition: 0.22s ease;
        margin-top: 18px;
    }

    .show-primary-btn {
        background: #245c2f;
        color: #ffffff;
        box-shadow: 0 14px 28px rgba(36, 92, 47, 0.22);
    }

    .show-primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .show-secondary-btn {
        background: #eef8ec;
        color: #245c2f;
        border: 1px solid #d9ead3;
    }

    .show-secondary-btn:hover {
        background: #dff1dc;
        transform: translateY(-2px);
    }

    .full {
        width: 100%;
    }

    .show-warning-card {
        max-width: 760px;
        margin: 0 auto;
        text-align: center;
    }

    .show-warning-card > span {
        margin-left: auto;
        margin-right: auto;
    }

    @media (max-width: 1080px) {
        .show-layout {
            grid-template-columns: 1fr;
        }

        .show-side {
            position: static;
        }

        .info-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 760px) {
        .show-title-card,
        .progress-card,
        .members-card,
        .invitations-card,
        .side-card,
        .show-warning-card {
            padding: 20px;
            border-radius: 22px;
        }

        .progress-head,
        .section-title-row,
        .invite-item {
            align-items: flex-start;
            flex-direction: column;
        }

        .info-grid,
        .member-row {
            grid-template-columns: 1fr;
        }

        .member-row-head {
            display: none;
        }

        .show-title-card h1 {
            font-size: clamp(30px, 9vw, 42px);
        }
    }
</style>