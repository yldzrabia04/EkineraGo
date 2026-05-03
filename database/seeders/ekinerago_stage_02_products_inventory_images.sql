/*
EkineraGo büyük demo seed — Aşama 02
Amaç: 35 üreticiye üretici başına 10-30 ürün/ilan, görsel ve stok hareketi eklemek.
Kategori yalnızca: 1=Sebze, 2=Meyve, 3=Diğer.
Önce Aşama 00 ve 01 çalıştırılmalı.
*/
USE ekinerago;
SET NAMES utf8mb4;


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'kumluca-bereket-ciftligi-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 105.47, 234.126, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 678, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 234.126, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'kumluca-bereket-ciftligi-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 74.00, 325.582, '2026-04-30', 1, '2026-05-13', 20.008, 'kg', 'active', 116, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 325.582, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'kumluca-bereket-ciftligi-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.45, 234.858, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 408, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 234.858, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Dut', 'kumluca-bereket-ciftligi-sezonluk-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 73.54, 182.810, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 210, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 182.810, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'kumluca-bereket-ciftligi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.58, 272.640, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 690, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 272.640, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'kumluca-bereket-ciftligi-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.86, 209.170, '2026-05-01', 1, '2026-05-07', 20.711, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 209.170, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Avokado', 'kumluca-bereket-ciftligi-dogal-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 43.85, 545.088, '2026-04-22', 1, '2026-05-21', 11.704, 'kg', 'active', 693, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-dogal-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 545.088, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-dogal-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Limon', 'kumluca-bereket-ciftligi-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.74, 173.449, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 633, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 173.449, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'kumluca-bereket-ciftligi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.64, 226.518, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 128, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 226.518, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'kumluca-bereket-ciftligi-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 96.76, 130.307, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 467, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 130.307, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'kumluca-bereket-ciftligi-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.95, 568.629, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 601, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 568.629, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'kumluca-bereket-ciftligi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 83.93, 391.532, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 691, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 391.532, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Üzüm', 'kumluca-bereket-ciftligi-sezonluk-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.60, 268.713, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 217, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 268.713, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'kumluca-bereket-ciftligi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.83, 347.638, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 191, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 347.638, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'kumluca-bereket-ciftligi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 20.43, 498.610, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 648, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 498.610, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Nar', 'kumluca-bereket-ciftligi-gunluk-hasat-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.02, 226.971, '2026-04-23', 1, '2026-05-13', 22.316, 'kg', 'active', 115, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-gunluk-hasat-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 226.971, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-gunluk-hasat-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Karpuz', 'kumluca-bereket-ciftligi-koy-tipi-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 20.25, 509.873, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 166, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-koy-tipi-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 509.873, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-koy-tipi-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'kumluca-bereket-ciftligi-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 14.55, 215.404, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 468, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 215.404, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Havuç', 'kumluca-bereket-ciftligi-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.44, 407.422, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 443, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 407.422, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'kumluca-bereket-ciftligi-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.80, 261.526, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 288, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 261.526, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Gezen Tavuk Yumurtası', 'kumluca-bereket-ciftligi-sezonluk-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 3.99, 534.216, '2026-04-25', 1, '2026-05-07', 8.037, 'kg', 'active', 67, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 534.216, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sezonluk-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'kumluca-bereket-ciftligi-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.57, 169.482, '2026-04-17', 1, '2026-05-10', 18.914, 'kg', 'active', 619, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 169.482, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'kumluca-bereket-ciftligi-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 20.96, 467.838, '2026-04-19', 1, '2026-05-09', 17.498, 'kg', 'active', 397, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 467.838, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'kumluca-bereket-ciftligi-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.88, 395.375, '2026-04-29', 1, '2026-05-16', 20.613, 'kg', 'active', 146, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 395.375, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ahmet.torun@ekinerago.test' AND p.slug = 'kumluca-bereket-ciftligi-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Portakal', 'sigacik-mandalina-bahcesi-koy-tipi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.12, 135.733, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 306, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-koy-tipi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 135.733, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-koy-tipi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'sigacik-mandalina-bahcesi-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.51, 191.215, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 533, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 191.215, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Dut', 'sigacik-mandalina-bahcesi-sezonluk-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 73.73, 86.902, '2026-04-15', 1, '2026-05-16', 4.258, 'kg', 'active', 633, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 86.902, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'sigacik-mandalina-bahcesi-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 104.02, 304.318, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 117, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 304.318, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'sigacik-mandalina-bahcesi-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 40.53, 135.728, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 618, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 135.728, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Limon', 'sigacik-mandalina-bahcesi-taze-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 27.65, 97.712, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 302, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 97.712, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Nar', 'sigacik-mandalina-bahcesi-sezonluk-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.77, 242.061, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 109, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 242.061, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Fındık İçi', 'sigacik-mandalina-bahcesi-taze-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 288.99, 518.204, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 553, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 518.204, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Maydanoz Demeti', 'sigacik-mandalina-bahcesi-sezonluk-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.44, 801.002, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 483, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 801.002, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-sezonluk-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'sigacik-mandalina-bahcesi-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 147.29, 341.372, '2026-04-16', 1, '2026-05-15', 23.499, 'kg', 'active', 141, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 341.372, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Ev Yapımı Salça', 'sigacik-mandalina-bahcesi-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 101.23, 113.097, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 194, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 113.097, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Pekmez', 'sigacik-mandalina-bahcesi-taze-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 136.76, 361.162, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 292, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 361.162, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-taze-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'sigacik-mandalina-bahcesi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 209.76, 102.457, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 80, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 102.457, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Havuç', 'sigacik-mandalina-bahcesi-dogal-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.99, 180.499, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 472, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-dogal-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 180.499, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-dogal-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'sigacik-mandalina-bahcesi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.97, 494.723, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 413, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 494.723, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'sigacik-mandalina-bahcesi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 295.82, 184.505, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 75, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 184.505, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'sigacik-mandalina-bahcesi-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 67.90, 174.784, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 608, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 174.784, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'sigacik-mandalina-bahcesi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.09, 345.504, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 277, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 345.504, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'sigacik-mandalina-bahcesi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 24.63, 432.955, '2026-04-19', 1, '2026-05-16', 20.213, 'kg', 'active', 456, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 432.955, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'sigacik-mandalina-bahcesi-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 72.91, 432.945, '2026-04-24', 1, '2026-05-09', 11.416, 'kg', 'active', 74, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 432.945, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'sigacik-mandalina-bahcesi-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 56.80, 435.630, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 268, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 435.630, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Avokado', 'sigacik-mandalina-bahcesi-dogal-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 37.98, 308.455, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 320, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-dogal-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 308.455, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nermin.ege@ekinerago.test' AND p.slug = 'sigacik-mandalina-bahcesi-dogal-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'bursa-dogal-bahce-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 90.19, 346.651, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 342, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 346.651, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'bursa-dogal-bahce-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 145.81, 210.044, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 231, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 210.044, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'bursa-dogal-bahce-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 191.75, 371.566, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 343, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 371.566, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'bursa-dogal-bahce-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 72.33, 199.782, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 628, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 199.782, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'bursa-dogal-bahce-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 17.58, 263.222, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 208, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 263.222, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'bursa-dogal-bahce-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.08, 365.373, '2026-04-22', 1, '2026-05-13', 17.802, 'kg', 'active', 265, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 365.373, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kabak', 'bursa-dogal-bahce-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.57, 81.258, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 109, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 81.258, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'bursa-dogal-bahce-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.13, 324.809, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 284, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 324.809, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Limon', 'bursa-dogal-bahce-gunluk-hasat-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.58, 455.803, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 259, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-gunluk-hasat-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 455.803, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-gunluk-hasat-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kapya Biber', 'bursa-dogal-bahce-taze-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 59.12, 316.407, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 510, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-taze-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 316.407, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-taze-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'bursa-dogal-bahce-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.76, 333.908, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 551, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 333.908, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'bursa-dogal-bahce-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 43.78, 445.649, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 521, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 445.649, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'bursa-dogal-bahce-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 204.52, 446.337, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 568, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 446.337, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'bursa-dogal-bahce-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.26, 262.341, '2026-04-23', 1, '2026-05-16', 10.034, 'kg', 'active', 588, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 262.341, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Dolmalık Biber', 'bursa-dogal-bahce-dogal-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.37, 379.217, '2026-04-26', 1, '2026-05-19', 10.279, 'kg', 'active', 512, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-dogal-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 379.217, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-dogal-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'bursa-dogal-bahce-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.04, 253.266, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 624, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 253.266, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'bursa-dogal-bahce-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.78, 221.809, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 464, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 221.809, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'bursa-dogal-bahce-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 13.75, 735.892, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 314, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 735.892, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND p.slug = 'bursa-dogal-bahce-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Nar', 'erdemli-limon-evi-sezonluk-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 45.14, 464.634, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 466, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-sezonluk-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 464.634, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-sezonluk-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Avokado', 'erdemli-limon-evi-gunluk-hasat-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 38.80, 694.200, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 393, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gunluk-hasat-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 694.200, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gunluk-hasat-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Sivri Biber', 'erdemli-limon-evi-gunluk-hasat-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.29, 359.807, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 239, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gunluk-hasat-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 359.807, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gunluk-hasat-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'erdemli-limon-evi-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.12, 169.731, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 612, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 169.731, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'erdemli-limon-evi-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.82, 177.872, '2026-04-21', 1, '2026-05-09', 20.111, 'kg', 'active', 202, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 177.872, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'erdemli-limon-evi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 168.80, 71.812, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 419, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 71.812, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'erdemli-limon-evi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 180.59, 94.958, '2026-04-25', 1, '2026-05-15', 21.706, 'kg', 'active', 649, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 94.958, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'erdemli-limon-evi-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 100.70, 320.329, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 473, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 320.329, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Gezen Tavuk Yumurtası', 'erdemli-limon-evi-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.05, 610.985, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 536, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 610.985, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Mandalina', 'erdemli-limon-evi-sezonluk-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.76, 441.205, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 569, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-sezonluk-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 441.205, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-sezonluk-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'erdemli-limon-evi-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.52, 431.772, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 511, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 431.772, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'erdemli-limon-evi-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 85.75, 183.462, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 123, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 183.462, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Karpuz', 'erdemli-limon-evi-koy-tipi-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 17.16, 273.766, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 541, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-koy-tipi-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 273.766, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-koy-tipi-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'erdemli-limon-evi-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 56.07, 157.575, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 645, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 157.575, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patates', 'erdemli-limon-evi-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 23.11, 64.670, '2026-04-26', 1, '2026-05-19', 13.749, 'kg', 'active', 281, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 64.670, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'erdemli-limon-evi-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 48.32, 482.473, '2026-05-02', 1, '2026-05-13', 11.897, 'kg', 'active', 284, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 482.473, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Salatalık', 'erdemli-limon-evi-taze-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.67, 314.598, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 598, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-taze-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 314.598, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-taze-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Portakal', 'erdemli-limon-evi-koy-tipi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.68, 175.646, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 358, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-koy-tipi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 175.646, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-koy-tipi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Üzüm', 'erdemli-limon-evi-taze-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 67.59, 377.475, '2026-04-26', 1, '2026-05-21', 9.083, 'kg', 'active', 638, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-taze-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 377.475, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-taze-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'erdemli-limon-evi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.35, 190.179, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 338, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 190.179, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND p.slug = 'erdemli-limon-evi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'efeler-zeytinligi-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.98, 438.173, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 625, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 438.173, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'efeler-zeytinligi-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 34.05, 202.342, '2026-04-23', 1, '2026-05-13', 5.606, 'kg', 'active', 461, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 202.342, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Portakal', 'efeler-zeytinligi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.99, 163.816, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 488, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 163.816, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze İncir', 'efeler-zeytinligi-taze-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 105.93, 200.475, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 136, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-taze-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 200.475, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-taze-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'efeler-zeytinligi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 45.23, 157.072, '2026-04-30', 1, '2026-05-11', 15.144, 'kg', 'active', 195, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 157.072, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Kırma Yeşil Zeytin', 'efeler-zeytinligi-koy-tipi-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 130.42, 276.160, '2026-05-01', 1, '2026-05-15', 18.466, 'kg', 'active', 499, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-koy-tipi-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 276.160, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-koy-tipi-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Ispanak', 'efeler-zeytinligi-dogal-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.97, 422.401, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 592, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dogal-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 422.401, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dogal-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Siyah Üzüm', 'efeler-zeytinligi-dogal-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 71.46, 440.250, '2026-04-30', 1, '2026-05-15', 16.091, 'kg', 'active', 617, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dogal-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 440.250, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dogal-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'efeler-zeytinligi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.61, 275.601, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 313, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 275.601, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'efeler-zeytinligi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.98, 97.003, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 365, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 97.003, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'efeler-zeytinligi-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 119.85, 165.305, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 310, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 165.305, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'efeler-zeytinligi-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 271.69, 140.588, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 319, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 140.588, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Zeytinyağı 1 L', 'efeler-zeytinligi-taze-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 323.44, 747.681, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 453, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-taze-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 747.681, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-taze-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Patlıcan', 'efeler-zeytinligi-gunluk-hasat-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.04, 211.710, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-gunluk-hasat-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 211.710, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-gunluk-hasat-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'efeler-zeytinligi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 172.43, 269.220, '2026-04-22', 1, '2026-05-09', 24.344, 'kg', 'active', 448, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 269.220, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'efeler-zeytinligi-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.86, 60.529, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 90, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 60.529, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Üzüm', 'efeler-zeytinligi-sezonluk-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.87, 289.307, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 243, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-sezonluk-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 289.307, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'fatma.aydin@ekinerago.test' AND p.slug = 'efeler-zeytinligi-sezonluk-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'fethiye-koy-sepeti-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.61, 130.827, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 314, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 130.827, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'fethiye-koy-sepeti-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 169.08, 277.221, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 427, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 277.221, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Ispanak', 'fethiye-koy-sepeti-taze-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.23, 464.490, '2026-04-30', 1, '2026-05-19', 10.477, 'kg', 'active', 554, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 464.490, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat İncir', 'fethiye-koy-sepeti-gunluk-hasat-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 86.84, 197.336, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 492, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-gunluk-hasat-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 197.336, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-gunluk-hasat-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'fethiye-koy-sepeti-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.64, 313.882, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 364, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 313.882, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'fethiye-koy-sepeti-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 217.23, 169.851, '2026-04-20', 1, '2026-05-19', 3.960, 'kg', 'active', 519, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 169.851, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'fethiye-koy-sepeti-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 83.13, 237.596, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 72, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 237.596, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Sivri Biber', 'fethiye-koy-sepeti-taze-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.88, 106.168, '2026-04-18', 1, '2026-05-20', 3.338, 'kg', 'active', 182, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 106.168, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Ev Yapımı Salça', 'fethiye-koy-sepeti-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 118.41, 131.006, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 306, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 131.006, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Nohut', 'fethiye-koy-sepeti-koy-tipi-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 77.40, 451.812, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 359, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 451.812, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'fethiye-koy-sepeti-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 97.43, 284.456, '2026-04-15', 1, '2026-05-08', 8.165, 'kg', 'active', 329, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 284.456, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'fethiye-koy-sepeti-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.06, 259.627, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 137, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 259.627, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'fethiye-koy-sepeti-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.06, 475.575, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 92, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 475.575, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Salkım Domates', 'fethiye-koy-sepeti-sezonluk-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.44, 172.331, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 219, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-sezonluk-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 172.331, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-sezonluk-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Muz', 'fethiye-koy-sepeti-gunluk-hasat-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 63.77, 235.970, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 632, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-gunluk-hasat-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 235.970, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-gunluk-hasat-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Kuru Soğan', 'fethiye-koy-sepeti-koy-tipi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.50, 271.402, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 511, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 271.402, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'fethiye-koy-sepeti-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 45.50, 132.669, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 636, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 132.669, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Kabak', 'fethiye-koy-sepeti-koy-tipi-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.79, 270.144, '2026-04-23', 1, '2026-05-18', 21.773, 'kg', 'active', 144, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 270.144, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-koy-tipi-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Dut', 'fethiye-koy-sepeti-taze-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 77.04, 196.101, '2026-04-23', 1, '2026-05-18', 9.039, 'kg', 'active', 614, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 196.101, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ali.kayra@ekinerago.test' AND p.slug = 'fethiye-koy-sepeti-taze-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Salatalık', 'alasehir-uzum-bagi-dogal-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.06, 463.172, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 314, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 463.172, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'alasehir-uzum-bagi-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 138.78, 756.246, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 337, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 756.246, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'alasehir-uzum-bagi-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 60.86, 112.978, '2026-04-30', 1, '2026-05-13', 21.923, 'kg', 'active', 441, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 112.978, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'alasehir-uzum-bagi-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 65.04, 228.257, '2026-04-20', 1, '2026-05-09', 13.005, 'kg', 'active', 303, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 228.257, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'alasehir-uzum-bagi-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.88, 492.534, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 517, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 492.534, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Armut', 'alasehir-uzum-bagi-taze-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.09, 340.638, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 510, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-taze-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 340.638, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-taze-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'alasehir-uzum-bagi-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 43.68, 414.803, '2026-04-28', 1, '2026-05-07', 9.696, 'kg', 'active', 539, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 414.803, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Havuç', 'alasehir-uzum-bagi-dogal-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.09, 122.405, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 588, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 122.405, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'alasehir-uzum-bagi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 57.34, 131.081, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 536, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 131.081, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'alasehir-uzum-bagi-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.44, 188.680, '2026-04-21', 1, '2026-05-20', 23.912, 'kg', 'active', 406, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 188.680, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Kuru Fasulye', 'alasehir-uzum-bagi-sezonluk-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 81.38, 509.808, '2026-04-21', 1, '2026-05-14', 7.176, 'kg', 'active', 160, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-sezonluk-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 509.808, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-sezonluk-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'alasehir-uzum-bagi-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 65.38, 102.170, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 646, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 102.170, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'alasehir-uzum-bagi-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.02, 213.414, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 245, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 213.414, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kuru Soğan', 'alasehir-uzum-bagi-taze-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 19.79, 159.338, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 186, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-taze-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 159.338, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-taze-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'alasehir-uzum-bagi-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 63.53, 187.546, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 588, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 187.546, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Zeytinyağı 1 L', 'alasehir-uzum-bagi-dogal-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 292.15, 790.487, '2026-04-28', 1, '2026-05-13', 15.955, 'kg', 'active', 51, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 790.487, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND p.slug = 'alasehir-uzum-bagi-dogal-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'pamukkale-organik-tarla-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 60.80, 87.980, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 471, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 87.980, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'pamukkale-organik-tarla-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 10.27, 825.955, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 364, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 825.955, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'pamukkale-organik-tarla-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.48, 186.507, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 425, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 186.507, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'pamukkale-organik-tarla-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 60.27, 268.709, '2026-04-19', 1, '2026-05-09', 21.761, 'kg', 'active', 701, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 268.709, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'pamukkale-organik-tarla-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 75.27, 458.126, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 268, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 458.126, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'pamukkale-organik-tarla-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.87, 243.416, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 355, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 243.416, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'pamukkale-organik-tarla-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.52, 130.214, '2026-04-17', 1, '2026-05-08', 5.051, 'kg', 'active', 133, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 130.214, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'pamukkale-organik-tarla-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.68, 119.853, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 610, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 119.853, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'pamukkale-organik-tarla-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.43, 248.972, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 87, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 248.972, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'pamukkale-organik-tarla-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 78.45, 221.757, '2026-04-16', 1, '2026-05-21', 7.933, 'kg', 'active', 145, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 221.757, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'pamukkale-organik-tarla-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 88.98, 112.847, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 474, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 112.847, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'pamukkale-organik-tarla-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 216.89, 436.476, '2026-04-15', 1, '2026-05-14', 3.637, 'kg', 'active', 314, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 436.476, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'pamukkale-organik-tarla-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.85, 216.319, '2026-05-02', 1, '2026-05-10', 15.459, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 216.319, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Salatalık', 'pamukkale-organik-tarla-gunluk-hasat-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.76, 304.022, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 384, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-gunluk-hasat-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 304.022, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-gunluk-hasat-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Çiçek Balı', 'pamukkale-organik-tarla-sezonluk-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 180.92, 417.344, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 194, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sezonluk-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 417.344, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sezonluk-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Cherry Domates', 'pamukkale-organik-tarla-taze-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.17, 97.528, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 532, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-taze-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 97.528, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-taze-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'pamukkale-organik-tarla-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 78.33, 159.162, '2026-04-16', 1, '2026-05-19', 5.440, 'kg', 'active', 642, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 159.162, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Ev Yapımı Salça', 'pamukkale-organik-tarla-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 118.82, 80.892, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 91, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 80.892, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Kırma Yeşil Zeytin', 'pamukkale-organik-tarla-sezonluk-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 139.63, 412.981, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 157, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sezonluk-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 412.981, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-sezonluk-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Üzüm', 'pamukkale-organik-tarla-koy-tipi-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.10, 234.895, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 719, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-koy-tipi-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 234.895, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-koy-tipi-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'pamukkale-organik-tarla-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 18.93, 456.412, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 505, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 456.412, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND p.slug = 'pamukkale-organik-tarla-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'bafra-ovasi-pazari-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.88, 260.411, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 440, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 260.411, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Havuç', 'bafra-ovasi-pazari-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 30.90, 161.923, '2026-04-27', 1, '2026-05-09', 14.673, 'kg', 'active', 233, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 161.923, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'bafra-ovasi-pazari-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.67, 394.594, '2026-04-28', 1, '2026-05-10', 8.631, 'kg', 'active', 212, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 394.594, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'bafra-ovasi-pazari-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 33.24, 361.534, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 678, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 361.534, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'bafra-ovasi-pazari-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 79.66, 409.543, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 613, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 409.543, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'bafra-ovasi-pazari-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 376.31, 345.031, '2026-04-22', 1, '2026-05-08', 13.316, 'kg', 'active', 681, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 345.031, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Kıvırcık Marul', 'bafra-ovasi-pazari-sezonluk-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 23.26, 368.593, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 497, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 368.593, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Salkım Domates', 'bafra-ovasi-pazari-sezonluk-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.22, 95.296, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 554, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 95.296, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'bafra-ovasi-pazari-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.38, 498.946, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 620, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 498.946, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patates', 'bafra-ovasi-pazari-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 23.43, 278.789, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 496, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 278.789, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Gezen Tavuk Yumurtası', 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 5.29, 149.150, '2026-04-27', 1, '2026-05-20', 24.802, 'kg', 'active', 571, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 149.150, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'bafra-ovasi-pazari-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 88.12, 231.512, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 381, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 231.512, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'bafra-ovasi-pazari-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 69.87, 350.208, '2026-04-22', 1, '2026-05-09', 15.275, 'kg', 'active', 430, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 350.208, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Taze Fasulye', 'bafra-ovasi-pazari-taze-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 84.51, 213.347, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 352, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-taze-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 213.347, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-taze-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'bafra-ovasi-pazari-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 56.66, 240.301, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 420, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 240.301, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND p.slug = 'bafra-ovasi-pazari-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Çam Balı', 'fatsa-findik-ve-bal-gunluk-hasat-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 190.98, 308.295, '2026-04-16', 1, '2026-05-16', 22.281, 'kg', 'active', 667, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-gunluk-hasat-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 308.295, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-gunluk-hasat-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Ispanak', 'fatsa-findik-ve-bal-koy-tipi-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.20, 143.189, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 79, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-koy-tipi-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 143.189, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-koy-tipi-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'fatsa-findik-ve-bal-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.74, 169.264, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 494, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 169.264, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Kırma Yeşil Zeytin', 'fatsa-findik-ve-bal-dogal-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 116.74, 431.967, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 233, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-dogal-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 431.967, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-dogal-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'fatsa-findik-ve-bal-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 285.21, 512.842, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 426, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 512.842, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'fatsa-findik-ve-bal-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 165.92, 134.547, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 176, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 134.547, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'fatsa-findik-ve-bal-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.22, 281.072, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 140, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 281.072, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'fatsa-findik-ve-bal-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 80.71, 117.352, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 314, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 117.352, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'fatsa-findik-ve-bal-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.02, 442.281, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 262, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 442.281, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Limon', 'fatsa-findik-ve-bal-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.51, 488.017, '2026-04-19', 1, '2026-05-17', 8.187, 'kg', 'active', 118, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 488.017, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'fatsa-findik-ve-bal-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 84.40, 488.180, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 175, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 488.180, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Elma', 'fatsa-findik-ve-bal-koy-tipi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.20, 123.845, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 40, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-koy-tipi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 123.845, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-koy-tipi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'fatsa-findik-ve-bal-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 39.86, 256.837, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 658, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 256.837, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'fatsa-findik-ve-bal-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.13, 316.243, '2026-04-23', 1, '2026-05-13', 12.236, 'kg', 'active', 672, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 316.243, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND p.slug = 'fatsa-findik-ve-bal-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Bamya', 'harran-gunes-tarlasi-koy-tipi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 88.94, 367.379, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 104, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-koy-tipi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 367.379, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-koy-tipi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'harran-gunes-tarlasi-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 57.38, 421.750, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 434, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 421.750, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'harran-gunes-tarlasi-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.80, 237.965, '2026-04-21', 1, '2026-05-06', 10.856, 'kg', 'active', 104, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 237.965, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Kırmızı Mercimek', 'harran-gunes-tarlasi-gunluk-hasat-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 71.13, 398.186, '2026-04-22', 1, '2026-05-17', 15.012, 'kg', 'active', 693, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-gunluk-hasat-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 398.186, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-gunluk-hasat-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Elma', 'harran-gunes-tarlasi-koy-tipi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.27, 280.124, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 99, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-koy-tipi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 280.124, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-koy-tipi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'harran-gunes-tarlasi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 215.17, 77.013, '2026-04-26', 1, '2026-05-12', 22.487, 'kg', 'active', 358, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 77.013, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'harran-gunes-tarlasi-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 93.12, 514.996, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 72, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 514.996, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'harran-gunes-tarlasi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.99, 224.208, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 374, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 224.208, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Gezen Tavuk Yumurtası', 'harran-gunes-tarlasi-sezonluk-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.55, 408.018, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 430, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sezonluk-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 408.018, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sezonluk-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Çilek', 'harran-gunes-tarlasi-dogal-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.45, 288.861, '2026-04-16', 1, '2026-05-08', 18.996, 'kg', 'active', 115, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-dogal-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 288.861, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-dogal-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'harran-gunes-tarlasi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 25.93, 143.010, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 116, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 143.010, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Kıvırcık Marul', 'harran-gunes-tarlasi-sezonluk-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 21.38, 574.150, '2026-04-19', 1, '2026-05-20', 10.734, 'kg', 'active', 78, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sezonluk-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 574.150, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-sezonluk-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'harran-gunes-tarlasi-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 89.97, 342.832, '2026-04-19', 1, '2026-05-07', 4.651, 'kg', 'active', 687, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 342.832, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'harran-gunes-tarlasi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.71, 404.953, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 181, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 404.953, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'harran-gunes-tarlasi-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 48.75, 439.302, '2026-04-28', 1, '2026-05-17', 10.967, 'kg', 'active', 615, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 439.302, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Köy Domatesi', 'harran-gunes-tarlasi-dogal-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.06, 496.459, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 113, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-dogal-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 496.459, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-dogal-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'harran-gunes-tarlasi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 171.41, 243.096, '2026-04-24', 1, '2026-05-09', 3.570, 'kg', 'active', 225, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 243.096, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'harran-gunes-tarlasi-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 73.71, 318.369, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 491, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 318.369, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND p.slug = 'harran-gunes-tarlasi-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Portakal', 'samandag-narenciye-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.16, 152.451, '2026-04-28', 1, '2026-05-21', 3.578, 'kg', 'active', 602, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 152.451, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'samandag-narenciye-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 65.29, 512.186, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 123, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 512.186, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Limon', 'samandag-narenciye-koy-tipi-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.58, 390.680, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 454, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-koy-tipi-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 390.680, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-koy-tipi-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'samandag-narenciye-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.13, 507.295, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 564, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 507.295, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Mandalina', 'samandag-narenciye-taze-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.81, 143.703, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 91, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 143.703, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'samandag-narenciye-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 76.62, 199.897, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 265, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 199.897, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Lahana', 'samandag-narenciye-taze-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 51.68, 773.666, '2026-04-24', 1, '2026-05-14', 5.754, 'kg', 'active', 345, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 773.666, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-taze-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'samandag-narenciye-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.08, 605.610, '2026-04-28', 1, '2026-05-16', 21.536, 'kg', 'active', 612, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 605.610, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Avokado', 'samandag-narenciye-gunluk-hasat-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 34.37, 857.808, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 620, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-gunluk-hasat-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 857.808, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-gunluk-hasat-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'samandag-narenciye-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.51, 289.098, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 344, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 289.098, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'samandag-narenciye-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.10, 375.096, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 96, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 375.096, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Roka Demeti', 'samandag-narenciye-koy-tipi-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 12.82, 247.299, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 361, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-koy-tipi-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 247.299, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-koy-tipi-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'samandag-narenciye-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 210.57, 508.672, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 562, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 508.672, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'samandag-narenciye-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 76.11, 274.577, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 179, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 274.577, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Fındık İçi', 'samandag-narenciye-sezonluk-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 285.09, 457.515, '2026-04-19', 1, '2026-05-11', 20.897, 'kg', 'active', 626, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-sezonluk-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 457.515, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-sezonluk-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'samandag-narenciye-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 79.64, 133.298, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 350, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 133.298, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'meryem.defne@ekinerago.test' AND p.slug = 'samandag-narenciye-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'sahinbey-antep-bahcesi-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.34, 394.654, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 394.654, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Köy Domatesi', 'sahinbey-antep-bahcesi-taze-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.88, 314.483, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 496, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 314.483, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'sahinbey-antep-bahcesi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.27, 514.982, '2026-04-29', 1, '2026-05-09', 11.666, 'kg', 'active', 382, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 514.982, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'sahinbey-antep-bahcesi-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 12.37, 198.299, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 76, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 198.299, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Bamya', 'sahinbey-antep-bahcesi-dogal-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 103.94, 429.824, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 655, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-dogal-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 429.824, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-dogal-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'sahinbey-antep-bahcesi-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.57, 488.430, '2026-04-22', 1, '2026-05-15', 16.062, 'kg', 'active', 554, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 488.430, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'sahinbey-antep-bahcesi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.06, 386.020, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 52, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 386.020, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'sahinbey-antep-bahcesi-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 62.76, 510.753, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 679, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 510.753, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Nar', 'sahinbey-antep-bahcesi-koy-tipi-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.14, 361.572, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 632, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-koy-tipi-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 361.572, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-koy-tipi-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'sahinbey-antep-bahcesi-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 22.82, 671.370, '2026-04-20', 1, '2026-05-13', 3.695, 'kg', 'active', 147, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 671.370, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Salatalık', 'sahinbey-antep-bahcesi-koy-tipi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.09, 129.658, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 661, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-koy-tipi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 129.658, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-koy-tipi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'sahinbey-antep-bahcesi-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.51, 398.485, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 566, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 398.485, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Zeytinyağı 1 L', 'sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 377.42, 472.264, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 212, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 472.264, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'sahinbey-antep-bahcesi-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 81.12, 311.286, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 231, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 311.286, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'sahinbey-antep-bahcesi-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 71.31, 197.310, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 247, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 197.310, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'sahinbey-antep-bahcesi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.96, 280.710, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 315, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 280.710, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Cherry Domates', 'sahinbey-antep-bahcesi-taze-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.39, 234.659, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 184, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 234.659, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'kemal.antep@ekinerago.test' AND p.slug = 'sahinbey-antep-bahcesi-taze-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Kuru Soğan', 'meram-ciftci-pazari-gunluk-hasat-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.70, 304.279, '2026-04-25', 1, '2026-05-19', 10.266, 'kg', 'active', 518, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-gunluk-hasat-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 304.279, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-gunluk-hasat-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Cherry Domates', 'meram-ciftci-pazari-dogal-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 57.30, 313.162, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 522, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-dogal-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 313.162, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-dogal-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patates', 'meram-ciftci-pazari-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.56, 503.400, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 95, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 503.400, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'meram-ciftci-pazari-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.73, 324.101, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 73, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 324.101, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'meram-ciftci-pazari-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.29, 465.833, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 72, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 465.833, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kabak', 'meram-ciftci-pazari-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.97, 287.877, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 44, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 287.877, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kırmızı Soğan', 'meram-ciftci-pazari-taze-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 27.37, 512.177, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 691, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 512.177, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırma Yeşil Zeytin', 'meram-ciftci-pazari-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 123.38, 491.738, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 232, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 491.738, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'meram-ciftci-pazari-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 12.24, 679.518, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 49, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 679.518, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'meram-ciftci-pazari-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 80.44, 321.179, '2026-04-26', 1, '2026-05-18', 21.194, 'kg', 'active', 562, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 321.179, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Portakal', 'meram-ciftci-pazari-koy-tipi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.75, 144.999, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 289, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-koy-tipi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 144.999, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-koy-tipi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Salatalık', 'meram-ciftci-pazari-koy-tipi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 33.27, 406.728, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 621, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-koy-tipi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 406.728, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-koy-tipi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Dolmalık Biber', 'meram-ciftci-pazari-sezonluk-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 56.57, 88.577, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 198, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-sezonluk-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 88.577, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-sezonluk-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'meram-ciftci-pazari-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 65.97, 471.754, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 689, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 471.754, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'meram-ciftci-pazari-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.17, 342.728, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 524, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 342.728, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Maydanoz Demeti', 'meram-ciftci-pazari-taze-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.92, 655.591, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 715, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 655.591, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'meram-ciftci-pazari-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.51, 372.957, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 575, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 372.957, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kapya Biber', 'meram-ciftci-pazari-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.40, 319.518, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 552, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 319.518, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Çiçek Balı', 'meram-ciftci-pazari-taze-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 152.62, 210.934, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 245, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 210.934, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-taze-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'meram-ciftci-pazari-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 189.93, 473.489, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 499, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 473.489, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'rabia.meram@ekinerago.test' AND p.slug = 'meram-ciftci-pazari-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Ispanak', 'harput-baglari-gunluk-hasat-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.61, 87.718, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 518, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-gunluk-hasat-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 87.718, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-gunluk-hasat-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Ev Yapımı Salça', 'harput-baglari-koy-tipi-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 102.74, 122.297, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 426, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-koy-tipi-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 122.297, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-koy-tipi-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'harput-baglari-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 369.64, 389.547, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 712, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 389.547, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'harput-baglari-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.87, 455.732, '2026-04-29', 1, '2026-05-18', 14.635, 'kg', 'active', 263, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 455.732, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'harput-baglari-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 24.35, 882.362, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 592, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 882.362, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'harput-baglari-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 144.10, 268.325, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 317, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 268.325, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Nar', 'harput-baglari-gunluk-hasat-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.92, 363.691, '2026-05-02', 1, '2026-05-08', 5.220, 'kg', 'active', 69, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-gunluk-hasat-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 363.691, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-gunluk-hasat-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'harput-baglari-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.30, 461.218, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 446, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 461.218, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'harput-baglari-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 192.76, 407.017, '2026-05-01', 1, '2026-05-15', 8.152, 'kg', 'active', 624, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 407.017, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Siyah Üzüm', 'harput-baglari-taze-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.93, 436.456, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 181, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-taze-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 436.456, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-taze-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'harput-baglari-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.05, 250.238, '2026-04-24', 1, '2026-05-11', 16.772, 'kg', 'active', 472, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 250.238, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'harput-baglari-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.86, 218.431, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 361, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 218.431, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'harput-baglari-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 10.02, 325.909, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 519, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 325.909, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Dolmalık Biber', 'harput-baglari-dogal-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.45, 385.485, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 610, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-dogal-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 385.485, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-dogal-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırma Yeşil Zeytin', 'harput-baglari-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 120.59, 303.796, '2026-04-20', 1, '2026-05-12', 10.266, 'kg', 'active', 115, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 303.796, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'yusuf.harput@ekinerago.test' AND p.slug = 'harput-baglari-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'safranbolu-koy-urunleri-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 74.89, 225.259, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 544, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 225.259, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'safranbolu-koy-urunleri-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 184.94, 392.310, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 414, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 392.310, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Kuru Soğan', 'safranbolu-koy-urunleri-gunluk-hasat-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.02, 161.786, '2026-04-28', 1, '2026-05-19', 9.494, 'kg', 'active', 235, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-gunluk-hasat-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 161.786, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-gunluk-hasat-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Bamya', 'safranbolu-koy-urunleri-koy-tipi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 99.84, 173.036, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 380, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-koy-tipi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 173.036, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-koy-tipi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Salatalık', 'safranbolu-koy-urunleri-koy-tipi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.95, 355.179, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 395, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-koy-tipi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 355.179, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-koy-tipi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Nar', 'safranbolu-koy-urunleri-taze-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.22, 481.774, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 95, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 481.774, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'safranbolu-koy-urunleri-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.85, 94.192, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 457, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 94.192, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Maydanoz Demeti', 'safranbolu-koy-urunleri-dogal-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.00, 203.844, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 417, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dogal-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 203.844, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dogal-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Limon', 'safranbolu-koy-urunleri-taze-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.77, 363.271, '2026-05-02', 1, '2026-05-19', 3.261, 'kg', 'active', 577, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 363.271, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'safranbolu-koy-urunleri-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 254.98, 191.877, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 475, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 191.877, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Portakal', 'safranbolu-koy-urunleri-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.20, 109.228, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 281, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 109.228, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Çam Balı', 'safranbolu-koy-urunleri-taze-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 176.81, 223.043, '2026-04-20', 1, '2026-05-18', 13.098, 'kg', 'active', 284, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 223.043, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-taze-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'safranbolu-koy-urunleri-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 20.85, 374.659, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 700, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 374.659, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'safranbolu-koy-urunleri-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.59, 234.461, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 687, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 234.461, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Taze Fasulye', 'safranbolu-koy-urunleri-dogal-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.96, 448.852, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 132, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dogal-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 448.852, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-dogal-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'safranbolu-koy-urunleri-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 67.03, 165.693, '2026-04-17', 1, '2026-05-08', 18.057, 'kg', 'active', 322, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 165.693, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'safranbolu-koy-urunleri-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 89.17, 75.135, '2026-04-22', 1, '2026-05-12', 15.915, 'kg', 'active', 442, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 75.135, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'safranbolu-koy-urunleri-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.19, 319.421, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 588, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 319.421, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'seda.safran@ekinerago.test' AND p.slug = 'safranbolu-koy-urunleri-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'adana-bereket-tarlasi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.34, 372.660, '2026-04-20', 1, '2026-05-15', 20.557, 'kg', 'active', 110, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 372.660, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Siyah Üzüm', 'adana-bereket-tarlasi-dogal-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.63, 420.590, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 359, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-dogal-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 420.590, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-dogal-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'adana-bereket-tarlasi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.19, 493.762, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 311, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 493.762, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Kapya Biber', 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber',
       'közlemelik etli kapya biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.30, 266.468, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 140, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 266.468, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Karpuz', 'adana-bereket-tarlasi-sezonluk-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 18.83, 334.585, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 47, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 334.585, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Armut', 'adana-bereket-tarlasi-koy-tipi-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.78, 393.428, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 283, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-koy-tipi-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 393.428, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-koy-tipi-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'adana-bereket-tarlasi-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.20, 235.137, '2026-04-28', 1, '2026-05-14', 13.849, 'kg', 'active', 99, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 235.137, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Avokado', 'adana-bereket-tarlasi-sezonluk-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 38.24, 477.070, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 287, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 477.070, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kabak', 'adana-bereket-tarlasi-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.92, 343.668, '2026-04-18', 1, '2026-05-15', 3.149, 'kg', 'active', 440, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 343.668, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Gezen Tavuk Yumurtası', 'adana-bereket-tarlasi-taze-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.47, 787.003, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 701, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-taze-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 787.003, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-taze-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'adana-bereket-tarlasi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 294.67, 342.945, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 216, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 342.945, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'adana-bereket-tarlasi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 193.15, 194.066, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 283, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 194.066, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Kuru Fasulye', 'adana-bereket-tarlasi-sezonluk-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.75, 240.750, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 239, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 240.750, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-sezonluk-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'adana-bereket-tarlasi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 99.15, 373.588, '2026-04-15', 1, '2026-05-20', 23.745, 'kg', 'active', 249, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 373.588, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'adana-bereket-tarlasi-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.04, 378.704, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 177, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 378.704, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'adana-bereket-tarlasi-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 80.97, 362.985, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 110, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 362.985, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'adana-bereket-tarlasi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 23.31, 327.832, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 463, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 327.832, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'cem.yuregir@ekinerago.test' AND p.slug = 'adana-bereket-tarlasi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'kadikoy-mikro-bahce-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 69.68, 512.460, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 374, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 512.460, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'kadikoy-mikro-bahce-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 65.59, 64.852, '2026-04-24', 1, '2026-05-13', 12.807, 'kg', 'active', 435, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 64.852, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'kadikoy-mikro-bahce-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.02, 377.601, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 60, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 377.601, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'kadikoy-mikro-bahce-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 140.45, 834.849, '2026-04-30', 1, '2026-05-10', 10.663, 'kg', 'active', 386, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 834.849, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'kadikoy-mikro-bahce-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 301.46, 475.999, '2026-04-17', 1, '2026-05-20', 10.016, 'kg', 'active', 342, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 475.999, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Siyah Zeytin', 'kadikoy-mikro-bahce-gunluk-hasat-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 119.71, 217.816, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 203, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-gunluk-hasat-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 217.816, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-gunluk-hasat-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'kadikoy-mikro-bahce-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 57.31, 297.357, '2026-04-15', 1, '2026-05-19', 24.086, 'kg', 'active', 272, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 297.357, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'kadikoy-mikro-bahce-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.41, 145.738, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 663, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 145.738, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'kadikoy-mikro-bahce-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 75.10, 257.594, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 245, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 257.594, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Nohut', 'kadikoy-mikro-bahce-gunluk-hasat-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 75.83, 427.771, '2026-04-15', 1, '2026-05-16', 7.336, 'kg', 'active', 151, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-gunluk-hasat-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 427.771, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-gunluk-hasat-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Limon', 'kadikoy-mikro-bahce-koy-tipi-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.19, 353.990, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 636, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-koy-tipi-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 353.990, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-koy-tipi-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Patates', 'kadikoy-mikro-bahce-sezonluk-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 27.21, 343.987, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 639, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-sezonluk-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 343.987, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'ece.kent@ekinerago.test' AND p.slug = 'kadikoy-mikro-bahce-sezonluk-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'cankaya-toprak-kooperatifi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 54.73, 254.598, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 695, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 254.598, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'cankaya-toprak-kooperatifi-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 59.65, 136.758, '2026-04-23', 1, '2026-05-16', 21.524, 'kg', 'active', 669, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 136.758, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Roka Demeti', 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 14.57, 477.379, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 610, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 477.379, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'cankaya-toprak-kooperatifi-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.11, 374.960, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 489, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 374.960, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'cankaya-toprak-kooperatifi-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 19.91, 105.306, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 316, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 105.306, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Taze Fasulye', 'cankaya-toprak-kooperatifi-sezonluk-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.85, 270.368, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 150, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 270.368, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'cankaya-toprak-kooperatifi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 91.23, 309.829, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 77, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 309.829, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'cankaya-toprak-kooperatifi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.26, 160.529, '2026-04-19', 1, '2026-05-13', 9.550, 'kg', 'active', 68, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 160.529, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'cankaya-toprak-kooperatifi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.44, 435.695, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 155, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 435.695, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'cankaya-toprak-kooperatifi-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 137.91, 744.776, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 659, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 744.776, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'cankaya-toprak-kooperatifi-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.30, 194.173, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 95, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 194.173, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'cankaya-toprak-kooperatifi-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 18.71, 334.555, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 334, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 334.555, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Armut', 'cankaya-toprak-kooperatifi-sezonluk-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.96, 296.631, '2026-04-29', 1, '2026-05-19', 23.213, 'kg', 'active', 318, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 296.631, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-sezonluk-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'cankaya-toprak-kooperatifi-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.25, 458.396, '2026-04-25', 1, '2026-05-16', 21.227, 'kg', 'active', 437, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 458.396, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'tuna.kaya@ekinerago.test' AND p.slug = 'cankaya-toprak-kooperatifi-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'kocaeli-seracilik-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 51.04, 156.376, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 401, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 156.376, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'kocaeli-seracilik-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.53, 242.949, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 541, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 242.949, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk İncir', 'kocaeli-seracilik-sezonluk-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 88.32, 325.849, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 84, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 325.849, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Çam Balı', 'kocaeli-seracilik-koy-tipi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 163.70, 487.539, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 35, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-tipi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 487.539, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-tipi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'kocaeli-seracilik-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.43, 518.019, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 344, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 518.019, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Roka Demeti', 'kocaeli-seracilik-sezonluk-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.35, 375.557, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 699, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 375.557, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Havuç', 'kocaeli-seracilik-koy-tipi-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.90, 393.955, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 128, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-tipi-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 393.955, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-tipi-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'kocaeli-seracilik-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.26, 279.331, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 566, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 279.331, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'kocaeli-seracilik-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 145.66, 379.975, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 467, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 379.975, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'kocaeli-seracilik-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.91, 165.316, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 139, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 165.316, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Kırmızı Mercimek', 'kocaeli-seracilik-sezonluk-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 73.23, 123.079, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 181, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 123.079, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-sezonluk-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kıvırcık Marul', 'kocaeli-seracilik-taze-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 19.42, 613.017, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 253, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-taze-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 613.017, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-taze-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'kocaeli-seracilik-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.72, 249.387, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 123, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 249.387, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'kocaeli-seracilik-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.27, 116.652, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 474, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 116.652, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Nar', 'kocaeli-seracilik-dogal-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 43.90, 356.525, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 649, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-dogal-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 356.525, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-dogal-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'kocaeli-seracilik-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.03, 492.988, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 709, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 492.988, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'leyla.izmit@ekinerago.test' AND p.slug = 'kocaeli-seracilik-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'narenciye-akdeniz-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.65, 414.369, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 49, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 414.369, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Elma', 'narenciye-akdeniz-gunluk-hasat-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.64, 496.393, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 678, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 496.393, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'narenciye-akdeniz-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 183.17, 254.845, '2026-04-20', 1, '2026-05-10', 9.104, 'kg', 'active', 352, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 254.845, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Nohut', 'narenciye-akdeniz-dogal-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 84.41, 131.473, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 684, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-dogal-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 131.473, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-dogal-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'narenciye-akdeniz-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 198.87, 355.851, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 279, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 355.851, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Limon', 'narenciye-akdeniz-gunluk-hasat-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 35.88, 113.354, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 708, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 113.354, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'narenciye-akdeniz-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 34.80, 660.478, '2026-05-02', 1, '2026-05-17', 14.506, 'kg', 'active', 300, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 660.478, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal İncir', 'narenciye-akdeniz-dogal-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 99.44, 461.792, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 65, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-dogal-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 461.792, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-dogal-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Salatalık', 'narenciye-akdeniz-koy-tipi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 33.66, 89.381, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 558, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-koy-tipi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 89.381, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-koy-tipi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'narenciye-akdeniz-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.54, 320.768, '2026-04-21', 1, '2026-05-09', 22.674, 'kg', 'active', 153, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 320.768, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kabak', 'narenciye-akdeniz-taze-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 28.18, 454.997, '2026-05-02', 1, '2026-05-21', 11.007, 'kg', 'active', 188, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-taze-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 454.997, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-taze-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Fındık İçi', 'narenciye-akdeniz-gunluk-hasat-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 256.24, 480.416, '2026-04-19', 1, '2026-05-13', 12.158, 'kg', 'active', 362, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 480.416, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Kuru Fasulye', 'narenciye-akdeniz-gunluk-hasat-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 82.01, 114.924, '2026-05-01', 1, '2026-05-07', 23.990, 'kg', 'active', 105, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 114.924, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gunluk-hasat-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'narenciye-akdeniz-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.40, 714.293, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 601, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 714.293, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'narenciye-akdeniz-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.55, 194.134, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 283, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 194.134, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'narenciye-akdeniz-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.19, 286.946, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 594, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 286.946, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Gezen Tavuk Yumurtası', 'narenciye-akdeniz-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.29, 85.230, '2026-04-19', 1, '2026-05-17', 16.991, 'kg', 'active', 44, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 85.230, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'narenciye-akdeniz-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.83, 362.360, '2026-04-23', 1, '2026-05-13', 12.236, 'kg', 'active', 96, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 362.360, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Portakal', 'narenciye-akdeniz-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.37, 188.720, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 567, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 188.720, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'okan.limoncu@ekinerago.test' AND p.slug = 'narenciye-akdeniz-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Kavun', 'ege-otlari-atolyesi-sezonluk-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 25.47, 240.758, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 313, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-sezonluk-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 240.758, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-sezonluk-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Muz', 'ege-otlari-atolyesi-dogal-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 55.25, 414.267, '2026-04-29', 1, '2026-05-11', 12.890, 'kg', 'active', 356, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-dogal-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 414.267, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-dogal-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'ege-otlari-atolyesi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 333.05, 871.000, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 509, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 871.000, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Patates', 'ege-otlari-atolyesi-gunluk-hasat-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.77, 431.495, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 652, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-gunluk-hasat-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 431.495, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-gunluk-hasat-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Siyah Zeytin', 'ege-otlari-atolyesi-sezonluk-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 124.81, 387.132, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 85, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-sezonluk-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 387.132, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-sezonluk-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Havuç', 'ege-otlari-atolyesi-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 26.83, 515.711, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 498, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 515.711, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırma Yeşil Zeytin', 'ege-otlari-atolyesi-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 125.40, 103.574, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 178, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 103.574, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Lahana', 'ege-otlari-atolyesi-gunluk-hasat-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 50.81, 885.705, '2026-04-28', 1, '2026-05-18', 11.189, 'kg', 'active', 680, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-gunluk-hasat-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 885.705, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-gunluk-hasat-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'ege-otlari-atolyesi-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 221.78, 329.615, '2026-04-30', 1, '2026-05-08', 7.351, 'kg', 'active', 696, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 329.615, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'ege-otlari-atolyesi-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 16.54, 476.336, '2026-04-22', 1, '2026-05-20', 4.114, 'kg', 'active', 622, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 476.336, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'ege-otlari-atolyesi-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 10.97, 486.824, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 211, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 486.824, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'ege-otlari-atolyesi-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 25.35, 305.485, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 70, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 305.485, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'ege-otlari-atolyesi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 197.04, 357.748, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 598, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 357.748, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'ege-otlari-atolyesi-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.44, 236.187, '2026-04-19', 1, '2026-05-13', 16.877, 'kg', 'active', 591, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 236.187, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'ege-otlari-atolyesi-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 100.03, 419.681, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 531, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 419.681, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND p.slug = 'ege-otlari-atolyesi-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Limon', 'nilufer-yumurta-ciftligi-limon',
       'sulu ve kabuğu aromalı limon. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.71, 167.071, '2026-04-27', 1, '2026-05-13', 8.864, 'kg', 'active', 92, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-limon';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 167.071, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-limon';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'nilufer-yumurta-ciftligi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 192.12, 324.818, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 212, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 324.818, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Karpuz', 'nilufer-yumurta-ciftligi-taze-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 17.56, 399.528, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 63, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-taze-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 399.528, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-taze-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'nilufer-yumurta-ciftligi-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.43, 321.120, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 227, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 321.120, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'nilufer-yumurta-ciftligi-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.17, 506.378, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 537, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 506.378, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Lahana', 'nilufer-yumurta-ciftligi-gunluk-hasat-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 42.74, 259.423, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 374, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 259.423, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'nilufer-yumurta-ciftligi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 19.75, 120.025, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 366, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 120.025, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Salkım Domates', 'nilufer-yumurta-ciftligi-dogal-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.69, 481.923, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 408, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-dogal-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 481.923, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-dogal-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'nilufer-yumurta-ciftligi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 317.46, 852.377, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 379, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 852.377, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Kabak', 'nilufer-yumurta-ciftligi-dogal-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.53, 396.882, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 533, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-dogal-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 396.882, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-dogal-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'nilufer-yumurta-ciftligi-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.27, 505.622, '2026-04-21', 1, '2026-05-11', 11.324, 'kg', 'active', 336, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 505.622, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Avokado', 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 44.26, 857.932, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 616, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 857.932, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Kavun', 'nilufer-yumurta-ciftligi-taze-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.46, 432.051, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 141, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-taze-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 432.051, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'suleyman.ova@ekinerago.test' AND p.slug = 'nilufer-yumurta-ciftligi-taze-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'erdemli-avokado-bahcesi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 186.09, 136.516, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 422, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 136.516, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'erdemli-avokado-bahcesi-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.78, 441.251, '2026-04-25', 1, '2026-05-08', 20.582, 'kg', 'active', 69, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 441.251, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Nar', 'erdemli-avokado-bahcesi-sezonluk-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.08, 108.174, '2026-04-22', 1, '2026-05-18', 6.540, 'kg', 'active', 111, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-sezonluk-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 108.174, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-sezonluk-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'erdemli-avokado-bahcesi-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.49, 156.346, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 476, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 156.346, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Çilek', 'erdemli-avokado-bahcesi-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 79.01, 469.287, '2026-04-27', 1, '2026-05-16', 7.522, 'kg', 'active', 229, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 469.287, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'erdemli-avokado-bahcesi-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.80, 485.764, '2026-04-15', 1, '2026-05-15', 9.543, 'kg', 'active', 133, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 485.764, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Fındık İçi', 'erdemli-avokado-bahcesi-taze-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 256.00, 285.836, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 472, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 285.836, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Kuru Soğan', 'erdemli-avokado-bahcesi-taze-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.51, 104.614, '2026-04-26', 1, '2026-05-15', 24.495, 'kg', 'active', 519, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 104.614, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'erdemli-avokado-bahcesi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.40, 242.835, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 306, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 242.835, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Salkım Domates', 'erdemli-avokado-bahcesi-taze-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.82, 230.669, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 491, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 230.669, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-taze-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Üzüm', 'erdemli-avokado-bahcesi-koy-tipi-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 59.13, 164.071, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 189, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-tipi-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 164.071, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-tipi-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'erdemli-avokado-bahcesi-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.89, 99.425, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 458, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 99.425, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'erdemli-avokado-bahcesi-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 13.21, 533.954, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 463, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 533.954, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'erdemli-avokado-bahcesi-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.79, 490.726, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 115, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 490.726, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'erdemli-avokado-bahcesi-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.29, 75.975, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 670, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 75.975, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Salatalık', 'erdemli-avokado-bahcesi-koy-tipi-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.62, 512.809, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 164, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-tipi-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 512.809, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-koy-tipi-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Avokado', 'erdemli-avokado-bahcesi-gunluk-hasat-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 44.71, 437.022, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 299, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-gunluk-hasat-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 437.022, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'dilan.akin@ekinerago.test' AND p.slug = 'erdemli-avokado-bahcesi-gunluk-hasat-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'İncir', 'efeler-incir-konagi-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 94.93, 503.823, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 611, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 503.823, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'efeler-incir-konagi-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 13.95, 791.330, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 305, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 791.330, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'efeler-incir-konagi-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.54, 340.123, '2026-05-01', 1, '2026-05-18', 6.165, 'kg', 'active', 658, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 340.123, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'efeler-incir-konagi-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 18.01, 242.065, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 85, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 242.065, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'efeler-incir-konagi-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 156.09, 472.634, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 345, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 472.634, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Siyah Üzüm', 'efeler-incir-konagi-koy-tipi-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.52, 375.032, '2026-04-25', 1, '2026-05-20', 20.029, 'kg', 'active', 363, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 375.032, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Kırma Yeşil Zeytin', 'efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 127.38, 101.072, '2026-04-18', 1, '2026-05-19', 19.301, 'kg', 'active', 563, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 101.072, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'efeler-incir-konagi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 360.42, 502.521, '2026-04-27', 1, '2026-05-18', 5.984, 'kg', 'active', 571, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 502.521, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'efeler-incir-konagi-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.66, 148.671, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 290, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 148.671, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Pekmez', 'efeler-incir-konagi-gunluk-hasat-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 167.53, 657.800, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 510, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-gunluk-hasat-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 657.800, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-gunluk-hasat-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'efeler-incir-konagi-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 83.51, 116.982, '2026-05-02', 1, '2026-05-21', 16.069, 'kg', 'active', 216, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 116.982, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kabak', 'efeler-incir-konagi-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.72, 313.614, '2026-04-21', 1, '2026-05-14', 19.477, 'kg', 'active', 127, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 313.614, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Bamya', 'efeler-incir-konagi-koy-tipi-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 85.02, 452.758, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 697, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 452.758, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-koy-tipi-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Kırmızı Soğan', 'efeler-incir-konagi-dogal-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 28.82, 248.373, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 44, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-dogal-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 248.373, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND p.slug = 'efeler-incir-konagi-dogal-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'fethiye-bal-ve-nar-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 17.98, 107.064, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 418, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 107.064, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Ispanak', 'fethiye-bal-ve-nar-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.21, 190.031, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 379, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 190.031, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'fethiye-bal-ve-nar-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 176.91, 456.286, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 702, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 456.286, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Lahana', 'fethiye-bal-ve-nar-dogal-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 46.58, 277.048, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 649, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 277.048, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salkım Domates', 'fethiye-bal-ve-nar-salkim-domates',
       'seradan yeni toplanmış salkım domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.84, 124.368, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 337, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-salkim-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 124.368, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-salkim-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Portakal', 'fethiye-bal-ve-nar-koy-tipi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.05, 398.897, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 262, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-koy-tipi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 398.897, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-koy-tipi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'fethiye-bal-ve-nar-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.57, 278.838, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 209, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 278.838, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'fethiye-bal-ve-nar-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.86, 143.322, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 299, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 143.322, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'fethiye-bal-ve-nar-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 81.72, 479.807, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 262, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 479.807, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'fethiye-bal-ve-nar-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 148.94, 201.259, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 634, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 201.259, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat Çilek', 'fethiye-bal-ve-nar-gunluk-hasat-cilek',
       'kokulu yayla çileği. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 86.80, 458.541, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 234, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-gunluk-hasat-cilek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 458.541, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-gunluk-hasat-cilek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'fethiye-bal-ve-nar-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 43.33, 392.969, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 189, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 392.969, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Nar', 'fethiye-bal-ve-nar-dogal-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 45.21, 514.108, '2026-04-18', 1, '2026-05-11', 20.137, 'kg', 'active', 534, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 514.108, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Muz', 'fethiye-bal-ve-nar-dogal-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.44, 86.686, '2026-04-18', 1, '2026-05-11', 15.678, 'kg', 'active', 197, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 86.686, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-dogal-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'fethiye-bal-ve-nar-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 64.33, 100.499, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 448, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 100.499, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'fethiye-bal-ve-nar-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 189.30, 62.148, '2026-04-15', 1, '2026-05-17', 23.902, 'kg', 'active', 364, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 62.148, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'gokce.ari@ekinerago.test' AND p.slug = 'fethiye-bal-ve-nar-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'alasehir-dogal-uzum-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.47, 215.404, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 536, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 215.404, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'alasehir-dogal-uzum-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 60.87, 496.119, '2026-04-20', 1, '2026-05-13', 18.998, 'kg', 'active', 169, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 496.119, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Köy Domatesi', 'alasehir-dogal-uzum-gunluk-hasat-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.92, 137.733, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 73, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 137.733, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'alasehir-dogal-uzum-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 62.18, 414.775, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 84, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 414.775, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'alasehir-dogal-uzum-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 83.93, 69.081, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 424, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 69.081, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Sezonluk Nar', 'alasehir-dogal-uzum-sezonluk-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.03, 130.438, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 712, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-sezonluk-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 130.438, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-sezonluk-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Ispanak', 'alasehir-dogal-uzum-taze-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.52, 338.592, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 142, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-taze-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 338.592, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-taze-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'alasehir-dogal-uzum-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.87, 190.045, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 658, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 190.045, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Pekmez', 'alasehir-dogal-uzum-sezonluk-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 163.77, 877.958, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 337, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-sezonluk-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 877.958, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-sezonluk-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Portakal', 'alasehir-dogal-uzum-taze-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 34.98, 155.539, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 37, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-taze-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 155.539, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-taze-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Roka Demeti', 'alasehir-dogal-uzum-gunluk-hasat-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 14.40, 764.890, '2026-04-17', 1, '2026-05-08', 20.150, 'kg', 'active', 111, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 764.890, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Dolmalık Biber', 'alasehir-dogal-uzum-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.34, 177.710, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 338, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 177.710, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Günlük Hasat İncir', 'alasehir-dogal-uzum-gunluk-hasat-incir',
       'olgun Aydın inciri. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 81.89, 140.363, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 403, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-incir';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 140.363, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-gunluk-hasat-incir';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'alasehir-dogal-uzum-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 60.38, 399.728, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 81, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 399.728, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Kırmızı Mercimek', 'alasehir-dogal-uzum-dogal-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 69.06, 138.436, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 671, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dogal-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 138.436, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'osman.bag@ekinerago.test' AND p.slug = 'alasehir-dogal-uzum-dogal-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Lahana', 'pamukkale-sera-koy-tipi-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 50.12, 581.314, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 534, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 581.314, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Dolmalık Biber', 'pamukkale-sera-koy-tipi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 52.63, 89.135, '2026-04-22', 1, '2026-05-13', 24.514, 'kg', 'active', 720, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 89.135, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'pamukkale-sera-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 64.22, 376.591, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 289, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 376.591, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'pamukkale-sera-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.85, 355.046, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 606, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 355.046, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'pamukkale-sera-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.34, 65.357, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 515, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 65.357, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'pamukkale-sera-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 25.10, 141.389, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 373, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 141.389, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Muz', 'pamukkale-sera-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 53.71, 162.445, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 275, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 162.445, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Çiçek Balı', 'pamukkale-sera-koy-tipi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 184.86, 266.125, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 156, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 266.125, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'pamukkale-sera-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 50.76, 68.174, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 605, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 68.174, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'pamukkale-sera-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 360.89, 729.262, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 610, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 729.262, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Kavun', 'pamukkale-sera-koy-tipi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 25.63, 227.138, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 500, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 227.138, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-koy-tipi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Patates', 'pamukkale-sera-taze-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 25.44, 389.663, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 151, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-taze-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 389.663, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-taze-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Roka Demeti', 'pamukkale-sera-dogal-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.01, 371.214, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 417, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-dogal-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 371.214, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-dogal-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'pamukkale-sera-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.16, 135.511, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 454, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 135.511, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Salatalık', 'pamukkale-sera-taze-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 32.86, 115.543, '2026-04-20', 1, '2026-05-12', 18.769, 'kg', 'active', 145, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-taze-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 115.543, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-taze-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Ev Yapımı Salça', 'pamukkale-sera-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 98.33, 351.291, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 496, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 351.291, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'pamukkale-sera-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 67.63, 291.931, '2026-04-17', 1, '2026-05-07', 15.171, 'kg', 'active', 478, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 291.931, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'pamukkale-sera-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 189.60, 293.833, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 212, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 293.833, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'hale.denizli@ekinerago.test' AND p.slug = 'pamukkale-sera-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'bafra-kirmizi-sogan-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 142.51, 321.222, '2026-04-28', 1, '2026-05-15', 21.548, 'kg', 'active', 595, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 321.222, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'bafra-kirmizi-sogan-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 13.67, 847.120, '2026-04-26', 1, '2026-05-15', 18.105, 'kg', 'active', 170, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 847.120, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'bafra-kirmizi-sogan-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.63, 500.830, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 687, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 500.830, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Lahana', 'bafra-kirmizi-sogan-gunluk-hasat-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 49.87, 541.070, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 581, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 541.070, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Kırma Yeşil Zeytin', 'bafra-kirmizi-sogan-koy-tipi-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 134.70, 300.456, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 89, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-koy-tipi-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 300.456, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-koy-tipi-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'bafra-kirmizi-sogan-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 173.89, 405.085, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 291, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 405.085, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Çiçek Balı', 'bafra-kirmizi-sogan-gunluk-hasat-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 179.38, 195.765, '2026-04-15', 1, '2026-05-20', 5.255, 'kg', 'active', 610, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 195.765, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Patlıcan', 'bafra-kirmizi-sogan-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.52, 318.184, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 329, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 318.184, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'bafra-kirmizi-sogan-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.55, 235.528, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 355, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 235.528, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'bafra-kirmizi-sogan-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 26.88, 402.088, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 488, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 402.088, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'bafra-kirmizi-sogan-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 89.97, 384.129, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 594, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 384.129, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'bafra-kirmizi-sogan-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 230.04, 393.461, '2026-04-26', 0, NULL, NULL, 'kg', 'active', 216, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 393.461, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'bafra-kirmizi-sogan-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 18.95, 502.739, '2026-04-16', 1, '2026-05-07', 12.427, 'kg', 'active', 604, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 502.739, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Havuç', 'bafra-kirmizi-sogan-dogal-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.55, 177.307, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 193, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-dogal-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 177.307, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'turgut.ova@ekinerago.test' AND p.slug = 'bafra-kirmizi-sogan-dogal-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Dolmalık Biber', 'fatsa-karadeniz-sepeti-dogal-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 56.11, 212.291, '2026-04-23', 1, '2026-05-21', 24.926, 'kg', 'active', 699, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-dogal-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 212.291, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-dogal-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Lahana', 'fatsa-karadeniz-sepeti-sezonluk-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 45.62, 821.687, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 363, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-sezonluk-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 821.687, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-sezonluk-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'fatsa-karadeniz-sepeti-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 206.99, 112.152, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 324, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 112.152, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Salatalık', 'fatsa-karadeniz-sepeti-taze-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.43, 232.481, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 79, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-taze-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 232.481, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-taze-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Kavun', 'fatsa-karadeniz-sepeti-dogal-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.47, 97.879, '2026-04-29', 1, '2026-05-06', 16.793, 'kg', 'active', 250, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-dogal-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 97.879, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-dogal-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'fatsa-karadeniz-sepeti-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 272.46, 457.877, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 245, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 457.877, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'fatsa-karadeniz-sepeti-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 10.91, 880.504, '2026-04-19', 0, NULL, NULL, 'kg', 'active', 108, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 880.504, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'fatsa-karadeniz-sepeti-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 33.34, 271.244, '2026-04-22', 1, '2026-05-08', 4.194, 'kg', 'active', 292, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 271.244, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'fatsa-karadeniz-sepeti-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 31.57, 164.717, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 496, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 164.717, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'fatsa-karadeniz-sepeti-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 12.62, 93.851, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 691, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 93.851, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'fatsa-karadeniz-sepeti-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 287.67, 691.680, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 109, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 691.680, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'fatsa-karadeniz-sepeti-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 170.09, 193.325, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 323, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 193.325, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kuru Soğan', 'fatsa-karadeniz-sepeti-kuru-sogan',
       'depolamaya uygun kuru soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.24, 241.752, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 581, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 241.752, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'melike.fatsa@ekinerago.test' AND p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Kabak', 'harran-bakliyat-sezonluk-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 30.19, 476.589, '2026-04-16', 1, '2026-05-11', 7.857, 'kg', 'active', 293, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-sezonluk-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 476.589, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-sezonluk-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Roka Demeti', 'harran-bakliyat-dogal-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 13.52, 545.180, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 597, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-dogal-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 545.180, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-dogal-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'harran-bakliyat-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 39.71, 318.335, '2026-04-30', 1, '2026-05-12', 18.963, 'kg', 'active', 533, DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 318.335, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'harran-bakliyat-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 71.07, 368.796, '2026-04-25', 1, '2026-05-08', 22.803, 'kg', 'active', 360, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 368.796, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kırmızı Soğan', 'harran-bakliyat-kirmizi-sogan',
       'salatalık mor/kırmızı soğan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 29.36, 363.334, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 408, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kirmizi-sogan';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 363.334, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kirmizi-sogan';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'harran-bakliyat-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 11.68, 218.284, '2026-04-22', 1, '2026-05-13', 18.668, 'kg', 'active', 691, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 218.284, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Bamya', 'harran-bakliyat-bamya',
       'sezonluk küçük bamya. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 107.54, 121.781, '2026-04-22', 0, NULL, NULL, 'kg', 'active', 508, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-bamya';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 121.781, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-bamya';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'harran-bakliyat-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.97, 284.007, '2026-04-29', 1, '2026-05-08', 21.519, 'kg', 'active', 178, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 284.007, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'harran-bakliyat-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.90, 397.431, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 54, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 397.431, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırmızı Mercimek', 'harran-bakliyat-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 68.45, 433.816, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 252, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 433.816, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Kıvırcık Marul', 'harran-bakliyat-kivircik-marul',
       'günlük kesim kıvırcık marul. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 23.00, 525.645, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 187, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kivircik-marul';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 525.645, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kivircik-marul';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Cherry Domates', 'harran-bakliyat-cherry-domates',
       'kahvaltılık tatlı cherry domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 61.55, 415.187, '2026-04-23', 1, '2026-05-08', 11.729, 'kg', 'active', 549, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-cherry-domates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 415.187, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-cherry-domates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Pekmez', 'harran-bakliyat-dogal-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 164.49, 741.363, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 178, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-dogal-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 741.363, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-dogal-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Ev Yapımı Salça', 'harran-bakliyat-ev-yapimi-salca',
       'güneşte yoğunlaştırılmış salça. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 102.71, 496.407, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 530, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-ev-yapimi-salca';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 496.407, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-ev-yapimi-salca';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kuru Fasulye', 'harran-bakliyat-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 69.59, 410.277, '2026-04-25', 1, '2026-05-17', 8.148, 'kg', 'active', 719, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 410.277, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Dolmalık Biber', 'harran-bakliyat-sezonluk-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.81, 482.235, '2026-05-01', 1, '2026-05-16', 5.271, 'kg', 'active', 568, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-sezonluk-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 482.235, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND p.slug = 'harran-bakliyat-sezonluk-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'hatay-defne-bahcesi-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 294.94, 215.797, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 322, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 215.797, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Siyah Üzüm', 'hatay-defne-bahcesi-dogal-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 57.49, 336.929, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 459, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-dogal-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 336.929, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-dogal-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'hatay-defne-bahcesi-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 147.97, 281.498, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 639, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 281.498, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Üzüm', 'hatay-defne-bahcesi-koy-tipi-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 51.43, 79.846, '2026-04-27', 1, '2026-05-07', 22.598, 'kg', 'active', 185, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-tipi-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 79.846, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-tipi-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Çiçek Balı', 'hatay-defne-bahcesi-sezonluk-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 190.86, 297.655, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 612, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-sezonluk-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 297.655, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-sezonluk-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'hatay-defne-bahcesi-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 211.56, 394.868, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 256, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 394.868, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Portakal', 'hatay-defne-bahcesi-portakal',
       'sıkmalık ve sofralık portakal. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.05, 458.959, '2026-04-27', 1, '2026-05-19', 16.218, 'kg', 'active', 631, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-portakal';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 458.959, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-portakal';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'hatay-defne-bahcesi-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 42.99, 363.438, '2026-04-24', 1, '2026-05-16', 23.292, 'kg', 'active', 645, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 363.438, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'hatay-defne-bahcesi-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 9.49, 396.079, '2026-04-29', 1, '2026-05-19', 21.183, 'kg', 'active', 655, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 396.079, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Köy Tipi Armut', 'hatay-defne-bahcesi-koy-tipi-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.32, 335.914, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 155, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-tipi-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 335.914, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-tipi-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Avokado', 'hatay-defne-bahcesi-dogal-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 43.72, 522.215, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 699, DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-dogal-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 522.215, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-dogal-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'hatay-defne-bahcesi-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 22.14, 462.419, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 528, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 462.419, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'hatay-defne-bahcesi-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 243.62, 330.962, '2026-04-29', 0, NULL, NULL, 'kg', 'active', 295, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 330.962, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Gezen Tavuk Yumurtası', 'hatay-defne-bahcesi-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.27, 784.424, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 591, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 784.424, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Domatesi', 'hatay-defne-bahcesi-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 39.81, 386.208, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 155, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 386.208, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'selma.defne@ekinerago.test' AND p.slug = 'hatay-defne-bahcesi-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Kavun', 'gaziantep-kurutmalik-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.98, 153.699, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 529, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 153.699, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Köy Domatesi', 'gaziantep-kurutmalik-taze-koy-domatesi',
       'ince kabuklu, sulu ve günlük hasat domates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 44.48, 176.738, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 442, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-taze-koy-domatesi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 176.738, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-taze-koy-domatesi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'gaziantep-kurutmalik-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.73, 363.270, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 200, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 363.270, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Taze Kuru Fasulye', 'gaziantep-kurutmalik-taze-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 78.01, 215.681, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 88, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-taze-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 215.681, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-taze-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Patlıcan', 'gaziantep-kurutmalik-gunluk-hasat-patlican',
       'az çekirdekli yemeklik patlıcan. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 49.34, 438.698, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 480, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-gunluk-hasat-patlican';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 438.698, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-gunluk-hasat-patlican';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Pekmez', 'gaziantep-kurutmalik-sezonluk-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 137.25, 145.633, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-sezonluk-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 145.633, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-sezonluk-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'gaziantep-kurutmalik-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 40.42, 387.339, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 214, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 387.339, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Üzüm', 'gaziantep-kurutmalik-uzum',
       'taze bağ üzümü. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 58.68, 152.785, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 69, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 152.785, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Elma', 'gaziantep-kurutmalik-elma',
       'sert dokulu yerli elma. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.19, 381.287, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 403, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-elma';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 381.287, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-elma';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Salatalık', 'gaziantep-kurutmalik-gunluk-hasat-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 41.04, 99.948, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 396, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-gunluk-hasat-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 99.948, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-gunluk-hasat-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'gaziantep-kurutmalik-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 10.02, 244.255, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 105, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 244.255, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Siyah Üzüm', 'gaziantep-kurutmalik-siyah-uzum',
       'tatlı siyah sofralık üzüm. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 64.78, 394.024, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 391, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-siyah-uzum';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 394.024, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-siyah-uzum';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Sezonluk Gezen Tavuk Yumurtası', 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi',
       'günlük gezen tavuk yumurtası. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 4.27, 869.707, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 623, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 869.707, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Ispanak', 'gaziantep-kurutmalik-dogal-ispanak',
       'ayıklanmış demet ıspanak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 38.08, 108.974, '2026-04-30', 0, NULL, NULL, 'kg', 'active', 383, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-dogal-ispanak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 108.974, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-dogal-ispanak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Dut', 'gaziantep-kurutmalik-dut',
       'günlük toplanmış dut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 87.43, 500.086, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 623, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-dut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 500.086, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-dut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Çiçek Balı', 'gaziantep-kurutmalik-koy-tipi-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 193.02, 319.058, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 504, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-koy-tipi-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 319.058, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-koy-tipi-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Kırma Yeşil Zeytin', 'gaziantep-kurutmalik-kirma-yesil-zeytin',
       'az tuzlu kırma yeşil zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 137.87, 456.531, '2026-04-17', 1, '2026-05-08', 11.419, 'kg', 'active', 260, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-kirma-yesil-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 456.531, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-kirma-yesil-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'gaziantep-kurutmalik-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 42.70, 338.899, '2026-04-21', 0, NULL, NULL, 'kg', 'active', 44, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 338.899, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'nihat.kurut@ekinerago.test' AND p.slug = 'gaziantep-kurutmalik-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Kuru Fasulye', 'konya-ova-urunleri-dogal-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 80.32, 151.847, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 246, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 151.847, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kuru-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Doğal Kırmızı Mercimek', 'konya-ova-urunleri-dogal-kirmizi-mercimek',
       'temizlenmiş kırmızı mercimek. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 72.38, 223.773, '2026-04-29', 1, '2026-05-08', 17.868, 'kg', 'active', 714, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kirmizi-mercimek';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 223.773, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kirmizi-mercimek';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Maydanoz Demeti', 'konya-ova-urunleri-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 8.82, 782.813, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 415, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 782.813, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Roka Demeti', 'konya-ova-urunleri-roka-demeti',
       'kokulu ve taze roka demeti. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 12.85, 887.996, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 558, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-roka-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 887.996, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-roka-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Patates', 'konya-ova-urunleri-dogal-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 26.52, 118.993, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 524, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 118.993, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sivri Biber', 'konya-ova-urunleri-sivri-biber',
       'acıya yakın aromalı taze sivri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 48.94, 219.753, '2026-04-27', 0, NULL, NULL, 'kg', 'active', 158, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-sivri-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 219.753, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-sivri-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Taze Fasulye', 'konya-ova-urunleri-taze-fasulye',
       'kılçıksız taze fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 75.33, 377.037, '2026-05-02', 0, NULL, NULL, 'kg', 'active', 423, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-taze-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 377.037, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-taze-fasulye';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Siyah Zeytin', 'konya-ova-urunleri-siyah-zeytin',
       'sele tipi siyah zeytin. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 131.98, 341.878, '2026-04-24', 1, '2026-05-14', 8.217, 'kg', 'active', 517, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-siyah-zeytin';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 341.878, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-siyah-zeytin';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Nohut', 'konya-ova-urunleri-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 70.77, 144.600, '2026-04-19', 1, '2026-05-17', 11.032, 'kg', 'active', 445, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 144.600, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Doğal Kabak', 'konya-ova-urunleri-dogal-kabak',
       'taze sakız kabak. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 33.65, 510.465, '2026-04-25', 0, NULL, NULL, 'kg', 'active', 311, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kabak';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 510.465, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-dogal-kabak';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Avokado', 'konya-ova-urunleri-avokado',
       'olgunlaşmaya yakın yerli avokado. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 39.77, 782.173, '2026-04-26', 1, '2026-05-10', 13.406, 'kg', 'active', 44, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-avokado';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 782.173, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-avokado';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Dolmalık Biber', 'konya-ova-urunleri-koy-tipi-dolmalik-biber',
       'dolma ve yemeklik iri biber. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 47.86, 470.904, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 358, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-koy-tipi-dolmalik-biber';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 470.904, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-koy-tipi-dolmalik-biber';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Mandalina', 'konya-ova-urunleri-mandalina',
       'ince kabuklu tatlı mandalina. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 37.83, 318.584, '2026-05-01', 0, NULL, NULL, 'kg', 'active', 202, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-mandalina';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 318.584, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-mandalina';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Sezonluk Havuç', 'konya-ova-urunleri-sezonluk-havuc',
       'tatlı ve diri havuç. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 28.64, 349.737, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 301, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-sezonluk-havuc';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 349.737, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-sezonluk-havuc';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Salatalık', 'konya-ova-urunleri-salatalik',
       'çıtır ve ince kabuklu salatalık. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 36.68, 488.649, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 456, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-salatalik';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 488.649, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-salatalik';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Taze Kavun', 'konya-ova-urunleri-taze-kavun',
       'kokulu yaz kavunu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 20.67, 324.911, '2026-04-15', 1, '2026-05-15', 10.812, 'kg', 'active', 557, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-taze-kavun';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 324.911, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'esra.ova@ekinerago.test' AND p.slug = 'konya-ova-urunleri-taze-kavun';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Fındık İçi', 'safran-dogal-pazar-findik-ici',
       'kavrulmamış fındık içi. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 284.60, 404.032, '2026-04-16', 0, NULL, NULL, 'kg', 'active', 458, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-findik-ici';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 404.032, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-findik-ici';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Günlük Hasat Nohut', 'safran-dogal-pazar-gunluk-hasat-nohut',
       'iri taneli yerli nohut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.06, 167.929, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 116, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-gunluk-hasat-nohut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 167.929, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-gunluk-hasat-nohut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Köy Tipi Patates', 'safran-dogal-pazar-koy-tipi-patates',
       'yemeklik orta boy patates. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 21.86, 89.345, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 61, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-koy-tipi-patates';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 89.345, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-koy-tipi-patates';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çiçek Balı', 'safran-dogal-pazar-cicek-bali',
       'çok çiçekli yayla balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 171.14, 518.166, '2026-04-29', 1, '2026-05-10', 4.855, 'kg', 'active', 434, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-cicek-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 518.166, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-cicek-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Doğal Muz', 'safran-dogal-pazar-dogal-muz',
       'yerli sera muzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 66.08, 263.854, '2026-04-28', 1, '2026-05-11', 3.629, 'kg', 'active', 714, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-dogal-muz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 263.854, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-dogal-muz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Pekmez', 'safran-dogal-pazar-pekmez',
       'üzüm pekmezi 700 g. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 167.41, 788.678, '2026-04-18', 0, NULL, NULL, 'kg', 'active', 588, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-pekmez';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 788.678, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-pekmez';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Lahana', 'safran-dogal-pazar-lahana',
       'sarma ve turşuluk lahana. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 47.01, 190.794, '2026-04-15', 1, '2026-05-20', 16.883, 'kg', 'active', 686, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-lahana';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 190.794, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-lahana';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Çam Balı', 'safran-dogal-pazar-cam-bali',
       'süzme doğal çam balı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 186.94, 354.302, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 390, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-cam-bali';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 354.302, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-cam-bali';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Zeytinyağı 1 L', 'safran-dogal-pazar-zeytinyagi-1-l',
       'soğuk sıkım naturel sızma zeytinyağı. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'piece', 303.40, 153.434, '2026-04-23', 0, NULL, NULL, 'kg', 'active', 301, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-zeytinyagi-1-l';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 153.434, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-zeytinyagi-1-l';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 1, 'Günlük Hasat Maydanoz Demeti', 'safran-dogal-pazar-gunluk-hasat-maydanoz-demeti',
       'sabah kesilmiş maydanoz. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'bunch', 8.80, 748.611, '2026-04-28', 0, NULL, NULL, 'kg', 'active', 515, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-gunluk-hasat-maydanoz-demeti';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 748.611, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-gunluk-hasat-maydanoz-demeti';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Armut', 'safran-dogal-pazar-armut',
       'sulu ve tatlı armut. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 45.63, 286.289, '2026-04-17', 0, NULL, NULL, 'kg', 'active', 475, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-armut';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 286.289, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-armut';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Karpuz', 'safran-dogal-pazar-karpuz',
       'tatlı ve iri tarla karpuzu. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 19.06, 426.513, '2026-04-15', 0, NULL, NULL, 'kg', 'active', 456, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-karpuz';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 426.513, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-karpuz';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 2, 'Nar', 'safran-dogal-pazar-nar',
       'bol taneli ekşi-tatlı nar. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 46.51, 174.952, '2026-04-20', 0, NULL, NULL, 'kg', 'active', 260, DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-nar';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 174.952, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-nar';


INSERT INTO products (producer_id, category_id, title, slug, description, unit_type, price, stock_quantity, harvest_date, is_preorder_enabled, preorder_deadline, min_preorder_quantity, min_preorder_unit, status, view_count, created_at)
SELECT u.id, 3, 'Köy Tipi Kuru Fasulye', 'safran-dogal-pazar-koy-tipi-kuru-fasulye',
       'yerli kuru fasulye. Ürün doğrudan üretici deposundan hazırlanır; stok ve hasat bilgisi demo amaçlıdır.',
       'kg', 83.27, 297.641, '2026-04-24', 0, NULL, NULL, 'kg', 'active', 579, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE title=VALUES(title), description=VALUES(description), category_id=VALUES(category_id), unit_type=VALUES(unit_type), price=VALUES(price), stock_quantity=VALUES(stock_quantity), harvest_date=VALUES(harvest_date), is_preorder_enabled=VALUES(is_preorder_enabled), preorder_deadline=VALUES(preorder_deadline), min_preorder_quantity=VALUES(min_preorder_quantity), status='active', view_count=VALUES(view_count);

INSERT INTO product_images (product_id, image_path, sort_order, is_cover)
SELECT p.id, CONCAT('/assets/img/demo/products/', p.slug, '-cover.jpg'), 1, TRUE
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-koy-tipi-kuru-fasulye';

INSERT INTO product_inventory_movements (product_id, movement_type, quantity, note)
SELECT p.id, 'initial', 297.641, 'Büyük demo seed başlangıç stoku'
FROM products p JOIN users u ON u.id = p.producer_id
WHERE u.email = 'murat.safran@ekinerago.test' AND p.slug = 'safran-dogal-pazar-koy-tipi-kuru-fasulye';
