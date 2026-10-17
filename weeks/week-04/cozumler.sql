-- =====================================================================
-- Hafta 4 laboratuvar çözümleri — SELECT ve WHERE
-- BLP 105 / BLP 1005 Veritabanı Yönetim Sistemleri
--
-- Bu dosya lab sonrasında yayımlanır. Önce kendin dene.
-- Farklı yazılmış doğru çözümler de kabul edilir.
--
-- Çalıştırmak için:
--   psql -d robot_fleet -f cozumler.sql     (R ile başlayan sorgular)
--   psql -d llm_ops     -f cozumler.sql     (Y ile başlayan sorgular)
-- Her iki veritabanında da çalıştırırsan, diğerinin sorguları
-- "relation does not exist" hatası verir, bu normaldir.
-- =====================================================================

-- Tarih ve saatlerin ders slaytlarıyla aynı görünmesi için:
SET timezone = 'Europe/Istanbul';

-- ############ ISINMA (1-5) ############

-- 1R. Bütün robotların adı ve modeli.                        [10 satır]
SELECT name, model FROM robots;

-- 1Y. Bütün çağrıların id'si ve model adı.                   [12 satır]
SELECT id, model_name FROM llm_calls;

-- 2R. Robot adı "robot" başlığıyla, eksik şarj "missing" başlığıyla.
SELECT name AS robot, 100 - battery_level AS missing FROM robots;
-- Not: Kartal-04'ün bataryası boş olduğu için sonucu da boş çıkar.
-- Bunun sebebini Hafta 5'te konuşacağız.

-- 2Y. Model adı "model", toplam token "total_tokens" başlığıyla.
SELECT model_name AS model,
       prompt_tokens + completion_tokens AS total_tokens
FROM llm_calls;

-- 3R. Bataryası 50'nin üstündeki robotlar.                   [4 satır]
SELECT name, battery_level FROM robots WHERE battery_level > 50;

-- 3Y. Gecikmesi 2 saniyeyi aşan çağrılar.                    [5 satır]
SELECT id, model_name, latency_ms FROM llm_calls WHERE latency_ms > 2000;
-- 2 saniye = 2000 ms. Birim dönüşümünü unutma.

-- 4R. Bakımdaki robotlar.                                    [1 satır]
SELECT name, zone FROM robots WHERE status = 'maintenance';

-- 4Y. Ece'nin yaptığı çağrılar.                              [3 satır]
SELECT id, model_name, task_type FROM llm_calls WHERE user_name = 'Ece';

-- 5R. Görevde OLMAYAN robotlar.                              [4 satır]
SELECT name, status FROM robots WHERE status <> 'active';

-- 5Y. Sohbet (chat) DIŞINDAKİ çağrılar.                      [9 satır]
SELECT id, task_type FROM llm_calls WHERE task_type <> 'chat';

-- ############ ORTA (6-10) ############

-- 6R. AMR-300 modelinde olup bataryası 40'ın üstündeki robotlar. [2 satır]
SELECT name, battery_level FROM robots
WHERE model = 'AMR-300' AND battery_level > 40;

-- 6Y. Anthropic modeli (claude ile başlayan) olup 1 saniyeden
--     yavaş olan çağrılar.                                   [2 satır]
SELECT id, model_name, latency_ms FROM llm_calls
WHERE model_name LIKE 'claude%' AND latency_ms > 1000;

-- 7R. Şarjda VEYA bakımda olan, bataryası 50'nin altındaki robotlar.
--     Parantez tuzağına dikkat.                              [1 satır]
SELECT name, status, battery_level FROM robots
WHERE (status = 'charging' OR status = 'maintenance')
  AND battery_level < 50;
-- Parantezsiz yazarsan AND önce çalışır ve Kartal-02 (bakımda, %64)
-- de listeye girer. Sonuç 2 satır olur ve yanlıştır.

-- 7Y. Kod VEYA çeviri işi olan, maliyeti 0.01 doları aşan çağrılar. [3 satır]
SELECT id, task_type, cost_usd FROM llm_calls
WHERE (task_type = 'code' OR task_type = 'translate')
  AND cost_usd > 0.01;

-- 8R. Bataryası 15 ile 50 arasındaki robotlar (uçlar dahil). [3 satır]
SELECT name, battery_level FROM robots
WHERE battery_level BETWEEN 15 AND 50;

-- 8Y. Gecikmesi 500 ile 1500 ms arasındaki çağrılar.         [3 satır]
SELECT id, model_name, latency_ms FROM llm_calls
WHERE latency_ms BETWEEN 500 AND 1500;

-- 9R. Depo A veya Depo B'de OLMAYAN robotlar.                [5 satır]
SELECT name, zone FROM robots WHERE zone NOT IN ('Depo A', 'Depo B');
-- Dikkat: Mars-03'ün bölgesi boş ve bu sorguda GELMEZ.
-- Sebebi Hafta 5'in konusu.

-- 9Y. gpt ailesine yapılan çağrılar (IN ile).                [4 satır]
SELECT id, model_name FROM llm_calls
WHERE model_name IN ('gpt-4o', 'gpt-4o-mini');

-- 10R. Adı "kartal" ile başlayan robotlar, büyük/küçük harf
--      fark etmeksizin.                                      [4 satır]
SELECT name, status FROM robots WHERE name ILIKE 'kartal%';
-- LIKE 'kartal%' yazsaydın 0 satır dönerdi: LIKE harf duyarlıdır.

-- 10Y. Model adında "mini" geçen çağrılar.                   [3 satır]
SELECT id, model_name FROM llm_calls WHERE model_name LIKE '%mini%';
-- Sürpriz: sonuç 1 değil 3 satır.
--   gpt-4o-mini   <- beklediğin
--   gemini-flash  <- "ge-MINI-flash"
--   gemini-pro    <- "ge-MINI-pro"
-- '%mini%' kalıbı "mini" harflerini kelimenin HER YERİNDE arar,
-- başka bir kelimenin ortasında olsa bile. Gerçek hayatta bu
-- tür eşleşmeler raporlara sessizce yanlış satır sokar.
-- Sadece sonda arıyorsan '%mini' yaz, o zaman 1 satır döner.

-- ############ ZOR (11-15) ############

-- 11R. Önce modele (A-Z), model içinde bataryaya (yüksekten
--      düşüğe) göre sırala.                                  [10 satır]
SELECT model, name, battery_level FROM robots
ORDER BY model ASC, battery_level DESC;
-- Kartal-04'ün bataryası boş; PostgreSQL boş değerleri DESC
-- sıralamada en başa koyar. Bunu değiştirmek için NULLS LAST
-- yazılır, Hafta 5'te göreceğiz.

-- 11Y. Önce kullanıcıya, kullanıcı içinde maliyete göre
--      (pahalıdan ucuza) sırala.                             [12 satır]
SELECT user_name, id, cost_usd FROM llm_calls
ORDER BY user_name ASC, cost_usd DESC;

-- 12R. En dolu 3 robot.                                      [3 satır]
SELECT name, battery_level FROM robots
ORDER BY battery_level DESC NULLS LAST
LIMIT 3;
-- NULLS LAST olmasaydı boş bataryalı Kartal-04 en başa gelirdi.

-- 12Y. En pahalı 3 çağrı.                                    [3 satır]
SELECT id, model_name, cost_usd FROM llm_calls
ORDER BY cost_usd DESC NULLS LAST
LIMIT 3;

-- 13R. Filoda kaç farklı bölge var? (liste olarak)           [6 satır]
SELECT DISTINCT zone FROM robots ORDER BY zone;
-- Boş bölge de ayrı bir satır olarak gelir.

-- 13Y. Hangi iş türleri var?                                 [5 satır]
SELECT DISTINCT task_type FROM llm_calls ORDER BY task_type;

-- 14R. Operatör adlarını doğru Türkçe alfabe sırasıyla listele. [9 satır]
SELECT operator_name FROM robots
WHERE operator_name IS NOT NULL
ORDER BY operator_name COLLATE "tr-TR-x-icu";
-- COLLATE yazmazsan Çağla, İsmail ve Şule sona düşebilir.
-- "tr-TR-x-icu" çift tırnak içinde, çünkü bu bir değer değil, bir isim.
-- Burada DISTINCT'e gerek yok: her robotun operatörü farklı.

-- 14Y. Kullanıcı adlarını doğru Türkçe sırayla listele.      [5 satır]
-- Burada DISTINCT gerekiyor, çünkü Ece üç çağrı yapmış.
SELECT DISTINCT user_name COLLATE "tr-TR-x-icu" AS user_name
FROM llm_calls
WHERE user_name IS NOT NULL
ORDER BY 1;
-- DİKKAT: "SELECT DISTINCT ... ORDER BY sutun COLLATE ..." yazarsan
-- şu hatayı alırsın:
--   ERROR: for SELECT DISTINCT, ORDER BY expressions must appear
--          in select list
-- Sebebi: DISTINCT önce tekrarları atar, sonra sıralama yapılır;
-- sıralama ifadesi seçilen sütunlar arasında olmak zorundadır.
-- Çözüm: COLLATE'i SELECT tarafına taşı ve ORDER BY 1 yaz
-- (1 = birinci sütun demektir).

-- 15R. "Dış Alan veya Depo B'deki, görevdeki robotların adını,
--       bölgesini ve bataryasını, en düşük bataryadan başlayarak
--       listele."                                            [4 satır]
SELECT name, zone, battery_level FROM robots
WHERE zone IN ('Dış Alan', 'Depo B')
  AND status = 'active'
ORDER BY battery_level;
-- Dört adım: 1) FROM robots  2) SELECT name, zone, battery_level
-- 3) WHERE iki koşul  4) ORDER BY battery_level

-- 15Y. "14 Ekim'den sonra yapılan, 1 saniyeden yavaş çağrıların
--       id'sini, modelini ve gecikmesini, en yavaştan başlayarak
--       listele."                                            [5 satır]
SELECT id, model_name, latency_ms, created_at FROM llm_calls
WHERE created_at >= '2026-10-15'
  AND latency_ms > 1000
ORDER BY latency_ms DESC;
-- "14 Ekim'den sonra" = 15 Ekim 00:00'dan itibaren.
-- Tarih sınırlarında bu yorum farkı çok sık hataya yol açar,
-- emin değilsen sor.
