# Hafta 6: Çoklu tablo sorguları (JOIN)

Durum: Yakında

## Bu hafta ne işliyoruz

- Veri neden birden fazla tabloya bölünür (sezgisel giriş)
- Birincil ve yabancı anahtara sorgu üzerinden ilk bakış
- `INNER JOIN`: sadece iki tarafta da eşleşenler
- `LEFT JOIN` ve eşleşmeyenleri bulma (`WHERE ... IS NULL`)
- `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN` (kısaca)
- Self join: bir tabloyu kendisiyle birleştirme
- JOIN ile `GROUP BY` birlikte
- Yaygın hata: satır çoğalması (fan-out) ve yanlış toplamlar

## Hafta sonunda yapabileceklerin

- İki tabloyu doğru JOIN türüyle birleştirebilirsin
- "Hiç görev almamış robotlar" tipi soruları `LEFT JOIN` ile cevaplayabilirsin
- JOIN sonrası bir toplamın neden şiştiğini fark edip düzeltebilirsin
- `count(*)` ile `count(sutun)` farkının JOIN'de neden kritik olduğunu açıklayabilirsin

## Bu haftanın verisi

Bu hafta `robot_fleet` içindeki üç tabloyu da, `llm_ops` içindeki iki tabloyu da kullanacağız. Veri zaten kurulu: [data/README.md](../../data/README.md)

```
robots (10) ──< missions (14)        bir robotun çok görevi olur
operators (10) ──< robots            bir operatörün çok robotu olur
model_catalog (7) ──< llm_calls (12) bir modele çok çağrı yapılır
```

Veride bilerek bırakılmış dört durum var; dersin örnekleri bunların üzerine kurulu:

| Durum | Ne öğretiyor |
|---|---|
| 4, 7, 9, 10 numaralı robotların hiç görevi yok | `LEFT JOIN` ve "eşleşmeyeni bul" |
| Kerem'in hiç robotu yok | Ters yönde `LEFT JOIN` |
| `gemini-pro` katalogda yok ama çağrılmış | `INNER JOIN` 11, `LEFT JOIN` 12 satır döndürür |
| `mistral-large` katalogda var ama hiç çağrılmamış | Katalog tarafından `LEFT JOIN` |

## Anahtar terimler

| English | Türkçe |
|---|---|
| join | birleştirme |
| inner join | iç birleştirme |
| left (outer) join | sol birleştirme |
| self join | kendiyle birleştirme |
| join condition (`ON`) | birleştirme koşulu |
| fan-out / row multiplication | satır çoğalması |
| primary key / foreign key | birincil anahtar / yabancı anahtar |

Tüm terimler: [GLOSSARY.md](../../GLOSSARY.md)

## Laboratuvar

JOIN ve `GROUP BY` birleşik alıştırmalar. "Hiç görev almamış robotlar", "hiç çağrılmamış modeller" tipi sorular. Fan-out tuzağını gösteren bir alıştırma.

## Okuma

PostgreSQL Tutorial, Joins Between Tables: https://www.postgresql.org/docs/current/tutorial-join.html

## Ek kaynaklar

- JOIN türleri, ayrıntılı: https://www.postgresql.org/docs/current/queries-table-expressions.html
- SQL Murder Mystery, JOIN pratiği için oyunlaştırılmış alıştırma: https://mystery.knightlab.com/
- Select Star SQL, Bölüm 4 (joins): https://selectstarsql.com/

## Kilometre taşı

JOIN sorguları

## Ödev

Bu haftanın ödevi ayrıca eklenecek.
