"""
Hafta 1 laboratuvar çözümleri
BLP 105 / BLP 1005 Veritabanı Yönetim Sistemleri

Bu dosya lab sonrasında yayımlanır. Önce kendin dene.
Farklı yazılmış doğru çözümler de kabul edilir: aynı soruya
birden fazla doğru cevap olabilir.
"""

# ---------------------------------------------------------------
# B2. İz sürme tablosu (cevap)
# ---------------------------------------------------------------
# a = 7            -> a=7
# b = 2            -> a=7,  b=2
# c = a * b        -> a=7,  b=2,  c=14
# a = c - a        -> a=7,  b=2,  c=14   (14 - 7 = 7)
# b = a + b        -> a=7,  b=9,  c=14
#
# Son değerler: a = 7, b = 9, c = 14
# Dikkat: "a = c - a" satırında sağ taraf ÖNCE hesaplanır (14-7=7),
# sonra sonuç a'ya yazılır. Bu yüzden a değişmemiş gibi görünür.


# ---------------------------------------------------------------
# C1. Isınma
# ---------------------------------------------------------------
def c1_merhaba():
    name = input("Adın: ")
    print("Merhaba " + name + ", veritabanı dersine hoş geldin!")


# ---------------------------------------------------------------
# C2. Tek mi çift mi
# ---------------------------------------------------------------
def c2_tek_cift():
    number = int(input("Bir tam sayı gir: "))
    if number % 2 == 0:
        print("çift")
    else:
        print("tek")


# ---------------------------------------------------------------
# C3. Batarya durumu
# ---------------------------------------------------------------
def c3_batarya():
    battery_level = int(input("Batarya seviyesi (0-100): "))
    if battery_level < 20:
        print("Kritik")
    elif battery_level < 60:
        print("Düşük")
    else:
        print("Normal")
    # Not: Sıra önemli. 15 değeri hem 20'den hem 60'tan küçük,
    # ama ilk tutan koşul kazandığı için "Kritik" yazar.
    # Hafta 5'te SQL'in CASE WHEN yapısında aynı kuralı göreceksin.


# ---------------------------------------------------------------
# C4. Not harfe çevirme
# ---------------------------------------------------------------
def c4_harf_notu():
    score = int(input("Not (0-100): "))
    if score >= 90:
        grade = "AA"
    elif score >= 80:
        grade = "BA"
    elif score >= 70:
        grade = "BB"
    elif score >= 60:
        grade = "CB"
    elif score >= 50:
        grade = "CC"
    else:
        grade = "FF"
    print(grade)
    # Büyükten küçüğe sıralamak kodu kısaltır: her koşulda
    # sadece alt sınırı kontrol etmek yeterli olur.


# ---------------------------------------------------------------
# C5. Üç sayının en büyüğü (max kullanmadan)
# ---------------------------------------------------------------
def c5_en_buyuk():
    a = float(input("1. sayı: "))
    b = float(input("2. sayı: "))
    c = float(input("3. sayı: "))

    if a >= b and a >= c:
        largest = a
    elif b >= a and b >= c:
        largest = b
    else:
        largest = c

    print("En büyük:", largest)

    # Alternatif çözüm: adım adım karşılaştırma.
    # largest = a
    # if b > largest:
    #     largest = b
    # if c > largest:
    #     largest = c
    # Bu yaklaşım dört, beş, yüz sayıya da genişler: Hafta 2'de
    # döngüyle bunu yapacağız.


# ---------------------------------------------------------------
# C6. Robot kontrolü
# ---------------------------------------------------------------
def c6_robot_kontrol():
    status = input("Durum (active / charging / offline): ")
    battery_level = int(input("Batarya seviyesi: "))

    if status == "offline":
        print("Robot kapalı, işlem yok")
    elif status == "charging":
        print("Şarjda, bekle")
    elif battery_level < 20:
        print("Şarja gönder")
    else:
        print("Göreve devam")

    # Neden böyle sıraladık: "offline" ve "charging" durumlarında
    # batarya seviyesine hiç bakmaya gerek yok. Önce bu iki durumu
    # eleyince, kalan her şey zaten "active" demek olur ve kod
    # sadeleşir. İç içe if yazmaya gerek kalmadı.


if __name__ == "__main__":
    # Denemek istediğin fonksiyonun başındaki # işaretini kaldır.
    # c1_merhaba()
    # c2_tek_cift()
    c3_batarya()
    # c4_harf_notu()
    # c5_en_buyuk()
    # c6_robot_kontrol()
