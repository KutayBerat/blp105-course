# Ödev 1 — SELECT ve WHERE

**Hafta 4 · 100 puan · PR son tarihi: [tarih] · Rapor teslimi: Hafta 5 dersinde**

## Amaç

Türkçe sorulmuş bir soruyu tek tablolu bir SQL sorgusuna çevirebilmek, ve sonucun neden o kadar satır döndüğünü açıklayabilmek.

## Yapılacaklar

### Bölüm 1 — Lab soruları (zorunlu)

[lab.md](lab.md) dosyasındaki **15 soruyu** kendi programının veritabanında çöz.

Çözümlerini `odevler/odev-01/cozumler.sql` dosyasına yaz. Biçim:

```sql
-- Soru 1: Bütün robotların adı ve modeli
SELECT name, model
FROM robots;
-- 10 satır döndü.
```

Her sorgunun **üstünde** soru numarası, **altında** kaç satır döndüğü olsun.

### Bölüm 2 — Kendi verine bak (zorunlu)

Hafta 3'te bulduğun veri kaynağından ham veriyi indir.

- [ ] CSV'yi `data/raw/` klasörüne koy (100 MB'ı aşıyorsa ilk 1000 satırını koy, tam linki `SCENARIO.md`'ye yaz)
- [ ] `SCENARIO.md` içine şunları ekle: kaç satır var, kaç sütun var, hangi sütunlar ilgini çekiyor
- [ ] Hafta 3'te yazdığın beş Türkçe sorudan **ikisini**, bu dersin SQL'iyle nasıl yazacağını tarif et (henüz veritabanın yok, sadece sözde SQL yaz)

### Bölüm 3 — Bonus (isteğe bağlı)

- Diğer programın 15 sorusunu da çöz
- `lab.md` sonundaki B2 sorusunu yanıtla

## Teslim

| Ne | Nerede |
|---|---|
| Sorgular | `odevler/odev-01/cozumler.sql` |
| Rapor (dijital) | `odevler/odev-01/rapor.md` |
| Ham veri | `data/raw/` |
| PR | Dal `odev-01`, başlık `Ödev 1 — Ad Soyad — No`, reviewer: gizemturker |
| **Rapor (kâğıt)** | **Hafta 5 dersinde elden** |

Rapor şablonu: [templates/odev-rapor-sablonu.md](../../templates/odev-rapor-sablonu.md)

## Raporda özellikle cevaplamanı istediklerim

Şablondaki bölümlere ek olarak bu haftaya özel iki soru:

1. **Soru 7 (parantez tuzağı):** parantezsiz ve parantezli hallerini çalıştırdın. Kaç satır fark etti ve neden?
2. **Soru 14 (Türkçe sıralama):** `COLLATE` kullanmadan ve kullanarak çalıştırdın. Hangi isimler yer değiştirdi?

## Değerlendirme

[RUBRIK.md bölüm 1](../../RUBRIK.md). Beş ölçüt: doğruluk (35), SQL kalitesi (20), yorum ve analiz (25), Git/PR disiplini (10), dürüstlük ve beyan (10).

**Kâğıt rapor gelmezse toplamdan %25 kesilir.**

## İpuçları

- Takıldığında önce **hata mesajını oku.** PostgreSQL genelde sorunu doğrudan söyler.
- Sorgun hata vermiyor ama sonuç tuhafsa: büyük/küçük harf, tırnak tipi, birim dönüşümü (saniye/milisaniye) ve koşul önceliğine bak.
- Bir sorgunun sonucunu her zaman gözünle bir satır üzerinden kontrol et.
