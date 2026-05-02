<?php

$pageTitle = $pageTitle ?? APP_NAME;
$bodyClass = $bodyClass ?? '';
?>
<!doctype html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($pageTitle) ?> - EkineraGo</title>
    <link rel="stylesheet" href="<?= e(asset('css/layout.css')) ?>">
</head>
<body class="<?= e($bodyClass) ?>">

<?php require APP_PATH . '/Views/layouts/navbar.php'; ?>

<?php if ($message = flash_get('success')): ?>
    <div class="flash flash-success">
        <?= e($message) ?>
    </div>
<?php endif; ?>

<?php if ($message = flash_get('error')): ?>
    <div class="flash flash-error">
        <?= e($message) ?>
    </div>
<?php endif; ?>

<?php if ($message = flash_get('warning')): ?>
    <div class="flash flash-warning">
        <?= e($message) ?>
    </div>
<?php endif; ?>

<?php if ($message = flash_get('info')): ?>
    <div class="flash flash-info">
        <?= e($message) ?>
    </div>
<?php endif; ?>