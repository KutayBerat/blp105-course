# Ödevler ve Teslim Kuralları

Bu derste **7 notlu ödev** ve bir hazırlık ödevi var. Hepsi aynı şekilde teslim edilir: GitHub'da kendi deponda bir **Pull Request (PR)** açarsın, ayrıca **bir sayfalık raporu derste elden teslim edersin.**

İki teslimin ikisi de zorunludur. PR'ı açıp raporu getirmezsen ödev eksik sayılır; raporu getirip PR açmazsan da öyle.

---

## 1. Teslim akışı özeti

```
Kendi repon  →  yeni branch  →  çalış, commit at  →  PR aç  →  beni reviewer ekle
                                                                      ↓
                                                        Derste bir sayfalık rapor
```

Neden PR? Çünkü sektörde kod böyle teslim edilir. Kimse ana dala doğrudan yazmaz: dal açar, iş biter, PR açar, biri inceler, sonra birleşir. Bu dersten çıkarken bu alışkanlığı kazanmanı istiyorum. Ödevlerin aynı zamanda bu akışın provası.

---

## 2. Bir kerelik kurulum (Hafta 3'te yapılır)

Bunu dönem başında **bir kez** yaparsın, sonra her ödevde tekrar etmezsin.

### 2.1 Depoyu oluştur

1. [Proje şablonunu](https://github.com/gizemturker/project-template) aç, **Use this template** → **Create a new repository**.
2. Owner: kendi kullanıcı adın. Repository name: önce `db-project`, kuradan sonra projene uygun İngilizce bir adla değiştir (`smart-farm-drone-db` gibi).
3. **Public** seç. Portfolyo için herkese açık olması gerekir. Gizli tutmak istersen Private seç ve beni collaborator ekle.

### 2.2 Beni ekle

Settings → Collaborators → Add people → **gizemturker**

Bu adım olmadan PR'larını göremem ve ödevin teslim edilmemiş sayılır. Dönem başında bir kez yap, sonra unut.

### 2.3 Ana dalı koru (önerilir, zorunlu değil)

Settings → Branches → Add branch protection rule → `main` → "Require a pull request before merging" işaretle.

Bunu açarsan `main`'e doğrudan yazamazsın, kendini PR açmaya zorlarsın. Gerçek projelerde bu ayar hep açıktır.

### 2.4 Klasör yapısı

Şablon bu yapıyla gelir, sen doldurursun:

```
senin-repon/
├── README.md              projenin tanıtımı
├── SCENARIO.md            senaryo kartın
├── data/
│   ├── raw/               indirdiğin ham veri (CSV)
│   └── seed/              kendi veritabanına yüklediğin veri
├── migrations/            şema dosyaların (Hafta 9'dan itibaren)
├── queries/               analiz sorguların
├── odevler/
│   ├── odev-01/
│   │   ├── cozumler.sql   sorguların
│   │   └── rapor.md       raporun (yazdırıp derse getireceğin)
│   ├── odev-02/
│   └── ...
└── docs/
    └── erd.md             ERD'n (Hafta 7'den itibaren)
```

---

## 3. Her ödevde yapacakların

### Adım 1: Dal aç

```bash
git checkout main
git pull
git checkout -b odev-01
```

Dal adı her zaman `odev-NN` biçiminde: `odev-01`, `odev-02`, `odev-07`.

### Adım 2: Çalış ve commit at

Dosyalarını `odevler/odev-01/` klasörüne koy.

```bash
git add odevler/odev-01/
git commit -m "Odev 1: SELECT ve WHERE cozumleri"
```

**En az üç commit** istiyorum. Tek bir dev commit yerine işi parçalara böl: "soru 1-5", "soru 6-10", "rapor". Son gece atılan tek commit yerine ilerleyen bir geçmiş görmek istiyorum.

İyi commit mesajı: `Odev 1: soru 6-10, BETWEEN ve IN`
Kötü commit mesajı: `update`, `son hali`, `asdf`

### Adım 3: Gönder ve PR aç

```bash
git push -u origin odev-01
```

GitHub'da repona git, çıkan **Compare & pull request** düğmesine bas.

| Alan | Ne yazacaksın |
|---|---|
| Başlık | `Ödev 1 — Ad Soyad — Öğrenci No` |
| base (hedef) | `main` |
| compare (kaynak) | `odev-01` |
| Açıklama | PR şablonunu doldur ([templates/pull_request_template.md](templates/pull_request_template.md)) |
| Reviewers | **gizemturker** |

Reviewer olarak beni eklemezsen PR'ın bana düşmez.

### Adım 4: PR'ı birleştirme

**PR'ı kendin birleştirme (merge).** Ben inceleyip yorum bırakacağım. Düzeltme istersem aynı dala commit atarsın, PR kendiliğinden güncellenir. Onaydan sonra birleştirebilirsin.

### Adım 5: Raporu derste teslim et

Raporunu (`odevler/odev-01/rapor.md`) **yazdır**, imzala ve **ödev tesliminin yapılacağı derste elden ver.**

Şablon: [templates/odev-rapor-sablonu.md](templates/odev-rapor-sablonu.md)

Bir sayfa, en fazla iki. Elle doldurulacak alanlar var, bilgisayarda doldurup yazdırman da olur.

> Neden hem dijital hem kâğıt? Kâğıt rapor resmi arşiv için gerekli. Ayrıca sorgularını yazdıktan sonra "bu sonuç ne anlama geliyor" sorusunu bir kez de kalemle cevaplamanı istiyorum: ekranda düşünmekle kâğıtta düşünmek aynı şey değil.

---

## 4. Ödev takvimi

| Ödev | Hafta | Konu | PR son tarihi | Rapor teslimi |
|---|---|---|---|---|
| Ödev 0 | 3 | Repo kurulumu ve senaryo kartı | [tarih] | — (notlandırılmaz) |
| **Ödev 1** | 4 | SELECT ve WHERE | [tarih] | Hafta 5 dersinde |
| **Ödev 2** | 5 | Gruplama ve NULL | [tarih] | Hafta 6 dersinde |
| **Ödev 3** | 6 | JOIN | [tarih] | Hafta 7 dersinde |
| **Ödev 4** | 7 | ERD ve normalizasyon | [tarih] | Hafta 8 dersinde |
| — | 8 | Ara sınav haftası, ödev yok | | |
| **Ödev 5** | 9 | Şema kurma (DDL) | [tarih] | Hafta 10 dersinde |
| **Ödev 6** | 10 | Veriyi taşıma (DML) | [tarih] | Hafta 11 dersinde |
| **Ödev 7** | 11 | Görünüm, güvenlik, YZ bileşeni | [tarih] | Hafta 12 dersinde |
| Final | 12 | Ana proje ve sunum | [tarih] | Sunum günü |

**Kural:** PR, bir sonraki dersin başlangıcından **en geç 24 saat önce** açılmış olmalı. Raporu da o derste getirirsin.

Tarihler dönem başında bu tabloya işlenir ve derste duyurulur.

---

## 5. Notlandırma

Yedi notlu ödevin ortalaması dönem notunun **%30'unu** oluşturur (SYLLABUS.md'deki "Proje" bileşeni).

**En düşük bir ödev notun atılır.** Yani yedi ödevin en iyi altısı sayılır. Hastalık, yoğunluk, kötü bir hafta: bir kere olur. Ama bunu baştan harcamamanı öneririm.

Her ödev 100 puan üzerinden, ayrıntılı ölçütler: **[RUBRIK.md](RUBRIK.md)**

### Geç teslim

| Gecikme | Kesinti |
|---|---|
| 24 saate kadar | %20 |
| 24-72 saat | %40 |
| 72 saatten fazla | Kabul edilmez (0) |

Geçerli mazeretin varsa (sağlık raporu, resmi görev) **önceden** yaz. Sonradan gelen mazeret kesintiyi kaldırmaz.

---

## 6. Yapay zeka kullanımı

**Serbest, beyan zorunlu.**

ChatGPT, Claude, Copilot ya da başka bir araç kullanabilirsin. Ama her ödevin raporunda ve PR açıklamasında şunları yazacaksın:

- Hangi aracı kullandın
- Hangi soruda kullandın
- Ne sordun (prompt'un özeti)
- Çıkan cevabı nasıl doğruladın

Son madde en önemlisi. Bir YZ'nin ürettiği SQL'i çalıştırmadan teslim edersen, çalışmadığında sorumluluk senindir.

**Beyan etmemek, kullanmaktan daha ağır bir sorundur.** Beyan edilmemiş YZ kullanımı tespit edilirse o ödev sıfırlanır.

Şunu da unutma: Hafta 11'de bir LLM'e kendi şemanı verip ürettiği SQL'i test edeceğiz. YZ bu derste bir düşman değil, öğrenmen gereken bir araç. Ama araçla ne yaptığını bilmen gerekiyor.

## 7. Kopya

Ödevler bireyseldir. Arkadaşınla konuşabilir, birlikte düşünebilirsin; **kodu kopyalayamazsın.**

Ayırt etme kuralı basit: tahtaya kalkıp kendi çözümünü satır satır anlatabiliyor musun? Anlatamıyorsan o çözüm senin değildir.

Tespit edilen kopyada her iki tarafa da sıfır verilir.

## 8. Güvenlik

- Şifre, API anahtarı, token repoya **girmez**. Bir kez commit ettiysen o anahtar yanmıştır, iptal et ve yenisini al.
- Kişisel veri (ad, soyad, telefon, TC kimlik, e-posta) repoya girmez. Projende gerçek kişi verisi kullanman gerekiyorsa anonimleştir.
- Benim de dahil kimseyle şifre paylaşma. Senden hiçbir zaman şifre istemeyeceğim.

---

## 9. Sık sorulanlar

**PR'ı yanlışlıkla merge ettim, ne olacak?**
Sorun değil, yorumlarımı commit üzerine yazarım. Bir dahakine bekle.

**Branch açmayı unuttum, doğrudan main'e commit attım.**
Yeni bir dal aç, `main`'i oraya al, `main`'i geri sar. Takılırsan lab saatinde çözeriz. İkinci kez olursa dal koruma kuralını açmanı isterim (bölüm 2.3).

**Sorgularımın hepsi doğru ama rapor yazmayı unuttum.**
Ödev eksiktir. Rapor, ödevin yarısı sayılabilecek kadar önemli; rubrikteki "Yorum ve analiz" ölçütü oradan geliyor.

**Dersi kaçırdım, raporu nasıl teslim edeceğim?**
Bir sonraki derste getir ve geç teslim kesintisini kabul et. Resmi mazeretin varsa önceden yaz.

**Ham verim çok büyük, repoya sığmıyor.**
100 MB üstü dosyayı GitHub kabul etmez. Verinin küçük bir örneğini (ilk 1000 satır) koy, tamamının indirme linkini `SCENARIO.md` içine yaz.

**Diğer programın sorularını da çözdüm, ekstra puan var mı?**
Bonus bölümleri notu yükseltmez ama rubrikte "Tam" seviyeye çıkmanı kolaylaştırır. Asıl faydası: iki veri alanını birden görmüş olursun.

---

## İlgili dosyalar

- [RUBRIK.md](RUBRIK.md) — notlandırma ölçütleri
- [templates/odev-rapor-sablonu.md](templates/odev-rapor-sablonu.md) — derste teslim edeceğin rapor
- [templates/pull_request_template.md](templates/pull_request_template.md) — PR açıklaması
- [SETUP.md](SETUP.md) — kurulum
- [SYLLABUS.md](SYLLABUS.md) — değerlendirme ağırlıkları
