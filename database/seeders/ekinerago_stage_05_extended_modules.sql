/*
EkineraGo büyük demo seed — Aşama 05
Amaç: Ön sipariş, talep/yanıt, kampanya, mahalle sepeti, performans ve audit log örnekleri.
Önce Aşama 00-04 çalıştırılmalı.
*/
USE ekinerago;
SET NAMES utf8mb4;


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 3.000, DATE_ADD(CURDATE(), INTERVAL 9 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-bursa-dogal-bahce-sivri-biber'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr_u.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 12.000, DATE_ADD(CURDATE(), INTERVAL 16 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fethiye-koy-sepeti-cam-bali'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr_u.email = 'ali.kayra@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 10.000, DATE_ADD(CURDATE(), INTERVAL 6 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-bafra-ovasi-pazari-zeytinyagi-1-l'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr_u.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 12.000, DATE_ADD(CURDATE(), INTERVAL 4 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-samandag-narenciye-sezonluk-findik-ici'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr_u.email = 'meryem.defne@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 3.000, DATE_ADD(CURDATE(), INTERVAL 14 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-harput-baglari-kirma-yesil-zeytin'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr_u.email = 'yusuf.harput@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 10.000, DATE_ADD(CURDATE(), INTERVAL 9 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-kadikoy-mikro-bahce-cherry-domates'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr_u.email = 'ece.kent@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 10 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-narenciye-akdeniz-gezen-tavuk-yumurtasi'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr_u.email = 'okan.limoncu@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 7.500, DATE_ADD(CURDATE(), INTERVAL 5 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-erdemli-avokado-bahcesi-cilek'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr_u.email = 'dilan.akin@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 7.500, DATE_ADD(CURDATE(), INTERVAL 14 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-alasehir-dogal-uzum-cherry-domates'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr_u.email = 'osman.bag@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 10.000, DATE_ADD(CURDATE(), INTERVAL 11 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-dogal-dolmalik-biber'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr_u.email = 'melike.fatsa@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 12.000, DATE_ADD(CURDATE(), INTERVAL 14 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-gaziantep-kurutmalik-kirma-yesil-zeytin'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr_u.email = 'nihat.kurut@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 11 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-kumluca-bereket-ciftligi-gunluk-hasat-nar'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr_u.email = 'ahmet.torun@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 17 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-erdemli-limon-evi-patates'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr_u.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 3.000, DATE_ADD(CURDATE(), INTERVAL 6 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-alasehir-uzum-bagi-uzum'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr_u.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 12.000, DATE_ADD(CURDATE(), INTERVAL 15 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fatsa-findik-ve-bal-maydanoz-demeti'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr_u.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 3.000, DATE_ADD(CURDATE(), INTERVAL 14 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr_u.email = 'kemal.antep@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 11 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-safranbolu-koy-urunleri-taze-limon'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr_u.email = 'seda.safran@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 15 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-kuru-sogan'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr_u.email = 'tuna.kaya@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 5.000, DATE_ADD(CURDATE(), INTERVAL 11 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-ege-otlari-atolyesi-karpuz'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr_u.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 12.000, DATE_ADD(CURDATE(), INTERVAL 14 DAY), 'harvest_ready', DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-efeler-incir-konagi-koy-tipi-siyah-uzum'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr_u.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 10.000, DATE_ADD(CURDATE(), INTERVAL 15 DAY), 'approved', DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-pamukkale-sera-kirmizi-mercimek'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr_u.email = 'hale.denizli@ekinerago.test';


INSERT INTO preorder_reservations (user_id, product_id, quantity, expected_harvest_date, status, created_at)
SELECT cu.id, p.id, 3.000, DATE_ADD(CURDATE(), INTERVAL 13 DAY), 'pending', DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-harran-bakliyat-cherry-domates'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr_u.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Limon', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-01-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'İstanbul' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kadıköy'
WHERE cu.email = 'deniz.arslan@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 35.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 3 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND dr.note LIKE '%DR-01-01%' AND pr_u.email = 'ahmet.torun@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Taze domates', prov.id, dist.id, 15.000, 'kg', 'Demo talep kodu DR-01-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'İstanbul' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kadıköy'
WHERE cu.email = 'deniz.arslan@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 50.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 12 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fethiye-koy-sepeti-cicek-bali'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND dr.note LIKE '%DR-01-02%' AND pr_u.email = 'ali.kayra@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Köy yumurtası', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-02-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 8 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Ankara' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Çankaya'
WHERE cu.email = 'elif.sahin@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 35.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 8 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-efeler-zeytinligi-avokado'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND dr.note LIKE '%DR-02-01%' AND pr_u.email = 'fatma.aydin@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Köy yumurtası', prov.id, dist.id, 10.000, 'kg', 'Demo talep kodu DR-02-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Ankara' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Çankaya'
WHERE cu.email = 'elif.sahin@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 35.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 5 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fatsa-findik-ve-bal-kuru-sogan'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND dr.note LIKE '%DR-02-02%' AND pr_u.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Limon', prov.id, dist.id, 15.000, 'kg', 'Demo talep kodu DR-03-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 8 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'İzmir' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Seferihisar'
WHERE cu.email = 'mert.kilic@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 35.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 7 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-bafra-ovasi-pazari-kavun'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND dr.note LIKE '%DR-03-01%' AND pr_u.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Salatalık', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-03-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'İzmir' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Seferihisar'
WHERE cu.email = 'mert.kilic@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 50.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 8 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-meram-ciftci-pazari-kuru-fasulye'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND dr.note LIKE '%DR-03-02%' AND pr_u.email = 'rabia.meram@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Kırmızı soğan', prov.id, dist.id, 15.000, 'kg', 'Demo talep kodu DR-04-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Bursa' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Nilüfer'
WHERE cu.email = 'zeynep.acar@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 50.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 11 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-sahinbey-antep-bahcesi-roka-demeti'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND dr.note LIKE '%DR-04-01%' AND pr_u.email = 'kemal.antep@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Salatalık', prov.id, dist.id, 5.000, 'kg', 'Demo talep kodu DR-04-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Bursa' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Nilüfer'
WHERE cu.email = 'zeynep.acar@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 75.000, 'accepted', DATE_ADD(dr.created_at, INTERVAL 11 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-kadikoy-mikro-bahce-zeytinyagi-1-l'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND dr.note LIKE '%DR-04-02%' AND pr_u.email = 'ece.kent@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Nohut', prov.id, dist.id, 5.000, 'kg', 'Demo talep kodu DR-05-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Kocaeli' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'İzmit'
WHERE cu.email = 'burak.demir@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 20.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 7 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-adana-bereket-tarlasi-sezonluk-karpuz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND dr.note LIKE '%DR-05-01%' AND pr_u.email = 'cem.yuregir@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Limon', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-05-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Kocaeli' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'İzmit'
WHERE cu.email = 'burak.demir@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 50.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 9 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-ege-otlari-atolyesi-havuc'
WHERE cu.email = 'burak.demir@ekinerago.test' AND dr.note LIKE '%DR-05-02%' AND pr_u.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Köy yumurtası', prov.id, dist.id, 10.000, 'kg', 'Demo talep kodu DR-06-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Mersin' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Erdemli'
WHERE cu.email = 'irem.yildiz@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 100.000, 'accepted', DATE_ADD(dr.created_at, INTERVAL 8 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-limon'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND dr.note LIKE '%DR-06-01%' AND pr_u.email = 'okan.limoncu@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Kırmızı soğan', prov.id, dist.id, 20.000, 'kg', 'Demo talep kodu DR-06-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Mersin' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Erdemli'
WHERE cu.email = 'irem.yildiz@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 20.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 3 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fethiye-bal-ve-nar-elma'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND dr.note LIKE '%DR-06-02%' AND pr_u.email = 'gokce.ari@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Doğal bal', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-07-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 18 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Aydın' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Efeler'
WHERE cu.email = 'can.ozturk@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 100.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 2 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND dr.note LIKE '%DR-07-01%' AND pr_u.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Mandalina', prov.id, dist.id, 10.000, 'kg', 'Demo talep kodu DR-07-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 20 DAY), DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Aydın' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Efeler'
WHERE cu.email = 'can.ozturk@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 35.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 8 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-elma'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND dr.note LIKE '%DR-07-02%' AND pr_u.email = 'melike.fatsa@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Kırmızı soğan', prov.id, dist.id, 5.000, 'kg', 'Demo talep kodu DR-08-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Antalya' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kumluca'
WHERE cu.email = 'selin.koc@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 75.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 7 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-bafra-kirmizi-sogan-patlican'
WHERE cu.email = 'selin.koc@ekinerago.test' AND dr.note LIKE '%DR-08-01%' AND pr_u.email = 'turgut.ova@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Mandalina', prov.id, dist.id, 10.000, 'kg', 'Demo talep kodu DR-08-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 15 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Antalya' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kumluca'
WHERE cu.email = 'selin.koc@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 100.000, 'accepted', DATE_ADD(dr.created_at, INTERVAL 12 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-konya-ova-urunleri-nohut'
WHERE cu.email = 'selin.koc@ekinerago.test' AND dr.note LIKE '%DR-08-02%' AND pr_u.email = 'esra.ova@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Doğal bal', prov.id, dist.id, 5.000, 'kg', 'Demo talep kodu DR-09-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Karabük' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Safranbolu'
WHERE cu.email = 'onur.kara@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 50.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 5 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-gaziantep-kurutmalik-elma'
WHERE cu.email = 'onur.kara@ekinerago.test' AND dr.note LIKE '%DR-09-01%' AND pr_u.email = 'nihat.kurut@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Taze domates', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-09-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 12 DAY), DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Karabük' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Safranbolu'
WHERE cu.email = 'onur.kara@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 75.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 7 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-bursa-dogal-bahce-taze-kapya-biber'
WHERE cu.email = 'onur.kara@ekinerago.test' AND dr.note LIKE '%DR-09-02%' AND pr_u.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 1, 'Mandalina', prov.id, dist.id, 15.000, 'kg', 'Demo talep kodu DR-10-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Samsun' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Bafra'
WHERE cu.email = 'derya.polat@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 75.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 5 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-siyah-zeytin'
WHERE cu.email = 'derya.polat@ekinerago.test' AND dr.note LIKE '%DR-10-01%' AND pr_u.email = 'nermin.ege@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Taze domates', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-10-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 11 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Samsun' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Bafra'
WHERE cu.email = 'derya.polat@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 20.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 11 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-alasehir-uzum-bagi-sezonluk-kuru-fasulye'
WHERE cu.email = 'derya.polat@ekinerago.test' AND dr.note LIKE '%DR-10-02%' AND pr_u.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 2, 'Kırmızı soğan', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-11-01: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Konya' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Meram'
WHERE cu.email = 'emre.celik@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 75.000, 'accepted', DATE_ADD(dr.created_at, INTERVAL 4 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-fethiye-koy-sepeti-cilek'
WHERE cu.email = 'emre.celik@ekinerago.test' AND dr.note LIKE '%DR-11-01%' AND pr_u.email = 'ali.kayra@ekinerago.test';


INSERT INTO demand_requests (consumer_id, category_id, product_name, province_id, district_id, desired_quantity, unit_type, note, status, expires_at, created_at)
SELECT cu.id, 3, 'Kırmızı soğan', prov.id, dist.id, 8.000, 'kg', 'Demo talep kodu DR-11-02: uygun üretici teklifleri bekleniyor.', 'responded', DATE_ADD(NOW(), INTERVAL 18 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN provinces prov ON prov.name = 'Konya' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Meram'
WHERE cu.email = 'emre.celik@ekinerago.test';

INSERT INTO demand_responses (demand_request_id, producer_id, product_id, message, offered_price, available_quantity, status, created_at)
SELECT dr.id, pr_u.id, p.id, 'Bu talebe uygun ürünümüz mevcut. Miktar ve teslimat için mesajlaşabiliriz.', p.price, 100.000, 'sent', DATE_ADD(dr.created_at, INTERVAL 6 HOUR)
FROM demand_requests dr JOIN users cu ON cu.id = dr.consumer_id JOIN users pr_u JOIN products p ON p.producer_id = pr_u.id AND p.slug = 'bd-harran-gunes-tarlasi-sezonluk-kivircik-marul'
WHERE cu.email = 'emre.celik@ekinerago.test' AND dr.note LIKE '%DR-11-02%' AND pr_u.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 15.000, 250.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 25 DAY), 'active'
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE u.email = 'ahmet.torun@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kumluca-bereket-ciftligi-cherry-domates'
WHERE u.email = 'ahmet.torun@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kumluca-bereket-ciftligi-koy-domatesi'
WHERE u.email = 'ahmet.torun@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'percentage_discount', 10.00, 10.000, 400.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 25 DAY), 'active'
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-koy-tipi-portakal'
WHERE u.email = 'nermin.ege@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-mandalina'
WHERE u.email = 'nermin.ege@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-sezonluk-dut'
WHERE u.email = 'nermin.ege@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 600.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 14 DAY), 'active'
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bursa-dogal-bahce-dut'
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bursa-dogal-bahce-siyah-zeytin'
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bursa-dogal-bahce-cicek-bali'
WHERE u.email = 'mustafa.bahcivan@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 10.000, 400.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 19 DAY), 'active'
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-limon-evi-sezonluk-nar'
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-limon-evi-gunluk-hasat-avokado'
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-limon-evi-gunluk-hasat-sivri-biber'
WHERE u.email = 'hasan.akdeniz@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 10.000, 400.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 19 DAY), 'active'
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-zeytinligi-armut'
WHERE u.email = 'fatma.aydin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-zeytinligi-avokado'
WHERE u.email = 'fatma.aydin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-zeytinligi-portakal'
WHERE u.email = 'fatma.aydin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 25 DAY), 'active'
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-koy-sepeti-siyah-uzum'
WHERE u.email = 'ali.kayra@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-koy-sepeti-cicek-bali'
WHERE u.email = 'ali.kayra@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-koy-sepeti-taze-ispanak'
WHERE u.email = 'ali.kayra@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'percentage_discount', 10.00, 5.000, 600.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 16 DAY), 'active'
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-uzum-bagi-dogal-salatalik'
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-uzum-bagi-pekmez'
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-uzum-bagi-siyah-uzum'
WHERE u.email = 'sevgi.bagci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 5.000, 250.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 21 DAY), 'active'
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-organik-tarla-dolmalik-biber'
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-organik-tarla-maydanoz-demeti'
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-organik-tarla-sivri-biber'
WHERE u.email = 'mehmet.ozgur@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 10.000, 400.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 22 DAY), 'active'
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-ovasi-pazari-kapya-biber'
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-ovasi-pazari-havuc'
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-ovasi-pazari-kavun'
WHERE u.email = 'ayhan.bafrali@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 600.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 23 DAY), 'active'
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-findik-ve-bal-gunluk-hasat-cam-bali'
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-findik-ve-bal-koy-tipi-ispanak'
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-findik-ve-bal-kuru-sogan'
WHERE u.email = 'gulcan.yaman@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'percentage_discount', 10.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 16 DAY), 'active'
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-gunes-tarlasi-koy-tipi-bamya'
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-gunes-tarlasi-sivri-biber'
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-gunes-tarlasi-kapya-biber'
WHERE u.email = 'ibrahim.harran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 400.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 25 DAY), 'active'
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-samandag-narenciye-portakal'
WHERE u.email = 'meryem.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-samandag-narenciye-kirmizi-mercimek'
WHERE u.email = 'meryem.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-samandag-narenciye-koy-tipi-limon'
WHERE u.email = 'meryem.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 15.000, 400.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 17 DAY), 'active'
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sahinbey-antep-bahcesi-kirmizi-sogan'
WHERE u.email = 'kemal.antep@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sahinbey-antep-bahcesi-taze-koy-domatesi'
WHERE u.email = 'kemal.antep@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE u.email = 'kemal.antep@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 5.000, 400.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'active'
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-meram-ciftci-pazari-gunluk-hasat-kuru-sogan'
WHERE u.email = 'rabia.meram@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-meram-ciftci-pazari-dogal-cherry-domates'
WHERE u.email = 'rabia.meram@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-meram-ciftci-pazari-patates'
WHERE u.email = 'rabia.meram@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 15.000, 400.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 18 DAY), 'active'
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harput-baglari-gunluk-hasat-ispanak'
WHERE u.email = 'yusuf.harput@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harput-baglari-koy-tipi-ev-yapimi-salca'
WHERE u.email = 'yusuf.harput@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harput-baglari-zeytinyagi-1-l'
WHERE u.email = 'yusuf.harput@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 5.000, 250.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 30 DAY), 'active'
FROM users u WHERE u.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safranbolu-koy-urunleri-nohut'
WHERE u.email = 'seda.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safranbolu-koy-urunleri-cicek-bali'
WHERE u.email = 'seda.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safranbolu-koy-urunleri-gunluk-hasat-kuru-sogan'
WHERE u.email = 'seda.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 600.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 26 DAY), 'active'
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-adana-bereket-tarlasi-elma'
WHERE u.email = 'cem.yuregir@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-adana-bereket-tarlasi-dogal-siyah-uzum'
WHERE u.email = 'cem.yuregir@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-adana-bereket-tarlasi-dolmalik-biber'
WHERE u.email = 'cem.yuregir@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 5.000, 400.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 19 DAY), 'active'
FROM users u WHERE u.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kadikoy-mikro-bahce-dut'
WHERE u.email = 'ece.kent@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kadikoy-mikro-bahce-cherry-domates'
WHERE u.email = 'ece.kent@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kadikoy-mikro-bahce-elma'
WHERE u.email = 'ece.kent@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 400.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 13 DAY), 'active'
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-dolmalik-biber'
WHERE u.email = 'tuna.kaya@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-kirmizi-mercimek'
WHERE u.email = 'tuna.kaya@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-sezonluk-roka-demeti'
WHERE u.email = 'tuna.kaya@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 22 DAY), 'active'
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kocaeli-seracilik-lahana'
WHERE u.email = 'leyla.izmit@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kocaeli-seracilik-sivri-biber'
WHERE u.email = 'leyla.izmit@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-kocaeli-seracilik-sezonluk-incir'
WHERE u.email = 'leyla.izmit@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 5.000, 400.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 13 DAY), 'active'
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-narenciye-akdeniz-nar'
WHERE u.email = 'okan.limoncu@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-elma'
WHERE u.email = 'okan.limoncu@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-narenciye-akdeniz-cicek-bali'
WHERE u.email = 'okan.limoncu@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'percentage_discount', 10.00, 15.000, 400.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 23 DAY), 'active'
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-ege-otlari-atolyesi-sezonluk-kavun'
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-ege-otlari-atolyesi-dogal-muz'
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-ege-otlari-atolyesi-zeytinyagi-1-l'
WHERE u.email = 'bahar.ulamis@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 10.000, 250.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 16 DAY), 'active'
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-limon'
WHERE u.email = 'suleyman.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-cicek-bali'
WHERE u.email = 'suleyman.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-karpuz'
WHERE u.email = 'suleyman.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 250.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 28 DAY), 'active'
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-avokado-bahcesi-cam-bali'
WHERE u.email = 'dilan.akin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-avokado-bahcesi-kirmizi-sogan'
WHERE u.email = 'dilan.akin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-erdemli-avokado-bahcesi-sezonluk-nar'
WHERE u.email = 'dilan.akin@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Toplu Alım İndirimi', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 5.000, 250.00, DATE_SUB(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 16 DAY), 'active'
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-incir-konagi-incir'
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-incir-konagi-roka-demeti'
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-efeler-incir-konagi-kuru-sogan'
WHERE u.email = 'huseyin.incirci@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 13 DAY), 'active'
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-bal-ve-nar-karpuz'
WHERE u.email = 'gokce.ari@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-bal-ve-nar-ispanak'
WHERE u.email = 'gokce.ari@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fethiye-bal-ve-nar-cicek-bali'
WHERE u.email = 'gokce.ari@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 10.000, 250.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 13 DAY), 'active'
FROM users u WHERE u.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-dogal-uzum-armut'
WHERE u.email = 'osman.bag@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-dogal-uzum-cherry-domates'
WHERE u.email = 'osman.bag@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-alasehir-dogal-uzum-gunluk-hasat-koy-domatesi'
WHERE u.email = 'osman.bag@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 10.000, 250.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 17 DAY), 'active'
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-sera-koy-tipi-lahana'
WHERE u.email = 'hale.denizli@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-sera-koy-tipi-dolmalik-biber'
WHERE u.email = 'hale.denizli@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-pamukkale-sera-siyah-uzum'
WHERE u.email = 'hale.denizli@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 250.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 11 DAY), 'active'
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-kirmizi-sogan-pekmez'
WHERE u.email = 'turgut.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-kirmizi-sogan-roka-demeti'
WHERE u.email = 'turgut.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-bafra-kirmizi-sogan-salatalik'
WHERE u.email = 'turgut.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 15.000, 600.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 13 DAY), 'active'
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-dogal-dolmalik-biber'
WHERE u.email = 'melike.fatsa@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-sezonluk-lahana'
WHERE u.email = 'melike.fatsa@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-cam-bali'
WHERE u.email = 'melike.fatsa@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'fixed_discount', 50.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 18 DAY), 'active'
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-bakliyat-sezonluk-kabak'
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-bakliyat-dogal-roka-demeti'
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-harran-bakliyat-avokado'
WHERE u.email = 'halil.bakliyat@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 10.000, 600.00, DATE_SUB(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 20 DAY), 'active'
FROM users u WHERE u.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-hatay-defne-bahcesi-zeytinyagi-1-l'
WHERE u.email = 'selma.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-hatay-defne-bahcesi-dogal-siyah-uzum'
WHERE u.email = 'selma.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-hatay-defne-bahcesi-siyah-zeytin'
WHERE u.email = 'selma.defne@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Yerel Teslimat Fırsatı', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'bulk_discount', 5.00, 10.000, 250.00, DATE_SUB(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 22 DAY), 'active'
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-gaziantep-kurutmalik-kavun'
WHERE u.email = 'nihat.kurut@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-gaziantep-kurutmalik-taze-koy-domatesi'
WHERE u.email = 'nihat.kurut@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-gaziantep-kurutmalik-armut'
WHERE u.email = 'nihat.kurut@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Haftanın Taze Hasat Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 10.000, 400.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY), 'active'
FROM users u WHERE u.email = 'esra.ova@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-konya-ova-urunleri-dogal-kuru-fasulye'
WHERE u.email = 'esra.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-konya-ova-urunleri-dogal-kirmizi-mercimek'
WHERE u.email = 'esra.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-konya-ova-urunleri-maydanoz-demeti'
WHERE u.email = 'esra.ova@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO campaigns (producer_id, title, description, campaign_type, discount_value, min_quantity, min_order_amount, starts_at, ends_at, status)
SELECT u.id, 'Sezon Ürünleri Kampanyası', 'Büyük demo verisi için oluşturulmuş kampanya. Sepet, üretici sayfası ve ürün listeleme testlerinde kullanılabilir.', 'free_shipping', 0.00, 15.000, 250.00, DATE_SUB(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 29 DAY), 'active'
FROM users u WHERE u.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safran-dogal-pazar-findik-ici'
WHERE u.email = 'murat.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safran-dogal-pazar-gunluk-hasat-nohut'
WHERE u.email = 'murat.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT IGNORE INTO campaign_products (campaign_id, product_id)
SELECT c.id, p.id
FROM campaigns c JOIN users u ON u.id = c.producer_id JOIN products p ON p.producer_id = u.id AND p.slug = 'bd-safran-dogal-pazar-koy-tipi-patates'
WHERE u.email = 'murat.safran@ekinerago.test' AND c.status='active'
ORDER BY c.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'İstanbul Köy Tipi Portakal Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 18.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-sigacik-mandalina-bahcesi-koy-tipi-portakal'
JOIN provinces prov ON prov.name = 'İstanbul' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kadıköy' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Caferağa'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr_u.email = 'nermin.ege@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'active', DATE_ADD(nb.created_at, INTERVAL 16 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İstanbul Köy Tipi Portakal Mahalle Sepeti' AND u.email = 'deniz.arslan@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 7.500, 'paid', DATE_ADD(nb.created_at, INTERVAL 7 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İstanbul Köy Tipi Portakal Mahalle Sepeti' AND u.email = 'elif.sahin@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'active', DATE_ADD(nb.created_at, INTERVAL 11 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İstanbul Köy Tipi Portakal Mahalle Sepeti' AND u.email = 'mert.kilic@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Ankara Çiçek Balı Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 18.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 4 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-fethiye-koy-sepeti-cicek-bali'
JOIN provinces prov ON prov.name = 'Ankara' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Çankaya' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Ayrancı'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr_u.email = 'ali.kayra@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 4.000, 'active', DATE_ADD(nb.created_at, INTERVAL 15 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Ankara Çiçek Balı Mahalle Sepeti' AND u.email = 'elif.sahin@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 3.000, 'active', DATE_ADD(nb.created_at, INTERVAL 16 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Ankara Çiçek Balı Mahalle Sepeti' AND u.email = 'mert.kilic@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'active', DATE_ADD(nb.created_at, INTERVAL 20 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Ankara Çiçek Balı Mahalle Sepeti' AND u.email = 'zeynep.acar@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'İzmir Kuru Soğan Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 18.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-fatsa-findik-ve-bal-kuru-sogan'
JOIN provinces prov ON prov.name = 'İzmir' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Seferihisar' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Sığacık'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr_u.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'active', DATE_ADD(nb.created_at, INTERVAL 13 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İzmir Kuru Soğan Mahalle Sepeti' AND u.email = 'mert.kilic@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 4.000, 'active', DATE_ADD(nb.created_at, INTERVAL 7 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İzmir Kuru Soğan Mahalle Sepeti' AND u.email = 'zeynep.acar@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 3.000, 'active', DATE_ADD(nb.created_at, INTERVAL 19 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'İzmir Kuru Soğan Mahalle Sepeti' AND u.email = 'burak.demir@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Bursa Kuru Fasulye Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 12.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 11 DAY), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-meram-ciftci-pazari-kuru-fasulye'
JOIN provinces prov ON prov.name = 'Bursa' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Nilüfer' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Görükle'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr_u.email = 'rabia.meram@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'paid', DATE_ADD(nb.created_at, INTERVAL 18 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Bursa Kuru Fasulye Mahalle Sepeti' AND u.email = 'zeynep.acar@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'active', DATE_ADD(nb.created_at, INTERVAL 15 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Bursa Kuru Fasulye Mahalle Sepeti' AND u.email = 'burak.demir@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'paid', DATE_ADD(nb.created_at, INTERVAL 18 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Bursa Kuru Fasulye Mahalle Sepeti' AND u.email = 'irem.yildiz@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Kocaeli Zeytinyağı 1 L Mahalle Sepeti', prov.id, dist.id, neigh.id, 40.000, 12.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-kadikoy-mikro-bahce-zeytinyagi-1-l'
JOIN provinces prov ON prov.name = 'Kocaeli' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'İzmit' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Yahyakaptan'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr_u.email = 'ece.kent@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'active', DATE_ADD(nb.created_at, INTERVAL 14 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Kocaeli Zeytinyağı 1 L Mahalle Sepeti' AND u.email = 'burak.demir@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'active', DATE_ADD(nb.created_at, INTERVAL 11 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Kocaeli Zeytinyağı 1 L Mahalle Sepeti' AND u.email = 'irem.yildiz@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'paid', DATE_ADD(nb.created_at, INTERVAL 8 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Kocaeli Zeytinyağı 1 L Mahalle Sepeti' AND u.email = 'can.ozturk@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Mersin Havuç Mahalle Sepeti', prov.id, dist.id, neigh.id, 50.000, 24.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 14 DAY), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-ege-otlari-atolyesi-havuc'
JOIN provinces prov ON prov.name = 'Mersin' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Erdemli' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Kargıpınarı'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr_u.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 3.000, 'active', DATE_ADD(nb.created_at, INTERVAL 16 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Mersin Havuç Mahalle Sepeti' AND u.email = 'irem.yildiz@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 2.000, 'active', DATE_ADD(nb.created_at, INTERVAL 11 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Mersin Havuç Mahalle Sepeti' AND u.email = 'can.ozturk@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 3.000, 'active', DATE_ADD(nb.created_at, INTERVAL 20 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Mersin Havuç Mahalle Sepeti' AND u.email = 'selin.koc@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Aydın Elma Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 18.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 10 DAY), DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-fethiye-bal-ve-nar-elma'
JOIN provinces prov ON prov.name = 'Aydın' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Efeler' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Güzelhisar'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr_u.email = 'gokce.ari@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'active', DATE_ADD(nb.created_at, INTERVAL 18 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Aydın Elma Mahalle Sepeti' AND u.email = 'can.ozturk@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 5.000, 'active', DATE_ADD(nb.created_at, INTERVAL 8 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Aydın Elma Mahalle Sepeti' AND u.email = 'selin.koc@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 4.000, 'active', DATE_ADD(nb.created_at, INTERVAL 10 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Aydın Elma Mahalle Sepeti' AND u.email = 'onur.kara@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_baskets (producer_id, product_id, creator_user_id, title, province_id, district_id, neighborhood_id, target_quantity, current_quantity, unit_type, status, expires_at, created_at)
SELECT pr_u.id, pdt.id, cu.id, 'Antalya Elma Mahalle Sepeti', prov.id, dist.id, neigh.id, 25.000, 8.000, pdt.unit_type, 'open', DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr_u JOIN products pdt ON pdt.producer_id = pr_u.id AND pdt.slug = 'bd-fatsa-karadeniz-sepeti-elma'
JOIN provinces prov ON prov.name = 'Antalya' JOIN districts dist ON dist.province_id = prov.id AND dist.name = 'Kumluca' JOIN neighborhoods neigh ON neigh.district_id = dist.id AND neigh.name = 'Merkez'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr_u.email = 'melike.fatsa@ekinerago.test';


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 7.500, 'active', DATE_ADD(nb.created_at, INTERVAL 4 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Antalya Elma Mahalle Sepeti' AND u.email = 'selin.koc@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 7.500, 'paid', DATE_ADD(nb.created_at, INTERVAL 5 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Antalya Elma Mahalle Sepeti' AND u.email = 'onur.kara@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_members (basket_id, user_id, quantity, status, created_at)
SELECT nb.id, u.id, 4.000, 'paid', DATE_ADD(nb.created_at, INTERVAL 19 HOUR)
FROM neighborhood_baskets nb JOIN users u
WHERE nb.title = 'Antalya Elma Mahalle Sepeti' AND u.email = 'derya.polat@ekinerago.test'
ORDER BY nb.id DESC LIMIT 1;


INSERT INTO neighborhood_basket_payments (basket_member_id, wallet_transaction_id, amount, status, created_at)
SELECT nbm.id, NULL, ROUND(nbm.quantity * p.price, 2), 'paid', DATE_ADD(nbm.created_at, INTERVAL 2 HOUR)
FROM neighborhood_basket_members nbm
JOIN neighborhood_baskets nb ON nb.id = nbm.basket_id
JOIN products p ON p.id = nb.product_id
JOIN users u ON u.id = nbm.user_id
WHERE u.email LIKE '%@ekinerago.test' AND nbm.status = 'paid';


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 1273.00, 7.00, 156, 70, 12
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 6, 1735.00, 40.00, 202, 48, 8
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 8, 2464.00, 75.00, 61, 15, 25
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 0, 2204.00, 58.00, 85, 20, 18
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 2047.00, 58.00, 42, 78, 18
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 140.00, 76.00, 86, 41, 32
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 1120.00, 73.00, 127, 82, 13
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 7, 1193.00, 48.00, 20, 105, 21
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 2, 862.00, 28.00, 184, 96, 3
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1996.00, 50.00, 81, 106, 10
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 0, 2244.00, 50.00, 91, 56, 30
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 5, 1603.00, 50.00, 23, 69, 18
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 4, 799.00, 70.00, 105, 14, 8
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 5, 2377.00, 6.00, 222, 92, 19
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 7, 670.00, 73.00, 40, 58, 30
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 4, 593.00, 26.00, 60, 104, 12
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 1483.00, 73.00, 31, 88, 9
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 6, 1749.00, 21.00, 19, 14, 22
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 7, 735.00, 6.00, 35, 67, 21
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 6, 608.00, 80.00, 189, 53, 15
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 486.00, 30.00, 106, 64, 19
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1537.00, 11.00, 204, 61, 24
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 4, 1823.00, 47.00, 7, 17, 7
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 1, 499.00, 62.00, 169, 87, 32
FROM users u WHERE u.email = 'ali.kayra@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 94.00, 75.00, 151, 75, 30
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 4, 387.00, 75.00, 51, 51, 30
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 6, 1222.00, 73.00, 37, 14, 20
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 1, 2201.00, 23.00, 108, 106, 1
FROM users u WHERE u.email = 'sevgi.bagci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 6, 2277.00, 68.00, 205, 105, 33
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 7, 261.00, 66.00, 219, 76, 34
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 849.00, 15.00, 51, 78, 11
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 0, 2272.00, 57.00, 209, 42, 7
FROM users u WHERE u.email = 'mehmet.ozgur@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 527.00, 73.00, 57, 85, 10
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 1, 2303.00, 32.00, 222, 98, 2
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 510.00, 64.00, 81, 48, 34
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 1732.00, 0.00, 68, 40, 2
FROM users u WHERE u.email = 'ayhan.bafrali@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 8, 1201.00, 68.00, 118, 19, 31
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 5, 2140.00, 45.00, 160, 70, 32
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 3, 405.00, 5.00, 65, 6, 12
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 1227.00, 27.00, 39, 79, 35
FROM users u WHERE u.email = 'gulcan.yaman@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 2423.00, 45.00, 76, 18, 27
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 1, 2252.00, 32.00, 71, 50, 10
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 6, 1868.00, 10.00, 70, 88, 27
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 2195.00, 26.00, 23, 82, 17
FROM users u WHERE u.email = 'ibrahim.harran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 1524.00, 72.00, 173, 84, 32
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1719.00, 19.00, 85, 102, 27
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 6, 106.00, 77.00, 68, 11, 17
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 1, 2176.00, 14.00, 180, 72, 26
FROM users u WHERE u.email = 'meryem.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 1, 1349.00, 11.00, 97, 44, 17
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 924.00, 35.00, 7, 14, 24
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 3, 1550.00, 13.00, 205, 17, 11
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 8, 1255.00, 75.00, 215, 105, 31
FROM users u WHERE u.email = 'kemal.antep@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 1, 2166.00, 44.00, 184, 75, 18
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 8, 1110.00, 77.00, 30, 8, 10
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 5, 1595.00, 23.00, 93, 105, 34
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 8, 2435.00, 51.00, 127, 77, 8
FROM users u WHERE u.email = 'rabia.meram@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 4, 38.00, 65.00, 187, 21, 8
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1551.00, 72.00, 193, 36, 3
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 5, 1020.00, 77.00, 112, 92, 29
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 1797.00, 45.00, 209, 61, 32
FROM users u WHERE u.email = 'yusuf.harput@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 4, 1129.00, 54.00, 138, 93, 14
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 4, 356.00, 39.00, 109, 100, 20
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 325.00, 9.00, 191, 32, 5
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 2356.00, 7.00, 26, 97, 18
FROM users u WHERE u.email = 'seda.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 8, 2018.00, 1.00, 113, 88, 32
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1964.00, 63.00, 136, 89, 34
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 1660.00, 1.00, 162, 26, 0
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 6, 2188.00, 44.00, 67, 96, 33
FROM users u WHERE u.email = 'cem.yuregir@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 2487.00, 57.00, 48, 88, 33
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 3, 716.00, 9.00, 98, 109, 8
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 8, 1447.00, 6.00, 113, 65, 24
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 2, 1528.00, 14.00, 91, 88, 15
FROM users u WHERE u.email = 'ece.kent@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 8, 482.00, 37.00, 81, 63, 18
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 4, 872.00, 0.00, 193, 82, 25
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 3, 1248.00, 65.00, 216, 6, 29
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 7, 235.00, 45.00, 6, 80, 29
FROM users u WHERE u.email = 'tuna.kaya@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 5, 1222.00, 45.00, 32, 2, 22
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1646.00, 45.00, 7, 14, 27
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 7, 809.00, 10.00, 140, 67, 9
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 6, 507.00, 62.00, 6, 21, 16
FROM users u WHERE u.email = 'leyla.izmit@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 1927.00, 50.00, 100, 40, 23
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 6, 746.00, 68.00, 212, 36, 6
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 7, 1799.00, 20.00, 40, 47, 27
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 0, 1471.00, 25.00, 33, 26, 18
FROM users u WHERE u.email = 'okan.limoncu@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 547.00, 50.00, 112, 97, 21
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 0, 656.00, 25.00, 127, 87, 17
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 1724.00, 62.00, 145, 65, 8
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 5, 1637.00, 64.00, 190, 96, 24
FROM users u WHERE u.email = 'bahar.ulamis@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 2, 449.00, 13.00, 207, 4, 8
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1409.00, 64.00, 8, 100, 15
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 0, 1401.00, 54.00, 157, 96, 0
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 6, 1966.00, 37.00, 77, 64, 5
FROM users u WHERE u.email = 'suleyman.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 6, 1014.00, 79.00, 44, 95, 32
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1021.00, 35.00, 201, 16, 16
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 3, 1757.00, 25.00, 126, 92, 6
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 8, 742.00, 24.00, 223, 77, 9
FROM users u WHERE u.email = 'dilan.akin@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 493.00, 16.00, 107, 6, 17
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 3, 598.00, 54.00, 9, 80, 12
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 1, 208.00, 48.00, 109, 69, 19
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 3, 908.00, 43.00, 114, 63, 3
FROM users u WHERE u.email = 'huseyin.incirci@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 8, 1749.00, 6.00, 82, 16, 17
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 5, 1149.00, 44.00, 187, 55, 15
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 5, 194.00, 23.00, 15, 2, 3
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 5, 868.00, 36.00, 125, 37, 6
FROM users u WHERE u.email = 'gokce.ari@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 6, 757.00, 32.00, 130, 48, 21
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 4, 456.00, 12.00, 176, 3, 35
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 2, 1356.00, 46.00, 194, 105, 23
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 8, 2476.00, 47.00, 65, 85, 17
FROM users u WHERE u.email = 'osman.bag@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 2393.00, 49.00, 27, 15, 8
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 1, 168.00, 75.00, 238, 85, 12
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 3, 1825.00, 12.00, 24, 71, 21
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 4, 1942.00, 25.00, 141, 94, 9
FROM users u WHERE u.email = 'hale.denizli@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 0, 523.00, 24.00, 112, 72, 16
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 8, 1422.00, 46.00, 119, 82, 7
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 6, 277.00, 61.00, 112, 69, 32
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 0, 683.00, 76.00, 75, 91, 8
FROM users u WHERE u.email = 'turgut.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 4, 186.00, 72.00, 20, 103, 12
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 6, 2027.00, 68.00, 227, 67, 4
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 2, 1793.00, 65.00, 103, 73, 24
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 6, 2487.00, 34.00, 57, 25, 0
FROM users u WHERE u.email = 'melike.fatsa@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 2, 2342.00, 27.00, 156, 91, 0
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 8, 1865.00, 64.00, 186, 94, 33
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 4, 1242.00, 28.00, 80, 92, 17
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 8, 487.00, 21.00, 62, 7, 34
FROM users u WHERE u.email = 'halil.bakliyat@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 1195.00, 5.00, 168, 20, 17
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1107.00, 6.00, 169, 33, 13
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 8, 475.00, 0.00, 171, 46, 23
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 5, 340.00, 70.00, 72, 94, 8
FROM users u WHERE u.email = 'selma.defne@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 6, 1207.00, 41.00, 19, 82, 0
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 5, 898.00, 35.00, 50, 34, 1
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 8, 2389.00, 13.00, 189, 97, 24
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 4, 2475.00, 70.00, 57, 106, 28
FROM users u WHERE u.email = 'nihat.kurut@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 3, 1328.00, 34.00, 57, 76, 25
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 2, 1827.00, 29.00, 191, 94, 27
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 5, 607.00, 61.00, 28, 65, 11
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 7, 757.00, 22.00, 53, 74, 31
FROM users u WHERE u.email = 'esra.ova@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 2, 1155.00, 2.00, 84, 22, 11
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 7 DAY), 6, 2489.00, 24.00, 22, 20, 4
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 14 DAY), 6, 1004.00, 58.00, 237, 84, 25
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO producer_performance_daily (producer_id, report_date, total_orders, total_revenue, total_products_sold, product_view_count, profile_view_count, favorite_count)
SELECT u.id, DATE_SUB(CURDATE(), INTERVAL 30 DAY), 1, 2157.00, 17.00, 191, 98, 0
FROM users u WHERE u.email = 'murat.safran@ekinerago.test'
ON DUPLICATE KEY UPDATE total_orders=VALUES(total_orders), total_revenue=VALUES(total_revenue), total_products_sold=VALUES(total_products_sold), product_view_count=VALUES(product_view_count), profile_view_count=VALUES(profile_view_count), favorite_count=VALUES(favorite_count);


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users u WHERE u.email = 'ahmet.torun@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'nermin.ege@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users u WHERE u.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO audit_logs (user_id, action, entity_type, entity_id, description, ip_address, created_at)
SELECT u.id, 'demo_seed_activity', 'seed', NULL, 'Büyük demo seed kapsamında oluşturulmuş örnek işlem kaydı.', CONCAT('10.0.0.', FLOOR(1 + RAND()*200)), DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'fatma.aydin@ekinerago.test';
