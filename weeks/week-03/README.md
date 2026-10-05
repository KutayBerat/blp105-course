# Hafta 3: Veritabanı temel kavramları ve mimari

Durum: Yayında

## Bu hafta ne işliyoruz

- Dosya tabanlı sistemlerin sorunları: veri tekrarı, tutarsızlık, eşzamanlı erişim, güvenlik
- İlişkisel model: tablo, satır, sütun, şema
- SQL'in alt dilleri: DQL, DDL, DML, DCL, TCL
- İstemci-sunucu mimarisi ve küme, veritabanı, şema, tablo hiyerarşisi
- Yapay zeka sistemlerinde veritabanının yeri: LLM loglama, robotik telemetri

## Hafta sonunda yapabileceklerin

- Excel/Sheets ile bir veritabanı arasındaki temel farkları örnekle açıklayabilirsin
- Hafta 2'de `for` ve `if` ile yazdığın döngünün SQL'de neden tek satıra indiğini gösterebilirsin
- Küme, veritabanı, şema, tablo hiyerarşisini sırayla sayabilirsin
- Kendi proje reponu açıp ilk commit'ini atabilirsin

## Anahtar terimler

| English | Türkçe |
|---|---|
| relational model | ilişkisel model |
| schema | şema |
| client-server architecture | istemci-sunucu mimarisi |
| query | sorgu |

## Laboratuvar

1. Şablondan kendi proje reponu oluştur, adım adım: [SETUP.md](../../SETUP.md), bölüm 4
2. Canlı kurada senaryonu çek.
3. `SCENARIO.md` dosyasını doldur.
4. Repo adını projene göre değiştir (örnek: `smart-farm-drone-db`).
5. `lab-sheets/week-03.md` föyünü doldur ve commit et.

## Okuma

PostgreSQL Tutorial, giriş bölümü: https://www.postgresql.org/docs/current/tutorial-sql-intro.html

## Ek kaynaklar

- Slaytların metin sürümü (ekran okuyucu ve büyütme dostu): [slides-text.md](slides-text.md)

## Kilometre taşı

Kura, repo, senaryo kartı

## Ödev

- `SCENARIO.md` içindeki beş soruyu tamamla.
- Senaryon için bir gerçek veri kaynağı adayı bul ve linkini `SCENARIO.md` içine yaz. Fikirler: İBB Açık Veri (data.ibb.gov.tr), Kaggle Datasets, Hugging Face Datasets, Open-Meteo, phyphox (telefon sensörleri).
- Ek olarak, ilk iki haftanın algoritma konularını pekiştiren bir ödev var, GitHub'a değil, derse elden getireceksin: [odev-algoritma.md](odev-algoritma.md). Teslim 5 gün sonra.
