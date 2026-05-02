<?php

$user = currentUser();

$currentScript = str_replace('\\', '/', $_SERVER['SCRIPT_NAME'] ?? '');

$isActive = function (string $path) use ($currentScript): string {
    $needle = '/' . ltrim($path, '/');

    return substr($currentScript, -strlen($needle)) === $needle ? ' active' : '';
};

$unreadNotificationCount = 0;
$pendingQuestionCount = 0;

if ($user) {
    $userId = (int) ($user['id'] ?? currentUserId());

    try {
        if (class_exists('Notification')) {
            $unreadNotificationCount = Notification::unreadCount($userId);
        }

        if (($user['role'] ?? '') === ROLE_PRODUCER && class_exists('ProductQuestionService')) {
            $questionService = new ProductQuestionService();
            $pendingQuestionCount = $questionService->countPendingByProducerId($userId);
        }
    } catch (Throwable $e) {
        $unreadNotificationCount = 0;
        $pendingQuestionCount = 0;
    }
}

?>

<header class="app-navbar">
    <a class="app-brand" href="<?= e(url('index.php')) ?>">
        EkineraGo
    </a>

    <nav class="app-nav-links">
        <a class="nav-link<?= $isActive('index.php') ?>" href="<?= e(url('index.php')) ?>">
            Ana Sayfa
        </a>

        <a class="nav-link<?= $isActive('products.php') ?>" href="<?= e(url('products.php')) ?>">
            Ürünler
        </a>

        <a class="nav-link<?= $isActive('producers.php') ?>" href="<?= e(url('producers.php')) ?>">
            Üreticiler
        </a>

        <?php if ($user): ?>
            <?php if (($user['role'] ?? '') === ROLE_PRODUCER): ?>
                <a class="nav-link<?= $isActive('producer/dashboard.php') ?>" href="<?= e(url('producer/dashboard.php')) ?>">
                    Üretici Paneli
                </a>

                <a class="nav-link<?= $isActive('producer/products.php') ?>" href="<?= e(url('producer/products.php')) ?>">
                    Ürünlerim
                </a>

                <a class="nav-link<?= $isActive('producer/product-create.php') ?>" href="<?= e(url('producer/product-create.php')) ?>">
                    Ürün Ekle
                </a>

                <a class="nav-link<?= $isActive('producer/orders.php') ?>" href="<?= e(url('producer/orders.php')) ?>">
                    Siparişler
                </a>

                <a class="nav-link<?= $isActive('producer/questions.php') ?>" href="<?= e(url('producer/questions.php')) ?>">
                    Ürün Soruları

                    <?php if ($pendingQuestionCount > 0): ?>
                        <span class="nav-badge">
                            <?= e((string) $pendingQuestionCount) ?>
                        </span>
                    <?php endif; ?>
                </a>

                <a class="nav-link<?= $isActive('producer/notifications.php') ?>" href="<?= e(url('producer/notifications.php')) ?>">
                    Bildirimler

                    <?php if ($unreadNotificationCount > 0): ?>
                        <span class="nav-badge">
                            <?= e((string) $unreadNotificationCount) ?>
                        </span>
                    <?php endif; ?>
                </a>
            <?php endif; ?>

            <?php if (($user['role'] ?? '') === ROLE_CONSUMER): ?>
                <a class="nav-link<?= $isActive('consumer/dashboard.php') ?>" href="<?= e(url('consumer/dashboard.php')) ?>">
                    Tüketici Paneli
                </a>

                <a class="nav-link<?= $isActive('cart.php') ?>" href="<?= e(url('cart.php')) ?>">
                    Sepet
                </a>

                <a class="nav-link<?= $isActive('consumer/orders.php') ?>" href="<?= e(url('consumer/orders.php')) ?>">
                    Siparişlerim
                </a>

                <a class="nav-link<?= $isActive('consumer/wallet.php') ?>" href="<?= e(url('consumer/wallet.php')) ?>">
                    Bakiye
                </a>

                <a class="nav-link<?= $isActive('consumer/favorites.php') ?>" href="<?= e(url('consumer/favorites.php')) ?>">
                    Favoriler
                </a>

                <a class="nav-link<?= $isActive('consumer/notifications.php') ?>" href="<?= e(url('consumer/notifications.php')) ?>">
                    Bildirimler

                    <?php if ($unreadNotificationCount > 0): ?>
                        <span class="nav-badge">
                            <?= e((string) $unreadNotificationCount) ?>
                        </span>
                    <?php endif; ?>
                </a>
            <?php endif; ?>

            <span class="nav-user">
                <?= e($user['full_name'] ?? 'Kullanıcı') ?>
            </span>

            <a class="nav-link nav-logout" href="<?= e(url('logout.php')) ?>">
                Çıkış
            </a>
        <?php else: ?>
            <a class="nav-link<?= $isActive('login.php') ?>" href="<?= e(url('login.php')) ?>">
                Giriş
            </a>

            <a class="nav-link nav-register<?= $isActive('register.php') ?>" href="<?= e(url('register.php')) ?>">
                Kayıt Ol
            </a>
        <?php endif; ?>
    </nav>
</header>

<style>
    .nav-link {
        position: relative;
    }

    .nav-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-width: 20px;
        height: 20px;
        padding: 0 6px;
        margin-left: 6px;
        border-radius: 999px;
        background: #e85d3f;
        color: #ffffff;
        font-size: 12px;
        font-weight: 800;
        line-height: 1;
    }

    .nav-link.active .nav-badge,
    .nav-link:hover .nav-badge {
        background: #ffffff;
        color: #245c2f;
    }
</style>