# Ders Bilgileri

## Dersin amacı

Excel'de tuttuğun bir tablo bir yere kadar gider: birkaç kullanıcı, birkaç bin satır, tek bir dosya. Gerçek bir ürün, bir chatbot'un konuşma geçmişi, bir filonun sensör verisi, bir hastanenin kayıt sistemi, aynı anda birden fazla kişinin okuyup yazdığı, milyonlarca satırlık, hatasız kalması gereken bir veri katmanı ister. Bu ders sana o katmanı kurmayı öğretir: PostgreSQL ile.

Dönem boyunca tek bir soruyu cevaplarsın: bu veriye nasıl güvenilir bir şekilde soru sorarım? İlk haftalarda hazır bir veritabanını sorgulayarak başlarız (SELECT, WHERE, JOIN, GROUP BY). Tasarım ve modelleme (E-R diyagramı, normalizasyon, DDL) sorgu deneyiminden sonra gelir, çünkü neyi modelleyeceğini önce ne sorduğunu görmeden bilemezsin.

## Öğrenme çıktıları

Bu dersi tamamlayan öğrenci:

1. Bir VTYS'nin hangi problemleri çözdüğünü ve PostgreSQL'in istemci-sunucu mimarisini açıklar.
2. SELECT, WHERE, JOIN (INNER/LEFT/self-join), GROUP BY, alt sorgu, CTE ve pencere fonksiyonuyla çok adımlı analiz sorguları yazar.
3. Bir problem senaryosundan E-R modeli çıkarır, normalize edilmiş (1NF-3NF) bir ilişkisel şemaya dönüştürür ve `CREATE TABLE` ile hayata geçirir.
4. INSERT/UPDATE/DELETE, transaction ve UPSERT kullanarak veri bütünlüğünü bozmadan veri taşır.
5. `EXPLAIN ANALYZE` çıktısını okur, doğru yere indeks koyar.
6. En az yetki ilkesine göre rol, `GRANT`/`REVOKE` ve Row-Level Security tasarlar, SQL injection riskini açıklar.
7. `jsonb` ile yarı yapılandırılmış veri saklar, pgvector ile anlamsal arama kurar ya da bir LLM'in ürettiği SQL'i şemasına karşı doğrular.
8. Çalışmasını README, ERD, demo videosu ve canlı bir savunmayla profesyonel biçimde sunar.
9. Git/GitHub ile sürüm kontrollü, tekrar üretilebilir bir veritabanı projesi yönetir.

Bu çıktılar araçtan bağımsız yazıldı. PostgreSQL bu dönemki aracımız, ama öğrendiğin kavramlar (ilişkisel model, normalizasyon, transaction, indeks, en az yetki ilkesi) her VTYS'de geçerli.

## Ders yapısı

Haftada 2 saat ders ve 2 saat laboratuvar, 14 hafta. Laboratuvar dersin devamı olarak aynı hafta içinde uygulamadır. İlk iki hafta algoritmik düşünme ve Python'la for/if tekrarına ayrılır, veritabanı konuları Hafta 3'ten başlar.

## Değerlendirme

| Bileşen | Ağırlık | İçerik |
|---|---|---|
| Ara sınav | %30 | Hafta 8, mini proje ve sunum |
| Proje | %30 | Haftalık commit'ler ve lab föyleri |
| Yarıyıl sonu | %40 | Ana proje ve sektör jürisi önünde 5 dakikalık sunum |

Yazılı sınav yok: sorgu yazar, şema kurar, sonra savunursun.

## Kurallar

- Her hafta commit at. Son gece atılan tek dev commit yerine haftalar boyunca ilerleyen bir geçmiş istiyorum.
- Tablo ve sütun adları İngilizce, küçük harf ve `snake_case`: `sensor_readings`, `battery_level`.
- YZ kullanmak serbest, beyan zorunlu. Lab föyünün YZ kullanım beyanı bölümüne hangi aracı, hangi prompt ile kullandığını yaz.
- Her projede en az bir gerçek veri kaynağı olacak.
- Şifre, API anahtarı ve kişisel veri repoya girmez.
- LinkedIn paylaşımı gönüllüdür ve notu etkilemez.
- Çalışmalar bireyseldir, her öğrenci kendi senaryosunda çalışır.

## Erişilebilirlik

Görme, işitme ya da başka bir nedenle farklı bir düzenlemeye ihtiyacın varsa derse gelmeden bana yazman yeterli: büyük punto föy, sınavda ek süre veya farklı sunum biçimi birlikte planlanır. Haftalık slaytların metin sürümü ayrıca yayımlanır.

## İletişim

Kurulum sorunu, ödev takılması ya da ders içeriğiyle ilgili sorular için GitHub üzerinden bir Issue aç ya da ders/lab saatinde sor.
