<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$pageTitle = 'Taleplerim';
$bodyClass = 'page-consumer-demands';

require APP_PATH . '/Views/layouts/header.php';
?>

<main class="container">
    <section class="card page-heading">
        <h1>Taleplerim</h1>

        <p>
            Bulunduğun şehirde bulamadığın ürünler için talep oluşturabileceğin ekran.
            DemandService bağlandığında talepler veritabanına kaydedilecek.
        </p>
    </section>

    <section class="demand-layout">
        <div class="card">
            <h2>Yeni Talep Oluştur</h2>

            <form method="POST" action="#" class="demand-form">
                <?= csrf_field() ?>

                <div class="form-group">
                    <label for="product_name">Ürün Adı</label>
                    <input type="text" id="product_name" name="product_name" placeholder="Örn: Avokado">
                </div>

                <div class="form-group">
                    <label for="desired_quantity">İstenen Miktar</label>
                    <input type="number" id="desired_quantity" name="desired_quantity" step="0.01" placeholder="Örn: 5">
                </div>

                <div class="form-group">
                    <label for="unit_type">Birim</label>
                    <select id="unit_type" name="unit_type">
                        <option value="kg">kg</option>
                        <option value="piece">adet</option>
                        <option value="bunch">demet</option>
                        <option value="box">kasa</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="province_id">İl</label>
                    <select id="province_id" name="province_id">
                        <option value="">İl seç</option>
                        <option value="6">Ankara</option>
                        <option value="7">Antalya</option>
                        <option value="34">İstanbul</option>
                        <option value="35">İzmir</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="district_id">İlçe</label>
                    <select id="district_id" name="district_id">
                        <option value="">İlçe seç</option>
                        <option value="1">Çankaya</option>
                        <option value="2">Kumluca</option>
                        <option value="3">Menemen</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="note">Not</label>
                    <textarea id="note" name="note" rows="4" placeholder="Ne zaman, ne kadar ve nasıl teslim almak istediğini yaz..."></textarea>
                </div>

                <button class="btn" type="button" disabled>
                    Talep Oluşturma Yakında Aktif
                </button>
            </form>
        </div>

        <div class="card">
            <h2>Mevcut Talepler</h2>

            <div class="demand-item">
                <strong>Avokado</strong>
                <p>Ankara / Çankaya · 5 kg</p>
                <span class="badge badge-warning">Açık</span>
            </div>

            <div class="demand-item">
                <strong>Organik Çilek</strong>
                <p>İstanbul / Kadıköy · 3 kg</p>
                <span class="badge badge-success">Yanıtlandı</span>
            </div>
        </div>
    </section>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1,
    .demand-layout h2 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p,
    .demand-item p {
        color: #526052;
        line-height: 1.5;
    }

    .demand-layout {
        display: grid;
        grid-template-columns: 1.2fr .8fr;
        gap: 22px;
    }

    .demand-form label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #245c2f;
    }

    .form-group {
        margin-bottom: 16px;
    }

    .demand-form input,
    .demand-form select,
    .demand-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .demand-item {
        padding: 16px 0;
        border-bottom: 1px solid #edf1ea;
    }

    .demand-item:last-child {
        border-bottom: none;
    }

    .badge {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .badge-warning {
        background: #fff5d6;
        color: #8a6200;
    }

    button:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    @media (max-width: 900px) {
        .demand-layout {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>