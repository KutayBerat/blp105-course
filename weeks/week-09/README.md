# Hafta 9: DDL, anahtarlar ve ilişkiler

Durum: Yakında

## Bu hafta ne işliyoruz

- `CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`
- PostgreSQL veri tipleri: `integer`/`bigint`, `numeric` ile `real` farkı, `text`, `boolean`, `date`, `timestamptz`, `uuid`, `jsonb` (ön bakış)
- `GENERATED ALWAYS AS IDENTITY` ile otomatik artan anahtarlar
- `PRIMARY KEY`, `FOREIGN KEY` ve silme davranışları: `CASCADE`, `RESTRICT`, `SET NULL`
- `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`

## Hafta sonunda yapabileceklerin

- Bir E-R modelini anahtar ve kısıtlarıyla eksiksiz bir PostgreSQL şemasına dönüştürebilirsin
- Bir kısıt ihlali denemesinde hata mesajını okuyup nedenini açıklayabilirsin

## Anahtar terimler

| English | Türkçe |
|---|---|
| primary key / foreign key | birincil anahtar / yabancı anahtar |
| constraint | kısıt |
| cascade | zincirleme silme |

## Laboratuvar

Kısıt ihlali denemeleri: hatalı veri ekleyip hata mesajlarını okuma. Kendi ERD'nden ilk migration dosyasını yazma.

## Okuma

PostgreSQL, Data Definition (DDL): https://www.postgresql.org/docs/current/ddl.html

## Kilometre taşı

Şema (`CREATE TABLE`)

## Ödev

Bu haftanın ödevi ayrıca eklenecek.
