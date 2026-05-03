/*
EkineraGo büyük demo seed — Aşama 03
Amaç: 11 tüketici için kişi başı 20 geçmiş sipariş = 220 sipariş; sipariş kalemleri, kargo ve cüzdan hareketleri.
Önce Aşama 00, 01, 02 çalıştırılmalı.
*/
USE ekinerago;
SET NAMES utf8mb4;


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'selin.koc@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'onur.kara@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'derya.polat@ekinerago.test';


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT u.id, 'deposit', 50000.00, 50000.00, NULL, 'Büyük demo başlangıç bakiyesi', DATE_SUB('2026-01-10 09:00:00', INTERVAL 1 DAY)
FROM users u WHERE u.email = 'emre.celik@ekinerago.test';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 455.77, 59.90, 0.00, 515.67,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01010001', '2026-01-22 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 118.41, 177.62, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 48.44, 72.66, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-sezonluk-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 83.13, 166.26, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 39.23, 39.23, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-taze-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-01010001', 'delivered', '2026-01-23 14:45:00', '2026-01-25 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -515.67, 49484.33, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 515.67, 515.67, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 162.23, 49.90, 0.00, 212.13,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01020002', '2026-01-27 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 32.43, 81.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 54.10, 81.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-koy-tipi-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-01020002', 'delivered', '2026-01-28 16:00:00', '2026-01-30 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -212.13, 49272.20, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 212.13, 212.13, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 354.01, 49.90, 0.00, 403.91,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01030003', '2026-02-01 16:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 190.98, 286.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-gunluk-hasat-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 31.02, 31.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 9.13, 36.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01030003', 'delivered', '2026-02-02 16:20:00', '2026-02-04 16:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -403.91, 48868.29, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 403.91, 403.91, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 337.59, 59.90, 0.00, 397.49,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01040004', '2026-02-06 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 31.16, 31.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 54.13, 135.33, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 65.29, 97.94, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 36.58, 73.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-koy-tipi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-01040004', 'delivered', '2026-02-07 12:30:00', '2026-02-09 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -397.49, 48470.80, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 397.49, 397.49, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 568.93, 29.90, 0.00, 598.83,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01050005', '2026-02-11 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 33.27, 133.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 87.17, 435.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-01050005', 'delivered', '2026-02-12 16:00:00', '2026-02-14 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -598.83, 47871.97, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 598.83, 598.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 702.87, 59.90, 0.00, 762.77,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01060006', '2026-02-16 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 40.95, 204.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 184.94, 462.35, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 35.77, 35.77, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-taze-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01060006', 'delivered', '2026-02-17 10:45:00', '2026-02-19 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -762.77, 47109.20, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 762.77, 762.77, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 6526.94, 0.00, 326.35, 6200.59,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01070007', '2026-02-21 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 301.46, 6029.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 57.31, 229.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 69.68, 104.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 65.59, 163.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-01070007', 'delivered', '2026-02-22 15:30:00', '2026-02-24 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -6200.59, 40908.61, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 6200.59, 6200.59, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 808.62, 0.00, 0.00, 808.62,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01080008', '2026-02-26 13:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 61.53, 153.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 163.70, 654.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-koy-tipi-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-01080008', 'delivered', '2026-02-27 13:10:00', '2026-03-01 13:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -808.62, 40099.99, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 808.62, 808.62, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 446.79, 49.90, 0.00, 496.69,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01090009', '2026-03-03 17:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 10.97, 54.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 21.77, 87.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-gunluk-hasat-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 50.81, 304.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-gunluk-hasat-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01090009', 'delivered', '2026-03-04 17:45:00', '2026-03-06 17:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -496.69, 39603.30, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 496.69, 496.69, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 878.15, 0.00, 0.00, 878.15,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01100010', '2026-03-08 18:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 44.71, 670.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 11.49, 45.96, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 79.01, 118.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 21.51, 43.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-taze-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-01100010', 'delivered', '2026-03-09 18:00:00', '2026-03-11 18:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -878.15, 38725.15, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 878.15, 878.15, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1171.95, 0.00, 0.00, 1171.95,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01110011', '2026-03-13 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 46.58, 698.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-dogal-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 189.30, 473.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-01110011', 'delivered', '2026-03-14 14:30:00', '2026-03-16 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1171.95, 37553.20, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1171.95, 1171.95, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 563.08, 29.90, 0.00, 592.98,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01120012', '2026-03-18 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 25.10, 251.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 50.76, 253.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 38.85, 58.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-01120012', 'delivered', '2026-03-19 16:00:00', '2026-03-21 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -592.98, 36960.22, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 592.98, 592.98, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 563.98, 39.90, 0.00, 603.88,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01130013', '2026-03-23 17:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 21.24, 31.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 170.09, 340.18, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 33.34, 166.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 12.62, 25.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01130013', 'delivered', '2026-03-24 17:20:00', '2026-03-26 17:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -603.88, 36356.34, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 603.88, 603.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 434.79, 29.90, 21.74, 442.95,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01140014', '2026-03-28 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 57.49, 172.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-dogal-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 43.72, 262.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-dogal-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-01140014', 'delivered', '2026-03-29 12:10:00', '2026-03-31 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -442.95, 35913.39, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 442.95, 442.95, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 286.62, 59.90, 0.00, 346.52,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01150015', '2026-04-02 14:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 26.52, 132.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 47.86, 47.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-koy-tipi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 70.77, 106.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01150015', 'delivered', '2026-04-03 14:10:00', '2026-04-05 14:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -346.52, 35566.87, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 346.52, 346.52, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 438.43, 49.90, 0.00, 488.33,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01160016', '2026-04-07 18:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 14.55, 43.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 3.99, 7.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 83.93, 335.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 20.43, 51.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01160016', 'delivered', '2026-04-08 18:30:00', '2026-04-10 18:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -488.33, 35078.54, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 488.33, 488.33, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 683.34, 49.90, 0.00, 733.24,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01170017', '2026-04-12 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 145.81, 583.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 40.04, 100.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-01170017', 'delivered', '2026-04-13 14:45:00', '2026-04-15 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -733.24, 34345.30, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 733.24, 733.24, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 559.22, 59.90, 0.00, 619.12,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01180018', '2026-04-17 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 43.97, 87.94, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dogal-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 130.42, 260.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-koy-tipi-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 52.61, 210.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-01180018', 'delivered', '2026-04-18 10:45:00', '2026-04-20 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -619.12, 33726.18, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 619.12, 619.12, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1343.83, 0.00, 0.00, 1343.83,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01190019', '2026-04-22 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 41.09, 102.73, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-taze-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 138.78, 832.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 57.34, 286.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 60.86, 121.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-01190019', 'delivered', '2026-04-23 11:00:00', '2026-04-25 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1343.83, 32382.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1343.83, 1343.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-01-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 482.62, 59.90, 0.00, 542.52,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-01200020', '2026-04-27 18:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 54.22, 271.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-sezonluk-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 52.88, 211.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-01-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-01200020', 'delivered', '2026-04-28 18:00:00', '2026-04-30 18:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-01-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -542.52, 31839.83, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-01-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 542.52, 542.52, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 469.41, 39.90, 0.00, 509.31,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02010021', '2026-01-29 18:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 23.43, 46.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 84.51, 422.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-taze-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-02010021', 'delivered', '2026-01-30 18:30:00', '2026-02-01 18:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -509.31, 49490.69, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 509.31, 1051.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 813.81, 0.00, 0.00, 813.81,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02020022', '2026-02-03 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 73.71, 221.13, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 89.97, 359.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 93.12, 232.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-02020022', 'delivered', '2026-02-04 16:00:00', '2026-02-06 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -813.81, 48676.88, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 813.81, 813.81, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 335.95, 29.90, 0.00, 365.85,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02030023', '2026-02-08 17:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 22.82, 136.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 34.09, 34.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 54.06, 54.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 36.96, 110.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02030023', 'delivered', '2026-02-09 17:45:00', '2026-02-11 17:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -365.85, 48311.03, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 365.85, 365.85, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 814.96, 0.00, 0.00, 814.96,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02040024', '2026-02-13 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 369.64, 739.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 50.45, 75.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02040024', 'delivered', '2026-02-14 14:20:00', '2026-02-16 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -814.96, 47496.07, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 814.96, 814.96, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 552.50, 59.90, 0.00, 612.40,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02050025', '2026-02-18 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 51.20, 153.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 54.30, 217.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 36.34, 181.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-02050025', 'delivered', '2026-02-19 14:45:00', '2026-02-21 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -612.40, 46883.67, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 612.40, 612.40, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 632.04, 29.90, 0.00, 661.94,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02060026', '2026-02-23 11:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 137.91, 275.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 18.71, 37.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 53.25, 79.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 19.91, 238.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02060026', 'delivered', '2026-02-24 11:45:00', '2026-02-26 11:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -661.94, 46221.73, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 661.94, 661.94, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1016.32, 0.00, 50.82, 965.50,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02070027', '2026-02-28 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 40.19, 100.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 183.17, 915.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02070027', 'delivered', '2026-03-01 10:00:00', '2026-03-03 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -965.50, 45256.23, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 965.50, 965.50, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 6713.51, 0.00, 0.00, 6713.51,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02080028', '2026-03-05 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 317.46, 6349.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 44.26, 265.56, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 19.75, 98.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02080028', 'delivered', '2026-03-06 17:10:00', '2026-03-08 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -6713.51, 38542.72, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 6713.51, 6713.51, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1002.55, 0.00, 0.00, 1002.55,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02090029', '2026-03-10 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 156.09, 780.45, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 42.66, 85.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 94.93, 94.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 13.95, 41.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-02090029', 'delivered', '2026-03-11 12:30:00', '2026-03-13 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1002.55, 37540.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1002.55, 1002.55, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 233.32, 59.90, 0.00, 293.22,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02100030', '2026-03-15 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 60.87, 91.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 47.34, 142.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-02100030', 'delivered', '2026-03-16 10:00:00', '2026-03-18 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -293.22, 37246.95, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 293.22, 293.22, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 672.01, 59.90, 0.00, 731.91,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02110031', '2026-03-20 16:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 37.55, 112.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 89.97, 359.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 49.87, 199.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02110031', 'delivered', '2026-03-21 16:20:00', '2026-03-23 16:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -731.91, 36515.04, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 731.91, 731.91, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 622.89, 39.90, 0.00, 662.79,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02120032', '2026-03-25 15:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 61.55, 246.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 23.00, 230.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 68.97, 68.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 51.81, 77.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-sezonluk-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-02120032', 'delivered', '2026-03-26 15:45:00', '2026-03-28 15:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -662.79, 35852.25, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 662.79, 662.79, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 581.54, 59.90, 0.00, 641.44,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02130033', '2026-03-30 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 137.87, 551.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 10.02, 30.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-02130033', 'delivered', '2026-03-31 17:30:00', '2026-04-02 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -641.44, 35210.81, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 641.44, 641.44, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 6568.24, 0.00, 328.41, 6239.83,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02140034', '2026-04-04 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 303.40, 3034.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 167.41, 3348.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 46.51, 186.04, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-02140034', 'delivered', '2026-04-05 14:20:00', '2026-04-07 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -6239.83, 28970.98, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 6239.83, 6239.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1099.26, 0.00, 0.00, 1099.26,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02150035', '2026-04-09 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 72.91, 109.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 288.99, 722.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-taze-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 24.63, 123.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 48.09, 144.27, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-02150035', 'delivered', '2026-04-10 12:10:00', '2026-04-12 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1099.26, 27871.72, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1099.26, 1099.26, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 95.12, 29.90, 0.00, 125.02,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02160036', '2026-04-14 12:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 23.11, 57.77, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 37.35, 37.35, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-02160036', 'delivered', '2026-04-15 12:00:00', '2026-04-17 12:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -125.02, 27746.70, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 125.02, 125.02, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 222.00, 39.90, 0.00, 261.90,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02170037', '2026-04-19 14:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 66.61, 133.22, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 45.50, 45.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 21.64, 43.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-02170037', 'delivered', '2026-04-20 14:00:00', '2026-04-22 14:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -261.90, 27484.80, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 261.90, 777.57, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 753.65, 0.00, 0.00, 753.65,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02180038', '2026-04-24 16:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 60.80, 182.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 32.43, 97.29, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 118.82, 356.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 78.33, 117.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-02180038', 'delivered', '2026-04-25 16:45:00', '2026-04-27 16:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -753.65, 26731.15, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 753.65, 965.78, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 369.94, 49.90, 0.00, 419.84,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02190039', '2026-01-11 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 80.71, 121.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 165.92, 248.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-02190039', 'delivered', '2026-01-12 10:00:00', '2026-01-14 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -419.84, 26311.31, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 419.84, 823.75, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-02-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 215.88, 59.90, 0.00, 275.78,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-02200040', '2026-01-16 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 9.08, 36.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 54.13, 54.13, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 41.81, 125.43, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-taze-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-02-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-02200040', 'delivered', '2026-01-17 16:00:00', '2026-01-19 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-02-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -275.78, 26035.53, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-02-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 275.78, 673.27, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 361.93, 59.90, 0.00, 421.83,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03010041', '2026-02-05 10:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 36.58, 182.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-koy-tipi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 12.82, 64.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-koy-tipi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 76.62, 114.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03010041', 'delivered', '2026-02-06 10:10:00', '2026-02-08 10:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -421.83, 49578.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 421.83, 1095.10, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 932.28, 0.00, 0.00, 932.28,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03020042', '2026-02-10 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 189.93, 189.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 80.44, 402.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 57.30, 57.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-dogal-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 56.57, 282.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-sezonluk-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03020042', 'delivered', '2026-02-11 17:30:00', '2026-02-13 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -932.28, 48645.89, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 932.28, 1531.11, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 276.14, 39.90, 0.00, 316.04,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03030043', '2026-02-15 16:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 43.59, 217.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 58.19, 58.19, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03030043', 'delivered', '2026-02-16 16:45:00', '2026-02-18 16:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -316.04, 48329.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 316.04, 1078.81, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 258.54, 29.90, 0.00, 288.44,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03040044', '2026-02-20 17:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 32.19, 32.19, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-koy-tipi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 27.21, 54.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-sezonluk-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 57.31, 171.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03040044', 'delivered', '2026-02-21 17:20:00', '2026-02-23 17:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -288.44, 48041.41, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 288.44, 6489.03, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 549.65, 59.90, 0.00, 609.55,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03050045', '2026-02-25 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 52.43, 78.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 11.35, 34.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-sezonluk-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 145.66, 145.66, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 19.42, 291.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-taze-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-03050045', 'delivered', '2026-02-26 15:30:00', '2026-02-28 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -609.55, 47431.86, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 609.55, 1418.17, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 349.21, 59.90, 0.00, 409.11,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03060046', '2026-03-02 14:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 16.54, 16.54, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 221.78, 332.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03060046', 'delivered', '2026-03-03 14:00:00', '2026-03-05 14:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -409.11, 47022.75, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 409.11, 905.80, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 648.51, 29.90, 32.43, 645.98,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03070047', '2026-03-07 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 79.01, 79.01, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 44.71, 447.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 40.80, 122.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03070047', 'delivered', '2026-03-08 12:10:00', '2026-03-10 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -645.98, 46376.77, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 645.98, 1524.13, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 843.58, 0.00, 0.00, 843.58,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03080048', '2026-03-12 10:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 81.72, 204.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 40.21, 201.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 38.57, 154.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 189.30, 283.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-03080048', 'delivered', '2026-03-13 10:10:00', '2026-03-15 10:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -843.58, 45533.19, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 843.58, 2015.53, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 608.28, 39.90, 0.00, 648.18,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03090049', '2026-03-17 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 189.60, 474.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 53.71, 134.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03090049', 'delivered', '2026-03-18 11:00:00', '2026-03-20 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -648.18, 44885.01, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 648.18, 1241.16, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 365.56, 59.90, 0.00, 425.46,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03100050', '2026-03-22 13:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 170.09, 255.13, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 31.57, 31.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 39.43, 78.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-taze-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03100050', 'delivered', '2026-03-23 13:00:00', '2026-03-25 13:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -425.46, 44459.55, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 425.46, 1029.34, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 545.73, 49.90, 0.00, 595.63,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03110051', '2026-03-27 13:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 57.49, 143.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-dogal-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 39.81, 79.62, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 43.72, 262.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-dogal-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 40.05, 60.07, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03110051', 'delivered', '2026-03-28 13:30:00', '2026-03-30 13:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -595.63, 43863.92, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 595.63, 1038.58, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 217.38, 49.90, 0.00, 267.28,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03120052', '2026-04-01 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 80.32, 160.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 37.83, 56.74, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03120052', 'delivered', '2026-04-02 12:10:00', '2026-04-04 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -267.28, 43596.64, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 267.28, 613.80, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 347.34, 39.90, 0.00, 387.24,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03130053', '2026-04-06 16:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 68.80, 68.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 49.58, 247.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 20.43, 30.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03130053', 'delivered', '2026-04-07 16:45:00', '2026-04-09 16:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -387.24, 43209.40, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 387.24, 875.57, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1756.70, 0.00, 87.84, 1668.86,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03140054', '2026-04-11 13:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 191.75, 575.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 72.33, 108.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 145.81, 729.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 68.78, 343.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03140054', 'delivered', '2026-04-12 13:00:00', '2026-04-14 13:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1668.86, 41540.54, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1668.86, 2402.10, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 504.53, 59.90, 0.00, 564.43,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03150055', '2026-04-16 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 119.85, 239.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 105.93, 264.83, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-taze-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-03150055', 'delivered', '2026-04-17 14:30:00', '2026-04-19 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -564.43, 40976.11, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 564.43, 1183.55, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 444.81, 49.90, 0.00, 494.71,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03160056', '2026-04-21 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 43.68, 174.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 65.38, 98.07, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 57.34, 172.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-03160056', 'delivered', '2026-04-22 12:30:00', '2026-04-24 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -494.71, 40481.40, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 494.71, 1838.54, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 679.15, 29.90, 0.00, 709.05,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03170057', '2026-04-26 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 23.43, 93.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 88.12, 352.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 21.67, 21.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 84.51, 211.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-taze-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03170057', 'delivered', '2026-04-27 16:00:00', '2026-04-29 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -709.05, 39772.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 709.05, 1760.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 523.32, 49.90, 0.00, 573.22,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03180058', '2026-01-13 11:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 57.38, 86.07, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 87.45, 437.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-dogal-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-03180058', 'delivered', '2026-01-14 11:10:00', '2026-01-16 11:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -573.22, 39199.13, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 573.22, 1387.03, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 446.14, 49.90, 0.00, 496.04,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03190059', '2026-01-18 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 34.34, 137.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 46.27, 92.54, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 54.06, 216.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-03190059', 'delivered', '2026-01-19 12:30:00', '2026-01-21 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -496.04, 38703.09, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 496.04, 861.89, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-03-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 519.35, 29.90, 0.00, 549.25,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-03200060', '2026-01-23 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 24.35, 97.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 50.45, 126.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 44.05, 132.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 40.92, 163.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-gunluk-hasat-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-03-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-03200060', 'delivered', '2026-01-24 17:30:00', '2026-01-26 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-03-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -549.25, 38153.84, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-03-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 549.25, 1364.21, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1014.21, 0.00, 0.00, 1014.21,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04010061', '2026-02-12 10:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 50.45, 75.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 68.93, 103.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-taze-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 192.76, 578.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 102.74, 256.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-koy-tipi-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-04010061', 'delivered', '2026-02-13 10:30:00', '2026-02-15 10:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1014.21, 48985.79, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1014.21, 2378.42, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 414.33, 49.90, 0.00, 464.23,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04020062', '2026-02-17 13:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 61.63, 184.89, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-dogal-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 38.24, 229.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-sezonluk-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-04020062', 'delivered', '2026-02-18 13:10:00', '2026-02-20 13:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -464.23, 48521.56, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 464.23, 1076.63, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 205.16, 49.90, 0.00, 255.06,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04030063', '2026-02-22 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 18.71, 37.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 14.57, 58.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 54.73, 109.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04030063', 'delivered', '2026-02-23 14:45:00', '2026-02-25 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -255.06, 48266.50, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 255.06, 917.00, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 468.07, 39.90, 0.00, 507.97,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04040064', '2026-02-27 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 33.66, 168.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 41.64, 41.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-gunluk-hasat-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 31.37, 94.11, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 82.01, 164.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-gunluk-hasat-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04040064', 'delivered', '2026-02-28 16:00:00', '2026-03-02 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -507.97, 47758.53, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 507.97, 1473.47, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 80.89, 59.90, 0.00, 140.79,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04050065', '2026-03-04 15:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 19.75, 29.62, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 51.27, 51.27, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-04050065', 'delivered', '2026-03-05 15:00:00', '2026-03-07 15:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -140.79, 47617.74, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 140.79, 6854.30, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 379.54, 39.90, 0.00, 419.44,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04060066', '2026-03-09 11:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 28.82, 43.23, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-dogal-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 83.51, 208.78, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 85.02, 127.53, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-koy-tipi-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-04060066', 'delivered', '2026-03-10 11:30:00', '2026-03-12 11:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -419.44, 47198.30, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 419.44, 1421.99, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 517.68, 39.90, 25.88, 531.70,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04070067', '2026-03-14 16:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 69.06, 207.18, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-dogal-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 34.98, 52.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-taze-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 47.03, 70.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 46.87, 187.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-04070067', 'delivered', '2026-03-15 16:30:00', '2026-03-17 16:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -531.70, 46666.60, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 531.70, 824.92, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 229.70, 39.90, 0.00, 269.60,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04080068', '2026-03-19 18:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 89.97, 134.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 18.95, 94.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-04080068', 'delivered', '2026-03-20 18:20:00', '2026-03-22 18:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -269.60, 46397.00, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 269.60, 1001.51, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2448.08, 0.00, 0.00, 2448.08,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04090069', '2026-03-24 10:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 29.36, 44.04, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 107.54, 430.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 164.49, 1973.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-dogal-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04090069', 'delivered', '2026-03-25 10:30:00', '2026-03-27 10:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -2448.08, 43948.92, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 2448.08, 3110.87, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2607.44, 0.00, 0.00, 2607.44,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04100070', '2026-03-29 16:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 47.73, 238.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 78.01, 117.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-taze-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 137.25, 2058.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-sezonluk-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 193.02, 193.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-koy-tipi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-04100070', 'delivered', '2026-03-30 16:30:00', '2026-04-01 16:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -2607.44, 41341.48, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 2607.44, 3248.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 734.42, 49.90, 0.00, 784.32,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04110071', '2026-04-03 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 47.01, 470.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 66.08, 264.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-dogal-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04110071', 'delivered', '2026-04-04 18:45:00', '2026-04-06 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -784.32, 40557.16, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 784.32, 7024.15, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 997.57, 0.00, 0.00, 997.57,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04120072', '2026-04-08 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 104.02, 104.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 40.53, 810.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 27.65, 82.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-taze-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-04120072', 'delivered', '2026-04-09 17:10:00', '2026-04-11 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -997.57, 39559.59, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 997.57, 2096.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 492.45, 29.90, 0.00, 522.35,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04130073', '2026-04-13 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 37.35, 56.03, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 67.59, 270.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-taze-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 100.70, 100.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 32.68, 65.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-koy-tipi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-04130073', 'delivered', '2026-04-14 10:45:00', '2026-04-16 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -522.35, 39037.24, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 522.35, 647.37, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 272.00, 49.90, 13.60, 308.30,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04140074', '2026-04-18 10:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 45.50, 182.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 22.50, 90.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-koy-tipi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04140074', 'delivered', '2026-04-19 10:30:00', '2026-04-21 10:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -308.30, 38728.94, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 308.30, 1085.87, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 228.55, 29.90, 0.00, 258.45,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04150075', '2026-04-23 15:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 58.17, 87.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-taze-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 18.93, 28.39, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 75.27, 112.91, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-04150075', 'delivered', '2026-04-24 15:45:00', '2026-04-26 15:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -258.45, 38470.49, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 258.45, 1224.23, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 978.42, 0.00, 0.00, 978.42,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04160076', '2026-01-10 11:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 285.21, 427.81, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 58.22, 291.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 116.74, 175.11, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-dogal-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 84.40, 84.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04160076', 'delivered', '2026-01-11 11:20:00', '2026-01-13 11:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -978.42, 37492.07, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 978.42, 1802.17, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 223.38, 39.90, 0.00, 263.28,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04170077', '2026-01-15 16:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 79.64, 159.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 12.82, 64.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-koy-tipi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-04170077', 'delivered', '2026-01-16 16:30:00', '2026-01-18 16:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -263.28, 37228.79, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 263.28, 1358.38, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 459.96, 29.90, 0.00, 489.86,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04180078', '2026-01-20 11:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 57.30, 143.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-dogal-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 56.57, 169.71, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-sezonluk-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 36.75, 147.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-koy-tipi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-04180078', 'delivered', '2026-01-21 11:30:00', '2026-01-23 11:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -489.86, 36738.93, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 489.86, 2020.97, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1052.76, 0.00, 0.00, 1052.76,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04190079', '2026-01-25 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 66.96, 100.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-dogal-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 58.19, 174.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 184.94, 554.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 89.17, 222.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-04190079', 'delivered', '2026-01-26 15:30:00', '2026-01-28 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1052.76, 35686.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1052.76, 2131.57, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-04-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 586.95, 29.90, 0.00, 616.85,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-04200080', '2026-01-30 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 57.31, 286.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 75.10, 300.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-04-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-04200080', 'delivered', '2026-01-31 16:00:00', '2026-02-02 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-04-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -616.85, 35069.32, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-04-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 616.85, 7105.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 361.37, 49.90, 0.00, 411.27,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05010081', '2026-02-19 12:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 37.41, 74.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 57.31, 286.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05010081', 'delivered', '2026-02-20 12:20:00', '2026-02-22 12:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -411.27, 49588.73, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 411.27, 7517.15, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 361.72, 39.90, 0.00, 401.62,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05020082', '2026-02-24 13:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 32.27, 32.27, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 52.43, 209.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 39.91, 119.73, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05020082', 'delivered', '2026-02-25 13:30:00', '2026-02-27 13:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -401.62, 49187.11, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 401.62, 1819.79, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1655.34, 0.00, 0.00, 1655.34,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05030083', '2026-03-01 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 55.25, 82.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-dogal-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 25.35, 507.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 221.78, 665.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 100.03, 400.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-05030083', 'delivered', '2026-03-02 15:30:00', '2026-03-04 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1655.34, 47531.77, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1655.34, 2561.14, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 172.31, 29.90, 0.00, 202.21,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05040084', '2026-03-06 13:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 13.21, 52.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 47.79, 119.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-05040084', 'delivered', '2026-03-07 13:45:00', '2026-03-09 13:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -202.21, 47329.56, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 202.21, 1726.34, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 308.95, 39.90, 0.00, 348.85,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05050085', '2026-03-11 13:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 38.57, 38.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 64.33, 128.66, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 70.86, 141.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-05050085', 'delivered', '2026-03-12 13:45:00', '2026-03-14 13:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -348.85, 46980.71, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 348.85, 2364.38, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 522.11, 39.90, 0.00, 562.01,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05060086', '2026-03-16 15:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 38.85, 116.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 32.86, 131.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-taze-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 25.44, 63.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-taze-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 52.63, 210.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-koy-tipi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05060086', 'delivered', '2026-03-17 15:45:00', '2026-03-19 15:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -562.01, 46418.70, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 562.01, 1803.17, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 144.95, 39.90, 7.25, 177.60,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05070087', '2026-03-21 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 10.91, 32.73, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 56.11, 112.22, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-05070087', 'delivered', '2026-03-22 17:10:00', '2026-03-24 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -177.60, 46241.10, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 177.60, 1206.94, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 801.30, 0.00, 0.00, 801.30,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05080088', '2026-03-26 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 147.97, 147.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 243.62, 609.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 22.14, 44.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-05080088', 'delivered', '2026-03-27 14:30:00', '2026-03-29 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -801.30, 45439.80, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 801.30, 1839.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 444.33, 49.90, 0.00, 494.23,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05090089', '2026-03-31 16:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 33.65, 50.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 39.77, 159.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 8.82, 17.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 72.38, 217.14, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-05090089', 'delivered', '2026-04-01 16:20:00', '2026-04-03 16:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -494.23, 44945.57, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 494.23, 1108.03, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 239.20, 59.90, 0.00, 299.10,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05100090', '2026-04-05 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 42.02, 210.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-gunluk-hasat-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 14.55, 29.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-05100090', 'delivered', '2026-04-06 17:10:00', '2026-04-08 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -299.10, 44646.47, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 299.10, 1174.67, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 252.25, 29.90, 0.00, 282.15,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05110091', '2026-04-10 13:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 40.04, 100.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 49.37, 49.37, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 34.26, 102.78, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-05110091', 'delivered', '2026-04-11 13:20:00', '2026-04-13 13:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -282.15, 44364.32, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 282.15, 2684.25, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 370.78, 29.90, 0.00, 400.68,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05120092', '2026-04-15 11:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 52.61, 78.91, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 43.97, 43.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dogal-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 42.98, 171.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 37.99, 75.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-05120092', 'delivered', '2026-04-16 11:30:00', '2026-04-18 11:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -400.68, 43963.64, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 400.68, 1584.23, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 94.53, 29.90, 0.00, 124.43,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05130093', '2026-04-20 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 53.44, 53.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 41.09, 41.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-taze-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05130093', 'delivered', '2026-04-21 12:10:00', '2026-04-23 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -124.43, 43839.21, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 124.43, 1962.97, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 463.00, 39.90, 23.15, 479.75,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05140094', '2026-04-25 13:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 21.67, 65.01, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 5.29, 79.35, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 79.66, 318.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05140094', 'delivered', '2026-04-26 13:10:00', '2026-04-28 13:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -479.75, 43359.46, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 479.75, 2240.63, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 571.57, 29.90, 0.00, 601.47,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05150095', '2026-01-12 17:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 21.38, 128.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-sezonluk-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 57.38, 114.76, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 51.80, 103.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 89.97, 224.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05150095', 'delivered', '2026-01-13 17:00:00', '2026-01-15 17:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -601.47, 42757.99, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 601.47, 1988.50, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 206.96, 29.90, 0.00, 236.86,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05160096', '2026-01-17 16:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 46.27, 115.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 22.82, 91.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-05160096', 'delivered', '2026-01-18 16:30:00', '2026-01-20 16:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -236.86, 42521.13, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 236.86, 1098.75, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 633.70, 29.90, 0.00, 663.60,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05170097', '2026-01-22 14:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 192.76, 289.14, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 40.92, 163.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-gunluk-hasat-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 120.59, 180.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-05170097', 'delivered', '2026-01-23 14:10:00', '2026-01-25 14:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -663.60, 41857.53, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 663.60, 3042.02, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1772.21, 0.00, 0.00, 1772.21,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05180098', '2026-01-27 13:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 23.31, 93.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 47.19, 141.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 38.24, 764.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-sezonluk-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 193.15, 772.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-05180098', 'delivered', '2026-01-28 13:45:00', '2026-01-30 13:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1772.21, 40085.32, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1772.21, 2848.84, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1034.01, 0.00, 0.00, 1034.01,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05190099', '2026-02-01 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 137.91, 827.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 68.85, 206.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-05190099', 'delivered', '2026-02-02 10:00:00', '2026-02-04 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1034.01, 39051.31, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1034.01, 1951.01, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-05-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1724.96, 0.00, 0.00, 1724.96,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-05200100', '2026-02-06 15:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 256.24, 768.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-gunluk-hasat-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 198.87, 795.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 40.19, 160.76, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-05-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-05200100', 'delivered', '2026-02-07 15:20:00', '2026-02-09 15:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-05-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1724.96, 37326.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-05-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1724.96, 3198.43, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 240.80, 29.90, 0.00, 270.70,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06010101', '2026-02-26 15:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 35.88, 53.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-gunluk-hasat-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 99.44, 99.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-dogal-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 87.54, 87.54, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-06010101', 'delivered', '2026-02-27 15:10:00', '2026-03-01 15:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -270.70, 49729.30, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 270.70, 3469.13, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 595.59, 39.90, 0.00, 635.49,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06020102', '2026-03-03 12:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 44.26, 442.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 38.43, 38.43, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 37.53, 75.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-dogal-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 19.75, 39.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06020102', 'delivered', '2026-03-04 12:45:00', '2026-03-06 12:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -635.49, 49093.81, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 635.49, 7489.79, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 845.89, 0.00, 0.00, 845.89,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06030103', '2026-03-08 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 32.72, 65.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 156.09, 780.45, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06030103', 'delivered', '2026-03-09 10:00:00', '2026-03-11 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -845.89, 48247.92, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 845.89, 2267.88, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 3503.64, 0.00, 0.00, 3503.64,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06040104', '2026-03-13 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 83.93, 167.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 163.77, 3275.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-sezonluk-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 60.38, 60.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06040104', 'delivered', '2026-03-14 15:30:00', '2026-03-16 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -3503.64, 44744.28, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 3503.64, 4328.56, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1891.57, 0.00, 0.00, 1891.57,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06050105', '2026-03-18 11:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 173.89, 521.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 179.38, 179.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 230.04, 1150.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 26.88, 40.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-06050105', 'delivered', '2026-03-19 11:45:00', '2026-03-21 11:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1891.57, 42852.71, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1891.57, 2893.08, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 518.98, 59.90, 0.00, 578.88,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06060106', '2026-03-23 13:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 23.00, 345.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 69.59, 173.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06060106', 'delivered', '2026-03-24 13:00:00', '2026-03-26 13:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -578.88, 42273.83, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 578.88, 3689.75, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1287.98, 0.00, 64.40, 1223.58,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06070107', '2026-03-28 18:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 193.02, 965.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-koy-tipi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 49.34, 148.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-gunluk-hasat-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 87.43, 174.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-06070107', 'delivered', '2026-03-29 18:10:00', '2026-03-31 18:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1223.58, 41050.25, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1223.58, 4472.46, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 5878.74, 0.00, 0.00, 5878.74,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06080108', '2026-04-02 17:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 19.06, 57.18, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 284.60, 1138.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 303.40, 4551.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 66.08, 132.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-dogal-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-06080108', 'delivered', '2026-04-03 17:20:00', '2026-04-05 17:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -5878.74, 35171.51, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 5878.74, 12902.89, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 292.44, 49.90, 0.00, 342.34,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06090109', '2026-04-07 15:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 39.12, 117.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-koy-tipi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 43.77, 175.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-06090109', 'delivered', '2026-04-08 15:20:00', '2026-04-10 15:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -342.34, 34829.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 342.34, 2439.17, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 306.70, 39.90, 0.00, 346.60,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06100110', '2026-04-12 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 42.82, 85.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 4.05, 40.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 45.14, 180.56, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-06100110', 'delivered', '2026-04-13 10:45:00', '2026-04-15 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -346.60, 34482.57, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 346.60, 993.97, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1769.67, 0.00, 0.00, 1769.67,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06110111', '2026-04-17 14:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 50.06, 200.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 217.23, 1086.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 86.84, 173.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-gunluk-hasat-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 77.40, 309.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-koy-tipi-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06110111', 'delivered', '2026-04-18 14:10:00', '2026-04-20 14:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1769.67, 32712.90, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1769.67, 2855.54, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 153.62, 49.90, 0.00, 203.52,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06120112', '2026-04-22 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 31.76, 79.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-gunluk-hasat-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 49.48, 74.22, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-06120112', 'delivered', '2026-04-23 18:45:00', '2026-04-25 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -203.52, 32509.38, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 203.52, 1427.75, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 776.55, 0.00, 0.00, 776.55,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06130113', '2026-04-27 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 116.74, 175.11, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-dogal-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 31.02, 31.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 285.21, 570.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06130113', 'delivered', '2026-04-28 11:00:00', '2026-04-30 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -776.55, 31732.83, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 776.55, 2578.72, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 687.48, 39.90, 34.37, 693.01,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06140114', '2026-01-14 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 36.58, 182.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-koy-tipi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 9.08, 45.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 34.37, 412.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 31.16, 46.74, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-06140114', 'delivered', '2026-01-15 17:30:00', '2026-01-17 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -693.01, 31039.82, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 693.01, 2051.39, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 493.43, 39.90, 0.00, 533.33,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06150115', '2026-01-19 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 66.51, 332.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 80.44, 160.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06150115', 'delivered', '2026-01-20 11:00:00', '2026-01-22 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -533.33, 30506.49, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 533.33, 2554.30, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 989.26, 0.00, 0.00, 989.26,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06160116', '2026-01-24 11:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 40.95, 102.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 58.85, 147.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 184.94, 739.76, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-06160116', 'delivered', '2026-01-25 11:45:00', '2026-01-27 11:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -989.26, 29517.23, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 989.26, 3120.83, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 3246.76, 0.00, 0.00, 3246.76,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06170117', '2026-01-29 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 69.68, 139.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 301.46, 3014.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 27.21, 27.21, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-sezonluk-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 65.59, 65.59, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-06170117', 'delivered', '2026-01-30 10:45:00', '2026-02-01 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -3246.76, 26270.47, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 3246.76, 10763.91, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1100.62, 0.00, 0.00, 1100.62,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06180118', '2026-02-03 11:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 51.04, 1020.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 39.91, 79.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-06180118', 'delivered', '2026-02-04 11:10:00', '2026-02-06 11:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1100.62, 25169.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1100.62, 2920.41, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 593.25, 59.90, 0.00, 653.15,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06190119', '2026-02-08 11:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 21.77, 43.54, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-gunluk-hasat-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 100.03, 300.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 124.81, 249.62, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-sezonluk-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06190119', 'delivered', '2026-02-09 11:10:00', '2026-02-11 11:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -653.15, 24516.70, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 653.15, 3214.29, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-06-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 827.27, 0.00, 0.00, 827.27,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-06200120', '2026-02-13 15:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 79.01, 79.01, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 40.80, 122.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 44.71, 536.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 29.78, 89.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-06-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-06200120', 'delivered', '2026-02-14 15:10:00', '2026-02-16 15:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-06-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -827.27, 23689.43, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-06-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 827.27, 2553.61, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 741.47, 39.90, 0.00, 781.37,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07010121', '2026-03-05 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 38.89, 155.56, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 59.13, 295.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-koy-tipi-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 79.01, 158.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 44.08, 132.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-07010121', 'delivered', '2026-03-06 14:30:00', '2026-03-08 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -781.37, 49218.63, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 781.37, 3334.98, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 865.78, 0.00, 0.00, 865.78,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07020122', '2026-03-10 18:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 148.94, 297.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 189.30, 567.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07020122', 'delivered', '2026-03-11 18:30:00', '2026-03-13 18:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -865.78, 48352.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 865.78, 3230.16, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 287.93, 59.90, 0.00, 347.83,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07030123', '2026-03-15 11:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 22.34, 89.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 50.12, 100.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-koy-tipi-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 98.33, 98.33, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-07030123', 'delivered', '2026-03-16 11:10:00', '2026-03-18 11:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -347.83, 48005.02, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 347.83, 2151.00, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1248.47, 0.00, 0.00, 1248.47,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07040124', '2026-03-20 15:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 10.91, 65.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 21.24, 84.96, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 206.99, 1034.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 12.62, 63.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-07040124', 'delivered', '2026-03-21 15:20:00', '2026-03-23 15:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1248.47, 46756.55, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1248.47, 2455.41, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1271.64, 0.00, 0.00, 1271.64,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07050125', '2026-03-25 12:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 190.86, 954.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-sezonluk-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 211.56, 317.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-07050125', 'delivered', '2026-03-26 12:00:00', '2026-03-28 12:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1271.64, 45484.91, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1271.64, 3111.52, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 249.03, 29.90, 0.00, 278.93,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07060126', '2026-03-30 13:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 36.68, 36.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 33.65, 168.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 8.82, 44.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07060126', 'delivered', '2026-03-31 13:30:00', '2026-04-02 13:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -278.93, 45205.98, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 278.93, 1386.96, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 254.36, 49.90, 12.72, 291.54,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07070127', '2026-04-04 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 49.57, 123.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 3.99, 15.96, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 20.96, 83.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 20.43, 30.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-07070127', 'delivered', '2026-04-05 16:00:00', '2026-04-07 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -291.54, 44914.44, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 291.54, 1466.21, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 524.20, 49.90, 0.00, 574.10,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07080128', '2026-04-09 13:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 53.08, 265.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 51.76, 258.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07080128', 'delivered', '2026-04-10 13:30:00', '2026-04-12 13:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -574.10, 44340.34, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 574.10, 3258.35, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 297.61, 59.90, 0.00, 357.51,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07090129', '2026-04-14 15:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 42.98, 42.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 37.99, 75.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 71.46, 178.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dogal-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-07090129', 'delivered', '2026-04-15 15:20:00', '2026-04-17 15:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -357.51, 43982.83, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 357.51, 1941.74, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 712.70, 29.90, 0.00, 742.60,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07100130', '2026-04-19 18:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 65.38, 196.14, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 53.44, 53.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 63.53, 158.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 60.86, 304.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-07100130', 'delivered', '2026-04-20 18:10:00', '2026-04-22 18:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -742.60, 43240.23, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 742.60, 2705.57, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 167.60, 59.90, 0.00, 227.50,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07110131', '2026-04-24 11:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 5.29, 105.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 30.90, 61.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-havuc'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07110131', 'delivered', '2026-04-25 11:20:00', '2026-04-27 11:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -227.50, 43012.73, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 227.50, 2468.13, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 561.13, 59.90, 0.00, 621.03,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07120132', '2026-01-11 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 21.71, 65.13, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 44.99, 67.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 171.41, 428.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-07120132', 'delivered', '2026-01-12 15:30:00', '2026-01-14 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -621.03, 42391.70, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 621.03, 2609.53, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 3043.47, 0.00, 0.00, 3043.47,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07130133', '2026-01-16 15:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 54.06, 162.18, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 81.12, 405.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 377.42, 2264.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 70.39, 211.17, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-taze-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-07130133', 'delivered', '2026-01-17 15:10:00', '2026-01-19 15:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -3043.47, 39348.23, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 3043.47, 4142.22, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 526.41, 59.90, 26.32, 559.99,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07140134', '2026-01-21 12:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 44.05, 44.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 120.59, 482.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-07140134', 'delivered', '2026-01-22 12:45:00', '2026-01-24 12:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -559.99, 38788.24, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 559.99, 3602.01, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 6033.74, 0.00, 0.00, 6033.74,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07150135', '2026-01-26 16:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 58.04, 58.04, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 294.67, 5893.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 32.92, 82.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-07150135', 'delivered', '2026-01-27 16:10:00', '2026-01-29 16:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -6033.74, 32754.50, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 6033.74, 8882.58, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2562.89, 0.00, 0.00, 2562.89,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07160136', '2026-01-31 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 91.23, 364.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 59.65, 298.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 137.91, 1654.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 48.96, 244.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07160136', 'delivered', '2026-02-01 12:30:00', '2026-02-03 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -2562.89, 30191.61, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 2562.89, 4513.90, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 102.65, 39.90, 0.00, 142.55,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07170137', '2026-02-05 16:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 40.19, 40.19, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 41.64, 62.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-gunluk-hasat-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-07170137', 'delivered', '2026-02-06 16:30:00', '2026-02-08 16:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -142.55, 30049.06, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 142.55, 3611.68, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 229.90, 49.90, 0.00, 279.80,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07180138', '2026-02-10 17:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 21.46, 32.19, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-taze-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 17.56, 43.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-taze-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 51.27, 153.81, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-07180138', 'delivered', '2026-02-11 17:45:00', '2026-02-13 17:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -279.80, 29769.26, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 279.80, 7769.59, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 4809.65, 0.00, 0.00, 4809.65,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07190139', '2026-02-15 15:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 167.53, 2512.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-gunluk-hasat-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 360.42, 2162.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 18.01, 36.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 32.72, 98.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-07190139', 'delivered', '2026-02-16 15:00:00', '2026-02-18 15:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -4809.65, 24959.61, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 4809.65, 7077.53, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-07-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 188.43, 29.90, 0.00, 218.33,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-07200140', '2026-02-20 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 47.34, 47.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 47.03, 141.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-07-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-07200140', 'delivered', '2026-02-21 17:10:00', '2026-02-23 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-07-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -218.33, 24741.28, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-07-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 218.33, 4546.89, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 356.68, 49.90, 0.00, 406.58,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08010141', '2026-03-12 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 36.52, 54.78, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-taze-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 60.38, 301.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-08010141', 'delivered', '2026-03-13 10:45:00', '2026-03-15 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -406.58, 49593.42, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 406.58, 4953.47, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1955.07, 0.00, 0.00, 1955.07,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08020142', '2026-03-17 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 37.55, 150.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 142.51, 1710.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 18.95, 94.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-08020142', 'delivered', '2026-03-18 11:00:00', '2026-03-20 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1955.07, 47638.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1955.07, 4848.15, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 850.20, 0.00, 0.00, 850.20,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08030143', '2026-03-22 15:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 68.45, 171.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 102.71, 410.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 30.19, 90.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-sezonluk-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 71.07, 177.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-08030143', 'delivered', '2026-03-23 15:20:00', '2026-03-25 15:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -850.20, 46788.15, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 850.20, 4539.95, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 555.10, 39.90, 0.00, 595.00,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08040144', '2026-03-27 16:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 4.27, 42.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 42.70, 512.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-08040144', 'delivered', '2026-03-28 16:10:00', '2026-03-30 16:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -595.00, 46193.15, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 595.00, 5067.46, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2730.75, 0.00, 0.00, 2730.75,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08050145', '2026-04-01 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 21.86, 54.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-koy-tipi-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 171.14, 855.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 303.40, 1820.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08050145', 'delivered', '2026-04-02 16:00:00', '2026-04-04 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -2730.75, 43462.40, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 2730.75, 15633.64, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 856.73, 0.00, 0.00, 856.73,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08060146', '2026-04-06 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 147.29, 147.29, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 37.98, 569.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-dogal-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 40.53, 81.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 39.12, 58.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-koy-tipi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08060146', 'delivered', '2026-04-07 16:00:00', '2026-04-09 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -856.73, 42605.67, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 856.73, 3295.90, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 309.39, 59.90, 15.47, 353.82,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08070147', '2026-04-11 12:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 42.82, 64.23, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 61.29, 245.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-gunluk-hasat-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08070147', 'delivered', '2026-04-12 12:45:00', '2026-04-14 12:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -353.82, 42251.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 353.82, 1347.79, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 879.70, 0.00, 0.00, 879.70,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08080148', '2026-04-16 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 48.44, 145.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-sezonluk-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 217.23, 543.07, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 63.77, 191.31, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-gunluk-hasat-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08080148', 'delivered', '2026-04-17 10:45:00', '2026-04-19 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -879.70, 41372.15, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 879.70, 3735.24, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 897.36, 0.00, 0.00, 897.36,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08090149', '2026-04-21 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 216.89, 650.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 38.68, 38.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 42.87, 128.61, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 31.76, 79.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-gunluk-hasat-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-08090149', 'delivered', '2026-04-22 14:30:00', '2026-04-24 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -897.36, 40474.79, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 897.36, 2325.11, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1030.29, 0.00, 0.00, 1030.29,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08100150', '2026-04-26 16:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 285.21, 855.63, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 58.22, 174.66, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-08100150', 'delivered', '2026-04-27 16:45:00', '2026-04-29 16:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1030.29, 39444.50, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1030.29, 3609.01, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 324.34, 59.90, 0.00, 384.24,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08110151', '2026-01-13 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 65.29, 261.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 22.51, 45.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 9.08, 18.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-08110151', 'delivered', '2026-01-14 14:20:00', '2026-01-16 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -384.24, 39060.26, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 384.24, 2435.63, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 591.39, 39.90, 0.00, 631.29,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08120152', '2026-01-18 15:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 66.51, 66.51, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 12.24, 73.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 87.17, 261.51, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 189.93, 189.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08120152', 'delivered', '2026-01-19 15:00:00', '2026-01-21 15:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -631.29, 38428.97, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 631.29, 3185.59, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 429.55, 49.90, 0.00, 479.45,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08130153', '2026-01-23 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 58.19, 174.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 254.98, 254.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-08130153', 'delivered', '2026-01-24 14:45:00', '2026-01-26 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -479.45, 37949.52, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 479.45, 3600.28, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 475.55, 49.90, 23.78, 501.67,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08140154', '2026-01-28 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 37.41, 93.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 27.21, 81.63, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-sezonluk-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 75.10, 300.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-08140154', 'delivered', '2026-01-29 12:30:00', '2026-01-31 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -501.67, 37447.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 501.67, 11265.58, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 976.45, 0.00, 0.00, 976.45,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08150155', '2026-02-02 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 39.91, 159.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 52.43, 157.29, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 88.32, 353.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-sezonluk-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 51.04, 306.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-08150155', 'delivered', '2026-02-03 17:10:00', '2026-02-05 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -976.45, 36471.40, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 976.45, 3896.86, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 129.49, 39.90, 0.00, 169.39,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08160156', '2026-02-07 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 25.47, 63.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-sezonluk-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 10.97, 65.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-08160156', 'delivered', '2026-02-08 18:45:00', '2026-02-10 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -169.39, 36302.01, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 169.39, 3383.68, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 424.16, 29.90, 0.00, 454.06,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08170157', '2026-02-12 17:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 47.82, 119.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-taze-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 186.09, 186.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 79.01, 118.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-08170157', 'delivered', '2026-02-13 17:20:00', '2026-02-15 17:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -454.06, 35847.95, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 454.06, 3789.04, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 955.14, 0.00, 0.00, 955.14,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08180158', '2026-02-17 16:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 46.84, 234.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 148.94, 297.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 189.30, 189.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 58.44, 233.76, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-dogal-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-08180158', 'delivered', '2026-02-18 16:10:00', '2026-02-20 16:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -955.14, 34892.81, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 955.14, 4185.30, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 432.35, 49.90, 0.00, 482.25,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08190159', '2026-02-22 14:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 25.10, 376.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 22.34, 55.85, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-08190159', 'delivered', '2026-02-23 14:00:00', '2026-02-25 14:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -482.25, 34410.56, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 482.25, 2633.25, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-08-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 505.38, 29.90, 0.00, 535.28,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-08200160', '2026-02-27 10:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 21.24, 53.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 170.09, 255.13, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 39.43, 197.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-taze-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-08-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-08200160', 'delivered', '2026-02-28 10:45:00', '2026-03-02 10:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-08-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -535.28, 33875.28, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-08-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 535.28, 2990.69, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1204.25, 0.00, 0.00, 1204.25,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09010161', '2026-03-19 15:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 206.99, 1034.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 12.62, 63.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 21.24, 106.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09010161', 'delivered', '2026-03-20 15:30:00', '2026-03-22 15:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1204.25, 48795.75, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1204.25, 4194.94, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 511.50, 49.90, 0.00, 561.40,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09020162', '2026-03-24 12:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 51.43, 205.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-koy-tipi-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 43.72, 174.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-dogal-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 42.99, 64.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 22.14, 66.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-09020162', 'delivered', '2026-03-25 12:45:00', '2026-03-27 12:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -561.40, 48234.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 561.40, 3672.92, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 239.35, 59.90, 0.00, 299.25,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09030163', '2026-03-29 18:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 12.85, 38.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 80.32, 200.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09030163', 'delivered', '2026-03-30 18:20:00', '2026-04-01 18:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -299.25, 47935.10, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 299.25, 1686.21, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 247.98, 59.90, 0.00, 307.88,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09040164', '2026-04-03 13:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 42.02, 63.03, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-gunluk-hasat-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 44.88, 112.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 14.55, 72.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-09040164', 'delivered', '2026-04-04 13:00:00', '2026-04-06 13:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -307.88, 47627.22, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 307.88, 1774.09, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 725.34, 49.90, 0.00, 775.24,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09050165', '2026-04-08 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 68.78, 343.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 34.26, 85.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 90.19, 225.47, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 17.58, 70.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-09050165', 'delivered', '2026-04-09 18:45:00', '2026-04-11 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -775.24, 46851.98, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 775.24, 4033.59, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1208.88, 0.00, 0.00, 1208.88,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09060166', '2026-04-13 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 105.93, 529.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-taze-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 271.69, 679.23, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-09060166', 'delivered', '2026-04-14 14:45:00', '2026-04-16 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1208.88, 45643.10, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1208.88, 3150.62, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 621.84, 59.90, 31.09, 650.65,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09070167', '2026-04-18 15:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 81.38, 406.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-sezonluk-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 87.88, 87.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 63.53, 127.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09070167', 'delivered', '2026-04-19 15:10:00', '2026-04-21 15:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -650.65, 44992.45, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 650.65, 3356.22, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 522.78, 39.90, 0.00, 562.68,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09080168', '2026-04-23 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 88.12, 264.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 5.29, 31.74, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 23.43, 93.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 33.24, 132.96, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-09080168', 'delivered', '2026-04-24 10:00:00', '2026-04-26 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -562.68, 44429.77, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 562.68, 3030.81, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 518.41, 29.90, 0.00, 548.31,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09090169', '2026-01-10 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 88.94, 444.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-koy-tipi-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 73.71, 73.71, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09090169', 'delivered', '2026-01-11 18:45:00', '2026-01-13 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -548.31, 43881.46, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 548.31, 3157.84, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 276.59, 49.90, 0.00, 326.49,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09100170', '2026-01-15 14:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 70.39, 175.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-taze-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 12.37, 49.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 34.09, 51.14, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-09100170', 'delivered', '2026-01-16 14:10:00', '2026-01-18 14:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -326.49, 43554.97, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 326.49, 4468.71, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1190.80, 0.00, 0.00, 1190.80,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09110171', '2026-01-20 14:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 39.61, 39.61, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-gunluk-hasat-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 120.59, 361.77, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 68.93, 275.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-taze-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 102.74, 513.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-koy-tipi-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-09110171', 'delivered', '2026-01-21 14:30:00', '2026-01-23 14:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1190.80, 42364.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1190.80, 4792.81, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 170.85, 39.90, 0.00, 210.75,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09120172', '2026-01-25 18:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 54.30, 54.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 23.31, 116.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09120172', 'delivered', '2026-01-26 18:00:00', '2026-01-28 18:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -210.75, 42153.42, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 210.75, 9093.33, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 358.85, 49.90, 0.00, 408.75,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09130173', '2026-01-30 10:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 48.96, 195.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 14.57, 43.71, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 59.65, 119.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09130173', 'delivered', '2026-01-31 10:20:00', '2026-02-02 10:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -408.75, 41744.67, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 408.75, 4922.65, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 224.75, 29.90, 11.24, 243.41,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09140174', '2026-02-04 14:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 47.55, 95.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 33.66, 50.49, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 11.40, 22.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 28.18, 56.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-taze-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09140174', 'delivered', '2026-02-05 14:45:00', '2026-02-07 14:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -243.41, 41501.26, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 243.41, 3855.09, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 419.99, 49.90, 0.00, 469.89,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09150175', '2026-02-09 15:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 42.74, 256.44, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 32.71, 163.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-09150175', 'delivered', '2026-02-10 15:00:00', '2026-02-12 15:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -469.89, 41031.37, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 469.89, 8239.48, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 3714.92, 0.00, 0.00, 3714.92,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09160176', '2026-02-14 10:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 13.95, 83.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 360.42, 3604.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 18.01, 27.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09160176', 'delivered', '2026-02-15 10:00:00', '2026-02-17 10:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -3714.92, 37316.45, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 3714.92, 10792.45, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2396.70, 0.00, 0.00, 2396.70,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09170177', '2026-02-19 17:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 44.92, 67.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-gunluk-hasat-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 163.77, 1965.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-sezonluk-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 81.89, 327.56, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-gunluk-hasat-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 36.52, 36.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-taze-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09170177', 'delivered', '2026-02-20 17:20:00', '2026-02-22 17:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -2396.70, 34919.75, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 2396.70, 7350.17, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 312.36, 49.90, 0.00, 362.26,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09180178', '2026-02-24 10:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 13.67, 27.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 142.51, 285.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-09180178', 'delivered', '2026-02-25 10:30:00', '2026-02-27 10:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -362.26, 34557.49, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 362.26, 5210.41, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 332.66, 59.90, 0.00, 392.56,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09190179', '2026-03-01 15:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 51.81, 207.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-sezonluk-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 39.71, 79.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 23.00, 46.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-09190179', 'delivered', '2026-03-02 15:10:00', '2026-03-04 15:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -392.56, 34164.93, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 392.56, 4932.51, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-09-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 240.72, 29.90, 0.00, 270.62,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-09200180', '2026-03-06 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 10.02, 50.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 4.27, 42.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 21.98, 54.95, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 37.19, 92.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-09-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-09200180', 'delivered', '2026-03-07 18:45:00', '2026-03-09 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-09-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -270.62, 33894.31, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-09-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 270.62, 5338.08, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 592.18, 49.90, 0.00, 642.08,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10010181', '2026-03-26 13:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 21.98, 65.94, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 4.27, 51.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 193.02, 386.04, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-koy-tipi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 44.48, 88.96, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-taze-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-10010181', 'delivered', '2026-03-27 13:20:00', '2026-03-29 13:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -642.08, 49357.92, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 642.08, 5980.16, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 212.17, 49.90, 0.00, 262.07,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10020182', '2026-03-31 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 45.63, 45.63, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 83.27, 166.54, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-koy-tipi-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10020182', 'delivered', '2026-04-01 14:20:00', '2026-04-03 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -262.07, 49095.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 262.07, 15895.71, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 435.11, 59.90, 0.00, 495.01,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10030183', '2026-04-05 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 147.29, 220.94, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-siyah-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 56.80, 170.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 43.77, 43.77, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-sezonluk-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-10030183', 'delivered', '2026-04-06 12:30:00', '2026-04-08 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -495.01, 48600.84, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 495.01, 3790.91, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1220.82, 0.00, 0.00, 1220.82,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10040184', '2026-04-10 18:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 17.16, 17.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-koy-tipi-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 66.12, 264.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 85.75, 214.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 15.000, 48.32, 724.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-10040184', 'delivered', '2026-04-11 18:10:00', '2026-04-13 18:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1220.82, 47380.02, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1220.82, 2568.61, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 501.60, 39.90, 0.00, 541.50,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10050185', '2026-04-15 11:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 169.08, 169.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 83.13, 332.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-koy-sepeti-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ali.kayra@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-10050185', 'delivered', '2026-04-16 11:20:00', '2026-04-18 11:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -541.50, 46838.52, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 541.50, 4276.74, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 872.41, 0.00, 0.00, 872.41,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10060186', '2026-04-20 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 49.48, 123.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 118.82, 356.46, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 78.45, 392.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-organik-tarla-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mehmet.ozgur@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-10060186', 'delivered', '2026-04-21 18:45:00', '2026-04-23 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -872.41, 45966.11, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 872.41, 3197.52, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 2035.44, 0.00, 101.77, 1933.67,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10070187', '2026-04-25 13:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 190.98, 954.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-gunluk-hasat-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 165.92, 663.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 9.13, 18.26, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 39.86, 398.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-findik-ve-bal-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gulcan.yaman@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10070187', 'delivered', '2026-04-26 13:20:00', '2026-04-28 13:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1933.67, 44032.44, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1933.67, 5542.68, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1660.95, 0.00, 0.00, 1660.95,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10080188', '2026-01-12 17:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 285.09, 1425.45, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-sezonluk-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 47.10, 235.50, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'samandag-narenciye-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'meryem.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-10080188', 'delivered', '2026-01-13 17:00:00', '2026-01-15 17:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1660.95, 42371.49, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1660.95, 4096.58, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 679.98, 59.90, 0.00, 739.88,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10090189', '2026-01-17 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 152.62, 152.62, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-taze-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 123.38, 493.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 22.56, 33.84, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'meram-ciftci-pazari-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'rabia.meram@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10090189', 'delivered', '2026-01-18 12:30:00', '2026-01-20 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -739.88, 41631.61, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 739.88, 3925.47, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 751.76, 0.00, 0.00, 751.76,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10100190', '2026-01-22 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 184.94, 277.41, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 9.00, 18.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-dogal-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 40.95, 81.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-koy-tipi-salatalik'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 74.89, 374.45, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safranbolu-koy-urunleri-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'seda.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10100190', 'delivered', '2026-01-23 16:00:00', '2026-01-25 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -751.76, 40879.85, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 751.76, 4352.04, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 496.21, 29.90, 0.00, 526.11,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10110191', '2026-01-27 11:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 75.83, 379.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-gunluk-hasat-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 39.02, 117.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kadikoy-mikro-bahce-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ece.kent@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10110191', 'delivered', '2026-01-28 11:00:00', '2026-01-30 11:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -526.11, 40353.74, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 526.11, 11791.69, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 223.67, 39.90, 0.00, 263.57,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10120192', '2026-02-01 16:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 41.03, 123.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 39.91, 59.86, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 40.72, 40.72, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kocaeli-seracilik-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'leyla.izmit@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-10120192', 'delivered', '2026-02-02 16:10:00', '2026-02-04 16:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -263.57, 40090.17, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 263.57, 4160.43, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 678.00, 39.90, 0.00, 717.90,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10130193', '2026-02-06 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 197.04, 492.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 34.44, 68.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 25.35, 50.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 10.97, 65.82, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'ege-otlari-atolyesi-maydanoz-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'bahar.ulamis@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-10130193', 'delivered', '2026-02-07 17:10:00', '2026-02-09 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -717.90, 39372.27, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 717.90, 4101.58, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 100.36, 29.90, 5.02, 125.24,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10140194', '2026-02-11 17:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 29.78, 59.56, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-kirmizi-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 40.80, 40.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-avokado-bahcesi-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'dilan.akin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-10140194', 'delivered', '2026-02-12 17:00:00', '2026-02-14 17:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -125.24, 39247.03, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 125.24, 3914.28, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 820.93, 0.00, 0.00, 820.93,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10150195', '2026-02-16 15:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 58.44, 116.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-dogal-muz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 176.91, 530.73, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 43.33, 173.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fethiye-bal-ve-nar-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'gokce.ari@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-10150195', 'delivered', '2026-02-17 15:45:00', '2026-02-19 15:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -820.93, 38426.10, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 820.93, 5006.23, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 524.11, 39.90, 0.00, 564.01,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10160196', '2026-02-21 16:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 52.63, 263.15, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-koy-tipi-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 22.34, 89.36, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 38.85, 116.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-elma'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 11.01, 55.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'pamukkale-sera-dogal-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hale.denizli@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-10160196', 'delivered', '2026-02-22 16:45:00', '2026-02-24 16:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -564.01, 37862.09, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 564.01, 3197.26, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 175.40, 29.90, 0.00, 205.30,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10170197', '2026-02-26 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 45.62, 91.24, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-sezonluk-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 56.11, 84.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'fatsa-karadeniz-sepeti-dogal-dolmalik-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'melike.fatsa@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-10170197', 'delivered', '2026-02-27 18:45:00', '2026-03-01 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -205.30, 37656.79, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 205.30, 4400.24, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 920.00, 0.00, 0.00, 920.00,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10180198', '2026-03-03 16:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 40.05, 200.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-portakal'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 22.14, 110.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 243.62, 609.05, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'hatay-defne-bahcesi-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'selma.defne@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-10180198', 'delivered', '2026-03-04 16:20:00', '2026-03-06 16:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -920.00, 36736.79, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 920.00, 4592.92, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 601.17, 29.90, 0.00, 631.07,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10190199', '2026-03-08 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 26.52, 66.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-dogal-patates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 39.77, 397.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 20.67, 31.01, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-taze-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 70.77, 106.16, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'konya-ova-urunleri-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'esra.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-10190199', 'delivered', '2026-03-09 17:30:00', '2026-03-11 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -631.07, 36105.72, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 631.07, 2317.28, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-10-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 293.54, 49.90, 0.00, 343.44,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-10200200', '2026-03-13 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 20.96, 251.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 42.02, 42.02, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-gunluk-hasat-nar'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-10-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-10200200', 'delivered', '2026-03-14 17:30:00', '2026-03-16 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-10-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -343.44, 35762.28, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-10-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 343.44, 2117.53, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-20';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-01', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 201.85, 29.90, 0.00, 231.75,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11010201', '2026-04-02 16:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 105.47, 158.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-01';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 14.55, 43.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'kumluca-bereket-ciftligi-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ahmet.torun@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-01';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-11010201', 'delivered', '2026-04-03 16:10:00', '2026-04-05 16:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-01'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -231.75, 49768.25, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-01';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 231.75, 2349.28, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-01';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-02', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 974.22, 0.00, 0.00, 974.22,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11020202', '2026-04-07 12:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 43.78, 437.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 68.78, 343.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-02';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 48.13, 192.52, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bursa-dogal-bahce-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'mustafa.bahcivan@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-02';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-11020202', 'delivered', '2026-04-08 12:45:00', '2026-04-10 12:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-02'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -974.22, 48794.03, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-02';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 974.22, 5007.81, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-02';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-03', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 3855.83, 0.00, 0.00, 3855.83,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11030203', '2026-04-12 12:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 34.05, 136.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 43.97, 175.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-dogal-ispanak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 61.87, 309.35, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-sezonluk-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-03';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 323.44, 3234.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-zeytinligi-taze-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'fatma.aydin@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-03';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-11030203', 'delivered', '2026-04-13 12:30:00', '2026-04-15 12:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-03'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -3855.83, 44938.20, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-03';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 3855.83, 7006.45, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-03';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-04', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 122.47, 49.90, 0.00, 172.37,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11040204', '2026-04-17 17:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 41.09, 41.09, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-taze-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-04';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 81.38, 81.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-uzum-bagi-sezonluk-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'sevgi.bagci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-04';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-11040204', 'delivered', '2026-04-18 17:10:00', '2026-04-20 17:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-04'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -172.37, 44765.83, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-04';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 172.37, 3528.59, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-04';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-05', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 8203.62, 0.00, 0.00, 8203.62,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11050205', '2026-04-22 18:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 12.000, 23.26, 279.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-sezonluk-kivircik-marul'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 79.66, 398.30, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-nohut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-05';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 376.31, 7526.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-ovasi-pazari-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ayhan.bafrali@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-05';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-11050205', 'delivered', '2026-04-23 18:45:00', '2026-04-25 18:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-05'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -8203.62, 36562.21, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-05';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 8203.62, 11234.43, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-05';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-06', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1106.35, 0.00, 0.00, 1106.35,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11060206', '2026-04-27 11:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 71.13, 355.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-gunluk-hasat-kirmizi-mercimek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 57.38, 57.38, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-sivri-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 215.17, 537.92, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-06';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 51.80, 155.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-gunes-tarlasi-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'ibrahim.harran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-06';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11060206', 'delivered', '2026-04-28 11:10:00', '2026-04-30 11:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-06'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1106.35, 35455.86, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-06';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1106.35, 4264.19, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-06';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-07', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 402.21, 49.90, 20.11, 432.00,
       'virtual_balance', 'paid', 'delivered', 'Ürünler ezilmeyecek şekilde paketlenirse sevinirim.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11070207', '2026-01-14 17:30:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 62.76, 188.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-07';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 71.31, 213.93, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sahinbey-antep-bahcesi-taze-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'kemal.antep@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-07';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-11070207', 'delivered', '2026-01-15 17:30:00', '2026-01-17 17:30:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-07'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -432.00, 35023.86, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-07';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 432.00, 4900.71, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-07';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-08', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 586.24, 49.90, 0.00, 636.14,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11080208', '2026-01-19 10:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 51.86, 77.79, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 44.05, 220.25, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-08';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 144.10, 288.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harput-baglari-pekmez'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'yusuf.harput@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-08';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-11080208', 'delivered', '2026-01-20 10:10:00', '2026-01-22 10:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-08'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -636.14, 34387.72, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-08';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 636.14, 5428.95, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-08';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-09', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 747.85, 59.90, 0.00, 807.75,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11090209', '2026-01-24 18:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 38.24, 382.40, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-sezonluk-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 99.15, 148.73, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-bamya'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 80.97, 80.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-cilek'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-09';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 54.30, 135.75, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'adana-bereket-tarlasi-gunluk-hasat-kapya-biber'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'cem.yuregir@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-09';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11090209', 'delivered', '2026-01-25 18:20:00', '2026-01-27 18:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-09'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -807.75, 33579.97, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-09';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 807.75, 9901.08, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-09';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-10', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 187.70, 39.90, 0.00, 227.60,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11100210', '2026-01-29 11:45:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 14.57, 87.42, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-sezonluk-roka-demeti'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-10';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 40.11, 100.28, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'cankaya-toprak-kooperatifi-mandalina'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'tuna.kaya@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-10';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-11100210', 'delivered', '2026-01-30 11:45:00', '2026-02-01 11:45:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-10'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -227.60, 33352.37, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-10';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 227.60, 5150.25, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-10';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-11', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1099.38, 0.00, 0.00, 1099.38,
       'virtual_balance', 'paid', 'delivered', 'Kapıya bırakmadan önce arayabilir misiniz?', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11110211', '2026-02-03 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 198.87, 795.48, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 47.55, 95.10, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-salkim-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-11';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 6.000, 34.80, 208.80, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'narenciye-akdeniz-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'okan.limoncu@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-11';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Yurtiçi Kargo', 'TRK-EGO-11110211', 'delivered', '2026-02-04 16:00:00', '2026-02-06 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-11'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1099.38, 32252.99, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-11';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1099.38, 4954.47, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-11';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-12', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1006.91, 0.00, 0.00, 1006.91,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11120212', '2026-02-08 11:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 17.56, 35.12, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-taze-karpuz'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 32.71, 49.06, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-limon'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 37.53, 37.53, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-dogal-kabak'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-12';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 44.26, 885.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'nilufer-yumurta-ciftligi-gunluk-hasat-avokado'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'suleyman.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-12';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'MNG Kargo', 'TRK-EGO-11120212', 'delivered', '2026-02-09 11:20:00', '2026-02-11 11:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-12'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1006.91, 31246.08, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-12';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1006.91, 9246.39, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-12';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-13', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 679.98, 39.90, 0.00, 719.88,
       'virtual_balance', 'paid', 'delivered', '', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11130213', '2026-02-13 14:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 127.38, 636.90, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-13';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 21.54, 43.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'efeler-incir-konagi-kuru-sogan'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'huseyin.incirci@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-13';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-11130213', 'delivered', '2026-02-14 14:00:00', '2026-02-16 14:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-13'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -719.88, 30526.20, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-13';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 719.88, 11512.33, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-13';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-14', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 515.92, 39.90, 25.80, 530.02,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11140214', '2026-02-18 18:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 44.92, 179.68, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-gunluk-hasat-koy-domatesi'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 81.89, 245.67, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-gunluk-hasat-incir'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-14';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 60.38, 90.57, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'alasehir-dogal-uzum-siyah-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'osman.bag@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-14';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11140214', 'delivered', '2026-02-19 18:10:00', '2026-02-21 18:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-14'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -530.02, 29996.18, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-14';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 530.02, 7880.19, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-14';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-15', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 923.83, 0.00, 0.00, 923.83,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11150215', '2026-02-23 11:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 29.55, 88.65, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-dogal-havuc'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 37.55, 93.88, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 48.52, 242.60, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-15';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 10.000, 49.87, 498.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'bafra-kirmizi-sogan-gunluk-hasat-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'turgut.ova@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-15';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-11150215', 'delivered', '2026-02-24 11:20:00', '2026-02-26 11:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-15'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -923.83, 29072.35, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-15';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 923.83, 6134.24, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-15';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-16', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 605.87, 39.90, 0.00, 645.77,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11160216', '2026-02-28 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 102.71, 513.55, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-ev-yapimi-salca'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-16';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 61.55, 92.32, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'harran-bakliyat-cherry-domates'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'halil.bakliyat@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-16';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Aras Kargo', 'TRK-EGO-11160216', 'delivered', '2026-03-01 14:20:00', '2026-03-03 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-16'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -645.77, 28426.58, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-16';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 645.77, 5578.28, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-16';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-17', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 218.02, 59.90, 0.00, 277.92,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11170217', '2026-03-05 14:20:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.500, 58.68, 146.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-uzum'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 49.34, 49.34, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-gunluk-hasat-patlican'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-17';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.000, 21.98, 21.98, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'gaziantep-kurutmalik-kavun'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nihat.kurut@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-17';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'Sürat Kargo', 'TRK-EGO-11170217', 'delivered', '2026-03-06 14:20:00', '2026-03-08 14:20:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-17'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -277.92, 28148.66, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-17';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 277.92, 6258.08, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-17';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-18', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 8275.98, 0.00, 0.00, 8275.98,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11180218', '2026-03-10 17:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 47.01, 940.20, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-lahana'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 20.000, 303.40, 6068.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 83.27, 333.08, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-koy-tipi-kuru-fasulye'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-18';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 5.000, 186.94, 934.70, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'safran-dogal-pazar-cam-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'murat.safran@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-18';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11180218', 'delivered', '2026-03-11 17:00:00', '2026-03-13 17:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-18'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -8275.98, 19872.68, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-18';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 8275.98, 24171.69, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-18';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-19', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 1458.61, 0.00, 0.00, 1458.61,
       'virtual_balance', 'paid', 'delivered', 'Pazar kahvaltısı için taze ürün olsun lütfen.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11190219', '2026-03-15 12:10:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 295.82, 591.64, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-zeytinyagi-1-l'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-19';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 3.000, 288.99, 866.97, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'sigacik-mandalina-bahcesi-taze-findik-ici'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'nermin.ege@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-19';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11190219', 'delivered', '2026-03-16 12:10:00', '2026-03-18 12:10:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-19'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -1458.61, 18414.07, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-19';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 1458.61, 5249.52, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-19';


INSERT INTO orders (order_no, consumer_id, producer_id, address_id, order_type, subtotal, shipping_fee, discount_total, total_amount, payment_method, payment_status, order_status, customer_note, producer_note, tracking_no, created_at)
SELECT 'EGO-2026-11-20', cu.id, pr.id,
       (SELECT a.id FROM addresses a WHERE a.user_id = cu.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'normal', 768.41, 0.00, 0.00, 768.41,
       'virtual_balance', 'paid', 'delivered', 'Mümkünse sabah teslim edilsin.', 'Hasat ve paketleme tamamlandı.', 'TRK-EGO-11200220', '2026-03-20 16:00:00'
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE subtotal=VALUES(subtotal), shipping_fee=VALUES(shipping_fee), discount_total=VALUES(discount_total), total_amount=VALUES(total_amount), payment_status='paid', order_status='delivered', customer_note=VALUES(customer_note), producer_note=VALUES(producer_note), tracking_no=VALUES(tracking_no), created_at=VALUES(created_at);


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 2.000, 180.59, 361.18, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-cicek-bali'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 1.500, 42.82, 64.23, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-armut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-20';


INSERT INTO order_items (order_id, product_id, product_title_snapshot, unit_type_snapshot, quantity, unit_price, total_price, harvest_date_snapshot)
SELECT o.id, p.id, p.title, p.unit_type, 4.000, 85.75, 343.00, p.harvest_date
FROM orders o
JOIN products p ON p.slug = 'erdemli-limon-evi-dut'
JOIN users pr ON pr.id = p.producer_id AND pr.email = 'hasan.akdeniz@ekinerago.test'
WHERE o.order_no = 'EGO-2026-11-20';


INSERT INTO shipments (order_id, cargo_company, tracking_no, shipment_status, shipped_at, delivered_at)
SELECT o.id, 'EkineraGo Yerel Kurye', 'TRK-EGO-11200220', 'delivered', '2026-03-21 16:00:00', '2026-03-23 16:00:00'
FROM orders o WHERE o.order_no = 'EGO-2026-11-20'
ON DUPLICATE KEY UPDATE cargo_company=VALUES(cargo_company), shipment_status=VALUES(shipment_status), shipped_at=VALUES(shipped_at), delivered_at=VALUES(delivered_at);


INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT cu.id, 'purchase', -768.41, 17645.66, o.id, CONCAT(o.order_no, ' numaralı alışveriş ödemesi'), o.created_at
FROM orders o JOIN users cu ON cu.id = o.consumer_id
WHERE o.order_no = 'EGO-2026-11-20';

INSERT INTO wallet_transactions (user_id, transaction_type, amount, balance_after, order_id, description, created_at)
SELECT pr.id, 'producer_income', 768.41, 3337.02, o.id, CONCAT(o.order_no, ' numaralı sipariş üretici geliri'), o.created_at
FROM orders o JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-20';

UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 31839.83 WHERE u.email = 'deniz.arslan@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 26035.53 WHERE u.email = 'elif.sahin@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 38153.84 WHERE u.email = 'mert.kilic@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 35069.32 WHERE u.email = 'zeynep.acar@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 37326.35 WHERE u.email = 'burak.demir@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 23689.43 WHERE u.email = 'irem.yildiz@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 24741.28 WHERE u.email = 'can.ozturk@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 33875.28 WHERE u.email = 'selin.koc@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 33894.31 WHERE u.email = 'onur.kara@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 35762.28 WHERE u.email = 'derya.polat@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 17645.66 WHERE u.email = 'emre.celik@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 2349.28 WHERE u.email = 'ahmet.torun@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5249.52 WHERE u.email = 'nermin.ege@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5007.81 WHERE u.email = 'mustafa.bahcivan@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3337.02 WHERE u.email = 'hasan.akdeniz@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 7006.45 WHERE u.email = 'fatma.aydin@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4276.74 WHERE u.email = 'ali.kayra@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3528.59 WHERE u.email = 'sevgi.bagci@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3197.52 WHERE u.email = 'mehmet.ozgur@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 11234.43 WHERE u.email = 'ayhan.bafrali@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5542.68 WHERE u.email = 'gulcan.yaman@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4264.19 WHERE u.email = 'ibrahim.harran@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4096.58 WHERE u.email = 'meryem.defne@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4900.71 WHERE u.email = 'kemal.antep@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3925.47 WHERE u.email = 'rabia.meram@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5428.95 WHERE u.email = 'yusuf.harput@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4352.04 WHERE u.email = 'seda.safran@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 9901.08 WHERE u.email = 'cem.yuregir@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 11791.69 WHERE u.email = 'ece.kent@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5150.25 WHERE u.email = 'tuna.kaya@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4160.43 WHERE u.email = 'leyla.izmit@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4954.47 WHERE u.email = 'okan.limoncu@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4101.58 WHERE u.email = 'bahar.ulamis@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 9246.39 WHERE u.email = 'suleyman.ova@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3914.28 WHERE u.email = 'dilan.akin@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 11512.33 WHERE u.email = 'huseyin.incirci@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5006.23 WHERE u.email = 'gokce.ari@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 7880.19 WHERE u.email = 'osman.bag@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 3197.26 WHERE u.email = 'hale.denizli@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 6134.24 WHERE u.email = 'turgut.ova@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4400.24 WHERE u.email = 'melike.fatsa@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 5578.28 WHERE u.email = 'halil.bakliyat@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 4592.92 WHERE u.email = 'selma.defne@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 6258.08 WHERE u.email = 'nihat.kurut@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 2317.28 WHERE u.email = 'esra.ova@ekinerago.test';
UPDATE wallets w JOIN users u ON u.id = w.user_id SET w.balance = 24171.69 WHERE u.email = 'murat.safran@ekinerago.test';