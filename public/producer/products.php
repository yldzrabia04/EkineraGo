<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$controller = new ProductController();

if (is_post()) {
    $action = $_POST['_action'] ?? '';

    if ($action === 'delete') {
        $controller->delete();
    }

    if ($action === 'change_status') {
        $controller->changeStatus();
    }

    flash_error('Geçersiz ürün işlemi.');
    redirect('producer/products.php');
}

$userId = currentUserId();
$data = $controller->producerIndexData((int) $userId);
$products = $data['products'] ?? [];

$pageTitle = 'Ürünlerim';
$bodyClass = 'page-producer-products';

require APP_PATH . '/Views/layouts/header.php';

function producer_product_status_label(string $status): string
{
    return match ($status) {
        'active' => 'Aktif',
        'draft' => 'Taslak',
        'sold_out' => 'Stokta Yok',
        'paused' => 'Pasif',
        'deleted' => 'Silindi',
        default => 'Bilinmiyor',
    };
}

function producer_product_status_badge(string $status): string
{
    return match ($status) {
        'active' => 'badge-success',
        'draft' => 'badge-info',
        'sold_out' => 'badge-warning',
        'paused' => 'badge-muted',
        'deleted' => 'badge-danger',
        default => 'badge-muted',
    };
}

function producer_unit_label(string $unit): string
{
    return match ($unit) {
        'kg' => 'kg',
        'piece' => 'adet',
        'bunch' => 'demet',
        'box' => 'kasa',
        default => $unit,
    };
}
?>

<main class="container">
    <section class="card page-heading">
        <div>
            <h1>Ürünlerim</h1>

            <p>
                Eklediğin ürünleri buradan görüntüleyebilir, düzenleyebilir, pasifleştirebilir veya silebilirsin.
            </p>
        </div>

        <a class="btn" href="<?= e(url('producer/product-create.php')) ?>">
            Yeni Ürün Ekle
        </a>
    </section>

    <section class="card table-card">
        <?php if (empty($products)): ?>
            <div class="empty-state">
                <h2>Henüz ürün eklenmedi</h2>
                <p>İlk ürününü ekleyerek üretici mini-marketini oluşturmaya başlayabilirsin.</p>
                <a class="btn" href="<?= e(url('producer/product-create.php')) ?>">Ürün Ekle</a>
            </div>
        <?php else: ?>
            <table>
                <thead>
                    <tr>
                        <th>Ürün</th>
                        <th>Kategori</th>
                        <th>Fiyat</th>
                        <th>Stok</th>
                        <th>Durum</th>
                        <th>Hasat</th>
                        <th>İşlem</th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($products as $product): ?>
                        <?php
                            $status = $product['status'] ?? 'draft';
                            $unit = producer_unit_label($product['unit_type'] ?? 'kg');
                        ?>
                        <tr>
                            <td>
                                <strong><?= e($product['title'] ?? 'Ürün') ?></strong>
                            </td>

                            <td><?= e($product['category_name'] ?? '-') ?></td>

                            <td><?= e(formatMoney($product['price'] ?? 0)) ?> / <?= e($unit) ?></td>

                            <td>
                                <?= e((string) ($product['stock_quantity'] ?? 0)) ?>
                                <?= e($unit) ?>
                            </td>

                            <td>
                                <span class="badge <?= e(producer_product_status_badge($status)) ?>">
                                    <?= e(producer_product_status_label($status)) ?>
                                </span>
                            </td>

                            <td>
                                <?= !empty($product['harvest_date']) ? e(date('d.m.Y', strtotime($product['harvest_date']))) : '-' ?>
                            </td>

                            <td>
                                <div class="action-group">
                                    <a class="small-link" href="<?= e(url('producer/product-edit.php?id=' . $product['id'])) ?>">
                                        Düzenle
                                    </a>

                                    <a class="small-link" href="<?= e(url('product-detail.php?id=' . $product['id'])) ?>">
                                        Gör
                                    </a>

                                    <?php if ($status === 'active'): ?>
                                        <form method="POST" action="<?= e(url('producer/products.php')) ?>">
                                            <?= csrf_field() ?>
                                            <input type="hidden" name="_action" value="change_status">
                                            <input type="hidden" name="product_id" value="<?= e((string) $product['id']) ?>">
                                            <input type="hidden" name="status" value="paused">
                                            <button class="table-button" type="submit">Pasifleştir</button>
                                        </form>
                                    <?php else: ?>
                                        <form method="POST" action="<?= e(url('producer/products.php')) ?>">
                                            <?= csrf_field() ?>
                                            <input type="hidden" name="_action" value="change_status">
                                            <input type="hidden" name="product_id" value="<?= e((string) $product['id']) ?>">
                                            <input type="hidden" name="status" value="active">
                                            <button class="table-button" type="submit">Aktif Yap</button>
                                        </form>
                                    <?php endif; ?>

                                    <form method="POST" action="<?= e(url('producer/products.php')) ?>" onsubmit="return confirm('Bu ürünü silmek istediğine emin misin?');">
                                        <?= csrf_field() ?>
                                        <input type="hidden" name="_action" value="delete">
                                        <input type="hidden" name="product_id" value="<?= e((string) $product['id']) ?>">
                                        <button class="table-button danger" type="submit">Sil</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php endif; ?>
    </section>
</main>

<style>
    .page-heading {
        margin-bottom: 22px;
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: center;
    }

    .page-heading h1 {
        margin-top: 0;
        color: #245c2f;
    }

    .page-heading p {
        color: #526052;
        line-height: 1.5;
        margin-bottom: 0;
    }

    .table-card {
        overflow-x: auto;
    }

    .empty-state {
        text-align: center;
        padding: 30px;
    }

    .empty-state h2 {
        color: #245c2f;
        margin-top: 0;
    }

    .empty-state p {
        color: #526052;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th,
    td {
        text-align: left;
        padding: 14px;
        border-bottom: 1px solid #edf1ea;
        vertical-align: top;
    }

    th {
        color: #245c2f;
        background: #f8fbf6;
    }

    .badge {
        display: inline-block;
        padding: 5px 9px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: bold;
        white-space: nowrap;
    }

    .badge-success {
        background: #e7f7e8;
        color: #236b2c;
    }

    .badge-warning {
        background: #fff5d6;
        color: #8a6200;
    }

    .badge-info {
        background: #e8f1ff;
        color: #1f4e8c;
    }

    .badge-muted {
        background: #edf1ea;
        color: #526052;
    }

    .badge-danger {
        background: #ffe8e8;
        color: #9b111e;
    }

    .action-group {
        display: flex;
        gap: 8px;
        flex-wrap: wrap;
        align-items: center;
    }

    .small-link,
    .table-button {
        color: #2f7d3d;
        font-weight: bold;
        text-decoration: none;
        border: none;
        background: transparent;
        cursor: pointer;
        padding: 0;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    .table-button.danger {
        color: #9b111e;
    }

    @media (max-width: 768px) {
        .page-heading {
            align-items: flex-start;
            flex-direction: column;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>