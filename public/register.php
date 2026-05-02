<?php

require_once __DIR__ . '/../app/bootstrap.php';

GuestMiddleware::handle();

$controller = new AuthController();

if (is_post()) {
    $controller->register();
}

$formErrors = errors();
$selectedRole = old('role', ROLE_CONSUMER);
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>EkineraGo - Kayıt Ol</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7f2;
            margin: 0;
            padding: 40px;
        }

        .auth-box {
            max-width: 520px;
            margin: 0 auto;
            background: #fff;
            padding: 28px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0,0,0,.08);
        }

        h1 {
            margin-top: 0;
            color: #245c2f;
        }

        label {
            display: block;
            margin-top: 14px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            box-sizing: border-box;
            margin-top: 6px;
            padding: 11px;
            border: 1px solid #d5dccf;
            border-radius: 9px;
        }

        button {
            width: 100%;
            margin-top: 20px;
            padding: 13px;
            border: none;
            border-radius: 9px;
            background: #2f7d3d;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }

        .error {
            color: #b00020;
            font-size: 14px;
            margin-top: 5px;
        }

        .flash-error {
            background: #ffe8e8;
            color: #9b111e;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .producer-fields {
            display: <?= $selectedRole === ROLE_PRODUCER ? 'block' : 'none' ?>;
        }

        .link {
            margin-top: 16px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="auth-box">
    <h1>EkineraGo Kayıt</h1>

    <?php if ($message = flash_get('error')): ?>
        <div class="flash-error"><?= e($message) ?></div>
    <?php endif; ?>

    <?php if (!empty($formErrors['general'])): ?>
        <div class="flash-error"><?= e($formErrors['general'][0]) ?></div>
    <?php endif; ?>

    <form method="POST" action="<?= e(url('register.php')) ?>">
        <?= csrf_field() ?>

        <label for="role">Hesap Tipi</label>
        <select name="role" id="role">
            <option value="<?= ROLE_CONSUMER ?>" <?= $selectedRole === ROLE_CONSUMER ? 'selected' : '' ?>>
                Tüketici
            </option>
            <option value="<?= ROLE_PRODUCER ?>" <?= $selectedRole === ROLE_PRODUCER ? 'selected' : '' ?>>
                Üretici
            </option>
        </select>
        <?php if (!empty($formErrors['role'])): ?>
            <div class="error"><?= e($formErrors['role'][0]) ?></div>
        <?php endif; ?>

        <label for="full_name">Ad Soyad</label>
        <input type="text" name="full_name" id="full_name" value="<?= e((string) old('full_name')) ?>">
        <?php if (!empty($formErrors['full_name'])): ?>
            <div class="error"><?= e($formErrors['full_name'][0]) ?></div>
        <?php endif; ?>

        <label for="email">E-posta</label>
        <input type="email" name="email" id="email" value="<?= e((string) old('email')) ?>">
        <?php if (!empty($formErrors['email'])): ?>
            <div class="error"><?= e($formErrors['email'][0]) ?></div>
        <?php endif; ?>

        <label for="phone">Telefon</label>
        <input type="text" name="phone" id="phone" value="<?= e((string) old('phone')) ?>">

        <label for="whatsapp_phone">WhatsApp Telefon</label>
        <input type="text" name="whatsapp_phone" id="whatsapp_phone" value="<?= e((string) old('whatsapp_phone')) ?>">

        <div class="producer-fields" id="producerFields">
            <label for="store_name">Market / Çiftlik Adı</label>
            <input type="text" name="store_name" id="store_name" value="<?= e((string) old('store_name')) ?>">
            <?php if (!empty($formErrors['store_name'])): ?>
                <div class="error"><?= e($formErrors['store_name'][0]) ?></div>
            <?php endif; ?>

            <label for="description">Üretici Açıklaması</label>
            <textarea name="description" id="description" rows="3"><?= e((string) old('description')) ?></textarea>
        </div>

        <label for="password">Şifre</label>
        <input type="password" name="password" id="password">
        <?php if (!empty($formErrors['password'])): ?>
            <div class="error"><?= e($formErrors['password'][0]) ?></div>
        <?php endif; ?>

        <label for="password_confirmation">Şifre Tekrarı</label>
        <input type="password" name="password_confirmation" id="password_confirmation">
        <?php if (!empty($formErrors['password_confirmation'])): ?>
            <div class="error"><?= e($formErrors['password_confirmation'][0]) ?></div>
        <?php endif; ?>

        <button type="submit">Kayıt Ol</button>
    </form>

    <div class="link">
        Zaten hesabın var mı?
        <a href="<?= e(url('login.php')) ?>">Giriş yap</a>
    </div>
</div>

<script>
    const roleSelect = document.getElementById('role');
    const producerFields = document.getElementById('producerFields');

    roleSelect.addEventListener('change', function () {
        producerFields.style.display = this.value === 'producer' ? 'block' : 'none';
    });
</script>

</body>
</html>
<?php clear_old(); ?>