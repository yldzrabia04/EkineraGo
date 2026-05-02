<?php

require_once __DIR__ . '/../../app/bootstrap.php';

ProducerMiddleware::handle();

$controller = new ProductController();

if (is_post()) {
    $controller->store();
}

$data = $controller->createData();
$categories = $data['categories'] ?? [];
$formErrors = errors();

$pageTitle = 'Ürün Ekle';
$bodyClass = 'page-product-create';

require APP_PATH . '/Views/layouts/header.php';
?>

<main class="container">
    <section class="card page-heading">
        <h1>Yeni Ürün Ekle</h1>

        <p>
            Ürün adı, kategori, fiyat, stok, hasat tarihi ve ürün fotoğrafı bilgilerini girerek
            yeni ürününü yayınlayabilirsin.
        </p>
    </section>

    <?php if (!empty($formErrors['general'])): ?>
        <section class="card form-alert">
            <?= e($formErrors['general'][0]) ?>
        </section>
    <?php endif; ?>

    <section class="card">
        <form method="POST" action="<?= e(url('producer/product-create.php')) ?>" enctype="multipart/form-data" class="product-form">
            <?= csrf_field() ?>

            <div class="form-grid">
                <div class="form-group">
                    <label for="title">Ürün Adı</label>
                    <input
                        type="text"
                        id="title"
                        name="title"
                        value="<?= e((string) old('title')) ?>"
                        placeholder="Örn: Kumluca Domatesi"
                    >
                    <?php if (!empty($formErrors['title'])): ?>
                        <div class="field-error"><?= e($formErrors['title'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="category_id">Kategori</label>
                    <select id="category_id" name="category_id">
                        <option value="">Kategori seç</option>

                        <?php foreach ($categories as $category): ?>
                            <option
                                value="<?= e((string) $category['id']) ?>"
                                <?= (string) old('category_id') === (string) $category['id'] ? 'selected' : '' ?>
                            >
                                <?= e($category['name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                    <?php if (!empty($formErrors['category_id'])): ?>
                        <div class="field-error"><?= e($formErrors['category_id'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="price">Fiyat</label>
                    <input
                        type="number"
                        id="price"
                        name="price"
                        step="0.01"
                        min="0"
                        value="<?= e((string) old('price')) ?>"
                        placeholder="35.00"
                    >
                    <?php if (!empty($formErrors['price'])): ?>
                        <div class="field-error"><?= e($formErrors['price'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="unit_type">Birim</label>
                    <select id="unit_type" name="unit_type">
                        <option value="kg" <?= old('unit_type', 'kg') === 'kg' ? 'selected' : '' ?>>kg</option>
                        <option value="piece" <?= old('unit_type') === 'piece' ? 'selected' : '' ?>>adet</option>
                        <option value="bunch" <?= old('unit_type') === 'bunch' ? 'selected' : '' ?>>demet</option>
                        <option value="box" <?= old('unit_type') === 'box' ? 'selected' : '' ?>>kasa</option>
                    </select>
                    <?php if (!empty($formErrors['unit_type'])): ?>
                        <div class="field-error"><?= e($formErrors['unit_type'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="stock_quantity">Stok Miktarı</label>
                    <input
                        type="number"
                        id="stock_quantity"
                        name="stock_quantity"
                        step="0.01"
                        min="0"
                        value="<?= e((string) old('stock_quantity')) ?>"
                        placeholder="100"
                    >
                    <?php if (!empty($formErrors['stock_quantity'])): ?>
                        <div class="field-error"><?= e($formErrors['stock_quantity'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="status">Durum</label>
                    <select id="status" name="status">
                        <option value="active" <?= old('status', 'active') === 'active' ? 'selected' : '' ?>>Aktif</option>
                        <option value="draft" <?= old('status') === 'draft' ? 'selected' : '' ?>>Taslak</option>
                        <option value="paused" <?= old('status') === 'paused' ? 'selected' : '' ?>>Pasif</option>
                        <option value="sold_out" <?= old('status') === 'sold_out' ? 'selected' : '' ?>>Stokta Yok</option>
                    </select>
                    <?php if (!empty($formErrors['status'])): ?>
                        <div class="field-error"><?= e($formErrors['status'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="harvest_date">Hasat Tarihi</label>
                    <input
                        type="date"
                        id="harvest_date"
                        name="harvest_date"
                        value="<?= e((string) old('harvest_date')) ?>"
                    >
                </div>

                <div class="form-group">
                    <label for="image">Ürün Fotoğrafı</label>
                    <input type="file" id="image" name="image" accept="image/*">
                </div>

                <div class="form-group full checkbox-group">
                    <label>
                        <input
                            type="checkbox"
                            name="is_preorder_enabled"
                            value="1"
                            <?= old('is_preorder_enabled') ? 'checked' : '' ?>
                        >
                        Ön siparişe açık
                    </label>
                </div>

                <div class="form-group">
                    <label for="preorder_deadline">Ön Sipariş Son Tarihi</label>
                    <input
                        type="date"
                        id="preorder_deadline"
                        name="preorder_deadline"
                        value="<?= e((string) old('preorder_deadline')) ?>"
                    >
                    <?php if (!empty($formErrors['preorder_deadline'])): ?>
                        <div class="field-error"><?= e($formErrors['preorder_deadline'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group">
                    <label for="min_preorder_quantity">Minimum Ön Sipariş Miktarı</label>
                    <input
                        type="number"
                        id="min_preorder_quantity"
                        name="min_preorder_quantity"
                        step="0.01"
                        min="0"
                        value="<?= e((string) old('min_preorder_quantity')) ?>"
                        placeholder="Örn: 2"
                    >
                    <?php if (!empty($formErrors['min_preorder_quantity'])): ?>
                        <div class="field-error"><?= e($formErrors['min_preorder_quantity'][0]) ?></div>
                    <?php endif; ?>
                </div>

                <div class="form-group full">
                    <label for="description">Açıklama</label>
                    <textarea id="description" name="description" rows="4" placeholder="Ürün açıklaması..."><?= e((string) old('description')) ?></textarea>
                </div>
            </div>

            <div class="form-actions">
                <button class="btn" type="submit">
                    Ürünü Kaydet
                </button>

                <a class="btn btn-secondary" href="<?= e(url('producer/products.php')) ?>">
                    Ürünlerime Dön
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

    .form-alert {
        margin-bottom: 22px;
        background: #ffe8e8;
        color: #9b111e;
        font-weight: bold;
    }

    .product-form label {
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

    .product-form input,
    .product-form select,
    .product-form textarea {
        width: 100%;
        padding: 11px;
        border: 1px solid #d5dccf;
        border-radius: 9px;
        font-family: Arial, sans-serif;
    }

    .checkbox-group label {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .checkbox-group input {
        width: auto;
    }

    .field-error {
        margin-top: 6px;
        color: #9b111e;
        font-size: 14px;
    }

    .form-actions {
        margin-top: 22px;
        display: flex;
        gap: 12px;
        flex-wrap: wrap;
    }

    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<?php require APP_PATH . '/Views/layouts/footer.php'; ?>
<?php clear_old(); ?>