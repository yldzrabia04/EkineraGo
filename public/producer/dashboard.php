<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$controller = new ProducerController();

$producerId = (int) currentUserId();
$data = $controller->dashboardData($producerId);

$summary = $data['summary'] ?? [];
$latestProducts = $data['latest_products'] ?? [];

$pageTitle = 'Üretici Paneli';
$bodyClass = 'page-producer-dashboard';

require APP_PATH . '/Views/layouts/header.php';

$user = currentUser();

if (!function_exists('dashboard_product_status_label')) {
    function dashboard_product_status_label(string $status): string
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
}

if (!function_exists('dashboard_product_status_badge')) {
    function dashboard_product_status_badge(string $status): string
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
}

if (!function_exists('dashboard_unit_label')) {
    function dashboard_unit_label(string $unit): string
    {
        return match ($unit) {
            'kg' => 'kg',
            'piece' => 'adet',
            'bunch' => 'demet',
            'box' => 'kasa',
            default => $unit,
        };
    }
}
?>

<main class="container">
    <section class="card dashboard-welcome">
        <h1>Üretici Paneli</h1>

        <p>
            Hoş geldin,
            <strong><?= e($user['full_name'] ?? 'Üretici') ?></strong>.
            Buradan ürünlerini yönetebilir, yeni ürün ekleyebilir ve siparişlerini takip edebilirsin.
        </p>
    </section>

    <section class="stats-grid">
        <div class="card stat-card">
            <span>Toplam Ürün</span>
            <strong><?= e((string) ($summary['total_products'] ?? 0)) ?></strong>
        </div>

        <div class="card stat-card">
            <span>Stokta Olmayan</span>
            <strong><?= e((string) ($summary['sold_out_products'] ?? 0)) ?></strong>
        </div>

        <div class="card stat-card">
            <span>Toplam Sipariş</span>
            <strong><?= e((string) ($summary['total_orders'] ?? 0)) ?></strong>
        </div>

        <div class="card stat-card">
            <span>Toplam Gelir</span>
            <strong><?= e(formatMoney($summary['total_revenue'] ?? 0)) ?></strong>
        </div>
    </section>

    <section class="dashboard-grid">
        <div class="card">
            <h2>Ürünlerim</h2>

            <p>
                Aktif ürünlerini listele, düzenle veya pasifleştir.
            </p>

            <a class="btn" href="<?= e(url('producer/products.php')) ?>">
                Ürünleri Gör
            </a>
        </div>

        <div class="card">
            <h2>Yeni Ürün Ekle</h2>

            <p>
                Ürün adı, kategori, fiyat, stok ve hasat tarihi bilgilerini gir.
            </p>

            <a class="btn" href="<?= e(url('producer/product-create.php')) ?>">
                Ürün Ekle
            </a>
        </div>

        <div class="card">
            <h2>Gelen Siparişler</h2>

            <p>
                Gelen siparişleri ve sipariş durumlarını takip et.
            </p>

            <a class="btn btn-secondary" href="<?= e(url('producer/orders.php')) ?>">
                Siparişlere Git
            </a>
        </div>
    </section>

    <section class="card latest-products-card">
        <div class="section-title-row">
            <div>
                <h2>Son Eklenen Ürünler</h2>

                <p>
                    En son oluşturduğun veya güncellediğin ürünler burada görünür.
                </p>
            </div>

            <a class="btn btn-secondary" href="<?= e(url('producer/products.php')) ?>">
                Tümünü Gör
            </a>
        </div>

        <?php if (empty($latestProducts)): ?>
            <div class="empty-state">
                <h3>Henüz ürün yok</h3>

                <p>
                    Ürün ekleyerek üretici panelini kullanmaya başlayabilirsin.
                </p>

                <a class="btn" href="<?= e(url('producer/product-create.php')) ?>">
                    İlk Ürünü Ekle
                </a>
            </div>
        <?php else: ?>
            <div class="latest-table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>Ürün</th>
                            <th>Kategori</th>
                            <th>Fiyat</th>
                            <th>Stok</th>
                            <th>Durum</th>
                            <th>İşlem</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($latestProducts as $product): ?>
                            <?php
                                $status = $product['status'] ?? 'draft';
                                $unit = dashboard_unit_label($product['unit_type'] ?? 'kg');
                            ?>

                            <tr>
                                <td>
                                    <strong><?= e($product['title'] ?? 'Ürün') ?></strong>
                                </td>

                                <td><?= e($product['category_name'] ?? '-') ?></td>

                                <td>
                                    <?= e(formatMoney($product['price'] ?? 0)) ?>
                                    /
                                    <?= e($unit) ?>
                                </td>

                                <td>
                                    <?= e((string) ($product['stock_quantity'] ?? 0)) ?>
                                    <?= e($unit) ?>
                                </td>

                                <td>
                                    <span class="badge <?= e(dashboard_product_status_badge($status)) ?>">
                                        <?= e(dashboard_product_status_label($status)) ?>
                                    </span>
                                </td>

                                <td>
                                    <a class="small-link" href="<?= e(url('producer/product-edit.php?id=' . $product['id'])) ?>">
                                        Düzenle
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        <?php endif; ?>
    </section>
</main>

<style>
    .dashboard-welcome {
        margin-bottom: 22px;
    }

    .dashboard-welcome h1,
    .dashboard-grid h2,
    .latest-products-card h2,
    .empty-state h3 {
        margin-top: 0;
        color: #245c2f;
    }

    .dashboard-welcome p,
    .dashboard-grid p,
    .latest-products-card p,
    .empty-state p {
        color: #526052;
        line-height: 1.5;
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 18px;
        margin-bottom: 22px;
    }

    .stat-card span {
        display: block;
        color: #526052;
        font-weight: bold;
        margin-bottom: 8px;
    }

    .stat-card strong {
        display: block;
        color: #245c2f;
        font-size: 28px;
    }

    .dashboard-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 22px;
        margin-bottom: 22px;
    }

    .dashboard-grid p {
        min-height: 48px;
    }

    .section-title-row {
        display: flex;
        justify-content: space-between;
        gap: 18px;
        align-items: flex-start;
        margin-bottom: 18px;
    }

    .latest-table-wrap {
        overflow-x: auto;
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

    .small-link {
        color: #2f7d3d;
        font-weight: bold;
        text-decoration: none;
    }

    .empty-state {
        text-align: center;
        padding: 28px;
        border-radius: 14px;
        background: #f8fbf6;
    }

    @media (max-width: 1000px) {
        .stats-grid,
        .dashboard-grid {
            grid-template-columns: 1fr 1fr;
        }
    }

    @media (max-width: 700px) {
        .stats-grid,
        .dashboard-grid {
            grid-template-columns: 1fr;
        }

        .section-title-row {
            flex-direction: column;
        }

        .dashboard-grid p {
            min-height: auto;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>