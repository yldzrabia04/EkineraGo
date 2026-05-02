<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$userId = (int) currentUserId();

if (!function_exists('producer_notification_data_array')) {
    function producer_notification_data_array(array $notification): array
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

if (!function_exists('producer_notification_safe_target')) {
    function producer_notification_safe_target(string $target): string
    {
        $target = trim($target);

        if ($target === '') {
            return 'producer/notifications.php';
        }

        if (
            str_starts_with($target, 'http://') ||
            str_starts_with($target, 'https://') ||
            str_starts_with($target, '//') ||
            str_contains($target, '\\')
        ) {
            return 'producer/notifications.php';
        }

        $target = ltrim($target, '/');

        return $target !== '' ? $target : 'producer/notifications.php';
    }
}

if (!function_exists('producer_notification_target_path')) {
    function producer_notification_target_path(array $notification): string
    {
        $data = producer_notification_data_array($notification);
        $type = (string) ($notification['type'] ?? '');

        if (!empty($data['url'])) {
            return producer_notification_safe_target((string) $data['url']);
        }

        if ($type === 'new_product_question' && !empty($data['question_id'])) {
            return 'producer/questions.php?question_id=' . (int) $data['question_id'];
        }

        if ($type === 'new_review' && !empty($data['product_id'])) {
            return 'product-detail.php?id=' . (int) $data['product_id'] . '#reviews';
        }

        if (!empty($data['product_id'])) {
            return 'product-detail.php?id=' . (int) $data['product_id'];
        }

        if (!empty($data['order_id']) || str_contains($type, 'order')) {
            return 'producer/orders.php';
        }

        return 'producer/notifications.php';
    }
}

if (is_post()) {
    require_csrf();

    $action = $_POST['_action'] ?? '';

    if ($action === 'open') {
        $notificationId = (int) ($_POST['notification_id'] ?? 0);
        $target = producer_notification_safe_target((string) ($_POST['target'] ?? 'producer/notifications.php'));

        if ($notificationId > 0) {
            try {
                Notification::markAsRead($userId, $notificationId);
            } catch (Throwable $e) {
                flash_error('Bildirim açılırken bir hata oluştu.');
                redirect('producer/notifications.php');
            }
        }

        redirect($target);
    }

    if ($action === 'read') {
        $notificationId = (int) ($_POST['notification_id'] ?? 0);

        if ($notificationId <= 0) {
            flash_error('Geçerli bir bildirim bulunamadı.');
            redirect('producer/notifications.php');
        }

        try {
            Notification::markAsRead($userId, $notificationId);
            flash_success('Bildirim okundu olarak işaretlendi.');
        } catch (Throwable $e) {
            flash_error('Bildirim güncellenirken bir hata oluştu.');
        }

        redirect('producer/notifications.php');
    }

    if ($action === 'read_all') {
        try {
            Notification::markAllAsRead($userId);
            flash_success('Tüm bildirimler okundu olarak işaretlendi.');
        } catch (Throwable $e) {
            flash_error('Bildirimler güncellenirken bir hata oluştu.');
        }

        redirect('producer/notifications.php');
    }

    flash_error('Geçersiz bildirim işlemi.');
    redirect('producer/notifications.php');
}

$notifications = Notification::getByUserId($userId);
$unreadCount = Notification::unreadCount($userId);

$pageTitle = 'Üretici Bildirimleri';
$bodyClass = 'page-producer-notifications';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('producer_notification_type_label')) {
    function producer_notification_type_label(string $type): string
    {
        return match ($type) {
            'new_order' => 'Yeni Sipariş',
            'order_created' => 'Sipariş',
            'order_status_changed' => 'Sipariş Durumu',
            'new_review' => 'Yeni Yorum',
            'new_product_question' => 'Ürün Sorusu',
            'product_question_answered' => 'Soru Cevabı',
            'restock_alert' => 'Stok Bildirimi',
            'favorite_product_updated' => 'Favori Ürün',
            default => 'Bildirim',
        };
    }
}

if (!function_exists('producer_notification_badge_class')) {
    function producer_notification_badge_class(string $type): string
    {
        return match ($type) {
            'new_order', 'order_created', 'new_review' => 'badge-success',
            'order_status_changed', 'new_product_question', 'product_question_answered' => 'badge-info',
            'restock_alert' => 'badge-warning',
            default => 'badge-muted',
        };
    }
}
?>

<main class="container">
    <section class="card page-heading">
        <div>
            <h1>Bildirimler</h1>

            <p>
                Yeni siparişler, ürün yorumları, tüketici soruları ve sistem mesajları burada listelenir.
            </p>
        </div>

        <?php if ($unreadCount > 0): ?>
            <form method="POST" action="<?= e(url('producer/notifications.php')) ?>">
                <?= csrf_field() ?>

                <input type="hidden" name="_action" value="read_all">

                <button class="btn btn-secondary" type="submit">
                    Tümünü Okundu Yap
                </button>
            </form>
        <?php endif; ?>
    </section>

    <section class="card notification-summary">
        <strong>Okunmamış Bildirim:</strong>
        <?= e((string) $unreadCount) ?>
    </section>

    <?php if (empty($notifications)): ?>
        <section class="card empty-state">
            <h2>Henüz bildirimin yok</h2>

            <p>
                Ürünlerine soru sorulduğunda, yorum geldiğinde veya yeni sipariş oluştuğunda bildirimler burada görünecek.
            </p>

            <a class="btn" href="<?= e(url('producer/dashboard.php')) ?>">
                Panele Dön
            </a>
        </section>
    <?php else: ?>
        <section class="notification-list">
            <?php foreach ($notifications as $notification): ?>
                <?php
                    $isRead = !empty($notification['is_read']);
                    $type = $notification['type'] ?? '';
                    $targetPath = producer_notification_target_path($notification);
                ?>

                <article class="card notification-card <?= $isRead ? '' : 'unread' ?>">
                    <div class="notification-content">
                        <div class="notification-title-row">
                            <span class="badge <?= e(producer_notification_badge_class($type)) ?>">
                                <?= e(producer_notification_type_label($type)) ?>
                            </span>

                            <?php if (!$isRead): ?>
                                <span class="unread-dot">Okunmamış</span>
                            <?php endif; ?>
                        </div>

                        <h2><?= e($notification['title'] ?? 'Bildirim') ?></h2>

                        <p>
                            <?= nl2br(e($notification['message'] ?? '')) ?>
                        </p>

                        <span class="notification-date">
                            <?= !empty($notification['created_at'])
                                ? e(date('d.m.Y H:i', strtotime($notification['created_at'])))
                                : '-'
                            ?>
                        </span>
                    </div>

                    <div class="notification-actions">
                        <form method="POST" action="<?= e(url('producer/notifications.php')) ?>">
                            <?= csrf_field() ?>

                            <input type="hidden" name="_action" value="open">
                            <input type="hidden" name="notification_id" value="<?= e((string) $notification['id']) ?>">
                            <input type="hidden" name="target" value="<?= e($targetPath) ?>">

                            <button class="btn" type="submit">
                                İlgili Kısma Git
                            </button>
                        </form>

                        <?php if (!$isRead): ?>
                            <form method="POST" action="<?= e(url('producer/notifications.php')) ?>">
                                <?= csrf_field() ?>

                                <input type="hidden" name="_action" value="read">
                                <input type="hidden" name="notification_id" value="<?= e((string) $notification['id']) ?>">

                                <button class="btn btn-secondary" type="submit">
                                    Okundu Yap
                                </button>
                            </form>
                        <?php else: ?>
                            <span class="read-label">
                                Okundu
                            </span>
                        <?php endif; ?>
                    </div>
                </article>
            <?php endforeach; ?>
        </section>
    <?php endif; ?>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: center;
    }

    .page-heading h1,
    .notification-card h2,
    .empty-state h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .notification-card p,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .notification-summary {
        margin-bottom: 22px;
        color: #245c2f;
    }

    .notification-list {
        display: grid;
        gap: 16px;
    }

    .notification-card {
        display: flex;
        justify-content: space-between;
        gap: 16px;
        align-items: center;
        border-left: 5px solid transparent;
    }

    .notification-card.unread {
        border-left-color: #2f7d3d;
    }

    .notification-title-row {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
        align-items: center;
        margin-bottom: 10px;
    }

    .badge {
        display: inline-block;
        padding: 6px 10px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        white-space: nowrap;
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

    .unread-dot {
        color: #2f7d3d;
        font-weight: bold;
        font-size: 14px;
    }

    .notification-date {
        color: #718071;
        font-size: 14px;
    }

    .notification-actions {
        min-width: 180px;
        display: grid;
        gap: 8px;
        justify-items: end;
    }

    .notification-actions form {
        margin: 0;
    }

    .read-label {
        color: #718071;
        font-weight: bold;
    }

    .empty-state {
        text-align: center;
        padding: 34px;
    }

    @media (max-width: 768px) {
        .page-heading,
        .notification-card {
            align-items: flex-start;
            flex-direction: column;
        }

        .notification-actions {
            justify-items: start;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>