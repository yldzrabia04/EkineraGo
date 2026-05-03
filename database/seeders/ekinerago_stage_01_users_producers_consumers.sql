/*
EkineraGo büyük demo seed — Aşama 01
Amaç: 11 tüketici + 35 üretici + profil + varsayılan adres + cüzdan + üretici gönderim kuralları.
Önce Aşama 00 çalıştırılmalı.
*/
USE ekinerago;
SET NAMES utf8mb4;
SET @demo_password_hash := '$2y$12$pxDUzCKrBelOzw1zCfV6X./969R.jmu6sgPPxD1vywmmf.PykMQru';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Deniz Arslan', 'deniz.arslan@ekinerago.test', @demo_password_hash, '05320001001', '05320001001', CONCAT('/assets/img/demo/users/', 'deniz-arslan', '.jpg'), p.id, d.id, n.id,
       'Moda Caddesi No: 18 D:4, Caferağa Mah., Kadıköy / İstanbul', 41.0022038, 29.0313436, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Caferağa'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Moda Caddesi No: 18 D:4, Caferağa Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'İstanbul' JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Caferağa'
WHERE u.email = 'deniz.arslan@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 31839.83
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Elif Nur Şahin', 'elif.sahin@ekinerago.test', @demo_password_hash, '05320001002', '05320001002', CONCAT('/assets/img/demo/users/', 'elif-nur-sahin', '.jpg'), p.id, d.id, n.id,
       'Hoşdere Caddesi No: 92 D:7, Ayrancı Mah., Çankaya / Ankara', 39.9085806, 32.8473165, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ayrancı'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Hoşdere Caddesi No: 92 D:7, Ayrancı Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Ankara' JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ayrancı'
WHERE u.email = 'elif.sahin@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 26035.53
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Mert Kılıç', 'mert.kilic@ekinerago.test', @demo_password_hash, '05320001003', '05320001003', CONCAT('/assets/img/demo/users/', 'mert-kilic', '.jpg'), p.id, d.id, n.id,
       'Akkum Sokak No: 11, Sığacık Mah., Seferihisar / İzmir', 38.1989667, 26.8348528, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Sığacık'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Akkum Sokak No: 11, Sığacık Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'İzmir' JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Sığacık'
WHERE u.email = 'mert.kilic@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 38153.84
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Zeynep Acar', 'zeynep.acar@ekinerago.test', @demo_password_hash, '05320001004', '05320001004', CONCAT('/assets/img/demo/users/', 'zeynep-acar', '.jpg'), p.id, d.id, n.id,
       'Üniversite Caddesi No: 33 D:12, Görükle Mah., Nilüfer / Bursa', 40.2149672, 29.0010504, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Görükle'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Üniversite Caddesi No: 33 D:12, Görükle Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Bursa' JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Görükle'
WHERE u.email = 'zeynep.acar@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 35069.32
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Burak Demir', 'burak.demir@ekinerago.test', @demo_password_hash, '05320001005', '05320001005', CONCAT('/assets/img/demo/users/', 'burak-demir', '.jpg'), p.id, d.id, n.id,
       'Şehit Ergün Köncü Sokak No: 9, Yahyakaptan Mah., İzmit / Kocaeli', 40.7715774, 29.9542278, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yahyakaptan'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Şehit Ergün Köncü Sokak No: 9, Yahyakaptan Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Kocaeli' JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yahyakaptan'
WHERE u.email = 'burak.demir@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'burak.demir@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 37326.35
FROM users u WHERE u.email = 'burak.demir@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'İrem Yıldız', 'irem.yildiz@ekinerago.test', @demo_password_hash, '05320001006', '05320001006', CONCAT('/assets/img/demo/users/', 'irem-yildiz', '.jpg'), p.id, d.id, n.id,
       'Atatürk Bulvarı No: 41, Kargıpınarı Mah., Erdemli / Mersin', 36.6011961, 34.3169887, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kargıpınarı'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Atatürk Bulvarı No: 41, Kargıpınarı Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Mersin' JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kargıpınarı'
WHERE u.email = 'irem.yildiz@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 23689.43
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Can Öztürk', 'can.ozturk@ekinerago.test', @demo_password_hash, '05320001007', '05320001007', CONCAT('/assets/img/demo/users/', 'can-ozturk', '.jpg'), p.id, d.id, n.id,
       'Gençlik Caddesi No: 26 D:5, Güzelhisar Mah., Efeler / Aydın', 37.8553584, 27.8348854, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Güzelhisar'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Gençlik Caddesi No: 26 D:5, Güzelhisar Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Aydın' JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Güzelhisar'
WHERE u.email = 'can.ozturk@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 24741.28
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Selin Koç', 'selin.koc@ekinerago.test', @demo_password_hash, '05320001008', '05320001008', CONCAT('/assets/img/demo/users/', 'selin-koc', '.jpg'), p.id, d.id, n.id,
       'Hal Caddesi No: 14, Merkez Mah., Kumluca / Antalya', 36.3543841, 30.2858313, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Merkez'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Hal Caddesi No: 14, Merkez Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Antalya' JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Merkez'
WHERE u.email = 'selin.koc@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'selin.koc@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 33875.28
FROM users u WHERE u.email = 'selin.koc@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Onur Kara', 'onur.kara@ekinerago.test', @demo_password_hash, '05320001009', '05320001009', CONCAT('/assets/img/demo/users/', 'onur-kara', '.jpg'), p.id, d.id, n.id,
       'Sadri Artunç Caddesi No: 22, Kıranköy Mah., Safranbolu / Karabük', 41.2390649, 32.6838993, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kıranköy'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Sadri Artunç Caddesi No: 22, Kıranköy Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Karabük' JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kıranköy'
WHERE u.email = 'onur.kara@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'onur.kara@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 33894.31
FROM users u WHERE u.email = 'onur.kara@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Derya Polat', 'derya.polat@ekinerago.test', @demo_password_hash, '05320001010', '05320001010', CONCAT('/assets/img/demo/users/', 'derya-polat', '.jpg'), p.id, d.id, n.id,
       'Cumhuriyet Caddesi No: 68, Emirefendi Mah., Bafra / Samsun', 41.5638349, 35.9100874, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Emirefendi'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Cumhuriyet Caddesi No: 68, Emirefendi Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Samsun' JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Emirefendi'
WHERE u.email = 'derya.polat@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'derya.polat@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 35762.28
FROM users u WHERE u.email = 'derya.polat@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'consumer', 'Emre Çelik', 'emre.celik@ekinerago.test', @demo_password_hash, '05320001011', '05320001011', CONCAT('/assets/img/demo/users/', 'emre-celik', '.jpg'), p.id, d.id, n.id,
       'Alaaddin Sokak No: 7, Lalebahçe Mah., Meram / Konya', 37.8584614, 32.4777499, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Lalebahçe'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Ev Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Alaaddin Sokak No: 7, Lalebahçe Mahallesi', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Konya' JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Lalebahçe'
WHERE u.email = 'emre.celik@ekinerago.test';

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT u.id, (SELECT a.id FROM addresses a WHERE a.user_id = u.id AND a.is_default = TRUE ORDER BY a.id DESC LIMIT 1),
       'Taze ve doğrudan üreticiden gelen ürünleri tercih eden demo tüketici.'
FROM users u WHERE u.email = 'emre.celik@ekinerago.test'
ON DUPLICATE KEY UPDATE default_address_id = VALUES(default_address_id), bio = VALUES(bio);

INSERT INTO wallets (user_id, balance)
SELECT u.id, 17645.66
FROM users u WHERE u.email = 'emre.celik@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Ahmet Torun', 'ahmet.torun@ekinerago.test', @demo_password_hash, '05330002001', '05330002001', CONCAT('/assets/img/demo/producers/', 'kumluca-bereket-ciftligi', '.jpg'), p.id, d.id, n.id,
       'Mavikent Mahallesi Üretici Yolu No: 11, Kumluca / Antalya', 36.3955422, 30.2879707, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Mavikent'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Kumluca Bereket Çiftliği', 'kumluca-bereket-ciftligi',
       'Kumluca Bereket Çiftliği, Antalya Kumluca bölgesinde domates, biber ve sera sebzeleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'kumluca-bereket-ciftligi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'kumluca-bereket-ciftligi', '.jpg'),
       'ahmet.torun@ekinerago.test', '05330002001', '05330002001', 'verified', 0.00, 0, 0, 0.00,
       'Antalya içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Mavikent Mahallesi Üretici Yolu No: 11, Kumluca / Antalya', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Antalya' JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Mavikent'
WHERE u.email = 'ahmet.torun@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 2349.28
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Antalya' JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE u.email = 'ahmet.torun@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Nermin Ege', 'nermin.ege@ekinerago.test', @demo_password_hash, '05330002002', '05330002002', CONCAT('/assets/img/demo/producers/', 'sigacik-mandalina-bahcesi', '.jpg'), p.id, d.id, n.id,
       'Sığacık Mahallesi Üretici Yolu No: 12, Seferihisar / İzmir', 38.2220710, 26.8618775, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Sığacık'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Sığacık Mandalina Bahçesi', 'sigacik-mandalina-bahcesi',
       'Sığacık Mandalina Bahçesi, İzmir Seferihisar bölgesinde mandalina, zeytin ve sezon meyveleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'sigacik-mandalina-bahcesi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'sigacik-mandalina-bahcesi', '.jpg'),
       'nermin.ege@ekinerago.test', '05330002002', '05330002002', 'verified', 0.00, 0, 0, 0.00,
       'İzmir içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Sığacık Mahallesi Üretici Yolu No: 12, Seferihisar / İzmir', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'İzmir' JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Sığacık'
WHERE u.email = 'nermin.ege@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5249.52
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'İzmir' JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE u.email = 'nermin.ege@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Mustafa Bahçıvan', 'mustafa.bahcivan@ekinerago.test', @demo_password_hash, '05330002003', '05330002003', CONCAT('/assets/img/demo/producers/', 'bursa-dogal-bahce', '.jpg'), p.id, d.id, n.id,
       'Görükle Mahallesi Üretici Yolu No: 13, Nilüfer / Bursa', 40.2154094, 28.9796141, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Görükle'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Bursa Doğal Bahçe', 'bursa-dogal-bahce',
       'Bursa Doğal Bahçe, Bursa Nilüfer bölgesinde elma, armut, yumurta ve bahçe ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'bursa-dogal-bahce', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'bursa-dogal-bahce', '.jpg'),
       'mustafa.bahcivan@ekinerago.test', '05330002003', '05330002003', 'verified', 0.00, 0, 0, 0.00,
       'Bursa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Görükle Mahallesi Üretici Yolu No: 13, Nilüfer / Bursa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Bursa' JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Görükle'
WHERE u.email = 'mustafa.bahcivan@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5007.81
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Bursa' JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE u.email = 'mustafa.bahcivan@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Hasan Akdeniz', 'hasan.akdeniz@ekinerago.test', @demo_password_hash, '05330002004', '05330002004', CONCAT('/assets/img/demo/producers/', 'erdemli-limon-evi', '.jpg'), p.id, d.id, n.id,
       'Limonlu Mahallesi Üretici Yolu No: 14, Erdemli / Mersin', 36.6245165, 34.3038396, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Limonlu'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Erdemli Limon Evi', 'erdemli-limon-evi',
       'Erdemli Limon Evi, Mersin Erdemli bölgesinde limon, portakal ve narenciye üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'erdemli-limon-evi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'erdemli-limon-evi', '.jpg'),
       'hasan.akdeniz@ekinerago.test', '05330002004', '05330002004', 'verified', 0.00, 0, 0, 0.00,
       'Mersin içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Limonlu Mahallesi Üretici Yolu No: 14, Erdemli / Mersin', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Mersin' JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Limonlu'
WHERE u.email = 'hasan.akdeniz@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3337.02
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Mersin' JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE u.email = 'hasan.akdeniz@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Fatma Aydın', 'fatma.aydin@ekinerago.test', @demo_password_hash, '05330002005', '05330002005', CONCAT('/assets/img/demo/producers/', 'efeler-zeytinligi', '.jpg'), p.id, d.id, n.id,
       'Umurlu Mahallesi Üretici Yolu No: 15, Efeler / Aydın', 37.8682101, 27.8656575, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Umurlu'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Efeler Zeytinliği', 'efeler-zeytinligi',
       'Efeler Zeytinliği, Aydın Efeler bölgesinde zeytin, zeytinyağı ve incir üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'efeler-zeytinligi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'efeler-zeytinligi', '.jpg'),
       'fatma.aydin@ekinerago.test', '05330002005', '05330002005', 'pending', 0.00, 0, 0, 0.00,
       'Aydın içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Umurlu Mahallesi Üretici Yolu No: 15, Efeler / Aydın', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Aydın' JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Umurlu'
WHERE u.email = 'fatma.aydin@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 7006.45
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Aydın' JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE u.email = 'fatma.aydin@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Ali Kayra', 'ali.kayra@ekinerago.test', @demo_password_hash, '05330002006', '05330002006', CONCAT('/assets/img/demo/producers/', 'fethiye-koy-sepeti', '.jpg'), p.id, d.id, n.id,
       'Yanıklar Mahallesi Üretici Yolu No: 16, Fethiye / Muğla', 36.6182344, 29.0863480, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yanıklar'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Fethiye Köy Sepeti', 'fethiye-koy-sepeti',
       'Fethiye Köy Sepeti, Muğla Fethiye bölgesinde nar, avokado, sebze ve köy ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'fethiye-koy-sepeti', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'fethiye-koy-sepeti', '.jpg'),
       'ali.kayra@ekinerago.test', '05330002006', '05330002006', 'verified', 0.00, 0, 0, 0.00,
       'Muğla içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Yanıklar Mahallesi Üretici Yolu No: 16, Fethiye / Muğla', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Muğla' JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yanıklar'
WHERE u.email = 'ali.kayra@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4276.74
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Muğla' JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE u.email = 'ali.kayra@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Sevgi Bağcı', 'sevgi.bagci@ekinerago.test', @demo_password_hash, '05330002007', '05330002007', CONCAT('/assets/img/demo/producers/', 'alasehir-uzum-bagi', '.jpg'), p.id, d.id, n.id,
       'İstasyon Mahallesi Üretici Yolu No: 17, Alaşehir / Manisa', 38.3633735, 28.4917310, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'İstasyon'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Alaşehir Üzüm Bağı', 'alasehir-uzum-bagi',
       'Alaşehir Üzüm Bağı, Manisa Alaşehir bölgesinde üzüm, pekmez ve kuru meyve üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'alasehir-uzum-bagi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'alasehir-uzum-bagi', '.jpg'),
       'sevgi.bagci@ekinerago.test', '05330002007', '05330002007', 'verified', 0.00, 0, 0, 0.00,
       'Manisa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'İstasyon Mahallesi Üretici Yolu No: 17, Alaşehir / Manisa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Manisa' JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'İstasyon'
WHERE u.email = 'sevgi.bagci@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3528.59
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Manisa' JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE u.email = 'sevgi.bagci@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Mehmet Özgür', 'mehmet.ozgur@ekinerago.test', @demo_password_hash, '05330002008', '05330002008', CONCAT('/assets/img/demo/producers/', 'pamukkale-organik-tarla', '.jpg'), p.id, d.id, n.id,
       'Akköy Mahallesi Üretici Yolu No: 18, Pamukkale / Denizli', 37.9396926, 29.0850132, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Akköy'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Pamukkale Organik Tarla', 'pamukkale-organik-tarla',
       'Pamukkale Organik Tarla, Denizli Pamukkale bölgesinde sebze, bakliyat ve tarla ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'pamukkale-organik-tarla', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'pamukkale-organik-tarla', '.jpg'),
       'mehmet.ozgur@ekinerago.test', '05330002008', '05330002008', 'verified', 0.00, 0, 0, 0.00,
       'Denizli içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Akköy Mahallesi Üretici Yolu No: 18, Pamukkale / Denizli', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Denizli' JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Akköy'
WHERE u.email = 'mehmet.ozgur@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3197.52
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Denizli' JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE u.email = 'mehmet.ozgur@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Ayhan Bafralı', 'ayhan.bafrali@ekinerago.test', @demo_password_hash, '05330002009', '05330002009', CONCAT('/assets/img/demo/producers/', 'bafra-ovasi-pazari', '.jpg'), p.id, d.id, n.id,
       'Kızılırmak Mahallesi Üretici Yolu No: 19, Bafra / Samsun', 41.5545200, 35.8856889, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kızılırmak'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Bafra Ovası Pazarı', 'bafra-ovasi-pazari',
       'Bafra Ovası Pazarı, Samsun Bafra bölgesinde soğan, patates ve ovadan sebzeler üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'bafra-ovasi-pazari', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'bafra-ovasi-pazari', '.jpg'),
       'ayhan.bafrali@ekinerago.test', '05330002009', '05330002009', 'verified', 0.00, 0, 0, 0.00,
       'Samsun içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Kızılırmak Mahallesi Üretici Yolu No: 19, Bafra / Samsun', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Samsun' JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kızılırmak'
WHERE u.email = 'ayhan.bafrali@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 11234.43
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Samsun' JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE u.email = 'ayhan.bafrali@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Gülcan Yaman', 'gulcan.yaman@ekinerago.test', @demo_password_hash, '05330002010', '05330002010', CONCAT('/assets/img/demo/producers/', 'fatsa-findik-ve-bal', '.jpg'), p.id, d.id, n.id,
       'Bolaman Mahallesi Üretici Yolu No: 20, Fatsa / Ordu', 40.9933164, 37.4998978, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Bolaman'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Fatsa Fındık ve Bal', 'fatsa-findik-ve-bal',
       'Fatsa Fındık ve Bal, Ordu Fatsa bölgesinde bal, fındık ve Karadeniz ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'fatsa-findik-ve-bal', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'fatsa-findik-ve-bal', '.jpg'),
       'gulcan.yaman@ekinerago.test', '05330002010', '05330002010', 'pending', 0.00, 0, 0, 0.00,
       'Ordu içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Bolaman Mahallesi Üretici Yolu No: 20, Fatsa / Ordu', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Ordu' JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Bolaman'
WHERE u.email = 'gulcan.yaman@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5542.68
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Ordu' JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE u.email = 'gulcan.yaman@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'İbrahim Harran', 'ibrahim.harran@ekinerago.test', @demo_password_hash, '05330002011', '05330002011', CONCAT('/assets/img/demo/producers/', 'harran-gunes-tarlasi', '.jpg'), p.id, d.id, n.id,
       'Küplüce Mahallesi Üretici Yolu No: 21, Harran / Şanlıurfa', 36.8865139, 39.0309435, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Küplüce'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Harran Güneş Tarlası', 'harran-gunes-tarlasi',
       'Harran Güneş Tarlası, Şanlıurfa Harran bölgesinde biber, isot ve bakliyat üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'harran-gunes-tarlasi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'harran-gunes-tarlasi', '.jpg'),
       'ibrahim.harran@ekinerago.test', '05330002011', '05330002011', 'verified', 0.00, 0, 0, 0.00,
       'Şanlıurfa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Küplüce Mahallesi Üretici Yolu No: 21, Harran / Şanlıurfa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Şanlıurfa' JOIN districts d ON d.province_id = p.id AND d.name = 'Harran' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Küplüce'
WHERE u.email = 'ibrahim.harran@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4264.19
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Şanlıurfa' JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE u.email = 'ibrahim.harran@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Meryem Defne', 'meryem.defne@ekinerago.test', @demo_password_hash, '05330002012', '05330002012', CONCAT('/assets/img/demo/producers/', 'samandag-narenciye', '.jpg'), p.id, d.id, n.id,
       'Deniz Mahallesi Üretici Yolu No: 22, Samandağ / Hatay', 36.0536373, 35.9887310, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Deniz'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Samandağ Narenciye', 'samandag-narenciye',
       'Samandağ Narenciye, Hatay Samandağ bölgesinde limon, portakal ve yöresel ürünler üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'samandag-narenciye', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'samandag-narenciye', '.jpg'),
       'meryem.defne@ekinerago.test', '05330002012', '05330002012', 'verified', 0.00, 0, 0, 0.00,
       'Hatay içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Deniz Mahallesi Üretici Yolu No: 22, Samandağ / Hatay', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Hatay' JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Deniz'
WHERE u.email = 'meryem.defne@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4096.58
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Hatay' JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE u.email = 'meryem.defne@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Kemal Antep', 'kemal.antep@ekinerago.test', @demo_password_hash, '05330002013', '05330002013', CONCAT('/assets/img/demo/producers/', 'sahinbey-antep-bahcesi', '.jpg'), p.id, d.id, n.id,
       'Karataş Mahallesi Üretici Yolu No: 23, Şahinbey / Gaziantep', 37.0439347, 37.3726074, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Karataş'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Şahinbey Antep Bahçesi', 'sahinbey-antep-bahcesi',
       'Şahinbey Antep Bahçesi, Gaziantep Şahinbey bölgesinde Antep biberi, domates ve kurutmalık ürünler üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'sahinbey-antep-bahcesi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'sahinbey-antep-bahcesi', '.jpg'),
       'kemal.antep@ekinerago.test', '05330002013', '05330002013', 'verified', 0.00, 0, 0, 0.00,
       'Gaziantep içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Karataş Mahallesi Üretici Yolu No: 23, Şahinbey / Gaziantep', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Gaziantep' JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Karataş'
WHERE u.email = 'kemal.antep@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4900.71
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Gaziantep' JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE u.email = 'kemal.antep@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Rabia Meram', 'rabia.meram@ekinerago.test', @demo_password_hash, '05330002014', '05330002014', CONCAT('/assets/img/demo/producers/', 'meram-ciftci-pazari', '.jpg'), p.id, d.id, n.id,
       'Havzan Mahallesi Üretici Yolu No: 24, Meram / Konya', 37.8616542, 32.5088597, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Havzan'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Meram Çiftçi Pazarı', 'meram-ciftci-pazari',
       'Meram Çiftçi Pazarı, Konya Meram bölgesinde patates, havuç, yumurta ve bakliyat üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'meram-ciftci-pazari', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'meram-ciftci-pazari', '.jpg'),
       'rabia.meram@ekinerago.test', '05330002014', '05330002014', 'verified', 0.00, 0, 0, 0.00,
       'Konya içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Havzan Mahallesi Üretici Yolu No: 24, Meram / Konya', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Konya' JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Havzan'
WHERE u.email = 'rabia.meram@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3925.47
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Konya' JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE u.email = 'rabia.meram@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Yusuf Harput', 'yusuf.harput@ekinerago.test', @demo_password_hash, '05330002015', '05330002015', CONCAT('/assets/img/demo/producers/', 'harput-baglari', '.jpg'), p.id, d.id, n.id,
       'Harput Mahallesi Üretici Yolu No: 25, Merkez / Elazığ', 38.6963711, 39.2404271, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Harput'
WHERE p.name = 'Elazığ'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Harput Bağları', 'harput-baglari',
       'Harput Bağları, Elazığ Merkez bölgesinde üzüm, dut ve doğal pekmez üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'harput-baglari', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'harput-baglari', '.jpg'),
       'yusuf.harput@ekinerago.test', '05330002015', '05330002015', 'pending', 0.00, 0, 0, 0.00,
       'Elazığ içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Harput Mahallesi Üretici Yolu No: 25, Merkez / Elazığ', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Elazığ' JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Harput'
WHERE u.email = 'yusuf.harput@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5428.95
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Elazığ' JOIN districts d ON d.province_id = p.id AND d.name = 'Merkez'
WHERE u.email = 'yusuf.harput@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Seda Safran', 'seda.safran@ekinerago.test', @demo_password_hash, '05330002016', '05330002016', CONCAT('/assets/img/demo/producers/', 'safranbolu-koy-urunleri', '.jpg'), p.id, d.id, n.id,
       'Bağlarbaşı Mahallesi Üretici Yolu No: 26, Safranbolu / Karabük', 41.2270241, 32.7117813, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Bağlarbaşı'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Safranbolu Köy Ürünleri', 'safranbolu-koy-urunleri',
       'Safranbolu Köy Ürünleri, Karabük Safranbolu bölgesinde sebze, bal ve yöresel ürünler üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'safranbolu-koy-urunleri', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'safranbolu-koy-urunleri', '.jpg'),
       'seda.safran@ekinerago.test', '05330002016', '05330002016', 'verified', 0.00, 0, 0, 0.00,
       'Karabük içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Bağlarbaşı Mahallesi Üretici Yolu No: 26, Safranbolu / Karabük', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Karabük' JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Bağlarbaşı'
WHERE u.email = 'seda.safran@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4352.04
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Karabük' JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE u.email = 'seda.safran@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'seda.safran@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Cem Yüreğir', 'cem.yuregir@ekinerago.test', @demo_password_hash, '05330002017', '05330002017', CONCAT('/assets/img/demo/producers/', 'adana-bereket-tarlasi', '.jpg'), p.id, d.id, n.id,
       'Doğankent Mahallesi Üretici Yolu No: 27, Yüreğir / Adana', 36.9816524, 35.3692566, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Doğankent'
WHERE p.name = 'Adana'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Adana Bereket Tarlası', 'adana-bereket-tarlasi',
       'Adana Bereket Tarlası, Adana Yüreğir bölgesinde karpuz, kavun ve tarla sebzeleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'adana-bereket-tarlasi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'adana-bereket-tarlasi', '.jpg'),
       'cem.yuregir@ekinerago.test', '05330002017', '05330002017', 'verified', 0.00, 0, 0, 0.00,
       'Adana içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Doğankent Mahallesi Üretici Yolu No: 27, Yüreğir / Adana', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Adana' JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Doğankent'
WHERE u.email = 'cem.yuregir@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 9901.08
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Adana' JOIN districts d ON d.province_id = p.id AND d.name = 'Yüreğir'
WHERE u.email = 'cem.yuregir@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Ece Kent', 'ece.kent@ekinerago.test', @demo_password_hash, '05330002018', '05330002018', CONCAT('/assets/img/demo/producers/', 'kadikoy-mikro-bahce', '.jpg'), p.id, d.id, n.id,
       'Koşuyolu Mahallesi Üretici Yolu No: 28, Kadıköy / İstanbul', 41.0236911, 29.0216864, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Koşuyolu'
WHERE p.name = 'İstanbul'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Kadıköy Mikro Bahçe', 'kadikoy-mikro-bahce',
       'Kadıköy Mikro Bahçe, İstanbul Kadıköy bölgesinde mikro yeşillik, marul ve taze otlar üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'kadikoy-mikro-bahce', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'kadikoy-mikro-bahce', '.jpg'),
       'ece.kent@ekinerago.test', '05330002018', '05330002018', 'verified', 0.00, 0, 0, 0.00,
       'İstanbul içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Koşuyolu Mahallesi Üretici Yolu No: 28, Kadıköy / İstanbul', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'İstanbul' JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Koşuyolu'
WHERE u.email = 'ece.kent@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 11791.69
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'İstanbul' JOIN districts d ON d.province_id = p.id AND d.name = 'Kadıköy'
WHERE u.email = 'ece.kent@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'ece.kent@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Tuna Kaya', 'tuna.kaya@ekinerago.test', @demo_password_hash, '05330002019', '05330002019', CONCAT('/assets/img/demo/producers/', 'cankaya-toprak-kooperatifi', '.jpg'), p.id, d.id, n.id,
       'Ümitköy Mahallesi Üretici Yolu No: 29, Çankaya / Ankara', 39.8936531, 32.8267221, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ümitköy'
WHERE p.name = 'Ankara'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Çankaya Toprak Kooperatifi', 'cankaya-toprak-kooperatifi',
       'Çankaya Toprak Kooperatifi, Ankara Çankaya bölgesinde kooperatif sebze ve meyve paketleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'cankaya-toprak-kooperatifi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'cankaya-toprak-kooperatifi', '.jpg'),
       'tuna.kaya@ekinerago.test', '05330002019', '05330002019', 'verified', 0.00, 0, 0, 0.00,
       'Ankara içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Ümitköy Mahallesi Üretici Yolu No: 29, Çankaya / Ankara', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Ankara' JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ümitköy'
WHERE u.email = 'tuna.kaya@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5150.25
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Ankara' JOIN districts d ON d.province_id = p.id AND d.name = 'Çankaya'
WHERE u.email = 'tuna.kaya@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Leyla İzmit', 'leyla.izmit@ekinerago.test', @demo_password_hash, '05330002020', '05330002020', CONCAT('/assets/img/demo/producers/', 'kocaeli-seracilik', '.jpg'), p.id, d.id, n.id,
       'Alikahya Mahallesi Üretici Yolu No: 30, İzmit / Kocaeli', 40.7367574, 29.9395599, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Alikahya'
WHERE p.name = 'Kocaeli'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Kocaeli Seracılık', 'kocaeli-seracilik',
       'Kocaeli Seracılık, Kocaeli İzmit bölgesinde sera domatesi, salatalık ve yeşillik üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'kocaeli-seracilik', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'kocaeli-seracilik', '.jpg'),
       'leyla.izmit@ekinerago.test', '05330002020', '05330002020', 'pending', 0.00, 0, 0, 0.00,
       'Kocaeli içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Alikahya Mahallesi Üretici Yolu No: 30, İzmit / Kocaeli', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Kocaeli' JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Alikahya'
WHERE u.email = 'leyla.izmit@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4160.43
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Kocaeli' JOIN districts d ON d.province_id = p.id AND d.name = 'İzmit'
WHERE u.email = 'leyla.izmit@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Okan Limoncu', 'okan.limoncu@ekinerago.test', @demo_password_hash, '05330002021', '05330002021', CONCAT('/assets/img/demo/producers/', 'narenciye-akdeniz', '.jpg'), p.id, d.id, n.id,
       'Narenciye Mahallesi Üretici Yolu No: 31, Kumluca / Antalya', 36.3458111, 30.2805098, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Narenciye'
WHERE p.name = 'Antalya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Narenciye Akdeniz', 'narenciye-akdeniz',
       'Narenciye Akdeniz, Antalya Kumluca bölgesinde narenciye, avokado ve tropik denemeler üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'narenciye-akdeniz', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'narenciye-akdeniz', '.jpg'),
       'okan.limoncu@ekinerago.test', '05330002021', '05330002021', 'verified', 0.00, 0, 0, 0.00,
       'Antalya içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Narenciye Mahallesi Üretici Yolu No: 31, Kumluca / Antalya', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Antalya' JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Narenciye'
WHERE u.email = 'okan.limoncu@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4954.47
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Antalya' JOIN districts d ON d.province_id = p.id AND d.name = 'Kumluca'
WHERE u.email = 'okan.limoncu@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Bahar Ulamış', 'bahar.ulamis@ekinerago.test', @demo_password_hash, '05330002022', '05330002022', CONCAT('/assets/img/demo/producers/', 'ege-otlari-atolyesi', '.jpg'), p.id, d.id, n.id,
       'Ulamış Mahallesi Üretici Yolu No: 32, Seferihisar / İzmir', 38.1735508, 26.8739106, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ulamış'
WHERE p.name = 'İzmir'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Ege Otları Atölyesi', 'ege-otlari-atolyesi',
       'Ege Otları Atölyesi, İzmir Seferihisar bölgesinde Ege otları, yeşillik ve zeytinyağı üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'ege-otlari-atolyesi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'ege-otlari-atolyesi', '.jpg'),
       'bahar.ulamis@ekinerago.test', '05330002022', '05330002022', 'verified', 0.00, 0, 0, 0.00,
       'İzmir içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Ulamış Mahallesi Üretici Yolu No: 32, Seferihisar / İzmir', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'İzmir' JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Ulamış'
WHERE u.email = 'bahar.ulamis@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4101.58
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'İzmir' JOIN districts d ON d.province_id = p.id AND d.name = 'Seferihisar'
WHERE u.email = 'bahar.ulamis@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Süleyman Ova', 'suleyman.ova@ekinerago.test', @demo_password_hash, '05330002023', '05330002023', CONCAT('/assets/img/demo/producers/', 'nilufer-yumurta-ciftligi', '.jpg'), p.id, d.id, n.id,
       'Fethiye Mahallesi Üretici Yolu No: 33, Nilüfer / Bursa', 40.2145864, 29.0023563, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Fethiye'
WHERE p.name = 'Bursa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Nilüfer Yumurta Çiftliği', 'nilufer-yumurta-ciftligi',
       'Nilüfer Yumurta Çiftliği, Bursa Nilüfer bölgesinde gezen tavuk yumurtası ve köy ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'nilufer-yumurta-ciftligi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'nilufer-yumurta-ciftligi', '.jpg'),
       'suleyman.ova@ekinerago.test', '05330002023', '05330002023', 'verified', 0.00, 0, 0, 0.00,
       'Bursa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Fethiye Mahallesi Üretici Yolu No: 33, Nilüfer / Bursa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Bursa' JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Fethiye'
WHERE u.email = 'suleyman.ova@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 9246.39
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Bursa' JOIN districts d ON d.province_id = p.id AND d.name = 'Nilüfer'
WHERE u.email = 'suleyman.ova@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Dilan Akın', 'dilan.akin@ekinerago.test', @demo_password_hash, '05330002024', '05330002024', CONCAT('/assets/img/demo/producers/', 'erdemli-avokado-bahcesi', '.jpg'), p.id, d.id, n.id,
       'Tömük Mahallesi Üretici Yolu No: 34, Erdemli / Mersin', 36.6219003, 34.3374699, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Tömük'
WHERE p.name = 'Mersin'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Erdemli Avokado Bahçesi', 'erdemli-avokado-bahcesi',
       'Erdemli Avokado Bahçesi, Mersin Erdemli bölgesinde avokado, muz ve narenciye üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'erdemli-avokado-bahcesi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'erdemli-avokado-bahcesi', '.jpg'),
       'dilan.akin@ekinerago.test', '05330002024', '05330002024', 'verified', 0.00, 0, 0, 0.00,
       'Mersin içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Tömük Mahallesi Üretici Yolu No: 34, Erdemli / Mersin', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Mersin' JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Tömük'
WHERE u.email = 'dilan.akin@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3914.28
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Mersin' JOIN districts d ON d.province_id = p.id AND d.name = 'Erdemli'
WHERE u.email = 'dilan.akin@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Hüseyin İncirci', 'huseyin.incirci@ekinerago.test', @demo_password_hash, '05330002025', '05330002025', CONCAT('/assets/img/demo/producers/', 'efeler-incir-konagi', '.jpg'), p.id, d.id, n.id,
       'Kemer Mahallesi Üretici Yolu No: 35, Efeler / Aydın', 37.8240184, 27.8690821, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kemer'
WHERE p.name = 'Aydın'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Efeler İncir Konağı', 'efeler-incir-konagi',
       'Efeler İncir Konağı, Aydın Efeler bölgesinde incir, zeytin ve kuru ürün üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'efeler-incir-konagi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'efeler-incir-konagi', '.jpg'),
       'huseyin.incirci@ekinerago.test', '05330002025', '05330002025', 'pending', 0.00, 0, 0, 0.00,
       'Aydın içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Kemer Mahallesi Üretici Yolu No: 35, Efeler / Aydın', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Aydın' JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kemer'
WHERE u.email = 'huseyin.incirci@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 11512.33
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 19.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Aydın' JOIN districts d ON d.province_id = p.id AND d.name = 'Efeler'
WHERE u.email = 'huseyin.incirci@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Gökçe Arı', 'gokce.ari@ekinerago.test', @demo_password_hash, '05330002026', '05330002026', CONCAT('/assets/img/demo/producers/', 'fethiye-bal-ve-nar', '.jpg'), p.id, d.id, n.id,
       'Çiftlik Mahallesi Üretici Yolu No: 36, Fethiye / Muğla', 36.6054963, 29.1309446, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Çiftlik'
WHERE p.name = 'Muğla'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Fethiye Bal ve Nar', 'fethiye-bal-ve-nar',
       'Fethiye Bal ve Nar, Muğla Fethiye bölgesinde bal, nar ve mevsimlik meyve üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'fethiye-bal-ve-nar', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'fethiye-bal-ve-nar', '.jpg'),
       'gokce.ari@ekinerago.test', '05330002026', '05330002026', 'verified', 0.00, 0, 0, 0.00,
       'Muğla içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Çiftlik Mahallesi Üretici Yolu No: 36, Fethiye / Muğla', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Muğla' JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Çiftlik'
WHERE u.email = 'gokce.ari@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5006.23
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Muğla' JOIN districts d ON d.province_id = p.id AND d.name = 'Fethiye'
WHERE u.email = 'gokce.ari@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 69.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Osman Bağ', 'osman.bag@ekinerago.test', @demo_password_hash, '05330002027', '05330002027', CONCAT('/assets/img/demo/producers/', 'alasehir-dogal-uzum', '.jpg'), p.id, d.id, n.id,
       'Kurtuluş Mahallesi Üretici Yolu No: 37, Alaşehir / Manisa', 38.3483078, 28.5242216, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kurtuluş'
WHERE p.name = 'Manisa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Alaşehir Doğal Üzüm', 'alasehir-dogal-uzum',
       'Alaşehir Doğal Üzüm, Manisa Alaşehir bölgesinde taze üzüm ve bağ ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'alasehir-dogal-uzum', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'alasehir-dogal-uzum', '.jpg'),
       'osman.bag@ekinerago.test', '05330002027', '05330002027', 'verified', 0.00, 0, 0, 0.00,
       'Manisa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Kurtuluş Mahallesi Üretici Yolu No: 37, Alaşehir / Manisa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Manisa' JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kurtuluş'
WHERE u.email = 'osman.bag@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 7880.19
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Manisa' JOIN districts d ON d.province_id = p.id AND d.name = 'Alaşehir'
WHERE u.email = 'osman.bag@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'osman.bag@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Hale Denizli', 'hale.denizli@ekinerago.test', @demo_password_hash, '05330002028', '05330002028', CONCAT('/assets/img/demo/producers/', 'pamukkale-sera', '.jpg'), p.id, d.id, n.id,
       'Kınıklı Mahallesi Üretici Yolu No: 38, Pamukkale / Denizli', 37.9437600, 29.0905626, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kınıklı'
WHERE p.name = 'Denizli'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Pamukkale Sera', 'pamukkale-sera',
       'Pamukkale Sera, Denizli Pamukkale bölgesinde sera sebzeleri ve yeşillik üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'pamukkale-sera', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'pamukkale-sera', '.jpg'),
       'hale.denizli@ekinerago.test', '05330002028', '05330002028', 'verified', 0.00, 0, 0, 0.00,
       'Denizli içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Kınıklı Mahallesi Üretici Yolu No: 38, Pamukkale / Denizli', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Denizli' JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Kınıklı'
WHERE u.email = 'hale.denizli@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 3197.26
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Denizli' JOIN districts d ON d.province_id = p.id AND d.name = 'Pamukkale'
WHERE u.email = 'hale.denizli@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 15.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Turgut Ova', 'turgut.ova@ekinerago.test', @demo_password_hash, '05330002029', '05330002029', CONCAT('/assets/img/demo/producers/', 'bafra-kirmizi-sogan', '.jpg'), p.id, d.id, n.id,
       'Gazipaşa Mahallesi Üretici Yolu No: 39, Bafra / Samsun', 41.5350806, 35.9226459, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Gazipaşa'
WHERE p.name = 'Samsun'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Bafra Kırmızı Soğan', 'bafra-kirmizi-sogan',
       'Bafra Kırmızı Soğan, Samsun Bafra bölgesinde kırmızı soğan, patates ve havuç üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'bafra-kirmizi-sogan', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'bafra-kirmizi-sogan', '.jpg'),
       'turgut.ova@ekinerago.test', '05330002029', '05330002029', 'verified', 0.00, 0, 0, 0.00,
       'Samsun içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Gazipaşa Mahallesi Üretici Yolu No: 39, Bafra / Samsun', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Samsun' JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Gazipaşa'
WHERE u.email = 'turgut.ova@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 6134.24
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Samsun' JOIN districts d ON d.province_id = p.id AND d.name = 'Bafra'
WHERE u.email = 'turgut.ova@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Melike Fatsa', 'melike.fatsa@ekinerago.test', @demo_password_hash, '05330002030', '05330002030', CONCAT('/assets/img/demo/producers/', 'fatsa-karadeniz-sepeti', '.jpg'), p.id, d.id, n.id,
       'Dolunay Mahallesi Üretici Yolu No: 40, Fatsa / Ordu', 41.0187843, 37.5135443, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Dolunay'
WHERE p.name = 'Ordu'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Fatsa Karadeniz Sepeti', 'fatsa-karadeniz-sepeti',
       'Fatsa Karadeniz Sepeti, Ordu Fatsa bölgesinde fındık, bal ve lahana üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'fatsa-karadeniz-sepeti', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'fatsa-karadeniz-sepeti', '.jpg'),
       'melike.fatsa@ekinerago.test', '05330002030', '05330002030', 'pending', 0.00, 0, 0, 0.00,
       'Ordu içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Dolunay Mahallesi Üretici Yolu No: 40, Fatsa / Ordu', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Ordu' JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Dolunay'
WHERE u.email = 'melike.fatsa@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4400.24
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Ordu' JOIN districts d ON d.province_id = p.id AND d.name = 'Fatsa'
WHERE u.email = 'melike.fatsa@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Halil Bakliyat', 'halil.bakliyat@ekinerago.test', @demo_password_hash, '05330002031', '05330002031', CONCAT('/assets/img/demo/producers/', 'harran-bakliyat', '.jpg'), p.id, d.id, n.id,
       'Merkez Mahallesi Üretici Yolu No: 41, Harran / Şanlıurfa', 36.8772756, 39.0313964, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Harran' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Merkez'
WHERE p.name = 'Şanlıurfa'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Harran Bakliyat', 'harran-bakliyat',
       'Harran Bakliyat, Şanlıurfa Harran bölgesinde mercimek, nohut ve biber üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'harran-bakliyat', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'harran-bakliyat', '.jpg'),
       'halil.bakliyat@ekinerago.test', '05330002031', '05330002031', 'verified', 0.00, 0, 0, 0.00,
       'Şanlıurfa içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Merkez Mahallesi Üretici Yolu No: 41, Harran / Şanlıurfa', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Şanlıurfa' JOIN districts d ON d.province_id = p.id AND d.name = 'Harran' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Merkez'
WHERE u.email = 'halil.bakliyat@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 5578.28
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Şanlıurfa' JOIN districts d ON d.province_id = p.id AND d.name = 'Harran'
WHERE u.email = 'halil.bakliyat@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Selma Defne', 'selma.defne@ekinerago.test', @demo_password_hash, '05330002032', '05330002032', CONCAT('/assets/img/demo/producers/', 'hatay-defne-bahcesi', '.jpg'), p.id, d.id, n.id,
       'Tekebaşı Mahallesi Üretici Yolu No: 42, Samandağ / Hatay', 36.0833175, 35.9603166, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Tekebaşı'
WHERE p.name = 'Hatay'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Hatay Defne Bahçesi', 'hatay-defne-bahcesi',
       'Hatay Defne Bahçesi, Hatay Samandağ bölgesinde narenciye, zeytin ve defne ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'hatay-defne-bahcesi', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'hatay-defne-bahcesi', '.jpg'),
       'selma.defne@ekinerago.test', '05330002032', '05330002032', 'verified', 0.00, 0, 0, 0.00,
       'Hatay içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Tekebaşı Mahallesi Üretici Yolu No: 42, Samandağ / Hatay', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Hatay' JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Tekebaşı'
WHERE u.email = 'selma.defne@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 4592.92
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Hatay' JOIN districts d ON d.province_id = p.id AND d.name = 'Samandağ'
WHERE u.email = 'selma.defne@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 10.000, 'kg', TRUE, 49.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'selma.defne@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Nihat Kurut', 'nihat.kurut@ekinerago.test', @demo_password_hash, '05330002033', '05330002033', CONCAT('/assets/img/demo/producers/', 'gaziantep-kurutmalik', '.jpg'), p.id, d.id, n.id,
       'Yeditepe Mahallesi Üretici Yolu No: 43, Şahinbey / Gaziantep', 37.1003498, 37.4096088, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yeditepe'
WHERE p.name = 'Gaziantep'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Gaziantep Kurutmalık', 'gaziantep-kurutmalik',
       'Gaziantep Kurutmalık, Gaziantep Şahinbey bölgesinde kurutmalık biber, patlıcan ve salça ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'gaziantep-kurutmalik', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'gaziantep-kurutmalik', '.jpg'),
       'nihat.kurut@ekinerago.test', '05330002033', '05330002033', 'verified', 0.00, 0, 0, 0.00,
       'Gaziantep içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Yeditepe Mahallesi Üretici Yolu No: 43, Şahinbey / Gaziantep', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Gaziantep' JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yeditepe'
WHERE u.email = 'nihat.kurut@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 6258.08
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 300.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Gaziantep' JOIN districts d ON d.province_id = p.id AND d.name = 'Şahinbey'
WHERE u.email = 'nihat.kurut@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Esra Ova', 'esra.ova@ekinerago.test', @demo_password_hash, '05330002034', '05330002034', CONCAT('/assets/img/demo/producers/', 'konya-ova-urunleri', '.jpg'), p.id, d.id, n.id,
       'Yenişehir Mahallesi Üretici Yolu No: 44, Meram / Konya', 37.8679789, 32.4515187, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yenişehir'
WHERE p.name = 'Konya'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Konya Ova Ürünleri', 'konya-ova-urunleri',
       'Konya Ova Ürünleri, Konya Meram bölgesinde patates, havuç ve kuru bakliyat üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'konya-ova-urunleri', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'konya-ova-urunleri', '.jpg'),
       'esra.ova@ekinerago.test', '05330002034', '05330002034', 'verified', 0.00, 0, 0, 0.00,
       'Konya içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Yenişehir Mahallesi Üretici Yolu No: 44, Meram / Konya', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Konya' JOIN districts d ON d.province_id = p.id AND d.name = 'Meram' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Yenişehir'
WHERE u.email = 'esra.ova@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 2317.28
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 39.90, 400.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Konya' JOIN districts d ON d.province_id = p.id AND d.name = 'Meram'
WHERE u.email = 'esra.ova@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 20.000, 'kg', TRUE, 59.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'esra.ova@ekinerago.test';


INSERT INTO users (role, full_name, email, password_hash, phone, whatsapp_phone, profile_photo, province_id, district_id, neighborhood_id, address_text, latitude, longitude, status, email_verified_at, last_login_at)
SELECT 'producer', 'Murat Safran', 'murat.safran@ekinerago.test', @demo_password_hash, '05330002035', '05330002035', CONCAT('/assets/img/demo/producers/', 'safran-dogal-pazar', '.jpg'), p.id, d.id, n.id,
       'Esentepe Mahallesi Üretici Yolu No: 45, Safranbolu / Karabük', 41.2494036, 32.6684142, 'active', NOW(), DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM provinces p JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Esentepe'
WHERE p.name = 'Karabük'
ON DUPLICATE KEY UPDATE full_name=VALUES(full_name), phone=VALUES(phone), whatsapp_phone=VALUES(whatsapp_phone), province_id=VALUES(province_id), district_id=VALUES(district_id), neighborhood_id=VALUES(neighborhood_id), address_text=VALUES(address_text), latitude=VALUES(latitude), longitude=VALUES(longitude), status='active';

INSERT INTO producer_profiles (user_id, store_name, slug, description, logo_path, cover_photo_path, contact_email, contact_phone, contact_whatsapp, verification_status, average_rating, rating_count, total_orders, total_sales_amount, shipping_note)
SELECT u.id, 'Safran Doğal Pazar', 'safran-dogal-pazar',
       'Safran Doğal Pazar, Karabük Safranbolu bölgesinde bal, sebze ve küçük üretici ürünleri üreten ve doğrudan tüketiciye satış yapan demo üretici profilidir. Günlük hasat, şeffaf fiyat ve hızlı iletişim odaklı çalışır.',
       CONCAT('/assets/img/demo/producers/logos/', 'safran-dogal-pazar', '.png'), CONCAT('/assets/img/demo/producers/covers/', 'safran-dogal-pazar', '.jpg'),
       'murat.safran@ekinerago.test', '05330002035', '05330002035', 'pending', 0.00, 0, 0, 0.00,
       'Karabük içi yerel teslimat; uygun ürünlerde Türkiye geneli korumalı kargo. Siparişten sonra üretici teslimat saatini teyit eder.'
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE store_name=VALUES(store_name), description=VALUES(description), logo_path=VALUES(logo_path), cover_photo_path=VALUES(cover_photo_path), contact_email=VALUES(contact_email), contact_phone=VALUES(contact_phone), contact_whatsapp=VALUES(contact_whatsapp), verification_status=VALUES(verification_status), shipping_note=VALUES(shipping_note);

INSERT INTO addresses (user_id, label, recipient_name, phone, province_id, district_id, neighborhood_id, address_line, latitude, longitude, is_default)
SELECT u.id, 'Üretici Adresi', u.full_name, u.phone, p.id, d.id, n.id, 'Esentepe Mahallesi Üretici Yolu No: 45, Safranbolu / Karabük', u.latitude, u.longitude, TRUE
FROM users u JOIN provinces p ON p.name = 'Karabük' JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu' JOIN neighborhoods n ON n.district_id = d.id AND n.name = 'Esentepe'
WHERE u.email = 'murat.safran@ekinerago.test';

INSERT INTO wallets (user_id, balance)
SELECT u.id, 24171.69
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE balance = VALUES(balance);

INSERT INTO producer_shipping_regions (producer_id, province_id, district_id, shipping_price, min_order_amount, is_active)
SELECT u.id, p.id, d.id, 29.90, 250.00, TRUE
FROM users u JOIN provinces p ON p.name = 'Karabük' JOIN districts d ON d.province_id = p.id AND d.name = 'Safranbolu'
WHERE u.email = 'murat.safran@ekinerago.test';

INSERT INTO producer_bulk_shipping_rules (producer_id, min_total_quantity, unit_type, ships_all_turkey, shipping_price, note, is_active)
SELECT u.id, 25.000, 'kg', TRUE, 79.90,
       'Toplu alımlarda üreticiyle teslimat günü netleştirilir.', TRUE
FROM users u WHERE u.email = 'murat.safran@ekinerago.test';
