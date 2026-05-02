<?php

$producerId = (int) currentUserId();

$producerUnreadCount = 0;
$producerPendingQuestionCount = 0;

try {
    if (class_exists('Notification')) {
        $producerUnreadCount = Notification::unreadCount($producerId);
    }

    if (class_exists('ProductQuestionService')) {
        $producerQuestionService = new ProductQuestionService();
        $producerPendingQuestionCount = $producerQuestionService->countPendingByProducerId($producerId);
    }
} catch (Throwable $e) {
    $producerUnreadCount = 0;
    $producerPendingQuestionCount = 0;
}

if (!function_exists('producer_sidebar_is_active')) {
    function producer_sidebar_is_active(string $path): bool
    {
        $script = str_replace('\\', '/', $_SERVER['SCRIPT_NAME'] ?? '');

        return str_contains($script, '/' . ltrim($path, '/'));
    }
}

if (!function_exists('producer_sidebar_active_class')) {
    function producer_sidebar_active_class(string $path): string
    {
        return producer_sidebar_is_active($path) ? 'active' : '';
    }
}
?>

<aside class="producer-sidebar">
    <div class="producer-sidebar-header">
        <h2>Üretici Paneli</h2>

        <p>
            Ürünlerini, siparişlerini, sorularını ve bildirimlerini buradan yönet.
        </p>
    </div>

    <nav class="producer-sidebar-nav">
        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/dashboard.php')) ?>"
            href="<?= e(url('producer/dashboard.php')) ?>"
        >
            <span>🏡</span>
            Panel
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/products.php')) ?>"
            href="<?= e(url('producer/products.php')) ?>"
        >
            <span>🥬</span>
            Ürünlerim
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/product-create.php')) ?>"
            href="<?= e(url('producer/product-create.php')) ?>"
        >
            <span>➕</span>
            Ürün Ekle
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/orders.php')) ?>"
            href="<?= e(url('producer/orders.php')) ?>"
        >
            <span>📦</span>
            Siparişler
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/questions.php')) ?>"
            href="<?= e(url('producer/questions.php')) ?>"
        >
            <span>💬</span>
            Ürün Soruları

            <?php if ($producerPendingQuestionCount > 0): ?>
                <strong class="sidebar-count">
                    <?= e((string) $producerPendingQuestionCount) ?>
                </strong>
            <?php endif; ?>
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/notifications.php')) ?>"
            href="<?= e(url('producer/notifications.php')) ?>"
        >
            <span>🔔</span>
            Bildirimler

            <?php if ($producerUnreadCount > 0): ?>
                <strong class="sidebar-count">
                    <?= e((string) $producerUnreadCount) ?>
                </strong>
            <?php endif; ?>
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/campaigns.php')) ?>"
            href="<?= e(url('producer/campaigns.php')) ?>"
        >
            <span>🏷️</span>
            Kampanyalar
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/shipping.php')) ?>"
            href="<?= e(url('producer/shipping.php')) ?>"
        >
            <span>🚚</span>
            Gönderim
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/demands.php')) ?>"
            href="<?= e(url('producer/demands.php')) ?>"
        >
            <span>📍</span>
            Talepler
        </a>

        <a
            class="producer-sidebar-link <?= e(producer_sidebar_active_class('producer/performance.php')) ?>"
            href="<?= e(url('producer/performance.php')) ?>"
        >
            <span>📊</span>
            Performans
        </a>
    </nav>

    <div class="producer-sidebar-footer">
        <a class="producer-sidebar-link public-link" href="<?= e(url('products.php')) ?>">
            <span>🌱</span>
            Public Ürünleri Gör
        </a>

        <a class="producer-sidebar-link logout-link" href="<?= e(url('logout.php')) ?>">
            <span>🚪</span>
            Çıkış Yap
        </a>
    </div>
</aside>

<style>
    .producer-sidebar {
        background: #ffffff;
        border: 1px solid #edf1ea;
        border-radius: 18px;
        padding: 18px;
        box-shadow: 0 10px 28px rgba(36, 92, 47, .08);
    }

    .producer-sidebar-header {
        padding-bottom: 14px;
        margin-bottom: 14px;
        border-bottom: 1px solid #edf1ea;
    }

    .producer-sidebar-header h2 {
        margin: 0 0 7px;
        color: #245c2f;
        font-size: 22px;
    }

    .producer-sidebar-header p {
        margin: 0;
        color: #526052;
        line-height: 1.5;
        font-size: 14px;
    }

    .producer-sidebar-nav,
    .producer-sidebar-footer {
        display: grid;
        gap: 8px;
    }

    .producer-sidebar-footer {
        margin-top: 16px;
        padding-top: 14px;
        border-top: 1px solid #edf1ea;
    }

    .producer-sidebar-link {
        position: relative;
        display: flex;
        align-items: center;
        gap: 10px;
        min-height: 42px;
        padding: 10px 12px;
        border-radius: 12px;
        color: #245c2f;
        background: #f8fbf6;
        text-decoration: none;
        font-weight: 700;
        transition: .15s ease;
    }

    .producer-sidebar-link:hover,
    .producer-sidebar-link.active {
        background: #245c2f;
        color: #ffffff;
        transform: translateX(2px);
    }

    .producer-sidebar-link span {
        width: 22px;
        text-align: center;
        flex-shrink: 0;
    }

    .sidebar-count {
        margin-left: auto;
        min-width: 24px;
        height: 24px;
        padding: 0 7px;
        border-radius: 999px;
        background: #e85d3f;
        color: #ffffff;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 12px;
        line-height: 1;
    }

    .producer-sidebar-link.active .sidebar-count,
    .producer-sidebar-link:hover .sidebar-count {
        background: #ffffff;
        color: #245c2f;
    }

    .public-link {
        background: #eef8ef;
    }

    .logout-link {
        background: #fff0ed;
        color: #9b321f;
    }

    .logout-link:hover,
    .logout-link.active {
        background: #9b321f;
        color: #ffffff;
    }

    @media (max-width: 900px) {
        .producer-sidebar {
            margin-bottom: 18px;
        }

        .producer-sidebar-nav,
        .producer-sidebar-footer {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media (max-width: 560px) {
        .producer-sidebar-nav,
        .producer-sidebar-footer {
            grid-template-columns: 1fr;
        }
    }
</style>