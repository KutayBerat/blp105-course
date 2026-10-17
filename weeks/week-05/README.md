# Hafta 5: SQL fonksiyonları ve gruplama (GROUP BY)

Durum: Yayında

## Bu hafta ne işliyoruz

- Toplama fonksiyonları: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `ROUND`
- `count(*)` ile `count(sütun)` arasındaki fark
- `GROUP BY` mantığı ve altın kuralı, `HAVING` ile `WHERE` farkı
- NULL kavramı ve üç değerli mantık, `IS NULL`, `COALESCE`, `NULLIF`
- Tarih ve zaman fonksiyonları: `now()`, `interval`, `date_trunc`, `EXTRACT`
- `CASE WHEN` ile koşullu sınıflandırma

## Hafta sonunda yapabileceklerin

- Veriyi gruplayarak özet istatistik üretebilirsin
- Boş değerlerin bir sorgunun sonucunu nasıl sessizce bozduğunu fark edebilirsin
- Kendi kategorilerini (`CASE WHEN`) tanımlayıp onlara göre gruplayabilirsin
- Hafta 2'de `for` ve `if` ile yazdığın sayma algoritmasının `GROUP BY` karşılığını kurabilirsin

## Bu haftanın dosyaları

- [ders-notu.md](ders-notu.md) — haftanın ders notu, çalıştırılabilir örneklerle
- [lab.md](lab.md) — laboratuvar föyü, 15 soru

Bu haftanın **metin sürümü** `ders-notu.md` dosyasıdır: slaytlardaki her konuyu, her sorguyu ve her sonucu içerir, ekran okuyucuyla okunabilir ve tarayıcıda büyütülebilir. Slayt sırasına göre ayrı bir `slides-text.md` slaytlar güncellendiğinde eklenecek.

## Anahtar terimler

| English | Türkçe |
|---|---|
| aggregate function | toplama fonksiyonu |
| aggregation | toplulaştırma |
| group by / having | gruplama / gruplanmış koşul |
| null | boş değer |
| three-valued logic | üç değerli mantık |
| coalesce | boşsa yerine koyma |
| conditional expression | koşullu ifade (`CASE WHEN`) |
| interval | zaman aralığı |

Tüm terimler: [GLOSSARY.md](../../GLOSSARY.md)

## Laboratuvar

Kolaydan zora 15 soru: [lab.md](lab.md). Bu hafta her sorgunun yanına bir yorum cümlesi de isteniyor: kaç satır döndü, neden o kadar, eksik veri sonucu etkiledi mi?

## Okuma

PostgreSQL Tutorial, Aggregate Functions: https://www.postgresql.org/docs/current/tutorial-agg.html

## Ek kaynaklar

- NULL ve üç değerli mantık, Markus Winand: https://modern-sql.com/concept/null
- Toplama fonksiyonlarının tam listesi: https://www.postgresql.org/docs/current/functions-aggregate.html
- Tarih ve zaman fonksiyonları: https://www.postgresql.org/docs/current/functions-datetime.html
- SQLBolt, ders 10-11: https://sqlbolt.com/

## Kilometre taşı

İlk analiz sorguları

## Ödev

**Ödev 1 — Haftalar 1-5: Temeller** (100 puan, dönemin ilk ödevi). Yönerge: [odev.md](odev.md)

- Kapsam: kurulum, SELECT/WHERE (Hafta 4 labı) ve gruplama/NULL (bu haftanın labı), toplam 30 soru
- PR ile teslim: dal `odev-01`, reviewer **gizemturker**
- **Kâğıt rapor derste elden teslim edilir**

Kurallar: [ODEVLER.md](../../ODEVLER.md) · Rubrik: [RUBRIK.md](../../RUBRIK.md)
