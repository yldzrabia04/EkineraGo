/*
EkineraGo büyük demo seed — Aşama 00
Amaç: Şema uyumluluğu, temizleme, temel lokasyonlar ve yalnızca 3 ana kategori.
Ön şart: 001-012 create dosyaları çalışmış olmalı.
Demo hesap şifresi: 123456
*/
CREATE DATABASE IF NOT EXISTS ekinerago CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE ekinerago;
SET NAMES utf8mb4;

/* categories.type içinde 'other' yoksa Diğer kategorisi patlar. */
ALTER TABLE categories
  MODIFY type ENUM('vegetable', 'fruit', 'other') NOT NULL DEFAULT 'other';

/* Büyük demo için miktar alanlarını kg gramajına daha uygun hale getiriyoruz. */
ALTER TABLE products
  MODIFY stock_quantity DECIMAL(12,3) NOT NULL DEFAULT 0.000,
  MODIFY min_preorder_quantity DECIMAL(12,3) NULL;
ALTER TABLE product_inventory_movements MODIFY quantity DECIMAL(12,3) NOT NULL;
ALTER TABLE cart_items MODIFY quantity DECIMAL(12,3) NOT NULL;
ALTER TABLE order_items MODIFY quantity DECIMAL(12,3) NOT NULL;
ALTER TABLE preorder_reservations MODIFY quantity DECIMAL(12,3) NOT NULL;
ALTER TABLE demand_requests MODIFY desired_quantity DECIMAL(12,3) NULL;
ALTER TABLE demand_responses MODIFY available_quantity DECIMAL(12,3) NULL;
ALTER TABLE producer_bulk_shipping_rules MODIFY min_total_quantity DECIMAL(12,3) NOT NULL;
ALTER TABLE neighborhood_baskets
  MODIFY target_quantity DECIMAL(12,3) NOT NULL,
  MODIFY current_quantity DECIMAL(12,3) NOT NULL DEFAULT 0.000;
ALTER TABLE neighborhood_basket_members MODIFY quantity DECIMAL(12,3) NOT NULL;

/* Önce bu büyük seed'in eski kayıtlarını temizle. */
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM product_questions WHERE consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM neighborhood_basket_payments WHERE basket_member_id IN (SELECT nbm.id FROM neighborhood_basket_members nbm JOIN neighborhood_baskets nb ON nb.id = nbm.basket_id JOIN users u ON u.id = nb.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM neighborhood_basket_members WHERE basket_id IN (SELECT nb.id FROM neighborhood_baskets nb JOIN users u ON u.id = nb.producer_id WHERE u.email LIKE '%@ekinerago.test') OR user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM neighborhood_baskets WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR creator_user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM demand_responses WHERE demand_request_id IN (SELECT id FROM demand_requests WHERE consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test')) OR producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM demand_requests WHERE consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM preorder_reservations WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM campaign_products WHERE campaign_id IN (SELECT id FROM campaigns WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test')) OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM campaigns WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM producer_shipping_regions WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM producer_bulk_shipping_rules WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM producer_performance_daily WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM audit_logs WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM product_views WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM restock_alerts WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM favorites WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM producer_follows WHERE consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM notifications WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM reviews WHERE consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM wallet_transactions WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR order_id IN (SELECT id FROM orders WHERE order_no LIKE 'EGO-2026-%');
DELETE FROM shipments WHERE order_id IN (SELECT id FROM orders WHERE order_no LIKE 'EGO-2026-%');
DELETE FROM order_items WHERE order_id IN (SELECT id FROM orders WHERE order_no LIKE 'EGO-2026-%');
DELETE FROM orders WHERE order_no LIKE 'EGO-2026-%' OR consumer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test') OR producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM cart_items WHERE cart_id IN (SELECT c.id FROM carts c JOIN users u ON u.id = c.user_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM carts WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM product_inventory_movements WHERE product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM product_images WHERE product_id IN (SELECT p.id FROM products p JOIN users u ON u.id = p.producer_id WHERE u.email LIKE '%@ekinerago.test');
DELETE FROM products WHERE producer_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM wallets WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM consumer_profiles WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM producer_profiles WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM addresses WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM password_resets WHERE user_id IN (SELECT id FROM users WHERE email LIKE '%@ekinerago.test');
DELETE FROM users WHERE email LIKE '%@ekinerago.test';
SET FOREIGN_KEY_CHECKS = 1;


/* Seed'in kullanacağı il/ilçe/mahalle kayıtları */
INSERT INTO provinces (id, plate_code, name) VALUES
(34, 34, 'İstanbul'),
(6, 6, 'Ankara'),
(35, 35, 'İzmir'),
(7, 7, 'Antalya'),
(16, 16, 'Bursa'),
(41, 41, 'Kocaeli'),
(33, 33, 'Mersin'),
(9, 9, 'Aydın'),
(48, 48, 'Muğla'),
(45, 45, 'Manisa'),
(20, 20, 'Denizli'),
(55, 55, 'Samsun'),
(52, 52, 'Ordu'),
(63, 63, 'Şanlıurfa'),
(31, 31, 'Hatay'),
(27, 27, 'Gaziantep'),
(42, 42, 'Konya'),
(23, 23, 'Elazığ'),
(78, 78, 'Karabük'),
(1, 1, 'Adana')
ON DUPLICATE KEY UPDATE plate_code = VALUES(plate_code), name = VALUES(name);

INSERT INTO districts (province_id, name) VALUES
(34, 'Kadıköy'),
(6, 'Çankaya'),
(35, 'Seferihisar'),
(7, 'Kumluca'),
(16, 'Nilüfer'),
(41, 'İzmit'),
(33, 'Erdemli'),
(9, 'Efeler'),
(48, 'Fethiye'),
(45, 'Alaşehir'),
(20, 'Pamukkale'),
(55, 'Bafra'),
(52, 'Fatsa'),
(63, 'Harran'),
(31, 'Samandağ'),
(27, 'Şahinbey'),
(42, 'Meram'),
(23, 'Merkez'),
(78, 'Safranbolu'),
(1, 'Yüreğir')
ON DUPLICATE KEY UPDATE name = VALUES(name);





















INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Caferağa'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Fenerbahçe'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Koşuyolu'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Moda'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Suadiye'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ayrancı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Bahçelievler'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kızılay'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Oran'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ümitköy'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Sığacık'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Camikebir'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ulamış'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Akarca'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Tepecik'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Mavikent'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Merkez'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Beykonak'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Adrasan'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Narenciye'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Görükle'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Beşevler'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ataevler'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Fethiye'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'İhsaniye'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yahyakaptan'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yenişehir'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Alikahya'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kuruçeşme'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Bekirdere'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kargıpınarı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Tömük'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ayaş'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Limonlu'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Merkez'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Güzelhisar'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kemer'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ata'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Mimar Sinan'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Umurlu'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Çiftlik'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Patlangıç'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Foça'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Karaçulha'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yanıklar'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kurtuluş'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'İstasyon'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yeni'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Beşeylül'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Soğuksu'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kınıklı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Bağbaşı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Akköy'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Zeytinköy'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Atalar'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Emirefendi'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'İshaklı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Gazipaşa'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kızılırmak'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Dededağı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Dolunay'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kurtuluş'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Mustafa Kemal Paşa'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Evkaf'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Bolaman'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Süleyman Demirel'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'İmam Bakır'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Hayati Harrani'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Küplüce'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Merkez'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Deniz'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kurtderesi'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Atatürk'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Meydan'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Tekebaşı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Karataş'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Binevler'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Akkent'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yeditepe'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Üniversite'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Lalebahçe'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ayanbey'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yenişehir'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Alavardı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Havzan'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Harput'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kültür'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Rızaiye'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Sürsürü'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Ataşehir'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kıranköy'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Emek'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Barış'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Bağlarbaşı'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Esentepe'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kazım Karabekir'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Serinevler'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Kışla'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Doğankent'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE name = VALUES(name);
INSERT INTO neighborhoods (district_id, name)
SELECT d.id, 'Yunusoğlu'
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE name = VALUES(name);

/* Kategori sadeleştirme: sadece 3 ana kategori kalacak. */
INSERT INTO categories (id, parent_id, name, slug, type, is_active) VALUES
  (1, NULL, 'Sebze', 'sebze', 'vegetable', TRUE),
  (2, NULL, 'Meyve', 'meyve', 'fruit', TRUE),
  (3, NULL, 'Diğer', 'diger', 'other', TRUE)
ON DUPLICATE KEY UPDATE parent_id = NULL, name = VALUES(name), slug = VALUES(slug), type = VALUES(type), is_active = TRUE;

UPDATE products p
JOIN categories c ON c.id = p.category_id
SET p.category_id = CASE
  WHEN c.type = 'vegetable' THEN 1
  WHEN c.type = 'fruit' THEN 2
  ELSE 3
END
WHERE c.id NOT IN (1,2,3);

UPDATE demand_requests dr
JOIN categories c ON c.id = dr.category_id
SET dr.category_id = CASE
  WHEN c.type = 'vegetable' THEN 1
  WHEN c.type = 'fruit' THEN 2
  ELSE 3
END
WHERE c.id NOT IN (1,2,3);

DELETE FROM categories WHERE id NOT IN (1,2,3);
