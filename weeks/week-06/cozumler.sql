-- =====================================================================
-- Hafta 6 laboratuvar çözümleri — JOIN
-- BLP 105 / BLP 1005 Veritabanı Yönetim Sistemleri
--
-- Bu dosya lab sonrasında yayımlanır. Önce kendin dene.
-- Farklı yazılmış doğru çözümler de kabul edilir.
--
--   psql -d robot_fleet -f cozumler.sql     (R sorguları)
--   psql -d llm_ops     -f cozumler.sql     (Y sorguları)
-- Diğer veritabanının sorguları "relation does not exist" verir, normaldir.
-- =====================================================================

SET timezone = 'Europe/Istanbul';

-- ############ ISINMA (1-5) ############

-- 1R. Her robotun adı, bölgesi ve operatörünün telefonu.          [9]
SELECT r.name, r.zone, o.phone
FROM robots r
JOIN operators o ON r.operator_name = o.operator_name
ORDER BY r.id;
-- 10 robot var ama 9 satır döndü: Mars-03'ün operatörü atanmamış.

-- 1Y. Her çağrının id'si, modeli ve sağlayıcısı.                 [11]
SELECT c.id, c.model_name, mc.provider
FROM llm_calls c
JOIN model_catalog mc ON c.model_name = mc.model_name
ORDER BY c.id;
-- 12 çağrı var ama 11 satır: gemini-pro katalogda yok.

-- 2R. Gece vardiyasındaki operatörlerin robotları.                [4]
SELECT o.operator_name, o.shift, r.name AS robot
FROM operators o
JOIN robots r ON o.operator_name = r.operator_name
WHERE o.shift = 'gece'
ORDER BY r.id;
-- ON birleştirmeyi, WHERE filtrelemeyi yapar. İkisi farklı iştir.

-- 2Y. Anthropic modellerine yapılan çağrılar.                     [4]
SELECT c.id, c.model_name, c.latency_ms
FROM llm_calls c
JOIN model_catalog mc ON c.model_name = mc.model_name
WHERE mc.provider = 'Anthropic'
ORDER BY c.id;

-- 3R. Bütün görevler, robot adıyla birlikte.                     [14]
SELECT r.name AS robot, m.mission_type, m.status, m.duration_min
FROM robots r
JOIN missions m ON r.id = m.robot_id
ORDER BY r.id, m.id;
-- Atlas-01 üç kere görünür: üç görevi var. Bu hata değil.

-- 3Y. Bütün çağrılar, modelin 1000 token fiyatıyla birlikte.     [11]
SELECT c.id, c.model_name, c.cost_usd, mc.price_per_1k_usd
FROM llm_calls c
JOIN model_catalog mc ON c.model_name = mc.model_name
ORDER BY c.id;

-- 4R. BÜTÜN robotlar, operatör telefonu varsa yanında.           [10]
SELECT r.name, r.operator_name, o.phone
FROM robots r
LEFT JOIN operators o ON r.operator_name = o.operator_name
ORDER BY r.id;
-- Mars-03 de listede, telefon sütunu boş.

-- 4Y. BÜTÜN çağrılar, sağlayıcı varsa yanında.                   [12]
SELECT c.id, c.model_name, mc.provider
FROM llm_calls c
LEFT JOIN model_catalog mc ON c.model_name = mc.model_name
ORDER BY c.id;

-- 5R. INNER ve LEFT satır sayısını karşılaştır.             [9 ve 10]
SELECT count(*) AS inner_join FROM robots r
  JOIN operators o ON r.operator_name = o.operator_name;
SELECT count(*) AS left_join FROM robots r
  LEFT JOIN operators o ON r.operator_name = o.operator_name;
-- Fark 1: INNER JOIN eşleşmeyeni sessizce düşürür.

-- 5Y. Aynı karşılaştırma.                                  [11 ve 12]
SELECT count(*) AS inner_join FROM llm_calls c
  JOIN model_catalog mc ON c.model_name = mc.model_name;
SELECT count(*) AS left_join FROM llm_calls c
  LEFT JOIN model_catalog mc ON c.model_name = mc.model_name;

-- ############ ORTA (6-10) ############

-- 6R. Operatörü atanmamış robotlar.                               [1]
SELECT r.id, r.name, r.status
FROM robots r
LEFT JOIN operators o ON r.operator_name = o.operator_name
WHERE o.operator_name IS NULL;
-- Desen: LEFT JOIN + WHERE sag_tablo.anahtar IS NULL

-- 6Y. Katalogda olmayan modellere yapılan çağrılar.               [1]
SELECT c.id, c.model_name, c.cost_usd
FROM llm_calls c
LEFT JOIN model_catalog mc ON c.model_name = mc.model_name
WHERE mc.model_name IS NULL;
-- gemini-pro. Raporu INNER JOIN ile yazsaydın bu maliyet kaybolurdu.

-- 7R. Hiç robotu olmayan operatörler.                             [1]
SELECT o.operator_name, o.shift, o.hired_at
FROM operators o
LEFT JOIN robots r ON o.operator_name = r.operator_name
WHERE r.id IS NULL;
-- Aynı desen, sol tablo değişti: soru tersine döndü.

-- 7Y. Hiç çağrılmamış modeller.                                   [1]
SELECT mc.model_name, mc.provider, mc.price_per_1k_usd
FROM model_catalog mc
LEFT JOIN llm_calls c ON mc.model_name = c.model_name
WHERE c.id IS NULL;

-- 8R. Hiç görev almamış robotlar.                                 [4]
SELECT r.id, r.name, r.status
FROM robots r
LEFT JOIN missions m ON r.id = m.robot_id
WHERE m.id IS NULL
ORDER BY r.id;

-- 8Y. Her modelin çağrı sayısı, hiç çağrılmayanlar dahil.         [7]
SELECT mc.model_name, count(c.id) AS cagri
FROM model_catalog mc
LEFT JOIN llm_calls c ON mc.model_name = c.model_name
GROUP BY mc.model_name
ORDER BY cagri DESC, mc.model_name;
-- mistral-large 0 görünür. count(*) yazsaydın 1 görünürdü.

-- 9R. Robot başına görev sayısı, hiç görevi olmayanlar dahil.    [10]
SELECT r.name, count(m.id) AS gorev_sayisi
FROM robots r
LEFT JOIN missions m ON r.id = m.robot_id
GROUP BY r.name
ORDER BY gorev_sayisi DESC, r.name;

-- 9Y. Sağlayıcı başına çağrı ve toplam maliyet.                   [4]
SELECT mc.provider, count(*) AS cagri, sum(c.cost_usd) AS maliyet
FROM llm_calls c
JOIN model_catalog mc ON c.model_name = mc.model_name
GROUP BY mc.provider
ORDER BY cagri DESC, mc.provider;

-- 10R. count(*) ile count(sutun) farkını göster.                 [10]
SELECT r.name,
       count(*)    AS yanlis_count_yildiz,
       count(m.id) AS dogru_count_sutun
FROM robots r
LEFT JOIN missions m ON r.id = m.robot_id
GROUP BY r.name
ORDER BY r.name;
-- Hiç görevi olmayan robotlarda count(*) 1, count(m.id) 0 verir.
-- LEFT JOIN o robotu bir satır olarak koruyor ama görev yok.
-- KURAL: LEFT JOIN sonrası her zaman sağ tablodan bir sütunu say.

-- 10Y. Aynı farkı katalog üzerinden göster.                       [7]
SELECT mc.model_name,
       count(*)   AS yanlis_count_yildiz,
       count(c.id) AS dogru_count_sutun
FROM model_catalog mc
LEFT JOIN llm_calls c ON mc.model_name = c.model_name
GROUP BY mc.model_name
ORDER BY mc.model_name;

-- ############ ZOR (11-15) ############

-- 11R. FAN-OUT. Görevi olan robotların toplam bataryası.
SELECT sum(r.battery_level) AS sisirilmis_toplam
FROM robots r JOIN missions m ON r.id = m.robot_id;
--> 700  (YANLIŞ)

SELECT sum(battery_level) AS dogru_toplam
FROM robots
WHERE id IN (SELECT DISTINCT robot_id FROM missions);
--> 262  (DOĞRU)

-- Neden? Her robotun bataryası, görev sayısı kadar tekrar toplandı:
SELECT r.name, r.battery_level, count(*) AS kac_kere
FROM robots r JOIN missions m ON r.id = m.robot_id
GROUP BY r.name, r.battery_level ORDER BY r.name;
-- 82x3 + 15x1 + 18x3 + 91x3 + 47x2 + 9x2 = 700
-- Doğrusu:  82 + 15 + 18 + 91 + 47 + 9   = 262
-- KURAL: JOIN'den sonra sum() görürsen iki kere düşün.

-- 11Y. FAN-OUT. Çağrılan modellerin liste fiyatları toplamı.
SELECT sum(mc.price_per_1k_usd) AS sisirilmis_toplam
FROM model_catalog mc JOIN llm_calls c ON mc.model_name = c.model_name;
--> 0.05095  (YANLIŞ) her modelin fiyatı, çağrı sayısı kadar toplandı

SELECT sum(price_per_1k_usd) AS dogru_toplam
FROM model_catalog
WHERE model_name IN (SELECT DISTINCT model_name FROM llm_calls);
--> 0.02095  (DOĞRU) her model bir kere sayıldı

-- Fark iki buçuk kat. gpt-4o üç kere çağrıldığı için fiyatı üç kere,
-- claude-sonnet iki kere çağrıldığı için iki kere toplandı.

-- 12R. Aynı vardiyada çalışan operatör çiftleri (gece).           [6]
SELECT o1.operator_name AS operator_1,
       o2.operator_name AS operator_2,
       o1.shift
FROM operators o1
JOIN operators o2
  ON o1.shift = o2.shift
 AND o1.operator_name < o2.operator_name
WHERE o1.shift = 'gece'
ORDER BY o1.operator_name, o2.operator_name;
-- "<" koşulu iki işi birden yapar: kendisiyle eşleşmeyi engeller
-- ve her çiftin iki kere çıkmasını önler (Can-Emre ve Emre-Can).

-- 12Y. Aynı sağlayıcının model çiftleri.                          [2]
SELECT m1.model_name AS model_1, m2.model_name AS model_2, m1.provider
FROM model_catalog m1
JOIN model_catalog m2
  ON m1.provider = m2.provider
 AND m1.model_name < m2.model_name
ORDER BY m1.provider;

-- 13R. Üç tablo: operatör, robotu ve görev sayısı.               [10]
SELECT o.operator_name, r.name AS robot, count(m.id) AS gorev
FROM operators o
LEFT JOIN robots r   ON o.operator_name = r.operator_name
LEFT JOIN missions m ON r.id = m.robot_id
GROUP BY o.operator_name, r.name
ORDER BY gorev DESC, o.operator_name;
-- Kerem robotu olmadığı halde listede: iki LEFT JOIN zinciri onu koruyor.
-- Zincirde bir INNER JOIN kullansaydın Kerem kaybolurdu.

-- 13Y. Kullanıcı ve sağlayıcı kırılımında çağrı sayısı.          [11]
SELECT c.user_name,
       coalesce(mc.provider, 'Katalogda yok') AS saglayici,
       count(*) AS cagri
FROM llm_calls c
LEFT JOIN model_catalog mc ON c.model_name = mc.model_name
GROUP BY c.user_name, saglayici
ORDER BY c.user_name NULLS LAST, saglayici;

-- 14R. Boş değerleri okunur etiketle.                            [10]
SELECT r.name,
       coalesce(r.operator_name, 'Atanmamış')   AS operator,
       coalesce(o.phone, 'Telefon yok')         AS telefon,
       coalesce(o.shift, '-')                   AS vardiya
FROM robots r
LEFT JOIN operators o ON r.operator_name = o.operator_name
ORDER BY r.id;
-- LEFT JOIN eksiği getirir, COALESCE onu görünür yapar.
-- Eksiği gizlemek değil, etiketlemek istiyoruz.

-- 14Y. Sağlayıcı dağılımı, katalogda olmayanlar dahil.            [5]
SELECT coalesce(mc.provider, 'Katalogda yok') AS saglayici,
       count(*) AS cagri
FROM llm_calls c
LEFT JOIN model_catalog mc ON c.model_name = mc.model_name
GROUP BY saglayici
ORDER BY cagri DESC, saglayici;
-- Toplam 12: INNER JOIN ile yazsaydın 11 olurdu ve bir çağrı kaybolurdu.

-- 15R. "Gece vardiyasındaki operatörlerin robotlarının tamamlanmış
--       görevleri, robot adı ve görev türüyle, en uzun süreden
--       başlayarak."                                              [3]
SELECT r.name AS robot, o.operator_name, m.mission_type, m.duration_min
FROM operators o
JOIN robots r   ON o.operator_name = r.operator_name
JOIN missions m ON r.id = m.robot_id
WHERE o.shift = 'gece'
  AND m.status = 'completed'
ORDER BY m.duration_min DESC;
-- Beş adım: 1) üç tablo  2) iki ON koşulu  3) INNER (eksikler
-- ilgilendirmiyor)  4) dört sütun  5) iki WHERE koşulu + sıralama

-- 15Y. "Her sağlayıcının toplam maliyeti ve ortalama gecikmesi,
--       katalogda olmayan çağrılar da ayrı satır olarak."         [5]
SELECT coalesce(mc.provider, 'Katalogda yok') AS saglayici,
       count(*)                 AS cagri,
       sum(c.cost_usd)          AS toplam_maliyet,
       round(avg(c.latency_ms)) AS ort_gecikme
FROM llm_calls c
LEFT JOIN model_catalog mc ON c.model_name = mc.model_name
GROUP BY saglayici
ORDER BY toplam_maliyet DESC NULLS LAST;
