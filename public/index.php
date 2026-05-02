<?php

require_once __DIR__ . '/../app/bootstrap.php';

$user = currentUser();
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>EkineraGo</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7f2;
            margin: 0;
            color: #1f2d1f;
        }

        .navbar {
            background: #ffffff;
            padding: 18px 40px;
            box-shadow: 0 4px 18px rgba(0,0,0,.06);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .brand {
            font-size: 24px;
            font-weight: bold;
            color: #2f7d3d;
            text-decoration: none;
        }

        .nav-links a {
            margin-left: 14px;
            color: #2f7d3d;
            text-decoration: none;
            font-weight: bold;
        }

        .hero {
            max-width: 1000px;
            margin: 70px auto;
            padding: 0 30px;
            display: grid;
            grid-template-columns: 1.3fr .7fr;
            gap: 40px;
            align-items: center;
        }

        .hero-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 36px;
            box-shadow: 0 14px 40px rgba(0,0,0,.08);
        }

        h1 {
            font-size: 44px;
            line-height: 1.1;
            margin: 0 0 18px;
            color: #245c2f;
        }

        p {
            font-size: 18px;
            line-height: 1.6;
            color: #526052;
        }

        .actions {
            margin-top: 26px;
        }

        .btn {
            display: inline-block;
            padding: 13px 18px;
            border-radius: 10px;
            background: #2f7d3d;
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-right: 10px;
        }

        .btn.secondary {
            background: #e8f3e9;
            color: #2f7d3d;
        }

        .info-box {
            background: #ffffff;
            border-radius: 20px;
            padding: 26px;
            box-shadow: 0 14px 40px rgba(0,0,0,.08);
        }

        .info-box h2 {
            color: #245c2f;
            margin-top: 0;
        }

        .step {
            padding: 12px 0;
            border-bottom: 1px solid #edf1ea;
        }

        .step:last-child {
            border-bottom: none;
        }

        .flash-success {
            max-width: 1000px;
            margin: 24px auto 0;
            background: #e7f7e8;
            color: #236b2c;
            padding: 12px 18px;
            border-radius: 10px;
        }

        .flash-error {
            max-width: 1000px;
            margin: 24px auto 0;
            background: #ffe8e8;
            color: #9b111e;
            padding: 12px 18px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<header class="navbar">
    <a class="brand" href="<?= e(url('index.php')) ?>">EkineraGo</a>

    <nav class="nav-links">
        <a href="<?= e(url('products.php')) ?>">Ürünler</a>
        <a href="<?= e(url('producers.php')) ?>">Üreticiler</a>

        <?php if ($user): ?>
            <?php if (($user['role'] ?? '') === ROLE_PRODUCER): ?>
                <a href="<?= e(url('producer/dashboard.php')) ?>">Üretici Paneli</a>
            <?php endif; ?>

            <a href="<?= e(url('logout.php')) ?>">Çıkış</a>
        <?php else: ?>
            <a href="<?= e(url('login.php')) ?>">Giriş</a>
            <a href="<?= e(url('register.php')) ?>">Kayıt Ol</a>
        <?php endif; ?>
    </nav>
</header>

<?php if ($message = flash_get('success')): ?>
    <div class="flash-success"><?= e($message) ?></div>
<?php endif; ?>

<?php if ($message = flash_get('error')): ?>
    <div class="flash-error"><?= e($message) ?></div>
<?php endif; ?>

<main class="hero">
    <section class="hero-card">
        <h1>Tarladan sofrana, üreticiden doğrudan.</h1>

        <p>
            EkineraGo, yerel üreticilerle tüketicileri aracısız buluşturan
            bir gıda platformudur. Üretici emeğinin karşılığını alır,
            tüketici ise taze ürüne daha adil fiyatla ulaşır.
        </p>

        <?php if ($user): ?>
            <p>
                Hoş geldin, <strong><?= e($user['full_name'] ?? 'Kullanıcı') ?></strong>.
            </p>
        <?php endif; ?>

        <div class="actions">
            <a class="btn" href="<?= e(url('products.php')) ?>">Ürünleri İncele</a>

            <?php if (!$user): ?>
                <a class="btn secondary" href="<?= e(url('register.php')) ?>">Hesap Oluştur</a>
            <?php endif; ?>
        </div>
    </section>

    <aside class="info-box">
        <h2>Nasıl çalışır?</h2>

        <div class="step">1. Ürünü ara</div>
        <div class="step">2. Üreticiyi incele</div>
        <div class="step">3. Sepete ekle</div>
        <div class="step">4. Sanal bakiye ile sipariş ver</div>
        <div class="step">5. Taze ürünü bekle</div>
    </aside>
</main>

</body>
</html>