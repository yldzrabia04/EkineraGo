USE ekinerago;

SET NAMES utf8mb4;

INSERT INTO users (
    role,
    full_name,
    email,
    password_hash,
    phone,
    whatsapp_phone,
    profile_photo,
    province_id,
    district_id,
    neighborhood_id,
    address_text,
    latitude,
    longitude,
    status
)
VALUES
(
    'admin',
    'Admin Kullanıcı',
    'admin@ekinerago.com',
    '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36e9xDk7b6F4Pc1kTk9qgMG',
    '5550000000',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'active'
),
(
    'consumer',
    'Demo Tüketici',
    'consumer@ekinerago.com',
    '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36e9xDk7b6F4Pc1kTk9qgMG',
    '5551111111',
    '5551111111',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'active'
),
(
    'producer',
    'Demo Üretici',
    'producer@ekinerago.com',
    '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36e9xDk7b6F4Pc1kTk9qgMG',
    '5552222222',
    '5552222222',
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    'active'
)
ON DUPLICATE KEY UPDATE
role = VALUES(role),
full_name = VALUES(full_name),
phone = VALUES(phone),
whatsapp_phone = VALUES(whatsapp_phone),
status = VALUES(status);

INSERT INTO wallets (user_id, balance)
SELECT id, 0.00
FROM users
WHERE email = 'admin@ekinerago.com'
ON DUPLICATE KEY UPDATE
balance = VALUES(balance);

INSERT INTO wallets (user_id, balance)
SELECT id, 1000.00
FROM users
WHERE email = 'consumer@ekinerago.com'
ON DUPLICATE KEY UPDATE
balance = VALUES(balance);

INSERT INTO wallets (user_id, balance)
SELECT id, 0.00
FROM users
WHERE email = 'producer@ekinerago.com'
ON DUPLICATE KEY UPDATE
balance = VALUES(balance);

INSERT INTO consumer_profiles (user_id, default_address_id, bio)
SELECT id, NULL, 'Demo tüketici hesabı'
FROM users
WHERE email = 'consumer@ekinerago.com'
ON DUPLICATE KEY UPDATE
bio = VALUES(bio);
