-- =====================================================================
-- Hafta 5 laboratuvar çözümleri — Gruplama ve NULL
-- BLP 105 / BLP 1005 Veritabanı Yönetim Sistemleri
--
-- Bu dosya lab sonrasında yayımlanır. Önce kendin dene.
-- Farklı yazılmış doğru çözümler de kabul edilir.
--
-- Çalıştırmak için:
--   psql -d robot_fleet -f cozumler.sql     (R ile başlayan sorgular)
--   psql -d llm_ops     -f cozumler.sql     (Y ile başlayan sorgular)
-- Diğer veritabanının sorguları "relation does not exist" hatası
-- verir, bu normaldir.
-- =====================================================================

SET timezone = 'Europe/Istanbul';

-- ############ ISINMA (1-5) ############

-- 1R. Filoda kaç robot var?                                      [10]
SELECT count(*) AS robot_sayisi FROM robots;

-- 1Y. Kaç çağrı kaydedilmiş?                                     [12]
SELECT count(*) AS cagri_sayisi FROM llm_calls;

-- 2R. Kaç robot görevde?                                          [6]
SELECT count(*) AS aktif FROM robots WHERE status = 'active';

-- 2Y. Kaç çağrı 2 saniyeden yavaş?                                [5]
SELECT count(*) AS yavas FROM llm_calls WHERE latency_ms > 2000;

-- 3R. Bütün bataryaların toplamı.                                [381]
SELECT sum(battery_level) AS toplam_batarya FROM robots;

-- 3Y. Toplam maliyet ve toplam token.            [0.0631 | 14340]
SELECT sum(cost_usd) AS toplam_maliyet,
       sum(prompt_tokens + completion_tokens) AS toplam_token
FROM llm_calls;

-- 4R. Ortalama batarya, bir ondalık basamak.                   [42.3]
SELECT round(avg(battery_level), 1) AS ort_batarya FROM robots;

-- 4Y. Ortalama gecikme, bir ondalık basamak.                 [1848.3]
SELECT round(avg(latency_ms), 1) AS ort_gecikme FROM llm_calls;

-- 5R. En düşük ve en yüksek batarya.                         [0 | 91]
SELECT min(battery_level) AS en_dusuk, max(battery_level) AS en_yuksek
FROM robots;

-- 5Y. En hızlı ve en yavaş çağrı.                        [380 | 4100]
SELECT min(latency_ms) AS en_hizli, max(latency_ms) AS en_yavas
FROM llm_calls;

-- ############ ORTA (6-10) ############

-- 6R. Her durumda (status) kaç robot var?                   [4 satır]
SELECT status, count(*) AS adet
FROM robots
GROUP BY status
ORDER BY adet DESC, status;

-- 6Y. Her iş türünde (task_type) kaç çağrı var?             [5 satır]
SELECT task_type, count(*) AS adet
FROM llm_calls
GROUP BY task_type
ORDER BY adet DESC, task_type;

-- 7R. Her model için robot sayısı ve ortalama batarya.      [3 satır]
SELECT model,
       count(*) AS adet,
       round(avg(battery_level), 1) AS ort_batarya
FROM robots
GROUP BY model
ORDER BY model;

-- 7Y. Her model için çağrı sayısı ve toplam maliyet,
--     pahalıdan ucuza.                                      [7 satır]
SELECT model_name,
       count(*) AS cagri,
       sum(cost_usd) AS toplam_maliyet
FROM llm_calls
GROUP BY model_name
ORDER BY toplam_maliyet DESC NULLS LAST;

-- 8R. Her bölgede, her durumdan kaç robot var?              [7 satır]
SELECT zone, status, count(*) AS adet
FROM robots
GROUP BY zone, status
ORDER BY zone NULLS LAST, status;
-- Bölgesi boş olan robot da kendi grubunu oluşturur:
-- GROUP BY, NULL'ı atmaz, ayrı bir grup sayar.

-- 8Y. Her kullanıcının her iş türünden kaç çağrısı var?    [12 satır]
SELECT user_name, task_type, count(*) AS adet
FROM llm_calls
GROUP BY user_name, task_type
ORDER BY user_name NULLS LAST, task_type;

-- 9R. Birden fazla robotu olan modeller.                    [3 satır]
SELECT model, count(*) AS adet
FROM robots
GROUP BY model
HAVING count(*) > 1
ORDER BY adet DESC, model;

-- 9Y. İkiden fazla çağrı almış modeller.                    [1 satır]
SELECT model_name, count(*) AS cagri
FROM llm_calls
GROUP BY model_name
HAVING count(*) > 2;
-- "İkiden fazla" = üç ve üstü, yani > 2.
-- >= 2 yazsaydın 4 satır gelirdi.

-- 10R. Sadece görevdeki robotları hesaba kat; en az 2 robotu
--      olan modelleri, ortalama bataryasıyla göster.        [2 satır]
SELECT model,
       count(*) AS adet,
       round(avg(battery_level), 1) AS ort_batarya
FROM robots
WHERE status = 'active'
GROUP BY model
HAVING count(*) >= 2
ORDER BY ort_batarya DESC;
-- WHERE gruplamadan ÖNCE satırları eler,
-- HAVING gruplamadan SONRA grupları eler.

-- 10Y. Sadece 500 ms'den yavaş çağrıları hesaba kat; en az 2
--      çağrısı olan modelleri ortalama gecikmesiyle göster.  [3 satır]
SELECT model_name,
       count(*) AS cagri,
       round(avg(latency_ms)) AS ort_gecikme
FROM llm_calls
WHERE latency_ms > 500
GROUP BY model_name
HAVING count(*) >= 2
ORDER BY ort_gecikme DESC;

-- ############ ZOR (11-15) ############

-- 11R. NULL avı: hangi sütunda kaç eksik veri var?
SELECT count(*)                      AS satir_sayisi,
       count(battery_level)          AS batarya_dolu,
       count(zone)                   AS bolge_dolu,
       count(operator_name)          AS operator_dolu,
       count(*) - count(zone)        AS bolge_eksik
FROM robots;
--> 10 | 9 | 9 | 9 | 1
-- count(*) ile count(sutun) farkı doğrudan eksik veri sayısını verir.

-- 11Y. NULL avı.
SELECT count(*)                       AS satir_sayisi,
       count(cost_usd)                AS maliyet_dolu,
       count(user_name)               AS kullanici_dolu,
       count(*) - count(cost_usd)     AS maliyet_eksik
FROM llm_calls;
--> 12 | 11 | 11 | 1

-- 12R. Bilgisi eksik olan robotları listele.                 [2 satır]
SELECT id, name, battery_level, zone, operator_name
FROM robots
WHERE battery_level IS NULL
   OR zone IS NULL
   OR operator_name IS NULL;
-- "= NULL" yazsaydın 0 satır dönerdi ve hata da almazdın.
-- NULL hiçbir şeye eşit değildir, kendine bile.

-- 12Y. Faturası gelmemiş çağrılar.                           [1 satır]
SELECT id, model_name, user_name, created_at
FROM llm_calls
WHERE cost_usd IS NULL;

-- 13R. Ortalamayı iki şekilde hesapla ve farkı göster.
SELECT round(avg(battery_level), 1)              AS bosu_atlayarak,
       round(avg(coalesce(battery_level, 0)), 1) AS bosu_sifir_sayarak
FROM robots;
--> 42.3 | 38.1
-- AVG boş hücreyi hiç saymaz: 381/9 = 42.3
-- COALESCE ile sıfır saydırınca: 381/10 = 38.1
-- İkisi de doğru olabilir; hangisini istediğine SEN karar verirsin
-- ve raporda hangisini seçtiğini yazarsın.

-- 13Y. Boş alanları okunur hale getir.                      [12 satır]
SELECT id,
       coalesce(user_name, 'anonim')  AS kullanici,
       coalesce(cost_usd, 0)          AS maliyet
FROM llm_calls
ORDER BY id;
-- COALESCE tabloyu değiştirmez, sadece görüntüyü değiştirir.

-- 14R. Operatörleri işe giriş yılına göre say.               [4 satır]
SELECT extract(year FROM hired_at) AS yil, count(*) AS operator_sayisi
FROM operators
GROUP BY yil
ORDER BY yil;
--> 2023:1, 2024:3, 2025:4, 2026:2
-- Bu sorgu operators tablosunu kullanır; robots'a hiç bakmaz.
-- Hafta 6'da iki tabloyu birleştirmeyi öğreneceğiz.

-- 14Y. Günlük kullanım raporu: gün, çağrı sayısı, maliyet.   [6 satır]
SELECT date_trunc('day', created_at)::date AS gun,
       count(*)      AS cagri,
       sum(cost_usd) AS maliyet
FROM llm_calls
GROUP BY gun
ORDER BY gun;
-- 16 Ekim'de 5 çağrı var ama maliyet düşük: biri henüz
-- faturalanmamış ve SUM onu saymıyor.

-- 15R. Bataryaya göre kendi kategorini yarat ve say.         [4 satır]
SELECT CASE
         WHEN battery_level IS NULL THEN 'Bilinmiyor'
         WHEN battery_level < 20    THEN 'Kritik'
         WHEN battery_level < 60    THEN 'Düşük'
         ELSE                            'Normal'
       END AS durum,
       count(*) AS adet
FROM robots
GROUP BY durum
ORDER BY adet DESC, durum;
-- NULL kontrolü EN BAŞTA olmalı. Sona koysaydın, NULL < 20 ve
-- NULL < 60 "bilinmiyor" döner, hiçbiri tutmaz ve ELSE çalışırdı:
-- sensörü bozuk robota "Normal" derdik.

-- 15Y. Gecikmeye göre hız kategorisi.                        [3 satır]
SELECT CASE
         WHEN latency_ms < 1000 THEN 'Hızlı'
         WHEN latency_ms < 2500 THEN 'Orta'
         ELSE                        'Yavaş'
       END AS hiz,
       count(*) AS cagri,
       round(avg(latency_ms)) AS ort_gecikme
FROM llm_calls
GROUP BY hiz
ORDER BY ort_gecikme;
