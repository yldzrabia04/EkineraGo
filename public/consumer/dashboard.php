<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$pageTitle = 'Tüketici Paneli';
$bodyClass = 'page-consumer-dashboard';

require APP_PATH . '/Views/layouts/header.php';

$user = currentUser();
?>

<main class="container">
    <section class="card dashboard-welcome">
        <h1>Tüketici Paneli</h1>

        <p>
            Hoş geldin,
            <strong><?= e($user['full_name'] ?? 'Tüketici') ?></strong>.
            Buradan siparişlerini, sanal bakiyeni, favorilerini ve bildirimlerini takip edebilirsin.
        </p>
    </section>

    <section class="dashboard-grid">
        <div class="card">
            <h2>Sepetim</h2>

            <p>Sepetindeki ürünleri görüntüle ve checkout adımına geç.</p>

            <a class="btn" href="<?= e(url('cart.php')) ?>">
                Sepete Git
            </a>
        </div>

        <div class="card">
            <h2>Siparişlerim</h2>

            <p>Sipariş durumlarını ve takip numaralarını görüntüle.</p>

            <a class="btn btn-secondary" href="<?= e(url('consumer/orders.php')) ?>">
                Siparişlere Git
            </a>
        </div>

        <div class="card">
            <h2>Sanal Bakiye</h2>

            <p>Bakiye yükle ve bakiye hareketlerini incele.</p>

            <a class="btn btn-secondary" href="<?= e(url('consumer/wallet.php')) ?>">
                Bakiye Sayfası
            </a>
        </div>

        <div class="card">
            <h2>Favorilerim</h2>

            <p>Kaydettiğin ürünleri tek sayfadan takip et.</p>

            <a class="btn btn-secondary" href="<?= e(url('consumer/favorites.php')) ?>">
                Favorileri Gör
            </a>
        </div>
    </section>
</main>

<style>
    .dashboard-welcome {
        margin-bottom: 22px;
    }

    .dashboard-welcome h1,
    .dashboard-grid h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .dashboard-welcome p,
    .dashboard-grid p {
        color: #526052;
        line-height: 1.5;
    }

    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 22px;
    }

    @media (max-width: 1000px) {
        .dashboard-grid {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media (max-width: 700px) {
        .dashboard-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>