<?php

require_once __DIR__ . '/../app/bootstrap.php';

$pageTitle = 'Ana Sayfa';
$bodyClass = 'page-home';

require APP_PATH . '/Views/layouts/header.php';

$user = currentUser();
?>

<main class="container">
    <section class="card home-hero">
        <div>
            <h1>Tarladan sofrana, üreticiden doğrudan.</h1>

            <p>
                EkineraGo, yerel üreticilerle tüketicileri aracısız buluşturan
                bir gıda platformudur. Üretici emeğinin karşılığını alır,
                tüketici ise taze ürüne daha adil fiyatla ulaşır.
            </p>

            <?php if ($user): ?>
                <p>
                    Hoş geldin,
                    <strong><?= e($user['full_name'] ?? 'Kullanıcı') ?></strong>.
                </p>
            <?php endif; ?>

            <div class="home-actions">
                <a class="btn" href="<?= e(url('products.php')) ?>">
                    Ürünleri İncele
                </a>

                <a class="btn btn-secondary" href="<?= e(url('producers.php')) ?>">
                    Üreticileri Gör
                </a>

                <?php if (!$user): ?>
                    <a class="btn btn-secondary" href="<?= e(url('register.php')) ?>">
                        Hesap Oluştur
                    </a>
                <?php endif; ?>
            </div>
        </div>
    </section>

    <section class="home-grid">
        <div class="card">
            <h2>Nasıl çalışır?</h2>

            <div class="step">1. Ürünü ara</div>
            <div class="step">2. Üreticiyi incele</div>
            <div class="step">3. Sepete ekle</div>
            <div class="step">4. Sanal bakiye ile sipariş ver</div>
            <div class="step">5. Taze ürünü bekle</div>
        </div>

        <div class="card">
            <h2>Üretici misin?</h2>

            <p>
                Ürünlerini doğrudan tüketiciye ulaştırabilir, kendi mini marketini
                oluşturabilir ve siparişlerini tek panelden yönetebilirsin.
            </p>

            <?php if (!$user): ?>
                <a class="btn" href="<?= e(url('register.php')) ?>">
                    Üretici Olarak Kayıt Ol
                </a>
            <?php elseif (($user['role'] ?? '') === ROLE_PRODUCER): ?>
                <a class="btn" href="<?= e(url('producer/dashboard.php')) ?>">
                    Üretici Paneline Git
                </a>
            <?php endif; ?>
        </div>
    </section>
</main>

<style>
    .home-hero {
        padding: 38px;
    }

    .home-hero h1 {
        max-width: 760px;
        margin: 0 0 18px;
        font-size: 44px;
        line-height: 1.12;
        color: #245c2f;
    }

    .home-hero p {
        max-width: 760px;
        font-size: 18px;
        line-height: 1.6;
        color: #526052;
    }

    .home-actions {
        margin-top: 26px;
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
    }

    .home-grid {
        margin-top: 22px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 22px;
    }

    .home-grid h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .home-grid p {
        line-height: 1.6;
        color: #526052;
    }

    .step {
        padding: 12px 0;
        border-bottom: 1px solid #edf1ea;
        color: #526052;
    }

    .step:last-child {
        border-bottom: none;
    }

    @media (max-width: 768px) {
        .home-hero {
            padding: 26px;
        }

        .home-hero h1 {
            font-size: 32px;
        }

        .home-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>