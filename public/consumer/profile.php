<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ConsumerMiddleware::handle();

$pageTitle = 'Profilim';
$bodyClass = 'page-consumer-profile';

require APP_PATH . '/Views/layouts/header.php';

$user = currentUser();
?>

<main class="container">
    <section class="card page-heading">
        <h1>Profilim</h1>

        <p>
            Tüketici profil bilgileri burada düzenlenecek. Profil güncelleme servisi
            bağlandığında bilgiler veritabanına kaydedilecek.
        </p>
    </section>

    <section class="card">
        <form method="POST" action="#" class="profile-form">
            <?= csrf_field() ?>

            <div class="form-grid">
                <div class="form-group">
                    <label for="full_name">Ad Soyad</label>
                    <input type="text" id="full_name" name="full_name" value="<?= e($user['full_name'] ?? '') ?>">
                </div>

                <div class="form-group">
                    <label for="email">E-posta</label>
                    <input type="email" id="email" name="email" value="<?= e($user['email'] ?? '') ?>" readonly>
                </div>

                <div class="form-group">
                    <label for="phone">Telefon</label>
                    <input type="text" id="phone" name="phone" placeholder="0555 000 00 00">
                </div>

                <div class="form-group">
                    <label for="whatsapp_phone">WhatsApp Telefon</label>
                    <input type="text" id="whatsapp_phone" name="whatsapp_phone" placeholder="0555 000 00 00">
                </div>

                <div class="form-group">
                    <label for="province_id">İl</label>
                    <select id="province_id" name="province_id">
                        <option value="">İl seç</option>
                        <option value="7">Antalya</option>
                        <option value="34">İstanbul</option>
                        <option value="35">İzmir</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="district_id">İlçe</label>
                    <select id="district_id" name="district_id">
                        <option value="">İlçe seç</option>
                        <option value="1">Kumluca</option>
                        <option value="2">Çankaya</option>
                        <option value="3">Menemen</option>
                    </select>
                </div>

                <div class="form-group full">
                    <label for="address_text">Adres</label>
                    <textarea id="address_text" name="address_text" rows="4" placeholder="Açık adres bilgisi..."></textarea>
                </div>
            </div>

            <div class="form-actions">
                <button class="btn" type="button" disabled>
                    Profil Güncelleme Yakında Aktif
                </button>

                <a class="btn btn-secondary" href="<?= e(url('consumer/dashboard.php')) ?>">
                    Panele Dön
                </a>
            </div>
        </form>
    </section>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
    }

    .page-heading h1 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p {
        color: #526052;
        line-height: 1.5;
    }

    .profile-form label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
        color: #245c2f;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
    }

    .form-group.full {
        grid-column: 1 / -1;
    }

    .profile-form input,
    .profile-form select,
    .profile-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .profile-form input[readonly] {
        background: #f8fbf6;
        color: #718071;
    }

    .form-actions {
        margin-top: 22px;
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
    }

    button:disabled {
        opacity: .65;
        cursor: not-allowed;
    }

    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>