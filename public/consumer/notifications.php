<?php
require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$userId = (int) currentUserId();

$pageTitle = 'Bildirimlerim';
$bodyClass = 'page-consumer-notifications';

if (!function_exists('consumer_notification_data')) {
    function consumer_notification_data(array $notification): array
    {
        $json = $notification['data_json'] ?? null;

        if (!$json) {
            return [];
        }

        if (is_array($json)) {
            return $json;
        }

        $decoded = json_decode((string) $json, true);

        return is_array($decoded) ? $decoded : [];
    }
}

if (!function_exists('consumer_notification_safe_target')) {
    function consumer_notification_safe_target(?string $target): string
    {
        $target = trim((string) $target);

        if ($target === '') {
            return 'consumer/notifications.php';
        }

        if (
            str_starts_with($target, 'http://') ||
            str_starts_with($target, 'https://') ||
            str_starts_with($target, '//') ||
            str_contains($target, '\\')
        ) {
            return 'consumer/notifications.php';
        }

        $target = ltrim($target, '/');

        return $target !== '' ? $target : 'consumer/notifications.php';
    }
}

if (!function_exists('consumer_notification_target')) {
    function consumer_notification_target(array $notification): string
    {
        $data = consumer_notification_data($notification);
        $type = (string) ($notification['type'] ?? '');

        if (!empty($data['url'])) {
            return consumer_notification_safe_target((string) $data['url']);
        }

        if (!empty($data['target'])) {
            return consumer_notification_safe_target((string) $data['target']);
        }

        if (!empty($data['product_id'])) {
            $productId = (int) $data['product_id'];

            if ($productId > 0) {
                if ($type === 'product_question_answered') {
                    return 'product-detail.php?id=' . $productId . '#questions';
                }

                if ($type === 'new_review') {
                    return 'product-detail.php?id=' . $productId . '#reviews';
                }

                return 'product-detail.php?id=' . $productId;
            }
        }

        if (!empty($data['basket_id']) || !empty($data['neighborhood_basket_id']) || str_contains($type, 'neighborhood')) {
            if (!empty($data['basket_id'])) {
                return 'neighborhood-baskets.php?action=show&id=' . (int) $data['basket_id'];
            }
            if (!empty($data['neighborhood_basket_id'])) {
                return 'neighborhood-baskets.php?action=show&id=' . (int) $data['neighborhood_basket_id'];
            }
            return 'consumer/neighborhood-baskets.php';
        }

        if (!empty($data['order_id']) || !empty($data['order_no']) || str_contains($type, 'order')) {
            return 'consumer/orders.php';
        }

        if (!empty($data['producer_id'])) {
            return 'producer-detail.php?id=' . (int) $data['producer_id'];
        }

        if (str_contains($type, 'wallet') || str_contains($type, 'payment') || str_contains($type, 'balance')) {
            return 'consumer/wallet.php';
        }

        if (str_contains($type, 'favorite')) {
            return 'consumer/favorites.php';
        }

        if (str_contains($type, 'demand')) {
            return 'consumer/demands.php';
        }

        return 'consumer/notifications.php';
    }
}

if (!function_exists('consumer_notification_date')) {
    function consumer_notification_date(?string $date): string
    {
        if (!$date) {
            return '-';
        }

        $timestamp = strtotime($date);

        if (!$timestamp) {
            return $date;
        }

        return date('d.m.Y H:i', $timestamp);
    }
}

if (!function_exists('consumer_notification_type_label')) {
    function consumer_notification_type_label(string $type): string
    {
        return match ($type) {
            'order_status_changed' => 'Sipariş güncellemesi',
            'product_question_answered' => 'Soru cevabı',
            'new_review' => 'Yorum bildirimi',
            'wallet_updated' => 'Bakiye hareketi',
            'payment_received' => 'Ödeme bildirimi',
            'neighborhood_basket' => 'Mahalle Sepeti',
            'system' => 'Sistem bildirimi',
            default => 'Bildirim',
        };
    }
}

if (!function_exists('consumer_notification_icon')) {
    function consumer_notification_icon(string $type): string
    {
        if (str_contains($type, 'order')) {
            return '📦';
        }

        if (str_contains($type, 'payment') || str_contains($type, 'wallet') || str_contains($type, 'balance')) {
            return '💳';
        }

        if (str_contains($type, 'question')) {
            return '💬';
        }

        if (str_contains($type, 'review')) {
            return '⭐';
        }

        if (str_contains($type, 'neighborhood')) {
            return '🧺';
        }

        if (str_contains($type, 'favorite')) {
            return '♥';
        }

        return '🔔';
    }
}

if (is_post()) {
    require_csrf();

    $action = $_POST['_action'] ?? '';

    if ($action === 'open') {
        $notificationId = (int) ($_POST['notification_id'] ?? 0);
        $target = consumer_notification_safe_target($_POST['target'] ?? 'consumer/notifications.php');

        if ($notificationId > 0) {
            try {
                Notification::markAsRead($userId, $notificationId);
            } catch (Throwable $e) {
                flash_error('Bildirim açılırken bir hata oluştu.');
                redirect('consumer/notifications.php');
            }
        }

        redirect($target);
    }

    if ($action === 'read') {
        $notificationId = (int) ($_POST['notification_id'] ?? 0);

        if ($notificationId <= 0) {
            flash_error('Geçerli bir bildirim bulunamadı.');
            redirect('consumer/notifications.php');
        }

        try {
            Notification::markAsRead($userId, $notificationId);
            flash_success('Bildirim okundu olarak işaretlendi.');
        } catch (Throwable $e) {
            flash_error('Bildirim güncellenirken bir hata oluştu.');
        }

        redirect('consumer/notifications.php');
    }

    if ($action === 'read_all') {
        try {
            Notification::markAllAsRead($userId);
            flash_success('Tüm bildirimler okundu olarak işaretlendi.');
        } catch (Throwable $e) {
            flash_error('Bildirimler güncellenirken bir hata oluştu.');
        }

        redirect('consumer/notifications.php');
    }

    redirect('consumer/notifications.php');
}

try {
    $notifications = Notification::getByUserId($userId, 100);
    $unreadCount = Notification::unreadCount($userId);
} catch (Throwable $e) {
    $notifications = [];
    $unreadCount = 0;
    flash_error('Bildirimler yüklenirken bir hata oluştu.');
}

$totalCount = count($notifications);
$readCount = max(0, $totalCount - $unreadCount);

$filter = $_GET['filter'] ?? 'all';

if (!in_array($filter, ['all', 'unread', 'read'], true)) {
    $filter = 'all';
}

$visibleNotifications = array_values(array_filter($notifications, function (array $notification) use ($filter): bool {
    $isRead = (int) ($notification['is_read'] ?? 0) === 1;

    return match ($filter) {
        'unread' => !$isRead,
        'read' => $isRead,
        default => true,
    };
}));

require APP_PATH . '/Views/layouts/header.php';
?>

<style>
    .notifications-page {
        max-width: 1120px;
        margin: 0 auto;
        padding: 28px 16px 48px;
    }

    .notifications-hero {
        background: linear-gradient(135deg, #f0fdf4, #ecfeff);
        border: 1px solid #d1fae5;
        border-radius: 24px;
        padding: 28px;
        margin-bottom: 22px;
        box-shadow: 0 18px 40px rgba(15, 23, 42, 0.08);
    }

    .notifications-breadcrumb {
        display: flex;
        gap: 8px;
        align-items: center;
        color: #64748b;
        font-size: 14px;
        margin-bottom: 14px;
    }

    .notifications-breadcrumb a {
        color: #047857;
        text-decoration: none;
        font-weight: 700;
    }

    .notifications-hero h1 {
        margin: 0 0 10px;
        color: #0f172a;
        font-size: clamp(28px, 4vw, 42px);
        line-height: 1.08;
    }

    .notifications-hero p {
        margin: 0;
        max-width: 720px;
        color: #475569;
        font-size: 16px;
        line-height: 1.65;
    }

    .notifications-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 20px;
    }

    .notifications-btn {
        border: 0;
        border-radius: 999px;
        padding: 11px 16px;
        font-weight: 800;
        cursor: pointer;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 8px;
        transition: transform .15s ease, box-shadow .15s ease;
    }

    .notifications-btn:hover {
        transform: translateY(-1px);
    }

    .notifications-btn-primary {
        background: #047857;
        color: #fff;
        box-shadow: 0 10px 22px rgba(4, 120, 87, .22);
    }

    .notifications-btn-soft {
        background: #ffffff;
        color: #047857;
        border: 1px solid #bbf7d0;
    }

    .notifications-btn-muted {
        background: #f8fafc;
        color: #334155;
        border: 1px solid #e2e8f0;
    }

    .notifications-stats {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 14px;
        margin-bottom: 20px;
    }

    .notifications-stat-card {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 20px;
        padding: 18px;
        box-shadow: 0 12px 28px rgba(15, 23, 42, .06);
    }

    .notifications-stat-card span {
        display: block;
        color: #64748b;
        font-size: 13px;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: .04em;
    }

    .notifications-stat-card strong {
        display: block;
        margin-top: 8px;
        color: #0f172a;
        font-size: 30px;
        line-height: 1;
    }

    .notifications-filter-bar {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        gap: 12px;
        align-items: center;
        margin-bottom: 16px;
    }

    .notifications-tabs {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

    .notifications-tab {
        text-decoration: none;
        border-radius: 999px;
        padding: 10px 14px;
        background: #fff;
        border: 1px solid #e2e8f0;
        color: #475569;
        font-weight: 800;
    }

    .notifications-tab.is-active {
        background: #064e3b;
        color: #fff;
        border-color: #064e3b;
    }

    .notifications-list {
        display: grid;
        gap: 12px;
    }

    .notification-card {
        display: grid;
        grid-template-columns: auto 1fr auto;
        gap: 14px;
        align-items: flex-start;
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 22px;
        padding: 18px;
        box-shadow: 0 12px 28px rgba(15, 23, 42, .055);
    }

    .notification-card.is-unread {
        border-color: #86efac;
        background: #f7fee7;
    }

    .notification-icon {
        width: 46px;
        height: 46px;
        border-radius: 16px;
        background: #ecfdf5;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 22px;
    }

    .notification-content h3 {
        margin: 0 0 7px;
        color: #0f172a;
        font-size: 18px;
    }

    .notification-content p {
        margin: 0 0 12px;
        color: #475569;
        line-height: 1.55;
    }

    .notification-meta {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        color: #64748b;
        font-size: 13px;
    }

    .notification-badge {
        border-radius: 999px;
        padding: 5px 9px;
        background: #f1f5f9;
        color: #334155;
        font-weight: 800;
    }

    .notification-badge-unread {
        background: #dcfce7;
        color: #166534;
    }

    .notification-actions {
        display: flex;
        flex-direction: column;
        gap: 8px;
        min-width: 132px;
    }

    .notification-actions form {
        margin: 0;
    }

    .notification-actions .notifications-btn {
        width: 100%;
        font-size: 13px;
        padding: 9px 12px;
    }

    .notifications-empty {
        background: #fff;
        border: 1px dashed #cbd5e1;
        border-radius: 24px;
        padding: 34px;
        text-align: center;
        color: #475569;
    }

    .notifications-empty strong {
        display: block;
        color: #0f172a;
        font-size: 20px;
        margin-bottom: 8px;
    }

    @media (max-width: 760px) {
        .notifications-stats {
            grid-template-columns: 1fr;
        }

        .notification-card {
            grid-template-columns: 1fr;
        }

        .notification-actions {
            width: 100%;
        }
    }
</style>

<main class="notifications-page">
    <section class="notifications-hero">
        <div class="notifications-breadcrumb">
            <a href="<?= e(url('index.php')) ?>">Ana Sayfa</a>
            <span>/</span>
            <a href="<?= e(url('consumer/dashboard.php')) ?>">Tüketici Paneli</a>
            <span>/</span>
            <span>Bildirimlerim</span>
        </div>

        <h1>Bildirimlerim</h1>
        <p>
            Sipariş durumları, ödeme hareketleri, ürün soruları, üretici güncellemeleri ve sistem bildirimlerini buradan takip edebilirsin.
        </p>

        <div class="notifications-actions">
            <a class="notifications-btn notifications-btn-primary" href="<?= e(url('consumer/dashboard.php')) ?>">
                ← Panele Dön
            </a>

            <a class="notifications-btn notifications-btn-soft" href="<?= e(url('consumer/orders.php')) ?>">
                Siparişlerim
            </a>

            <a class="notifications-btn notifications-btn-soft" href="<?= e(url('consumer/wallet.php')) ?>">
                Sanal Bakiye
            </a>
        </div>
    </section>

    <section class="notifications-stats">
        <div class="notifications-stat-card">
            <span>Toplam bildirim</span>
            <strong><?= e((string) $totalCount) ?></strong>
        </div>

        <div class="notifications-stat-card">
            <span>Okunmamış</span>
            <strong><?= e((string) $unreadCount) ?></strong>
        </div>

        <div class="notifications-stat-card">
            <span>Okunmuş</span>
            <strong><?= e((string) $readCount) ?></strong>
        </div>
    </section>

    <section class="notifications-filter-bar">
        <div class="notifications-tabs">
            <a class="notifications-tab<?= $filter === 'all' ? ' is-active' : '' ?>" href="<?= e(url('consumer/notifications.php?filter=all')) ?>">
                Tümü
            </a>

            <a class="notifications-tab<?= $filter === 'unread' ? ' is-active' : '' ?>" href="<?= e(url('consumer/notifications.php?filter=unread')) ?>">
                Okunmamış
            </a>

            <a class="notifications-tab<?= $filter === 'read' ? ' is-active' : '' ?>" href="<?= e(url('consumer/notifications.php?filter=read')) ?>">
                Okunmuş
            </a>
        </div>

        <?php if ($unreadCount > 0): ?>
            <form method="post" action="<?= e(url('consumer/notifications.php')) ?>">
                <?= csrf_field() ?>
                <input type="hidden" name="_action" value="read_all">
                <button class="notifications-btn notifications-btn-primary" type="submit">
                    Tümünü Okundu Yap
                </button>
            </form>
        <?php endif; ?>
    </section>

    <?php if (!$visibleNotifications): ?>
        <section class="notifications-empty">
            <strong>Gösterilecek bildirim yok.</strong>
            <span>
                <?= $filter === 'all'
                    ? 'Henüz hesabına ait bir bildirim oluşmamış.'
                    : 'Bu filtreye uygun bildirim bulunamadı.' ?>
            </span>
        </section>
    <?php else: ?>
        <section class="notifications-list">
            <?php foreach ($visibleNotifications as $notification): ?>
                <?php
                    $notificationId = (int) ($notification['id'] ?? 0);
                    $type = (string) ($notification['type'] ?? 'system');
                    $title = (string) ($notification['title'] ?? 'Bildirim');
                    $message = (string) ($notification['message'] ?? '');
                    $createdAt = (string) ($notification['created_at'] ?? '');
                    $isRead = (int) ($notification['is_read'] ?? 0) === 1;
                    $target = consumer_notification_target($notification);
                ?>

                <article class="notification-card<?= $isRead ? '' : ' is-unread' ?>">
                    <div class="notification-icon">
                        <?= e(consumer_notification_icon($type)) ?>
                    </div>

                    <div class="notification-content">
                        <h3><?= e($title) ?></h3>

                        <p><?= e($message) ?></p>

                        <div class="notification-meta">
                            <span class="notification-badge">
                                <?= e(consumer_notification_type_label($type)) ?>
                            </span>

                            <span class="notification-badge">
                                <?= e(consumer_notification_date($createdAt)) ?>
                            </span>

                            <?php if (!$isRead): ?>
                                <span class="notification-badge notification-badge-unread">
                                    Yeni
                                </span>
                            <?php else: ?>
                                <span class="notification-badge">
                                    Okundu
                                </span>
                            <?php endif; ?>
                        </div>
                    </div>

                    <div class="notification-actions">
                        <form method="post" action="<?= e(url('consumer/notifications.php')) ?>">
                            <?= csrf_field() ?>
                            <input type="hidden" name="_action" value="open">
                            <input type="hidden" name="notification_id" value="<?= e((string) $notificationId) ?>">
                            <input type="hidden" name="target" value="<?= e($target) ?>">
                            <button class="notifications-btn notifications-btn-primary" type="submit">
                                Aç
                            </button>
                        </form>

                        <?php if (!$isRead): ?>
                            <form method="post" action="<?= e(url('consumer/notifications.php')) ?>">
                                <?= csrf_field() ?>
                                <input type="hidden" name="_action" value="read">
                                <input type="hidden" name="notification_id" value="<?= e((string) $notificationId) ?>">
                                <button class="notifications-btn notifications-btn-muted" type="submit">
                                    Okundu Yap
                                </button>
                            </form>
                        <?php endif; ?>
                    </div>
                </article>
            <?php endforeach; ?>
        </section>
    <?php endif; ?>
</main>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>