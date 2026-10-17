# Ödev 1 — Haftalar 1-5: Temeller

**Dönemin ilk ödevi · 100 puan · PR son tarihi: [tarih] · Rapor teslimi: [tarih] dersinde**

Bu ödev beş haftayı birden kapsıyor: algoritmik düşünme, döngüler, veritabanı kavramları, SELECT/WHERE ve gruplama/NULL. Dönemin ilk ödevi olduğu için aynı zamanda **dönem boyunca kullanacağın altyapıyı** da burada kuruyorsun.

Panik yok. Bölüm 0 bir kerelik kurulum, Bölüm 1 ve 2 derste zaten çözdüğümüz lab sorularının tekrarı. Gerçek yeni iş Bölüm 3'te.

Teslim akışının tamamı: **[ODEVLER.md](../../ODEVLER.md)**. Nasıl notlandırılacağı: **[RUBRIK.md](../../RUBRIK.md)**.

---

## Bölüm 0 — Kurulum (bir kerelik, zorunlu)

Bu adımları yapmadan diğer bölümleri teslim edemezsin, çünkü teslim yeri burası.

- [ ] Şablondan kendi depomu oluşturdum ([ODEVLER.md bölüm 2](../../ODEVLER.md))
- [ ] **gizemturker**'ı collaborator olarak ekledim
- [ ] PR şablonunu `.github/pull_request_template.md` olarak kopyaladım
- [ ] `README.md` dosyasını [proje şablonundan](../../templates/proje-readme-sablonu.md) başlattım
- [ ] Depoma projemi anlatan İngilizce bir ad verdim (`smart-farm-drone-db`, `hospital-chatbot-logs` gibi)
- [ ] PostgreSQL'i kurdum, `psql` çalışıyor
- [ ] `data/robot_fleet.sql` veya `data/llm_ops.sql` dosyasını kendi veritabanıma yükledim

Kurulumda takılırsan: [SETUP.md](../../SETUP.md). Hâlâ takılıysan ders öncesi 15 dakika erken gel, birlikte bakalım. **Kurulum sorunu mazerettir, geç teslim değil** — ama bana ödev gecesi değil, haftanın başında söylemen şartıyla.

---

## Bölüm 1 — SELECT ve WHERE (zorunlu, 15 soru)

[../week-04/lab.md](../week-04/lab.md) dosyasındaki **15 soruyu** kendi programının veritabanında çöz.

- Robotik (BLP 105) → `robot_fleet`
- YZO (BLP 1005) → `llm_ops`

Çözümler `odevler/odev-01/cozumler.sql` dosyasına. Biçim şu:

```sql
-- Soru 1: Bütün robotların adı ve modeli
SELECT name, model
FROM robots;
-- 10 satır döndü.
```

Her sorgunun **üstünde** soru numarası, **altında** kaç satır döndüğü yazsın. Satır sayısı yazmak zahmetli görünüyor ama hata yakalamanın en ucuz yolu: beklediğin sayıyla gelen sayı tutmuyorsa sorgunda bir şey var demektir.

---

## Bölüm 2 — Gruplama ve NULL (zorunlu, 15 soru)

[lab.md](lab.md) dosyasındaki **15 soruyu** çöz, aynı dosyanın devamına yaz.

Bu bölümde ek bir kural var: **her sorgunun altına bir yorum cümlesi.** Sayıyı değil, sayının anlamını yaz.

```sql
-- Soru 11: NULL avı
SELECT count(*) AS satir_sayisi,
       count(battery_level) AS batarya_dolu
FROM robots;
-- 10 | 9  --> bir robotun bataryası bilinmiyor (Kartal-04, sensör arızası).
-- Bu fark ortalamayı 4 puan kaydırıyor.
```

Yorumsuz teslim edilen ödevde "Yorum ve analiz" ölçütü en fazla 2 (Gelişmeli) alır. Yani 25 puanın 14'ünü kaybedersin.

---

## Bölüm 3 — Kendi senaryon (zorunlu)

Burası ödevin asıl kısmı. Dönem projen buradan büyüyecek, o yüzden ciddiye al.

### 3.1 Senaryo kartı

Depondaki `SCENARIO.md` dosyasını doldur:

1. **Senaryo:** üzerinde çalışacağın alan nedir?
2. **Problem:** bu alanda çözülmeye değer hangi gerçek problem var? (3-5 cümle)
3. **Kim kullanacak:** bu veritabanından kim, hangi soruyu soracak?
4. **İlk beş soru:** sisteme soracağın beş soruyu **Türkçe cümle** olarak yaz. Henüz SQL değil.
5. **Veri kaynağı:** gerçek veriyi nereden alacaksın? Linkiyle yaz.

Veri kaynağı fikirleri: [RESOURCES.md](../../RESOURCES.md) sonundaki liste.

### 3.2 Ham veriyi indir

- [ ] CSV'yi `data/raw/` klasörüne koy (100 MB'ı aşıyorsa ilk 1000 satırı yeter, tam linki `SCENARIO.md`'ye yaz)
- [ ] Kaç satır, kaç sütun var? Hangi sütunlar ilgini çekiyor?

### 3.3 Veri kalitesi notu

`SCENARIO.md` içine bir "Veri kalitesi" bölümü aç:

- [ ] Hangi sütunlarda boş hücre var, kaç tane
- [ ] Bu boşluklar ne anlama geliyor? (ölçülmedi mi, uygulanmaz mı, unutuldu mu?)
- [ ] Hangi sütuna göre gruplamak anlamlı olur, neden?
- [ ] Bu veriden bir ortalama hesaplasaydın boş hücreleri nasıl ele alırdın, **neden?**

Son madde bu ödevin kalbi. "Boşu sıfır say" ile "boşu hesaba katma" farklı raporlar üretir ve ikisi de savunulabilir. Hangisini seçtiğini gerekçelendir — gerekçesiz seçim yanlış seçimle aynı puanı alır.

---

## Bölüm 4 — Bonus (isteğe bağlı)

- Diğer programın 30 sorusunu da çöz
- `CASE WHEN` ile kendi verine uygun üç kategori tanımla
- `week-04/lab.md` sonundaki B2 sorusunu yanıtla

Bonus puan kaybını telafi etmez; ilgi gösterir. Ben de öyle okurum.

---

## Teslim

| Ne | Nerede |
|---|---|
| Sorgular (30 soru, yorumlu) | `odevler/odev-01/cozumler.sql` |
| Rapor (dijital) | `odevler/odev-01/rapor.md` |
| Senaryo ve veri kalitesi | `SCENARIO.md` |
| Ham veri | `data/raw/` |
| PR | Dal `odev-01`, başlık `Ödev 1 — Ad Soyad — Öğrenci No`, reviewer: **gizemturker** |
| **Rapor (kâğıt)** | **[tarih] dersinde elden** |

Rapor şablonu: [templates/odev-rapor-sablonu.md](../../templates/odev-rapor-sablonu.md)

PR'ı **kendin birleştirme.** İnceleyip yorum bırakacağım, düzeltmeleri aynı dala gönderebilirsin.

---

## Raporda özellikle cevaplamanı istediklerim

Şablondaki bölümlere ek olarak dört soru:

1. **Parantez tuzağı** (week-04 Soru 7): parantezsiz ve parantezli hallerini çalıştırdın. Kaç satır fark etti ve neden?
2. **Türkçe sıralama** (week-04 Soru 14): `COLLATE` kullanmadan ve kullanarak çalıştırdın. Hangi isimler yer değiştirdi?
3. **Kayıp kayıtlar:** `WHERE x < 50` ve `WHERE x >= 50` sonuçlarını topladığında toplam satır sayısını bulamıyorsun. Kaç kayıt kayboldu, neden?
4. **İki ortalama:** `avg(sutun)` ile `avg(coalesce(sutun, 0))` farklı sonuç verdi. Fark kaç puan, hangisi bu veri için daha dürüst bir rapor? Gerekçelendir.

---

## Değerlendirme

[RUBRIK.md bölüm 1](../../RUBRIK.md). Beş ölçüt: doğruluk (35), SQL kalitesi (20), yorum ve analiz (25), Git/PR disiplini (10), dürüstlük ve YZ beyanı (10).

**Kâğıt rapor gelmezse toplamdan %25 kesilir.**

Bu ilk ödev olduğu için Git/PR disiplininde elim gevşek olacak: dal adını yanlış yazdıysan ya da commit mesajların dağınıksa puan kırmam, yorum bırakırım. Ödev 2'den itibaren bu ölçüt tam işler.

---

## İpuçları

- Takıldığında önce **hata mesajını oku.** PostgreSQL genelde sorunu doğrudan söyler, hatta hangi karakterde olduğunu gösterir.
- Sorgun hata vermiyor ama sonuç tuhafsa: büyük/küçük harf, tırnak tipi, birim (saniye/milisaniye) ve koşul önceliğine bak.
- Her sorgunun sonucunu tek bir satır üzerinden gözünle doğrula.
- Tek oturuşta bitirmeye çalışma. 30 soru, iki akşam.
- Yapay zekaya sorabilirsin; **beyan etmek şartıyla.** Beyansız kullanım ödevi sıfırlar. Ayrıntı: [ODEVLER.md bölüm 6](../../ODEVLER.md).
