<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$user = currentUser();
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Üretici Paneli - EkineraGo</title>
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

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 30px;
        }

        .welcome {
            background: #ffffff;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 14px 40px rgba(0,0,0,.08);
            margin-bottom: 24px;
        }

        h1 {
            margin-top: 0;
            color: #245c2f;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .card {
            background: #ffffff;
            border-radius: 16px;
            padding: 22px;
            box-shadow: 0 10px 28px rgba(0,0,0,.07);
        }

        .card h3 {
            margin-top: 0;
            color: #245c2f;
        }

        .card p {
            color: #526052;
            line-height: 1.5;
        }

        .btn {
            display: inline-block;
            padding: 11px 15px;
            border-radius: 9px;
            background: #2f7d3d;
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-top: 8px;
        }

        .flash-success {
            background: #e7f7e8;
            color: #236b2c;
            padding: 12px 18px;
            border-radius: 10px;
            margin-bottom: 18px;
        }

        .flash-error {
            background: #ffe8e8;
            color: #9b111e;
            padding: 12px 18px;
            border-radius: 10px;
            margin-bottom: 18px;
        }
    </style>
</head>
<body>

<header class="navbar">
    <a class="brand" href="<?= e(url('index.php')) ?>">EkineraGo</a>

    <nav class="nav-links">
        <a href="<?= e(url('index.php')) ?>">Ana Sayfa</a>
        <a href="<?= e(url('producer/products.php')) ?>">Ürünlerim</a>
        <a href="<?= e(url('producer/product-create.php')) ?>">Ürün Ekle</a>
        <a href="<?= e(url('logout.php')) ?>">Çıkış</a>
    </nav>
</header>

<main class="container">
    <?php if ($message = flash_get('success')): ?>
        <div class="flash-success"><?= e($message) ?></div>
    <?php endif; ?>

    <?php if ($message = flash_get('error')): ?>
        <div class="flash-error"><?= e($message) ?></div>
    <?php endif; ?>

    <section class="welcome">
        <h1>Üretici Paneli</h1>
        <p>
            Hoş geldin, <strong><?= e($user['full_name'] ?? 'Üretici') ?></strong>.
            Buradan ürünlerini yönetebilir, yeni ürün ekleyebilir ve gelen siparişleri takip edebilirsin.
        </p>
    </section>

    <section class="grid">
        <div class="card">
            <h3>Ürünlerim</h3>
            <p>Aktif ürünlerini listele, düzenle veya pasifleştir.</p>
            <a class="btn" href="<?= e(url('producer/products.php')) ?>">Ürünleri Gör</a>
        </div>

        <div class="card">
            <h3>Yeni Ürün Ekle</h3>
            <p>Ürün adı, kategori, fiyat, stok ve hasat tarihi bilgilerini gir.</p>
            <a class="btn" href="<?= e(url('producer/product-create.php')) ?>">Ürün Ekle</a>
        </div>

        <div class="card">
            <h3>Siparişler</h3>
            <p>Gelen siparişler Rabia’nın order modülü tamamlanınca buraya bağlanacak.</p>
            <a class="btn" href="#">Yakında</a>
        </div>
    </section>
</main>

</body>
</html>