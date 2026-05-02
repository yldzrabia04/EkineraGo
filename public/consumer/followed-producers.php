<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$pageTitle = 'Takip Edilen Üreticiler';
$bodyClass = 'page-followed-producers';

require APP_PATH . '/Views/layouts/header.php';
?>

<main class="container">
    <section class="card page-heading">
        <h1>Takip Edilen Üreticiler</h1>

        <p>
            Takip ettiğin üreticiler burada listelenecek. FollowService bağlandığında
            gerçek takip kayıtları veritabanından gelecek.
        </p>
    </section>

    <section class="producer-grid">
        <article class="card producer-card">
            <div class="producer-logo-placeholder">
                Logo
            </div>

            <h2>Ahmet Çiftliği</h2>

            <p>Antalya / Kumluca</p>
            <p>Yeni ürün, kampanya ve ön sipariş bildirimleri için takip ediliyor.</p>

            <div class="producer-meta">
                <span>⭐ 4.8</span>
                <span>Aktif ürün: 12</span>
            </div>

            <div class="producer-actions">
                <a class="btn btn-secondary" href="<?= e(url('producer-detail.php?id=1')) ?>">
                    Profili Gör
                </a>

                <button class="btn btn-danger" type="button" disabled>
                    Takibi Bırak
                </button>
            </div>
        </article>

        <article class="card producer-card">
            <div class="producer-logo-placeholder">
                Logo
            </div>

            <h2>Yeşil Bahçe</h2>

            <p>Isparta / Eğirdir</p>
            <p>Sezonluk meyve ürünleri için takip ediliyor.</p>

            <div class="producer-meta">
                <span>⭐ 4.6</span>
                <span>Aktif ürün: 8</span>
            </div>

            <div class="producer-actions">
                <a class="btn btn-secondary" href="<?= e(url('producer-detail.php?id=2')) ?>">
                    Profili Gör
                </a>

                <button class="btn btn-danger" type="button" disabled>
                    Takibi Bırak
                </button>
            </div>
        </article>

        <article class="card empty-card">
            <h2>Takip sistemi yakında aktif</h2>

            <p>
                Üretici profilindeki takip butonu bağlandığında takip edilen üreticiler burada görünecek.
            </p>

            <a class="btn" href="<?= e(url('producers.php')) ?>">
                Üreticileri İncele
            </a>
        </article>
    </section>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .producer-card h2,
    .empty-card h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .producer-card p,
    .empty-card p {
        color: #526052;
        line-height: 1.5;
    }

    .producer-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 22px;
    }

    .producer-logo-placeholder {
        width: 82px;
        height: 82px;
        border-radius: 50%;
        background: #e8f3e9;
        color: #2f7d3d;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        margin-bottom: 16px;
    }

    .producer-meta {
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
        color: #526052;
        margin: 14px 0;
    }

    .producer-actions {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .btn-danger {
        background: #ffe8e8;
        color: #9b111e;
    }

    .btn-danger:hover {
        background: #ffd4d4;
    }

    button:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    .empty-card {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    @media (max-width: 900px) {
        .producer-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>