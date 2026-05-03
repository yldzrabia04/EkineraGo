<?php

$user = currentUser();
$userRole = $user['role'] ?? null;
$isConsumer = $user && $userRole === ROLE_CONSUMER;

$token = trim((string) ($_GET['token'] ?? ''));

$invitation = null;
$members = [];
$errorMessage = null;
$userCanAccept = false;
$alreadyAcceptedByCurrentUser = false;
$estimatedUnitPrice = 0.00;

if ($token === '') {
    $errorMessage = 'Davet bağlantısı geçersiz veya eksik.';
} else {
    try {
        $invitationStatement = db()->prepare("
            SELECT
                nbi.id AS invitation_id,
                nbi.basket_id,
                nbi.invited_email,
                nbi.invited_user_id,
                nbi.invited_by_user_id,
                nbi.token,
                nbi.status AS invitation_status,
                nbi.accepted_at,
                nbi.expires_at AS invitation_expires_at,

                nb.title AS basket_title,
                nb.creator_user_id,
                nb.target_quantity,
                nb.current_quantity,
                nb.unit_type,
                nb.status AS basket_status,
                nb.basket_type,
                nb.visibility,
                nb.creator_note,
                nb.discount_percent_snapshot,
                nb.unit_price_snapshot,
                nb.discounted_unit_price_snapshot,
                nb.expires_at AS basket_expires_at,

                p.title AS product_title,
                p.price AS product_price,

                producer.full_name AS producer_full_name,
                COALESCE(pp.store_name, producer.full_name) AS producer_name,

                creator.full_name AS creator_name,

                pr.name AS province_name,
                d.name AS district_name
            FROM neighborhood_basket_invitations nbi
            INNER JOIN neighborhood_baskets nb ON nb.id = nbi.basket_id
            INNER JOIN products p ON p.id = nb.product_id
            INNER JOIN users producer ON producer.id = nb.producer_id
            INNER JOIN users creator ON creator.id = nb.creator_user_id
            LEFT JOIN producer_profiles pp ON pp.user_id = producer.id
            LEFT JOIN provinces pr ON pr.id = nb.province_id
            LEFT JOIN districts d ON d.id = nb.district_id
            WHERE nbi.token = :token
            LIMIT 1
        ");

        $invitationStatement->execute([
            'token' => $token,
        ]);

        $invitation = $invitationStatement->fetch(PDO::FETCH_ASSOC) ?: null;

        if (!$invitation) {
            $errorMessage = 'Bu davet bulunamadı.';
        } else {
            $estimatedUnitPrice = (float) ($invitation['discounted_unit_price_snapshot'] ?? 0);

            $memberStatement = db()->prepare("
                SELECT
                    nbm.user_id,
                    nbm.quantity,
                    nbm.status,
                    u.full_name
                FROM neighborhood_basket_members nbm
                INNER JOIN users u ON u.id = nbm.user_id
                WHERE nbm.basket_id = :basket_id
                  AND nbm.status = 'active'
                ORDER BY nbm.created_at ASC
            ");

            $memberStatement->execute([
                'basket_id' => (int) $invitation['basket_id'],
            ]);

            $members = $memberStatement->fetchAll(PDO::FETCH_ASSOC);

            if ($user && $isConsumer) {
                $currentUserId = (int) currentUserId();
                $currentUserEmail = strtolower((string) ($user['email'] ?? ''));
                $invitedEmail = strtolower((string) ($invitation['invited_email'] ?? ''));
                $invitedUserId = (int) ($invitation['invited_user_id'] ?? 0);

                foreach ($members as $member) {
                    if ((int) $member['user_id'] === $currentUserId) {
                        $alreadyAcceptedByCurrentUser = true;
                        break;
                    }
                }

                if ($invitation['invitation_status'] === 'pending') {
                    if ($invitedUserId > 0 && $invitedUserId === $currentUserId) {
                        $userCanAccept = true;
                    }

                    if ($invitedUserId <= 0 && $currentUserEmail === $invitedEmail) {
                        $userCanAccept = true;
                    }
                }
            }
        }
    } catch (Throwable $e) {
        $errorMessage = 'Davet bilgileri alınırken hata oluştu: ' . $e->getMessage();
    }
}

$targetQuantity = $invitation ? (float) ($invitation['target_quantity'] ?? 0) : 0;
$currentQuantity = $invitation ? (float) ($invitation['current_quantity'] ?? 0) : 0;
$progressPercent = $targetQuantity > 0
    ? min(100, round(($currentQuantity / $targetQuantity) * 100))
    : 0;

$normalUnitPrice = $invitation ? (float) ($invitation['unit_price_snapshot'] ?? 0) : 0;
$discountPercent = $invitation ? (float) ($invitation['discount_percent_snapshot'] ?? 0) : 0;
$unitType = $invitation['unit_type'] ?? 'kg';

$isExpired = false;

if ($invitation && !empty($invitation['invitation_expires_at'])) {
    $isExpired = strtotime((string) $invitation['invitation_expires_at']) < time();
}

$basketIsClosed = $invitation && in_array($invitation['basket_status'], ['ordered', 'cancelled', 'expired'], true);

?>

<main class="invite-page">

    <section class="invite-hero">
        <div class="container invite-container">

            <a class="invite-back-link" href="<?= e(url('neighborhood-baskets.php')) ?>">
                ← Mahalle Sepeti sayfasına dön
            </a>

            <?php if ($errorMessage): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">⚠️</span>
                    <h1>Davet bulunamadı</h1>
                    <p><?= e($errorMessage) ?></p>

                    <a class="invite-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Mahalle Sepeti sayfasına dön
                    </a>
                </div>

            <?php elseif (!$user): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">🔐</span>
                    <h1>Giriş yapmalısın</h1>
                    <p>
                        Bu Mahalle Sepeti davetini kabul etmek için önce davet edilen e-posta
                        adresinle giriş yapmalısın.
                    </p>

                    <a class="invite-primary-btn" href="<?= e(url('login.php')) ?>">
                        Giriş Yap
                    </a>
                </div>

            <?php elseif (!$isConsumer): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">👤</span>
                    <h1>Sadece tüketiciler katılabilir</h1>
                    <p>
                        Mahalle Sepeti davetleri tüketici hesapları içindir. Üretici hesabıyla bu sepete katılamazsın.
                    </p>

                    <a class="invite-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Geri Dön
                    </a>
                </div>

            <?php elseif ($isExpired): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">⏰</span>
                    <h1>Davetin süresi dolmuş</h1>
                    <p>
                        Bu davet artık kabul edilemiyor. Yeni davet için sepeti oluşturan kişiyle iletişime geçmelisin.
                    </p>

                    <a class="invite-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Mahalle Sepeti sayfasına dön
                    </a>
                </div>

            <?php elseif ($basketIsClosed): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">📦</span>
                    <h1>Bu sepet artık kapalı</h1>
                    <p>
                        Bu Mahalle Sepeti siparişe dönüşmüş, iptal edilmiş veya süresi dolmuş olabilir.
                    </p>

                    <a class="invite-primary-btn" href="<?= e(url('neighborhood-baskets.php')) ?>">
                        Mahalle Sepeti sayfasına dön
                    </a>
                </div>

            <?php elseif (!$userCanAccept && !$alreadyAcceptedByCurrentUser): ?>

                <div class="invite-warning-card">
                    <span class="warning-icon">📩</span>
                    <h1>Bu davet sana ait değil</h1>
                    <p>
                        Bu davet, <strong><?= e($invitation['invited_email'] ?? '') ?></strong>
                        e-posta adresine gönderilmiş. Lütfen o hesapla giriş yap.
                    </p>

                    <a class="invite-primary-btn" href="<?= e(url('logout.php')) ?>">
                        Farklı hesapla giriş yap
                    </a>
                </div>

            <?php else: ?>

                <div class="invite-layout">

                    <section class="invite-main-card">
                        <span class="invite-mini-title">Mahalle Sepeti Daveti</span>

                        <h1>
                            <?= e($invitation['creator_name'] ?? 'Bir kullanıcı') ?>
                            seni bu sepete davet etti
                        </h1>

                        <p class="invite-description">
                            Bu sepete katılırsan almak istediğin miktarı girersin.
                            Toplam miktar üreticinin minimum hedefini geçerse sepet toplu siparişe hazır olur.
                        </p>

                        <div class="basket-summary-box">
                            <div class="basket-summary-top">
                                <span class="basket-icon">🧺</span>

                                <div>
                                    <h2><?= e($invitation['basket_title']) ?></h2>
                                    <p>
                                        <?= e($invitation['producer_name'] ?? 'Üretici') ?>
                                        ·
                                        <?= e($invitation['province_name'] ?? 'Konum yok') ?>
                                        <?php if (!empty($invitation['district_name'])): ?>
                                            / <?= e($invitation['district_name']) ?>
                                        <?php endif; ?>
                                    </p>
                                </div>
                            </div>

                            <?php if (!empty($invitation['creator_note'])): ?>
                                <p class="basket-note">
                                    <?= e($invitation['creator_note']) ?>
                                </p>
                            <?php endif; ?>

                            <div class="progress-info">
                                <span>Toplanan miktar</span>
                                <strong>
                                    <?= e(number_format($currentQuantity, 2, ',', '.')) ?>
                                    /
                                    <?= e(number_format($targetQuantity, 2, ',', '.')) ?>
                                    <?= e($unitType) ?>
                                </strong>
                            </div>

                            <div class="progress-bar">
                                <span style="width: <?= e((string) $progressPercent) ?>%;"></span>
                            </div>

                            <small class="progress-help">
                                Hedefin %<?= e((string) $progressPercent) ?> kadarı tamamlandı.
                            </small>
                        </div>

                        <div class="info-grid">
                            <div>
                                <span>Ürün</span>
                                <strong><?= e($invitation['product_title']) ?></strong>
                            </div>

                            <div>
                                <span>Minimum hedef</span>
                                <strong>
                                    <?= e(number_format($targetQuantity, 2, ',', '.')) ?>
                                    <?= e($unitType) ?>
                                </strong>
                            </div>

                            <div>
                                <span>İndirim</span>
                                <strong>%<?= e(number_format($discountPercent, 2, ',', '.')) ?></strong>
                            </div>

                            <div>
                                <span>Normal fiyat</span>
                                <strong>
                                    <?= e(number_format($normalUnitPrice, 2, ',', '.')) ?> TL /
                                    <?= e($unitType) ?>
                                </strong>
                            </div>

                            <div>
                                <span>İndirimli fiyat</span>
                                <strong>
                                    <?= e(number_format($estimatedUnitPrice, 2, ',', '.')) ?> TL /
                                    <?= e($unitType) ?>
                                </strong>
                            </div>

                            <div>
                                <span>Sepet durumu</span>
                                <strong>
                                    <?php if ($invitation['basket_status'] === 'ready_to_order'): ?>
                                        Siparişe hazır
                                    <?php elseif ($invitation['basket_status'] === 'open'): ?>
                                        Katılıma açık
                                    <?php else: ?>
                                        <?= e($invitation['basket_status']) ?>
                                    <?php endif; ?>
                                </strong>
                            </div>
                        </div>

                        <?php if ($alreadyAcceptedByCurrentUser): ?>

                            <div class="already-joined-box">
                                <span>✅</span>
                                <div>
                                    <h2>Bu sepete zaten katıldın</h2>
                                    <p>
                                        Katılımın sisteme kaydedildi. Sepet hedef miktara ulaştığında
                                        sepeti oluşturan kişi toplu siparişi onaylayabilecek.
                                    </p>
                                </div>
                            </div>

                        <?php else: ?>

                            <form
                                class="join-form"
                                action="<?= e(url('neighborhood-baskets.php?action=join')) ?>"
                                method="post"
                            >
                                <?php if (function_exists('csrf_field')): ?>
                                    <?= csrf_field() ?>
                                <?php endif; ?>

                                <input type="hidden" name="token" value="<?= e($token) ?>">

                                <div class="join-form-heading">
                                    <h2>Kaç <?= e($unitType) ?> almak istiyorsun?</h2>
                                    <p>
                                        Girdiğin miktara göre tahmini ücretin hesaplanacak.
                                    </p>
                                </div>

                                <div class="join-input-row">
                                    <div class="join-field">
                                        <label for="quantity">Talep miktarın</label>
                                        <input
                                            type="number"
                                            id="quantity"
                                            name="quantity"
                                            min="1"
                                            step="0.01"
                                            placeholder="Örn: 10"
                                            data-unit-price="<?= e((string) $estimatedUnitPrice) ?>"
                                            required
                                        >
                                    </div>

                                    <div class="estimated-box">
                                        <span>Tahmini ücret</span>
                                        <strong data-estimated-total>0,00 TL</strong>
                                    </div>
                                </div>

                                <button class="invite-primary-btn" type="submit">
                                    Sepete Katıl
                                </button>
                            </form>

                        <?php endif; ?>
                    </section>

                    <aside class="invite-side-card">
                        <span class="side-icon">👥</span>

                        <h2>Katılımcılar</h2>

                        <?php if (!$members): ?>
                            <p class="side-muted">
                                Henüz katılımcı yok.
                            </p>
                        <?php else: ?>
                            <div class="member-list">
                                <?php foreach ($members as $member): ?>
                                    <?php
                                        $memberQuantity = (float) ($member['quantity'] ?? 0);
                                        $memberTotal = $memberQuantity * $estimatedUnitPrice;
                                    ?>

                                    <div class="member-item">
                                        <div>
                                            <strong><?= e($member['full_name']) ?></strong>
                                            <span>
                                                <?= e(number_format($memberQuantity, 2, ',', '.')) ?>
                                                <?= e($unitType) ?>
                                            </span>
                                        </div>

                                        <small>
                                            <?= e(number_format($memberTotal, 2, ',', '.')) ?> TL
                                        </small>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        <?php endif; ?>

                        <div class="side-info-box">
                            <span>Bilgi</span>
                            <p>
                                Bu aşamada gerçek ödeme alınmaz. Sepet hedef miktara ulaşınca
                                sepeti oluşturan kişi toplu siparişi onaylar.
                            </p>
                        </div>
                    </aside>

                </div>

            <?php endif; ?>

        </div>
    </section>

</main>

<style>
    .invite-page {
        min-height: calc(100vh - 90px);
        background:
            radial-gradient(circle at top left, rgba(150, 210, 153, 0.30), transparent 34%),
            linear-gradient(135deg, #f8fcf5 0%, #eef8ec 100%);
        color: #263326;
        padding-bottom: 58px;
    }

    .invite-hero {
        padding: 38px 0 0;
    }

    .invite-container {
        max-width: 1180px;
    }

    .invite-back-link {
        display: inline-flex;
        margin-bottom: 16px;
        color: #3f8f46;
        text-decoration: none;
        font-weight: 900;
    }

    .invite-back-link:hover {
        color: #245c2f;
    }

    .invite-layout {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 340px;
        gap: 22px;
        align-items: start;
    }

    .invite-main-card,
    .invite-side-card,
    .invite-warning-card {
        border-radius: 30px;
        background: rgba(255, 255, 255, 0.92);
        border: 1px solid rgba(205, 229, 199, 0.95);
        box-shadow: 0 18px 45px rgba(36, 92, 47, 0.10);
    }

    .invite-main-card,
    .invite-warning-card {
        padding: 32px;
    }

    .invite-side-card {
        position: sticky;
        top: 98px;
        padding: 24px;
    }

    .invite-mini-title {
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

    .invite-main-card h1,
    .invite-warning-card h1 {
        margin: 0;
        color: #245c2f;
        font-size: clamp(30px, 5vw, 48px);
        line-height: 1.08;
        letter-spacing: -0.05em;
        font-weight: 950;
    }

    .invite-description,
    .invite-warning-card p {
        margin: 16px 0 0;
        color: #647064;
        font-size: 17px;
        line-height: 1.7;
    }

    .basket-summary-box,
    .join-form,
    .already-joined-box {
        margin-top: 22px;
        padding: 22px;
        border-radius: 26px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .basket-summary-top {
        display: flex;
        align-items: flex-start;
        gap: 14px;
        margin-bottom: 14px;
    }

    .basket-icon,
    .side-icon,
    .warning-icon {
        width: 52px;
        height: 52px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border-radius: 19px;
        background: #eef8ec;
        font-size: 27px;
        flex: 0 0 auto;
    }

    .basket-summary-top h2,
    .invite-side-card h2,
    .join-form-heading h2,
    .already-joined-box h2 {
        margin: 0 0 6px;
        color: #245c2f;
        font-size: 24px;
        letter-spacing: -0.035em;
    }

    .basket-summary-top p,
    .basket-note,
    .join-form-heading p,
    .already-joined-box p,
    .side-muted {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    .basket-note {
        margin-bottom: 14px;
    }

    .progress-info {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        margin-top: 10px;
        margin-bottom: 9px;
        color: #245c2f;
        font-weight: 900;
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

    .progress-help {
        display: block;
        margin-top: 9px;
        color: #647064;
        font-weight: 750;
    }

    .info-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        margin-top: 18px;
    }

    .info-grid div,
    .estimated-box,
    .side-info-box {
        padding: 14px;
        border-radius: 18px;
        background: #ffffff;
        border: 1px solid #edf5e9;
    }

    .info-grid span,
    .estimated-box span,
    .side-info-box span {
        display: block;
        color: #7b887b;
        font-size: 12px;
        font-weight: 950;
        margin-bottom: 5px;
    }

    .info-grid strong,
    .estimated-box strong {
        display: block;
        color: #245c2f;
        font-size: 15px;
    }

    .join-form-heading {
        margin-bottom: 16px;
    }

    .join-input-row {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 230px;
        gap: 14px;
        align-items: end;
        margin-bottom: 18px;
    }

    .join-field {
        display: grid;
        gap: 8px;
    }

    .join-field label {
        color: #245c2f;
        font-weight: 900;
        font-size: 14px;
    }

    .join-field input {
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

    .join-field input:focus {
        border-color: #78b978;
        box-shadow: 0 0 0 4px rgba(120, 185, 120, 0.18);
    }

    .invite-primary-btn {
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
    }

    .invite-primary-btn:hover {
        background: #1d4b27;
        transform: translateY(-2px);
    }

    .already-joined-box {
        display: flex;
        gap: 14px;
        align-items: flex-start;
        background: #eef8ec;
    }

    .already-joined-box > span {
        font-size: 28px;
        flex: 0 0 auto;
    }

    .invite-warning-card {
        text-align: center;
        max-width: 760px;
        margin: 0 auto;
    }

    .invite-warning-card .warning-icon {
        margin: 0 auto 16px;
    }

    .invite-warning-card .invite-primary-btn {
        margin-top: 20px;
    }

    .invite-side-card .side-icon {
        margin-bottom: 14px;
    }

    .member-list {
        display: grid;
        gap: 10px;
        margin-top: 16px;
    }

    .member-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        padding: 13px;
        border-radius: 17px;
        background: #f8fcf5;
        border: 1px solid #d9ead3;
    }

    .member-item strong {
        display: block;
        color: #245c2f;
        margin-bottom: 3px;
    }

    .member-item span,
    .member-item small {
        color: #647064;
        font-weight: 800;
    }

    .side-info-box {
        margin-top: 18px;
        background: #f8fcf5;
    }

    .side-info-box p {
        margin: 0;
        color: #647064;
        line-height: 1.6;
    }

    @media (max-width: 980px) {
        .invite-layout {
            grid-template-columns: 1fr;
        }

        .invite-side-card {
            position: static;
        }

        .info-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 680px) {
        .invite-main-card,
        .invite-side-card,
        .invite-warning-card {
            padding: 20px;
            border-radius: 22px;
        }

        .join-input-row,
        .info-grid {
            grid-template-columns: 1fr;
        }

        .invite-primary-btn {
            width: 100%;
        }

        .progress-info {
            align-items: flex-start;
            flex-direction: column;
        }
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const quantityInput = document.querySelector('[data-unit-price]');
        const estimatedTotal = document.querySelector('[data-estimated-total]');

        if (!quantityInput || !estimatedTotal) {
            return;
        }

        const unitPrice = Number(quantityInput.dataset.unitPrice || 0);

        function formatMoney(value) {
            return value.toLocaleString('tr-TR', {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            }) + ' TL';
        }

        function updateEstimatedTotal() {
            const quantity = Number(quantityInput.value || 0);
            const total = quantity * unitPrice;

            estimatedTotal.textContent = formatMoney(total);
        }

        quantityInput.addEventListener('input', updateEstimatedTotal);
        updateEstimatedTotal();
    });
</script>