<?php



require_once __DIR__ . '/../app/bootstrap.php';

GuestMiddleware::handle();

$controller = new AuthController();

if (is_post()) {
    $controller->login();
}

$formErrors = errors();
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>EkineraGo - Giriş Yap</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7f2;
            margin: 0;
            padding: 40px;
        }

        .auth-box {
            max-width: 420px;
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

        input {
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

        .flash-success {
            background: #e7f7e8;
            color: #236b2c;
            padding: 10px;
            border-radius: 8px;
            margin-bottom: 12px;
        }

        .link {
            margin-top: 16px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="auth-box">
    <h1>EkineraGo Giriş</h1>

    <?php if ($message = flash_get('success')): ?>
        <div class="flash-success"><?= e($message) ?></div>
    <?php endif; ?>

    <?php if ($message = flash_get('error')): ?>
        <div class="flash-error"><?= e($message) ?></div>
    <?php endif; ?>

    <?php if (!empty($formErrors['general'])): ?>
        <div class="flash-error"><?= e($formErrors['general'][0]) ?></div>
    <?php endif; ?>

    <form method="POST" action="<?= e(url('login.php')) ?>">
        <?= csrf_field() ?>

        <label for="email">E-posta</label>
        <input type="email" name="email" id="email" value="<?= e((string) old('email')) ?>">
        <?php if (!empty($formErrors['email'])): ?>
            <div class="error"><?= e($formErrors['email'][0]) ?></div>
        <?php endif; ?>

        <label for="password">Şifre</label>
        <input type="password" name="password" id="password">
        <?php if (!empty($formErrors['password'])): ?>
            <div class="error"><?= e($formErrors['password'][0]) ?></div>
        <?php endif; ?>

        <button type="submit">Giriş Yap</button>
    </form>

    <div class="link">
        Hesabın yok mu?
        <a href="<?= e(url('register.php')) ?>">Kayıt ol</a>
    </div>
</div>

</body>
</html>
<?php clear_old(); ?>