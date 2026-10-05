# Hafta 10: DML ve transaction

Durum: Yakında

## Bu hafta ne işliyoruz

- `INSERT`: tek satır, çok satır, `INSERT ... SELECT`, `RETURNING`
- `UPDATE` ve `DELETE`, güvenli alışkanlık: önce aynı WHERE ile SELECT, sonra DML
- UPSERT: `INSERT ... ON CONFLICT`
- Transaction: `BEGIN`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- ACID özellikleri

## Hafta sonunda yapabileceklerin

- Veriyi güvenli şekilde ekleyebilir, güncelleyebilir, silebilirsin
- Bilerek hatalı bir işlemi `ROLLBACK` ile geri alabilirsin
- ACID özelliklerinin her birini bir örnekle açıklayabilirsin

## Anahtar terimler

| English | Türkçe |
|---|---|
| insert / update / delete | ekleme / güncelleme / silme |
| transaction | işlem |
| commit / rollback | onaylama / geri alma |

## Laboratuvar

Bilerek hatalı bir `UPDATE` çalıştırıp `ROLLBACK` ile kurtarma. Kendi projene gerçekçi seed verisi yükleme.

## Okuma

PostgreSQL, Data Manipulation (DML): https://www.postgresql.org/docs/current/dml.html , Transactions: https://www.postgresql.org/docs/current/tutorial-transactions.html

## Kilometre taşı

Veriyi şemaya taşıma

## Ödev

Bu haftanın ödevi ayrıca eklenecek.
