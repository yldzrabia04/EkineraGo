/*
EkineraGo büyük demo seed — Aşama 04
Amaç: Her tüketici için 10 civarı yorum, favori, takip, ürün sorusu, bildirim, görüntülenme ve stok alarmı.
Önce Aşama 00-03 çalıştırılmalı.
*/
USE ekinerago;
SET NAMES utf8mb4;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-01-31 13:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-02-01 12:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-02-09 22:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-02-10 09:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-02-18 17:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-02-25 10:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-02-26 15:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-03-07 18:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-03-12 18:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-03-17 14:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-01-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-02-05 16:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-02-11 11:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-02-14 17:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-02-19 21:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-02-26 19:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-02-28 11:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-03-08 10:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-03-14 19:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-03-18 15:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-03-19 12:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-02-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-02-12 14:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-02-17 09:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-02-19 20:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-02-26 19:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-03-06 22:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-03-11 20:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-03-15 18:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-03-17 17:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-03-22 19:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-03-26 10:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-03-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-02-21 18:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-02-26 18:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-03-03 18:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-03-05 12:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-03-10 17:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-03-18 10:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-03-20 11:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-03-23 13:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-03-30 12:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-04-05 16:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-04-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-02-27 21:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-03-03 18:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-03-10 15:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-03-12 09:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-03-19 22:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-03-25 14:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-03-26 11:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-03-30 09:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-04-07 14:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-04-11 13:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-05-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-03-02 10:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-03-09 17:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-03-17 13:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-03-20 11:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-03-23 21:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-04-01 11:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-04-03 15:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-04-11 09:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-04-12 14:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-04-18 09:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-06-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-03-12 13:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-03-16 10:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-03-19 11:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-03-25 14:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-04-03 15:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-04-06 09:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-04-10 12:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-04-16 18:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-04-23 16:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-04-27 21:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-07-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-03-19 15:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-03-25 13:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-03-28 14:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-04-02 17:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-04-08 10:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-04-12 09:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-04-16 19:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-04-22 09:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-04-26 17:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-05-01 19:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-08-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-03-25 12:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-03-29 19:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-04-03 13:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-04-07 15:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-04-14 10:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-04-18 12:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-04-24 14:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-04-28 11:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-01-18 17:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-01-24 17:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-09-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-04-01 09:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-04-06 22:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-04-13 22:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-04-18 13:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-04-19 09:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-04-27 16:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-04-30 18:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-01-18 22:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-01-21 14:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-01-30 18:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-10-10'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Ürünler anlatıldığı gibi taze geldi, paketleme de gayet iyiydi.', 'visible', '2026-04-11 13:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-01'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Lezzeti market ürünlerinden belirgin şekilde daha iyi, tekrar sipariş veririm.', 'visible', '2026-04-14 11:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-02'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Teslimat zamanında yapıldı, üretici notlara dikkat etmiş.', 'visible', '2026-04-20 18:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-03'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fiyat/performans çok iyi, özellikle tazeliği memnun etti.', 'visible', '2026-04-25 13:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-04'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Küçük bir gecikme oldu ama ürün kalitesi bunu telafi etti.', 'visible', '2026-04-28 15:05:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-05'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Aile için aldık, miktar ve kalite beklentimizi karşıladı.', 'visible', '2026-05-06 22:15:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-06'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Fotoğraftaki ürünle gelen ürün uyumluydu, güven verdi.', 'visible', '2026-01-18 20:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-07'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Sebzeler diri, meyveler eziksiz geldi. Tavsiye ederim.', 'visible', '2026-01-28 13:35:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-08'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 4, 'Doğrudan üreticiden almak iyi hissettirdi, not için teşekkürler.', 'visible', '2026-01-28 12:45:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-09'
ORDER BY oi.id
LIMIT 1;


INSERT INTO reviews (order_item_id, consumer_id, producer_id, product_id, rating, comment, status, created_at)
SELECT oi.id, cu.id, pr.id, oi.product_id, 5, 'Aroması ve kokusu çok başarılıydı, özellikle kahvaltıda beğendik.', 'visible', '2026-02-02 17:25:00'
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
JOIN users cu ON cu.id = o.consumer_id
JOIN users pr ON pr.id = o.producer_id
WHERE o.order_no = 'EGO-2026-11-10'
ORDER BY oi.id
LIMIT 1;


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-mandalina'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cicek-bali'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-siyah-uzum'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salkim-domates'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cam-bali'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-lahana'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-mandalina'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-patlican'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-limon'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-kavun'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-koy-tipi-roka-demeti'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 61 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kirmizi-mercimek'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kirma-yesil-zeytin'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-siyah-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-pekmez'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-sivri-biber'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 63 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-kirmizi-sogan'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 51 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-findik-ici'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 69 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-cam-bali'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-taze-lahana'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-kapya-biber'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 69 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-roka-demeti'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-taze-siyah-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-portakal'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-cicek-bali'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-dut'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 49 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dogal-nar'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 50 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-koy-tipi-bamya'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-kirmizi-mercimek'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kuru-fasulye'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 60 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kivircik-marul'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 48 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-taze-nar'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-sivri-biber'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-salatalik'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-elma'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-mandalina'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-taze-kabak'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kivircik-marul'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-kavun'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-patlican'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-incir'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-nohut'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-dogal-siyah-uzum'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-elma'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 64 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-mandalina'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 47 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dolmalik-biber'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-limon'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kirma-yesil-zeytin'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 64 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-dogal-salkim-domates'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-kavun'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-gunluk-hasat-pekmez'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-gunluk-hasat-cilek'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 51 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-dolmalik-biber'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-dogal-roka-demeti'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-dogal-havuc'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 65 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-sezonluk-lahana'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 64 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-nar'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-dogal-muz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-karpuz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-maydanoz-demeti'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-siyah-zeytin'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-koy-tipi-portakal'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-taze-ispanak'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-koy-tipi-cicek-bali'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-armut'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-roka-demeti'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-kivircik-marul'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-kavun'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-sezonluk-havuc'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 69 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-findik-ici'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-karpuz'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-cherry-domates'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-siyah-uzum'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 55 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-gunluk-hasat-lahana'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-dogal-kavun'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-portakal'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-uzum'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-nohut'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-gunluk-hasat-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 60 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-taze-pekmez'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 64 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cam-bali'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 47 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-muz'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-cicek-bali'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-sezonluk-kabak'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-dogal-siyah-uzum'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-roka-demeti'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 54 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-dogal-muz'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 69 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-kapya-biber'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-sezonluk-nar'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-gezen-tavuk-yumurtasi'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 51 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salatalik'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cilek'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-kapya-biber'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-taze-taze-fasulye'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-gunluk-hasat-cam-bali'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 55 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-mandalina'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cicek-bali'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-siyah-uzum'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salkim-domates'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cam-bali'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-lahana'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-mandalina'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-patlican'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-limon'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 62 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-kavun'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-koy-tipi-roka-demeti'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kirmizi-mercimek'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kirma-yesil-zeytin'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-siyah-uzum'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-pekmez'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 61 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-sivri-biber'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-kirmizi-sogan'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-findik-ici'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-cam-bali'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-taze-lahana'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-kapya-biber'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-roka-demeti'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-taze-siyah-uzum'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-portakal'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-cicek-bali'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-dut'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-uzum'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dogal-nar'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-koy-tipi-bamya'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-kirmizi-mercimek'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 49 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kuru-fasulye'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kivircik-marul'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-taze-nar'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-sivri-biber'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-salatalik'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-elma'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-mandalina'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-taze-kabak'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kivircik-marul'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-kavun'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-patlican'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-incir'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-nohut'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 49 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-dogal-siyah-uzum'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 52 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-elma'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-mandalina'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dolmalik-biber'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-limon'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kirma-yesil-zeytin'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-dogal-salkim-domates'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 50 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-kavun'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 60 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-gunluk-hasat-pekmez'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 55 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-gunluk-hasat-cilek'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-dolmalik-biber'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-dogal-roka-demeti'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-dogal-havuc'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO favorites (user_id, product_id, created_at)
SELECT cu.id, p.id, DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-sezonluk-lahana'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 76 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 77 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 76 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 74 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 82 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 66 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 54 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 62 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 80 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 75 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 66 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 84 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 75 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 70 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 61 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 78 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 48 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 67 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 76 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 85 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 87 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 65 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 72 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 55 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 82 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 86 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 61 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 89 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 89 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 60 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 77 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 89 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 75 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 73 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 79 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO producer_follows (consumer_id, producer_id, created_at)
SELECT cu.id, pr.id, DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-14 14:15:00', DATE_SUB('2026-04-14 14:15:00', INTERVAL 3 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-15 09:45:00', DATE_SUB('2026-04-15 09:45:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-siyah-zeytin'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-01 12:15:00', DATE_SUB('2026-04-01 12:15:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-portakal'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-20 12:15:00', DATE_SUB('2026-04-20 12:15:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-uzum'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-24 14:45:00', DATE_SUB('2026-04-24 14:45:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-pekmez'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-13 11:00:00', DATE_SUB('2026-04-13 11:00:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-kavun'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-01 10:30:00', DATE_SUB('2026-04-01 10:30:00', INTERVAL 2 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-gunluk-hasat-kirmizi-mercimek'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-18 10:15:00', DATE_SUB('2026-04-18 10:15:00', INTERVAL 6 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-dogal-bamya'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-15 12:30:00', DATE_SUB('2026-04-15 12:30:00', INTERVAL 2 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-01 12:15:00', DATE_SUB('2026-04-01 12:15:00', INTERVAL 6 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kirmizi-mercimek'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-06 12:30:00', DATE_SUB('2026-04-06 12:30:00', INTERVAL 4 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-sezonluk-karpuz'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-11 17:15:00', DATE_SUB('2026-04-11 17:15:00', INTERVAL 4 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-sezonluk-taze-fasulye'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-07 09:15:00', DATE_SUB('2026-04-07 09:15:00', INTERVAL 6 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-mandalina'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-04 09:15:00', DATE_SUB('2026-04-04 09:15:00', INTERVAL 8 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-cam-bali'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-21 10:30:00', DATE_SUB('2026-04-21 10:30:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-gunluk-hasat-lahana'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-10 16:15:00', DATE_SUB('2026-04-10 16:15:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-koy-tipi-kirma-yesil-zeytin'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-26 14:15:00', DATE_SUB('2026-04-26 14:15:00', INTERVAL 10 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-siyah-zeytin'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-26 18:45:00', DATE_SUB('2026-04-26 18:45:00', INTERVAL 3 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-sezonluk-nar'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-04 11:15:00', DATE_SUB('2026-04-04 11:15:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-gunluk-hasat-cicek-bali'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-07 17:45:00', DATE_SUB('2026-04-07 17:45:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-siyah-uzum'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-11 18:45:00', DATE_SUB('2026-04-11 18:45:00', INTERVAL 12 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-08 09:15:00', DATE_SUB('2026-04-08 09:15:00', INTERVAL 10 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-mandalina'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-10 11:30:00', DATE_SUB('2026-04-10 11:30:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-cam-bali'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-02 13:15:00', DATE_SUB('2026-04-02 13:15:00', INTERVAL 10 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-sezonluk-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-19 16:15:00', DATE_SUB('2026-04-19 16:15:00', INTERVAL 3 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-sezonluk-nar'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-26 16:00:00', DATE_SUB('2026-04-26 16:00:00', INTERVAL 4 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-incir'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-17 15:30:00', DATE_SUB('2026-04-17 15:30:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-ev-yapimi-salca'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-17 16:15:00', DATE_SUB('2026-04-17 16:15:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-taze-fasulye'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-23 14:45:00', DATE_SUB('2026-04-23 14:45:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-mandalina'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-16 13:45:00', DATE_SUB('2026-04-16 13:45:00', INTERVAL 12 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-kirmizi-sogan'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-26 18:00:00', DATE_SUB('2026-04-26 18:00:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-kuru-sogan'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-08 12:45:00', DATE_SUB('2026-04-08 12:45:00', INTERVAL 5 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-koy-tipi-portakal'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-13 12:30:00', DATE_SUB('2026-04-13 12:30:00', INTERVAL 8 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-roka-demeti'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-13 18:15:00', DATE_SUB('2026-04-13 18:15:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-findik-ici'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-09 17:00:00', DATE_SUB('2026-04-09 17:00:00', INTERVAL 4 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-koy-tipi-limon'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-25 10:30:00', DATE_SUB('2026-04-25 10:30:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-taze-kivircik-marul'
WHERE cu.email = 'onur.kara@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Sipariş verirsem hangi gün kargoya teslim edilir?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-17 14:15:00', DATE_SUB('2026-04-17 14:15:00', INTERVAL 11 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-mandalina'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-02 16:30:00', DATE_SUB('2026-04-02 16:30:00', INTERVAL 8 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-maydanoz-demeti'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-15 16:45:00', DATE_SUB('2026-04-15 16:45:00', INTERVAL 8 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-elma'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Bu ürün bugün hasat edilmiş olarak mı gönderiliyor?', 'Toplu alım için mesaj atarsanız teslimat gününü birlikte netleştirebiliriz.', 'answered', '2026-04-12 16:30:00', DATE_SUB('2026-04-12 16:30:00', INTERVAL 6 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-dogal-nar'
WHERE cu.email = 'derya.polat@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Uzak il gönderimlerinde strafor kutu ve koruyucu ambalaj kullanıyoruz.', 'answered', '2026-04-13 09:15:00', DATE_SUB('2026-04-13 09:15:00', INTERVAL 9 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-gunluk-hasat-cilek'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Ürün ilaç kalıntısı açısından kontrol ediliyor mu?', 'Evet, sipariş saatine göre aynı gün veya ertesi sabah hasat ederek gönderiyoruz.', 'answered', '2026-04-08 13:00:00', DATE_SUB('2026-04-08 13:00:00', INTERVAL 7 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-taze-patates'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Paketleme sırasında soğuk zincir kullanıyor musunuz?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-03 13:00:00', DATE_SUB('2026-04-03 13:00:00', INTERVAL 6 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-kuru-sogan'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT INTO product_questions (product_id, consumer_id, producer_id, question, answer, status, answered_at, created_at)
SELECT p.id, cu.id, pr.id, 'Toplu alımda aynı gün teslimat mümkün olur mu?', 'Ürünleri kendi üretim alanımızdan seçiyoruz; detaylı bilgi için bizimle iletişime geçebilirsiniz.', 'answered', '2026-04-08 10:00:00', DATE_SUB('2026-04-08 10:00:00', INTERVAL 3 HOUR)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-gezen-tavuk-yumurtasi'
WHERE cu.email = 'emre.celik@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'deniz.arslan@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'elif.sahin@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'mert.kilic@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 17 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'zeynep.acar@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'burak.demir@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'irem.yildiz@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'can.ozturk@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users u WHERE u.email = 'selin.koc@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users u WHERE u.email = 'selin.koc@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'selin.koc@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users u WHERE u.email = 'selin.koc@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'onur.kara@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users u WHERE u.email = 'onur.kara@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'onur.kara@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'onur.kara@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users u WHERE u.email = 'derya.polat@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users u WHERE u.email = 'derya.polat@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users u WHERE u.email = 'derya.polat@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users u WHERE u.email = 'derya.polat@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'order_delivered', 'Siparişin teslim edildi', 'Son siparişin teslim edildi. Ürünü değerlendirerek üreticiye destek olabilirsin.', JSON_OBJECT('source','big_demo_seed'), 0, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'emre.celik@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'campaign', 'Yakınındaki üreticiden kampanya', 'Takip ettiğin üreticilerden birinde yeni kampanya başladı.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'emre.celik@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'preorder', 'Ön sipariş fırsatı', 'Sezonluk ürünler için ön sipariş verebilirsin.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users u WHERE u.email = 'emre.celik@ekinerago.test';


INSERT INTO notifications (user_id, type, title, message, data_json, is_read, created_at)
SELECT u.id, 'basket', 'Mahalle sepeti daveti', 'Bölgen için toplu alım sepeti oluşturuldu.', JSON_OBJECT('source','big_demo_seed'), 1, DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users u WHERE u.email = 'emre.celik@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-mandalina'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cicek-bali'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-siyah-uzum'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salkim-domates'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cam-bali'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-lahana'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-mandalina'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-patlican'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-limon'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-kavun'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-koy-tipi-roka-demeti'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kirmizi-mercimek'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kirma-yesil-zeytin'
WHERE cu.email = 'deniz.arslan@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-siyah-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-pekmez'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 2 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-sivri-biber'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-kirmizi-sogan'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-findik-ici'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-cam-bali'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-taze-lahana'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-kapya-biber'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-roka-demeti'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-taze-siyah-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 15 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-portakal'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-cicek-bali'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-dut'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-uzum'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dogal-nar'
WHERE cu.email = 'elif.sahin@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-koy-tipi-bamya'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 4 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-kirmizi-mercimek'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 24 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kuru-fasulye'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kivircik-marul'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-taze-nar'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 21 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-sivri-biber'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-salatalik'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-elma'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-mandalina'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-taze-kabak'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kivircik-marul'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 8 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-kavun'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-patlican'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-incir'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safranbolu-koy-urunleri-nohut'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'seda.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-dogal-siyah-uzum'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 48 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kadikoy-mikro-bahce-elma'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'ece.kent@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-mandalina'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kocaeli-seracilik-dolmalik-biber'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'leyla.izmit@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-limon'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-kirma-yesil-zeytin'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-dogal-salkim-domates'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 9 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-kavun'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 56 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-gunluk-hasat-pekmez'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-gunluk-hasat-cilek'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-dolmalik-biber'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-dogal-roka-demeti'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-dogal-havuc'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-sezonluk-lahana'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-nar'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 31 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-ege-otlari-atolyesi-dogal-muz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'bahar.ulamis@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-karpuz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-avokado-bahcesi-maydanoz-demeti'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'dilan.akin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-siyah-zeytin'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-koy-tipi-portakal'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 38 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-taze-ispanak'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-koy-tipi-cicek-bali'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 33 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-armut'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-roka-demeti'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 44 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-kivircik-marul'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-kavun'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 13 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-sezonluk-havuc'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 1 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-findik-ici'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 10 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-bal-ve-nar-karpuz'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'gokce.ari@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 29 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-cherry-domates'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-sera-siyah-uzum'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hale.denizli@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-gunluk-hasat-lahana'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-karadeniz-sepeti-dogal-kavun'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'melike.fatsa@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 39 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 52 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-portakal'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-uzum'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 34 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-nohut'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 22 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-gunluk-hasat-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-maydanoz-demeti'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-taze-pekmez'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cam-bali'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-muz'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-cicek-bali'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-sezonluk-kabak'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-hatay-defne-bahcesi-dogal-siyah-uzum'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'selma.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 48 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-konya-ova-urunleri-roka-demeti'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'esra.ova@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 6 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-dogal-muz'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-kapya-biber'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 42 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-sezonluk-nar'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 57 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 59 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-gezen-tavuk-yumurtasi'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salatalik'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 23 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cilek'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-kapya-biber'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 54 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-armut'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 46 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-taze-taze-fasulye'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 51 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-gunluk-hasat-cam-bali'
WHERE cu.email = 'can.ozturk@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 20 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-kumluca-bereket-ciftligi-incir'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ahmet.torun@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sigacik-mandalina-bahcesi-mandalina'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'nermin.ege@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bursa-dogal-bahce-cicek-bali'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mustafa.bahcivan@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 53 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-erdemli-limon-evi-siyah-uzum'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'hasan.akdeniz@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 52 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-zeytinligi-salkim-domates'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'fatma.aydin@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 55 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fethiye-koy-sepeti-cam-bali'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ali.kayra@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-uzum-bagi-lahana'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'sevgi.bagci@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-pamukkale-organik-tarla-mandalina'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'mehmet.ozgur@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-ovasi-pazari-patlican'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ayhan.bafrali@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-fatsa-findik-ve-bal-limon'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'gulcan.yaman@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 58 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-kavun'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 40 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-samandag-narenciye-koy-tipi-roka-demeti'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'meryem.defne@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 47 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-sezonluk-zeytinyagi-1-l'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 28 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-meram-ciftci-pazari-kirmizi-mercimek'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'rabia.meram@ekinerago.test';


INSERT INTO product_views (product_id, user_id, ip_hash, user_agent, created_at)
SELECT p.id, cu.id, SHA2(CONCAT(cu.email, p.slug), 256), 'Mozilla/5.0 Demo Browser', DATE_SUB(NOW(), INTERVAL 30 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kirma-yesil-zeytin'
WHERE cu.email = 'selin.koc@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 25 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-gunes-tarlasi-koy-tipi-bamya'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'ibrahim.harran@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-sahinbey-antep-bahcesi-salkim-domates'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'kemal.antep@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 12 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harput-baglari-kivircik-marul'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'yusuf.harput@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-sivri-biber'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 37 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-elma'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 7 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-taze-kabak'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 26 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-kavun'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-incir'
WHERE cu.email = 'mert.kilic@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 3 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-adana-bereket-tarlasi-dogal-siyah-uzum'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'cem.yuregir@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 16 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-cankaya-toprak-kooperatifi-mandalina'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'tuna.kaya@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 11 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-gunluk-hasat-limon'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 18 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-dogal-salkim-domates'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 41 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-gunluk-hasat-pekmez'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 35 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-dolmalik-biber'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 19 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-dogal-havuc'
WHERE cu.email = 'zeynep.acar@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 43 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-narenciye-akdeniz-nar'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'okan.limoncu@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 5 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-nilufer-yumurta-ciftligi-taze-karpuz'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'suleyman.ova@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 45 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-efeler-incir-konagi-siyah-zeytin'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'huseyin.incirci@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 47 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-taze-ispanak'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 47 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-armut'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 14 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-harran-bakliyat-kivircik-marul'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'halil.bakliyat@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 32 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-gaziantep-kurutmalik-sezonluk-gezen-tavuk-yumurtasi'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'nihat.kurut@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 27 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-safran-dogal-pazar-findik-ici'
WHERE cu.email = 'burak.demir@ekinerago.test' AND pr.email = 'murat.safran@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 49 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-alasehir-dogal-uzum-cherry-domates'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'osman.bag@ekinerago.test';


INSERT IGNORE INTO restock_alerts (user_id, product_id, status, created_at)
SELECT cu.id, p.id, 'waiting', DATE_SUB(NOW(), INTERVAL 36 DAY)
FROM users cu JOIN users pr JOIN products p ON p.producer_id = pr.id AND p.slug = 'bd-bafra-kirmizi-sogan-gunluk-hasat-lahana'
WHERE cu.email = 'irem.yildiz@ekinerago.test' AND pr.email = 'turgut.ova@ekinerago.test';


/* Yorum/favori/görüntüleme özetlerini hesapla. */
UPDATE products p
LEFT JOIN (SELECT product_id, AVG(rating) avg_rating, COUNT(*) rating_count FROM reviews WHERE status='visible' GROUP BY product_id) r ON r.product_id = p.id
LEFT JOIN (SELECT product_id, COUNT(*) favorite_count FROM favorites GROUP BY product_id) f ON f.product_id = p.id
LEFT JOIN (SELECT product_id, COUNT(*) view_count FROM product_views GROUP BY product_id) v ON v.product_id = p.id
SET p.average_rating = COALESCE(r.avg_rating, 0.00),
    p.rating_count = COALESCE(r.rating_count, 0),
    p.favorite_count = COALESCE(f.favorite_count, 0),
    p.view_count = GREATEST(p.view_count, COALESCE(v.view_count, 0));

UPDATE producer_profiles pp
LEFT JOIN (SELECT producer_id, AVG(rating) avg_rating, COUNT(*) rating_count FROM reviews WHERE status='visible' GROUP BY producer_id) r ON r.producer_id = pp.user_id
LEFT JOIN (SELECT producer_id, COUNT(*) total_orders, SUM(total_amount) total_sales FROM orders WHERE payment_status='paid' AND order_status='delivered' GROUP BY producer_id) o ON o.producer_id = pp.user_id
SET pp.average_rating = COALESCE(r.avg_rating, 0.00),
    pp.rating_count = COALESCE(r.rating_count, 0),
    pp.total_orders = COALESCE(o.total_orders, 0),
    pp.total_sales_amount = COALESCE(o.total_sales, 0.00);
