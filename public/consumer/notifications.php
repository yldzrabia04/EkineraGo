<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$userId = (int) currentUserId();

if (is_post()) {
    require_csrf();

    $action = $_POST['_action'] ?? '';

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

    flash_error('Geçersiz bildirim işlemi.');
    redirect('consumer/notifications.php');
}

$notifications = Notification::getByUserId($userId);
$unreadCount = Notification::unreadCount($userId);

$pageTitle = 'Bildirimler';
$bodyClass = 'page-consumer-notifications';

require APP_PATH . '/Views/layouts/header.php';

if (!function_exists('notification_type_label')) {
    function notification_type_label(string $type): string
    {
        return match ($type) {
            'order_created' => 'Sipariş',
            'order_status_changed' => 'Sipariş Durumu',
            'new_order' => 'Yeni Sipariş',
            'restock_alert' => 'Stok Bildirimi',
            'favorite_product_updated' => 'Favori Ürün',
            default => 'Bildirim',
        };
    }
}

if (!function_exists('notification_badge_class')) {
    function notification_badge_class(string $type): string
    {
        return match ($type) {
            'order_created', 'new_order' => 'badge-success',
            'order_status_changed' => 'badge-info',
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
                Sipariş durumları, stok bildirimleri ve sistem mesajları burada listelenir.
            </p>
        </div>

        <?php if ($unreadCount > 0): ?>
            <form method="POST" action="<?= e(url('consumer/notifications.php')) ?>">
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
                Sipariş oluşturduğunda veya sipariş durumun güncellendiğinde bildirimler burada görünecek.
            </p>
        </section>
    <?php else: ?>
        <section class="notification-list">
            <?php foreach ($notifications as $notification): ?>
                <?php
                    $isRead = !empty($notification['is_read']);
                    $type = $notification['type'] ?? '';
                ?>

                <article class="card notification-card <?= $isRead ? '' : 'unread' ?>">
                    <div class="notification-content">
                        <div class="notification-title-row">
                            <span class="badge <?= e(notification_badge_class($type)) ?>">
                                <?= e(notification_type_label($type)) ?>
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
                        <?php if (!$isRead): ?>
                            <form method="POST" action="<?= e(url('consumer/notifications.php')) ?>">
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
        min-width: 130px;
        display: flex;
        justify-content: flex-end;
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
            justify-content: flex-start;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>