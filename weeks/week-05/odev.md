# Ödev 2 — Gruplama ve NULL

**Hafta 5 · 100 puan · PR son tarihi: [tarih] · Rapor teslimi: Hafta 6 dersinde**

## Amaç

Veriyi gruplayarak özet üretebilmek, ve **eksik verinin raporu nasıl sessizce bozduğunu** fark edebilmek.

Bu ödevin asıl konusu ikincisi. Sorgu yazmak kolay; çıkan sayının doğru olup olmadığını anlamak zor olan.

## Yapılacaklar

### Bölüm 1 — Lab soruları (zorunlu)

[lab.md](lab.md) dosyasındaki **15 soruyu** çöz, `odevler/odev-02/cozumler.sql` dosyasına yaz.

Bu hafta ek bir kural var: **her sorgunun altına bir yorum cümlesi yaz.**

```sql
-- Soru 11: NULL avı
SELECT count(*) AS satir_sayisi,
       count(battery_level) AS batarya_dolu
FROM robots;
-- 10 | 9  --> bir robotun bataryası bilinmiyor (Kartal-04, sensör arızası).
-- Bu fark, ortalamayı 4 puan kaydırıyor (16. soruda görülecek).
```

Yorumsuz teslim edilen ödevde "Yorum ve analiz" ölçütü en fazla 2 (Gelişmeli) alır.

### Bölüm 2 — Kendi verinde eksik veri avı (zorunlu)

Hafta 4'te indirdiğin ham veriye bak. Henüz veritabanına yüklemedin, CSV olarak incele (Excel, Numbers, VS Code, ne istersen).

`SCENARIO.md` içine bir "Veri kalitesi" bölümü ekle ve şunları yaz:

- [ ] Toplam satır sayısı
- [ ] Hangi sütunlarda boş hücre var, kaç tane
- [ ] Bu boşluklar ne anlama geliyor? (ölçülmedi mi, uygulanmaz mı, unutuldu mu?)
- [ ] Hangi sütuna göre gruplamak anlamlı olur ve neden?
- [ ] Eğer bu veriden bir ortalama hesaplasaydın, boş hücreleri nasıl ele alırdın? Neden?

Son soru önemli: bu dersin kararı. "Boşu sıfır say" ile "boşu hesaba katma" farklı raporlar üretir ve ikisi de savunulabilir. Hangisini seçtiğini **gerekçelendir.**

### Bölüm 3 — Bonus (isteğe bağlı)

- Diğer programın sorularını da çöz
- `CASE WHEN` ile kendi verine uygun üç kategori tanımla ve nasıl grupladığını anlat

## Teslim

| Ne | Nerede |
|---|---|
| Sorgular (yorumlu) | `odevler/odev-02/cozumler.sql` |
| Rapor (dijital) | `odevler/odev-02/rapor.md` |
| Veri kalitesi notu | `SCENARIO.md` içinde |
| PR | Dal `odev-02`, reviewer: gizemturker |
| **Rapor (kâğıt)** | **Hafta 6 dersinde elden** |

## Raporda özellikle cevaplamanı istediklerim

1. **Kayıp robot / kayıp çağrı:** `WHERE x < 50` ve `WHERE x >= 50` sorgularının sonuçlarını topladığında toplam satır sayısını bulamıyorsun. Kaç kayıt kayboldu ve neden?
2. **İki ortalama:** `avg(sutun)` ile `avg(coalesce(sutun, 0))` farklı sonuç verdi. Fark kaç puan ve hangisi bu veri için daha dürüst bir rapor? Gerekçelendir.
3. **Kendi verinde:** eksik veri bulundu mu? Bulunmadıysa, gerçekten yok mu yoksa bakmadın mı?

## Değerlendirme

[RUBRIK.md bölüm 1](../../RUBRIK.md). Bu hafta "Yorum ve analiz" (25 puan) ölçütü belirleyici olacak.

**Kâğıt rapor gelmezse toplamdan %25 kesilir.**
