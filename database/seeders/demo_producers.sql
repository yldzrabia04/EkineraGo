USE ekinerago;

SET NAMES utf8mb4;

INSERT INTO producer_profiles (
    user_id,
    store_name,
    slug,
    description,
    logo_path,
    cover_photo_path,
    contact_email,
    contact_phone,
    contact_whatsapp,
    verification_status,
    average_rating,
    rating_count,
    total_orders,
    total_sales_amount,
    shipping_note
)
SELECT
    id,
    'Ekinera Demo Çiftliği',
    'ekinera-demo-ciftligi',
    'Doğrudan üreticiden tüketiciye taze ürün satışı yapan demo üretici hesabı.',
    NULL,
    NULL,
    'producer@ekinerago.com',
    '5552222222',
    '5552222222',
    'verified',
    0.00,
    0,
    0,
    0.00,
    'Gönderim bilgileri daha sonra üretici panelinden düzenlenecektir.'
FROM users
WHERE email = 'producer@ekinerago.com'
ON DUPLICATE KEY UPDATE
store_name = VALUES(store_name),
description = VALUES(description),
contact_email = VALUES(contact_email),
contact_phone = VALUES(contact_phone),
contact_whatsapp = VALUES(contact_whatsapp),
verification_status = VALUES(verification_status),
shipping_note = VALUES(shipping_note);

INSERT INTO producer_bulk_shipping_rules (
    producer_id,
    min_total_quantity,
    unit_type,
    ships_all_turkey,
    shipping_price,
    note,
    is_active
)
SELECT
    u.id,
    100.00,
    'kg',
    TRUE,
    150.00,
    '100 kg üzeri toplu alımda gönderim yapılabilir.',
    TRUE
FROM users u
WHERE u.email = 'producer@ekinerago.com'
AND NOT EXISTS (
    SELECT 1
    FROM producer_bulk_shipping_rules r
    WHERE r.producer_id = u.id
);

-- producer_shipping_regions tablosuna bilinçli olarak veri eklenmedi.
-- Çünkü belirli il/ilçe bilgisi kullanmak istemiyoruz.
