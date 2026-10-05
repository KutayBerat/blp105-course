# Hafta 13: Veritabanı güvenliği

Durum: Yakında

## Bu hafta ne işliyoruz

- Kullanıcılar ve roller (`CREATE ROLE`), `GRANT` ve `REVOKE`
- En az yetki ilkesi, LLM ve otomasyon araçları için salt okunur rol tasarımı
- Row-Level Security (`ENABLE ROW LEVEL SECURITY`, `CREATE POLICY`)
- SQL injection: nasıl oluşur, gerçek hayattaki sonuçları, parametreli sorgular
- Yedekleme ve geri yükleme: `pg_dump`, `pg_restore`

## Hafta sonunda yapabileceklerin

- En az yetki ilkesine göre roller tanımlayabilirsin
- SQL injection riskini bir örnekle açıklayabilirsin
- Kendi projene salt okunur bir rol ve en az bir Row-Level Security politikası ekleyebilirsin

## Anahtar terimler

| English | Türkçe |
|---|---|
| role / grant / revoke | rol / yetki verme / yetki alma |
| row-level security | satır düzeyinde güvenlik |
| sql injection | SQL enjeksiyonu |

## Laboratuvar

Kendi projene `app_readonly` rolü ve en az bir RLS politikası ekleme. Savunma provası.

## Okuma

PostgreSQL, Database Roles: https://www.postgresql.org/docs/current/user-manag.html , Row Security Policies: https://www.postgresql.org/docs/current/ddl-rowsecurity.html

## Kilometre taşı

README, demo, portfolyo

## Ödev

Bu haftanın ödevi ayrıca eklenecek.
