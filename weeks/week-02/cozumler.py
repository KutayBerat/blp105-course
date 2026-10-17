"""
Hafta 2 laboratuvar çözümleri
BLP 105 / BLP 1005 Veritabanı Yönetim Sistemleri

Bu dosya lab sonrasında yayımlanır. Önce kendin dene.
Her çözümün altında, aynı işin Hafta 4-5'te SQL'de nasıl yazılacağı
yorum olarak var. Şimdi anlamasan da olur, haftaya geri dön.
"""

robots = [
    {"name": "Atlas-01",  "model": "AMR-200", "status": "active",      "battery_level": 82, "zone": "Depo A"},
    {"name": "Atlas-02",  "model": "AMR-200", "status": "charging",    "battery_level": 15, "zone": "Şarj"},
    {"name": "Kartal-01", "model": "DRN-X1",  "status": "active",      "battery_level": 18, "zone": "Dış Alan"},
    {"name": "Kartal-02", "model": "DRN-X1",  "status": "maintenance", "battery_level": 64, "zone": "Atölye"},
    {"name": "Mars-01",   "model": "AMR-300", "status": "active",      "battery_level": 47, "zone": "Depo B"},
    {"name": "Mars-02",   "model": "AMR-300", "status": "active",      "battery_level":  9, "zone": "Depo B"},
    {"name": "Atlas-03",  "model": "AMR-200", "status": "offline",     "battery_level":  0, "zone": "Depo A"},
    {"name": "Kartal-03", "model": "DRN-X1",  "status": "active",      "battery_level": 91, "zone": "Dış Alan"},
]

print("=== A1 ===")
for robot in robots:
    print(robot["name"])

print("=== A2 ===")
for robot in robots:
    print(robot["name"], "-", str(robot["battery_level"]) + "%")

print("=== A3 ===")
for i in range(1, 11):
    print(i, "->", i * i)

# A4. Cevap: 6 satır.
# Dış döngü 3 kere döner, her dönüşte iç döngü 2 kere döner: 3 x 2 = 6.
# İç içe döngülerde toplam yineleme sayısı çarpılır.

print("=== B1 sayma ===")
active_count = 0
for robot in robots:
    if robot["status"] == "active":
        active_count = active_count + 1
print("Aktif robot sayısı:", active_count)        # 5
# SQL (Hafta 5): SELECT count(*) FROM robots WHERE status = 'active';

print("=== B2 toplama ===")
total = 0
for robot in robots:
    total = total + robot["battery_level"]
print("Toplam batarya:", total)                   # 326
# SQL (Hafta 5): SELECT sum(battery_level) FROM robots;

print("=== B3 ortalama ===")
total = 0
count = 0
for robot in robots:
    total = total + robot["battery_level"]
    count = count + 1
average = total / count
print("Ortalama batarya:", round(average, 1))     # 40.8
# SQL (Hafta 5): SELECT round(avg(battery_level), 1) FROM robots;
# Hafta 5'te şunu soracağız: bataryası BİLİNMEYEN bir robot olsaydı,
# onu count'a katmalı mıydık? Cevap raporu değiştiriyor.

print("=== B4 en büyük ===")
largest_robot = robots[0]
for robot in robots:
    if robot["battery_level"] > largest_robot["battery_level"]:
        largest_robot = robot
print("En yüksek:", largest_robot["name"], largest_robot["battery_level"])   # Kartal-03 91
# Dikkat: sadece sayıyı değil, robotun kendisini saklıyoruz.
# Böylece sonunda adına da erişebiliyoruz.

print("=== B5 en küçük ===")
smallest_robot = robots[0]
for robot in robots:
    if robot["battery_level"] < smallest_robot["battery_level"]:
        smallest_robot = robot
print("En düşük:", smallest_robot["name"], smallest_robot["battery_level"])  # Atlas-03 0

print("=== C1 bataryası 20 altı ===")
low_battery = []
for robot in robots:
    if robot["battery_level"] < 20:
        low_battery.append(robot["name"])
print(low_battery)        # ['Atlas-02', 'Kartal-01', 'Mars-02', 'Atlas-03']
# SQL (Hafta 4): SELECT name FROM robots WHERE battery_level < 20;

print("=== C2 DRN-X1 modeli ===")
drones = []
for robot in robots:
    if robot["model"] == "DRN-X1":
        drones.append(robot["name"])
print(drones)             # ['Kartal-01', 'Kartal-02', 'Kartal-03']
# SQL (Hafta 4): SELECT name FROM robots WHERE model = 'DRN-X1';

print("=== C3 aktif VE bataryası 50 altı ===")
result = []
for robot in robots:
    if robot["status"] == "active" and robot["battery_level"] < 50:
        result.append(robot["name"])
print(result)             # ['Kartal-01', 'Mars-01', 'Mars-02']
# SQL (Hafta 4):
#   SELECT name FROM robots WHERE status = 'active' AND battery_level < 50;

print("=== C4 Depo A veya Depo B ===")
depot = []
for robot in robots:
    if robot["zone"] == "Depo A" or robot["zone"] == "Depo B":
        depot.append(robot["name"])
print(depot)              # ['Atlas-01', 'Mars-01', 'Mars-02', 'Atlas-03']
# SQL (Hafta 4): SELECT name FROM robots WHERE zone IN ('Depo A', 'Depo B');
# SQL'de IN, uzun OR zincirlerinin kısa yazımıdır.

print("=== C5 model başına sayım ===")
counts = {}
for robot in robots:
    model = robot["model"]
    if model in counts:
        counts[model] = counts[model] + 1
    else:
        counts[model] = 1
for model in counts:
    print(model + ":", counts[model])
# AMR-200: 3
# DRN-X1: 3
# AMR-300: 2
#
# SQL (Hafta 5): SELECT model, count(*) FROM robots GROUP BY model;
#
# Bu sorunun zor olmasının sebebi: önce grupları keşfetmen, sonra
# saymanı gerekiyor. SQL'de GROUP BY iki işi birden yapar.
# Yukarıdaki 7 satır, SQL'de tek satır.

# ---------------------------------------------------------------
# D bölümü: düşünme sorusu, örnek cevap
# ---------------------------------------------------------------
# SQL versiyonunda kaybolan şey: NASIL bulunacağı.
#
# Python kodunda açıkça yazıyorsun:
#   - boş bir liste aç
#   - listeyi baştan sona gez
#   - her elemanın bataryasına bak
#   - koşulu sağlıyorsa listeye ekle
#
# SQL'de bunların hiçbirini yazmıyorsun. Sadece "bataryası 20'den
# küçük olanların adını istiyorum" diyorsun. Tarama işini, hangi
# sırayla yapacağını, indeks kullanıp kullanmayacağını veritabanı
# kendisi seçiyor.
#
# Buna bildirimsel (declarative) dil denir. Avantajı: kısa ve
# okunur. Bedeli: bir şey yavaş çalıştığında arka planda ne
# olduğunu bilmen gerekir. Bu dersin ilerleyen haftalarında
# (EXPLAIN, indeks) tam olarak buna bakacağız.
