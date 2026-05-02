USE ekinerago;

SET NAMES utf8mb4;

INSERT INTO categories (parent_id, name, slug, type) VALUES
(NULL, 'Sebze', 'sebze', 'vegetable'),
(NULL, 'Meyve', 'meyve', 'fruit'),
(NULL, 'Bakliyat', 'bakliyat', 'other'),
(NULL, 'Süt Ürünleri', 'sut-urunleri', 'other'),
(NULL, 'Yumurta', 'yumurta', 'other'),
(NULL, 'Bal', 'bal', 'other'),
(NULL, 'Zeytin ve Zeytinyağı', 'zeytin-ve-zeytinyagi', 'other')
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Domates', 'domates', 'vegetable'
FROM categories
WHERE slug = 'sebze'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Biber', 'biber', 'vegetable'
FROM categories
WHERE slug = 'sebze'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Patates', 'patates', 'vegetable'
FROM categories
WHERE slug = 'sebze'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Soğan', 'sogan', 'vegetable'
FROM categories
WHERE slug = 'sebze'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Elma', 'elma', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Armut', 'armut', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Çilek', 'cilek', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Portakal', 'portakal', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Mandalina', 'mandalina', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;

INSERT INTO categories (parent_id, name, slug, type)
SELECT id, 'Üzüm', 'uzum', 'fruit'
FROM categories
WHERE slug = 'meyve'
ON DUPLICATE KEY UPDATE
name = VALUES(name),
type = VALUES(type),
is_active = TRUE;
