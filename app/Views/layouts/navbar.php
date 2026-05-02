<?php

$user = currentUser();

$currentScript = str_replace('\\', '/', $_SERVER['SCRIPT_NAME'] ?? '');

$isActive = function (string $path) use ($currentScript): string {
    $needle = '/' . ltrim($path, '/');

    return substr($currentScript, -strlen($needle)) === $needle ? ' active' : '';
};
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