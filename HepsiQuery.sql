Use veterinerdb
CREATE TABLE klinik_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    klinikAd VARCHAR(30) NOT NULL,
    konumu VARCHAR(120) NOT NULL,
    bolge VARCHAR(60) NOT NULL,
    mail VARCHAR(60) NOT NULL,
    telNo VARCHAR(11) NOT NULL,
);

CREATE TABLE personel_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    klinikId INT NOT NULL,
    ad VARCHAR(20) NOT NULL,
    soyad VARCHAR(20) NOT NULL,
    dogumTarihi DATE,
    unvan VARCHAR(50) NOT NULL,
    maas INT NOT NULL,
    girisTarihi DATE NOT NULL,
    mail VARCHAR(60),
    telNo VARCHAR(11) NOT NULL,
    FOREIGN KEY (klinikId) REFERENCES klinik_bilgi(id)
)

CREATE TABLE sahip_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ad VARCHAR(20) NOT NULL,
    soyad VARCHAR(20) NOT NULL,
    evAdresi VARCHAR(120) NOT NULL,
    mail VARCHAR(60),
    telNo VARCHAR(11) NOT NULL,
)

CREATE TABLE musteri_faturalari (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    musteriId INT NOT NULL,
    faturaDetay VARCHAR(30) NOT NULL,
    tutar FLOAT NOT NULL,
    odemeTuru VARCHAR(20),
    kesimTarihi DATE NOT NULL,
    FOREIGN KEY (musteriId) REFERENCES sahip_bilgi(id)
)

CREATE TABLE hasta_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    sahipId INT NOT NULL,
    veterinerId INT NOT NULL,
    tur VARCHAR(30) NOT NULL,
    cins VARCHAR(30) NOT NULL,
    ad VARCHAR(30) NOT NULL,
    sonGelmeTarihi DATE,
    yas INT NOT NULL,
    agirlik FLOAT NOT NULL,
    kisirlikDurumu VARCHAR(1) NOT NULL,
    cipDurumu VARCHAR(1) NOT NULL,
    FOREIGN KEY (sahipId) REFERENCES sahip_bilgi(id),
    FOREIGN KEY (veterinerId) REFERENCES personel_bilgi(id)
)

CREATE TABLE hizmet_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	hastaId INT NOT NULL,
	hizmetAd VARCHAR(30) NOT NULL,
	hizmetTarih DATE NOT NULL,
	FOREIGN KEY (hastaId) REFERENCES hasta_bilgi(id),
)

CREATE TABLE hastalik_gecmisi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    hastaId INT NOT NULL,
    hastalikAd VARCHAR(120) NOT NULL,
    durum VARCHAR(30) NOT NULL,
    tehsisTarihi DATE NOT NULL,
    FOREIGN KEY (hastaId) REFERENCES hasta_bilgi(id)
)

CREATE TABLE Asi_Test_Bilgileri(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    hastaId INT NOT NULL,
	testTur varchar(50),
	testSonuc varchar(50),
	AsiDozaj float,
	AsiTur varchar(50),
	Tarih date not null
)
--INSERT INTO asi_test_bilgileri (id, hastaId, testTur , testSonuc , AsiDozaj , AsiTur , Tarih) VALUES 

CREATE TABLE kategori (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 kategoriAd VARCHAR(120) NOT NULL,
)

CREATE TABLE tedarikci_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    ad VARCHAR(60) NOT NULL,
    konum VARCHAR(160) NOT NULL,
    mail VARCHAR(60),
    telNo VARCHAR(11) NOT NULL
)

CREATE TABLE urun_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    kategoriId INT NOT NULL,
    tedarikId INT NOT NULL,
    UrunAd VARCHAR(120) NOT NULL,
    urunFiyat FLOAT NOT NULL,
    FOREIGN KEY (kategoriId) REFERENCES kategori(id),
    FOREIGN KEY (tedarikId) REFERENCES tedarikci_bilgi(id)
)

CREATE TABLE rel_urun(
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
klinikId INT NOT NULL,
urunId INT NOT NULL,
urunAdet INT NOT NULL,
FOREIGN KEY (klinikId) REFERENCES klinik_bilgi(id),
FOREIGN KEY (urunId) REFERENCES urun_bilgi(id),
)

CREATE TABLE urun_fatura_bilgi (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    urunId INT NOT NULL,
	ad VARCHAR(60) NOT NULL,
	soyad VARCHAR(60) NOT NULL,
    tutar FLOAT NOT NULL,
    odemeTuru VARCHAR(20),
    topAdet INT NOT NULL,
    kesimTarihi DATE NOT NULL,
    FOREIGN KEY (urunId) REFERENCES urun_bilgi(id)
)

--KLINIK BILGILERI
INSERT INTO klinik_bilgi (klinikAd, konumu, bolge, mail, telNo)
VALUES ('AgdagVet', '�stanbul', 'Esenyurt', 'info@agdagvet.com.tr','05334073133')
INSERT INTO klinik_bilgi ( klinikAd, konumu, bolge, mail, telNo)
VALUES ('KurtVet', 'Ankara', 'Ke�i�ren', 'info@kurtVet.com.tr','05334077542')
INSERT INTO klinik_bilgi ( klinikAd, konumu, bolge, mail, telNo)
VALUES ('KayaVet', '�zmir', 'Bornova', 'info@kayaVet.com.tr','05334075323')
INSERT INTO klinik_bilgi (klinikAd, konumu, bolge, mail, telNo)
VALUES ('YildizVet', 'Samsun', 'Atakum', 'info@yildizvet.com.tr' ,'05334073654')
INSERT INTO klinik_bilgi (klinikAd, konumu, bolge, mail, telNo)
VALUES ('OzturkVet', 'Antalya', 'Konyaalt�', 'info@yildizvet.com.tr' , '05334073689')

--------------------PERSONEL BILGILERI-------------------
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'�ilem','Akay','1998-8-5','Veteriner Hekim',24000,'2009-7-26','ak�ilem@gmail.com','05491645134');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Erna','Arikan','1994-4-14','Veteriner Cerrah',22000,'2015-9-6','erarikan@gmail.com','05487695132');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Mustafa','Arif','2002-12-2','Veteriner Hekim',24000,'2022-1-8','muarif@gmail.com','05761243657');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Ali','Balta','1999-11-30','Veteriner Di� Hekimi',20000,'2019-5-22','albalta@gmail.com','05431246597');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Co�kun','Ba�ar','1995-3-26','Veteriner Beslenme Uzman�',21000,'2014-11-10','cobasar@gmail.com','05461237514');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Bensu','Belge','1996-7-17','Veteriner Di� Hekimi',20000,'2016-08-25','bebelge@gmail.com','05431267854');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Mehmet','Bural','1994-12-24','Veteriner Hekim',24000,'2018-6-18','mebural@gmail.com','05463219658');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(5,'O�uzcan','�a�an','1998-11-9','Veteriner Cerrah',22000,'2019-7-30','ogcagan@gmail.com','05462158765');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(2,'Elif','�ark','1987-5-31','Veteriner Hekim',24000,'2008-5-8','elcark@gmail.com','05461784593');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Sena','�elik','1989-7-16','Veteriner Hekim',24000,'2014-4-10','secelik@gmail.com','05436257890');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'G�rb�z','�uhadar','1992-3-10','Veteriner Beslenme Uzman�',24000,'2015-9-16','g�cuhadar@gmail.com','05461248752');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Ezgin','Davuto�lu','1985-8-22','Veteriner Cerrah',22000,'2015-7-24','ezdavut@gmail.com','05481246359');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Mira�','Dikba�','1994-3-3','Veteriner Di� Hekimi',20000,'2016-5-10','midik@gmail.com','05497643120');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(5,'Firuze','Co�an','1992-7-24','Veteriner Di� Hekimi',21000,'2017-9-17','fircosan@gmail.com','05431254678');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Alya','Dur','1984-3-4','Veteriner Cerrah',22000,'2008-10-24','aldur@gmail.com','05431246597');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Bahar','Erkovan','1994-4-10','Veteriner Cerrah',22000,'2014-6-2','baher@gmail.com','05431246785');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Melike','G�r�r','1995-9-23','Veteriner Beslenme Uzman�',21000,'2015-9-12','melg�r@gmail.com','05491325467');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Katya','Kudu','1990-12-19','Veteriner Beslenme Uzman�',21000,'2016-5-5','katdu@gmail.com','05462348752');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'H�seyin','Y�ld�z','1992-3-8','Veteriner Beslenme Uzman�',21000,'2013-9-9','h�y�l@gmail.com','05432645785');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Zehra','Meng��','1995-11-25','Veteriner Di� Hekimi',20000,'2018-12-30','zehmen@gmail.com','05461235203');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Barbaros','Mumcu','1980-12-7','CEO',50000,'2010-1-9','barbmum@gmail.com','05842134562');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Melike','Mas�r','1994-4-10','Sekreter',12000,'2020-5-4','memas�r@gmail.com','05421326587');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'�lker','Oduncu','1993-6-17','Sekreter',12000,'2023-6-3','�lodun@gmail.com','05421023465');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'�zel','�nen','1990-8-23','Sekreter',12000,'2022-12-3','iz�ne@gmail.com','05423120451');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Ebru','�zdel','1989-3-24','Sekreter',12000,'2021-7-9','eb�z@gmail.com','05421325420');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'�lay','�zg�l','1999-11-30','Sekreter',12000,'2020-6-5','il�z@gmail.com','05423164204');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Melis','Mezarc�','1995-9-23','Patron',26000,'2015-8-5','melmez@gmail.com','05431234562');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'An�l','�zdil','1990-12-1','Patron',26000,'2014-5-9','an�z@gmail.com','05531234513');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Merve','�z�berk','1999-5-8','Patron',26000,'2013-2-3','mer�z@gmail.com','05632514852');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Zeynep','Po�an','1986-2-20','Patron',26000,'2016-9-19','zeypo@gmail.com','05632145784');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Ay�e','Sar','1993-4-10','Patron',26000,'2015-9-10','aysar@gmail.com','05421234658');

-----------------------SAH�P B�LG�LER�-------------------------
INSERT INTO sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Aylin','Y�lmaz','�stanbul, Be�ikta� Mahallesi, Barbaros Caddesi No:15','aylinyilmaz@gmail.com','05551234567');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Kaan','�ahin','�zmir, Alsancak Mahallesi, K�br�s �ehitleri Caddesi No:23','kaansahin@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Elif','�elik','Antalya, Lara Mahallesi, Kundu Caddesi No:7','elifcelik@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Bar��','Kaya','Samsun, Atakum Mahallesi, Sahil Yolu No:45','bariskaya@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Zeynep','Aksoy','Ankara, K�z�lay Mahallesi, Atat�rk Bulvar� No:30','zeynepaksoy@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Emre','Demir','�stanbul, Kad�k�y Mahallesi, Moda Caddesi No:12','emredemir@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Gizem','�zt�rk','�zmir, Bornova Mahallesi, Ege Caddesi No:18','gizemozturk@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Caner','Arslan','Antalya, Konyaalt� Mahallesi, 100. Y�l Bulvar� No:5','canerarslan@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Melis','G�r','Samsun, �lkad�m Mahallesi, Gazi Caddesi No:33','melisgur@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Berkay','Y�ld�z','Ankara, Bah�elievler Mahallesi, 7. Cadde No:21','berkayyildiz@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Asl�han','�zdemir','�stanbul, �sk�dar Mahallesi, Ba�larba�� Caddesi No:8','aslihanozdemir@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Burak','Top�u','�zmir, Kar��yaka Mahallesi, Mithatpa�a Caddesi No:16','buraktopcu@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ceren','Korkmaz','Antalya, Muratpa�a Mahallesi, �a�layan Bulvar� No:42','cerenkorkmaz@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('O�uzhan','K�l��','Samsun, Atakum Mahallesi, Sahil Yolu No:28','oguzhankilic@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Selin','Demirci','Ankara, �ankaya Mahallesi, Tunal� Hilmi Caddesi No:11','selindemirci@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Tolga','Avc�','�stanbul, Beylikd�z� Mahallesi, Bar�� Bulvar� No:3','tolgaavci@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ece','Ko�ak','�zmir, Gaziemir Mahallesi, Gazi Caddesi No:37','ecekokak@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Furkan','Ak�n','Antalya, Kepez Mahallesi, 5. Cadde No:14','furkanakin@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Dilara','T�rk','Samsun, �lkad�m Mahallesi, Cumhuriyet Caddesi No:25','dilaraturk@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Deniz','Yaman','Ankara, Etimesgut Mahallesi, Y�ld�r�m Beyaz�t Caddesi No:9','denizyaman@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Burcu','�en','�stanbul, �i�li Mahallesi, Abide-i H�rriyet Caddesi No:36','burcusen@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Serkan','G�k','�zmir, Karaba�lar Mahallesi, Adnan Menderes Bulvar� No:22','serkangok@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Seda','Ayd�n','Antalya, Lara Mahallesi, Fener Caddesi No:13','sedaaydin@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Onur','Yal��n','Samsun, Atakum Mahallesi, Atat�rk Bulvar� No:17','onuryalcin@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Yasemin','Y�ld�r�m','Ankara, Ke�i�ren Mahallesi, 1. Cadde No:29','yaseminyildirim@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('H�seyin','�zbek','�stanbul, �mraniye Mahallesi, Libadye Caddesi No:31','huseyinozbek@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ay�e','Toprak','�zmir, Buca Mahallesi, Fevzi �akmak Caddesi No:14','aysetoprak@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Emirhan','Y�ld�z','Antalya, Konyaalt� Mahallesi, Lara Caddesi No:5','emirhanyildiz@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('�eyma','Ta�k�n','Samsun, �lkad�m Mahallesi, Gazi Caddesi No:20','seymataskin@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Baran','G�ne�','Ankara, Yenimahalle Mahallesi, Fatih Caddesi No:24','barangunes@gmail.com','05553456789');

----------------------MUSTER� FATURALARI--------------------------------------

select * from sahip_bilgi

INSERT INTO musteri_faturalari (musteriId, faturaDetay, tutar, kesimTarihi, odemeTuru)
VALUES
(1, 'Veteriner Kontrol�', 150.50, '2023-01-01', 'Kredi Kart�'),
(2, 'A�� Uygulamas�', 75.25, '2023-01-02', 'Nakit'),
(3, 'Parazit Tedavisi', 200.00, '2023-01-03', 'Banka Havalesi'),
(4, 'Operasyon Masraf�', 120.75, '2023-01-04', 'Nakit'),
(5, 'G�z Muayenesi', 50.30, '2023-01-05', 'Kredi Kart�'),
(6, 'Kulak Temizleme', 80.00, '2023-01-06', 'Nakit'),
(7, 'Di� Bak�m�', 170.25, '2023-01-07', 'Banka Havalesi'),
(8, 'R�ntgen �ekimi', 220.50, '2023-01-08', 'Nakit'),
(9, 'Kan Testi', 130.00, '2023-01-09', 'Kredi Kart�'),
(10, 'T�rnak Kesimi', 60.75, '2023-01-10', 'Banka Havalesi'),
(11, 'A�� Uygulamas�', 90.25, '2023-01-11', 'Nakit'),
(12, 'Operasyon Masraf�', 180.50, '2023-01-12', 'Kredi Kart�'),
(13, 'Kulak Temizleme', 210.75, '2023-01-13', 'Banka Havalesi'),
(14, 'G�z Muayenesi', 110.00, '2023-01-14', 'Nakit'),
(15, 'Di� Bak�m�', 70.30, '2023-01-15', 'Kredi Kart�'),
(16, 'A�� Uygulamas�', 85.00, '2023-01-16', 'Banka Havalesi'),
(17, 'Veteriner Kontrol�', 160.25, '2023-01-17', 'Nakit'),
(18, 'R�ntgen �ekimi', 230.50, '2023-01-18', 'Kredi Kart�'),
(19, 'Operasyon Masraf�', 145.00, '2023-01-19', 'Nakit'),
(20, 'G�z Muayenesi', 65.75, '2023-01-20', 'Banka Havalesi'),
(21, 'Di� Bak�m�', 95.75, '2023-01-21', 'Kredi Kart�'),
(22, 'T�rnak Kesimi', 190.00, '2023-01-22', 'Banka Havalesi'),
(23, 'G�z Muayenesi', 245.25, '2023-01-23', 'Nakit'),
(24, 'Veteriner Kontrol�', 125.50, '2023-01-24', 'Kredi Kart�'),
(25, 'A�� Uygulamas�', 80.30, '2023-01-25', 'Banka Havalesi'),
(26, 'Parazit Tedavisi', 100.00, '2023-01-26', 'Nakit'),
(27, 'R�ntgen �ekimi', 175.25, '2023-01-27', 'Kredi Kart�'),
(28, 'Kan Testi', 260.50, '2023-01-28', 'Banka Havalesi'),
(29, 'Veteriner Kontrol�', 135.00, '2023-01-29', 'Nakit'),
(30, 'A�� Uygulamas�', 70.75, '2023-01-30', 'Kredi Kart�'),
(31, 'Di� Bak�m�', 95.75, '2023-02-01', 'Kredi Kart�'),
(32, 'T�rnak Kesimi', 190.00, '2023-02-02', 'Banka Havalesi'),
(33, 'Veteriner Kontrol�', 245.25, '2023-02-03', 'Nakit'),
(34, 'A�� Uygulamas�', 125.50, '2023-02-04', 'Kredi Kart�'),
(35, 'Parazit Tedavisi', 80.30, '2023-02-05', 'Banka Havalesi'),
(36, 'Di� Bak�m�', 100.00, '2023-02-06', 'Nakit'),
(37, 'T�rnak Kesimi', 175.25, '2023-02-07', 'Kredi Kart�'),
(38, 'Veteriner Kontrol�', 260.50, '2023-02-08', 'Banka Havalesi'),
(39, 'A�� Uygulamas�', 135.00, '2023-02-09', 'Nakit'),
(40, 'Parazit Tedavisi', 70.75, '2023-02-10', 'Kredi Kart�');

----------------HASTA B�LG�LER�--------------------

INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (1,5,'K�pek','Golden Retriever','Max','2021-6-15',3,5.8,'H','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (2,14,'Kedi','Scottish Fold','Luna','2021-4-20',1,2.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (3,14,'K�pek','Labrador Retriever','Bella','2021-7-5',2,4.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (4,14,'Kedi','British Shorthair','Charlie','2021-8-10',3,3.5,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (5,3,'K�pek','German Shepherd','Rocky','2021-9-15',4,6.9,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (6,3,'Kedi','Persian','Lucy','2021-3-20',2,2.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (6,3,'K�pek','French Bulldog','Cooper','2021-10-5',1,3.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (7,3,'Kedi','Siamese','Oliver','2021-11-10',3,4.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (8,8,'K�pek','Poodle','Milo','2021-12-15',2,5.8,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (9,8,'Kedi','Maine Coon','Simba','2022-1-20',2,4.6,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (10,8,'K�pek','Bulldog','Maximus','2022-2-5',3,7.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (10,9,'Kedi','Ragdoll','Lily','2022-3-10',1,3.3,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (11,9,'K�pek','Siberian Husky','Luna','2022-4-15',2,5.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (12,7,'Kedi','Sphynx','Milo','2022-5-20',3,2.9,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (13,7,'K�pek','Rottweiler','Rocko','2022-6-5',4,8.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (14,12,'Kedi','Bengal','Leo','2022-7-10',2,3.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (15,12,'K�pek','Chihuahua','Bella','2022-8-15',1,2.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (15,12,'Kedi','Norwegian Forest','Mia','2022-9-20',3,4.1,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (16,12,'K�pek','Boxer','Max','2022-10-5',2,6.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (17,13,'Kedi','Persian','Milo','2022-11-10',2,3.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (18,13,'K�pek','Labrador Retriever','Charlie','2022-12-15',3,5.9,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (19,13,'Kedi','Siamese','Oliver','2023-1-20',1,4.2,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (20,11,'K�pek','Golden Retriever','Maximus','2023-2-5',2,7.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (21,11,'Kedi','Scottish Fold','Luna','2023-3-10',3,3.1,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (22,11,'K�pek','German Shepherd','Rocky','2023-4-15',4,6.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'Kedi','British Shorthair','Lucy','2023-5-20',2,2.9,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'K�pek','French Bulldog','Cooper','2023-6-5',1,3.6,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'Kedi','Maine Coon','Oliver','2023-7-10',3,4.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (24,4,'K�pek','Poodle','Milo','2023-8-15',2,5.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (25,4,'Kedi','Ragdoll','Lily','2023-9-20',1,3.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (26,4,'K�pek','Siberian Husky','Luna','2023-10-5',2,5.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (26,18,'Kedi','Sphynx','Milo','2023-11-10',3,2.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (27,18,'K�pek','Rottweiler','Rocko','2023-12-15',4,8.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (28,18,'Kedi','Bengal','Leo','2023-1-20',2,3.5,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,20,'K�pek','Chihuahua','Bella','2023-2-5',1,2.7,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,20,'Kedi','Norwegian Forest','Mia','2023-3-10',3,4.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,17,'K�pek','Boxer','Max','2023-4-15',2,6.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (30,17,'Kedi','Persian','Milo','2023-5-20',2,3.2,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (30,17,'K�pek','Labrador Retriever','Charlie','2023-6-5',3,5.7,'E','E')
----------------------H�ZMET B�LG�----------------------------------------
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (34, 'Muayene ve Te�his', '08-12-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (12, 'Cerrahi M�dahaleler',  '03-25-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (3, 'Laboratuvar Testleri',  '11-08-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (26, 'Hasta Bak�m� ve Tedavi', '06-17-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (29, 'Di� Bak�m�', '02-04-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (7, 'Dermatoloji Hizmetleri', '09-30-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (23, 'Ultrason', '05-21-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (19, 'Yara Bak�m�', '12-11-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (14, '�� Hastal�klar',  '07-02-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (6, 'Beslenme Dan��manl���',  '01-19-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (8, 'A��lar ve Ba����klama', '10-14-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (17, 'Davran�� Dan��manl���',  '04-07-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (32, 'A��lar ve Ba����klama',  '11-26-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (9, 'Kanser Tedavisi',  '06-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (38, 'Anestezi ve A�r� Kontrol�',  '02-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (5, 'Beslenme Dan��manl���',  '09-15-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (36, 'Anestezi ve A�r� Kontrol�',  '05-05-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (22, 'G�z Sa�l��� Hizmetleri', '12-27-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (29, 'Beslenme Dan��manl���',  '07-08-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (20, 'Alerji Testleri',  '01-31-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (1, 'R�ntgen ve G�r�nt�leme',  '10-23-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (11, 'A�r� Y�netimi',  '04-15-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (4, 'Ortopedik Cerrahi',  '11-04-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (39, 'Davran�� Dan��manl���',  '06-28-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (30, 'Beslenme Dan��manl���',  '03-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (13, 'Ortopedik Cerrahi',  '08-02-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (31, 'R�ntgen ve G�r�nt�leme',  '07-11-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (16, 'N�roloji Hizmetleri',  '12-19-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (25, 'Beslenme Dan��manl���',  '02-01-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (2, 'G�z Sa�l��� Hizmetleri', '09-20-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (27, 'Evcil Hayvan Sa�l�k E�itimi',  '05-13-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (18, 'R�ntgen ve G�r�nt�leme',  '01-05-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (21, 'Ultrason', '10-30-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (15, 'N�roloji Hizmetleri',  '04-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (10, 'Ultrason',  '04-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (28, 'Evcil Hayvan Sa�l�k E�itimi',  '06-03-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (35, 'G�z Sa�l��� Hizmetleri', '06-03-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (24, 'Kanser Tedavisi',  '02-16-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (37, 'Kanser Tedavisi', '09-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (33, 'Alerji Testleri', '07-24-2023')
----------------------HASTALIK GECMISI----------------------------------------

INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (1,'�shal','Kontrol Alt�nda','2021-5-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (2,'Kulak Enfeksiyonu','Stabil','2021-6-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (8,'Alerji','Stabil','2021-7-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'G�z Enfeksiyonu','Kontrol Alt�nda','2021-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (5,'Solunum Problemi','Kontrol Alt�nda','2021-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'Yara �yile�mesi','Kontrol Alt�nda','2021-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (7,'Kemik K�r���','Kontrol Alt�nda','2021-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Karaci�er Problemi','Stabil','2021-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (4,'B�brek �ltihab�','Kontrol Alt�nda','2022-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (10,'Kalp Rahats�zl���','Kritik','2022-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Mide �lseri','Kontrol Alt�nda','2022-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Kemik �ltihab�','Kontrol Alt�nda','2022-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (13,'Kulak Enfeksiyonu','Kontrol Alt�nda','2022-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (14,'Alerji','Stabil','2022-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (15,'G�z Enfeksiyonu','Kontrol Alt�nda','2022-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (16,'Solunum Problemi','Kritik','2022-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Yara �yile�mesi','Kontrol Alt�nda','2022-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (18,'Kemik K�r���','Kontrol Alt�nda','2022-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Karaci�er Problemi','Stabil','2022-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (20,'B�brek �ltihab�','Kontrol Alt�nda','2022-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (21,'Kalp Rahats�zl���','Kontrol Alt�nda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (22,'Mide �lseri','Kontrol Alt�nda','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Kemik �ltihab�','Kritik','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (24,'Kulak Enfeksiyonu','Kontrol Alt�nda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (25,'Alerji','Kontrol Alt�nda','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (26,'G�z Enfeksiyonu','Stabil','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (27,'Solunum Problemi','Kontrol Alt�nda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Yara �yile�mesi','Stabil','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Kemik K�r���','Kontrol Alt�nda','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Karaci�er Problemi','Kritik','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'Halsizlik','Kontrol Alt�nda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (2,'Kulak Enfeksiyonu','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (8,'Alerji','Stabil','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'G�z Enfeksiyonu','Kontrol Alt�nda','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Solunum Problemi','Kontrol Alt�nda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Yara �yile�mesi','Kontrol Alt�nda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (7,'Kemik K�r���','Kontrol Alt�nda','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Karaci�er Problemi','Stabil','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (4,'B�brek �ltihab�','Kontrol Alt�nda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (10,'Kalp Rahats�zl���','Kritik','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Mide �lseri','Kontrol Alt�nda','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Kemik �ltihab�','Kontrol Alt�nda','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (13,'Kulak Enfeksiyonu','Kontrol Alt�nda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (14,'Alerji','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (15,'G�z Enfeksiyonu','Kontrol Alt�nda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (16,'Solunum Problemi','Kritik','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Yara �yile�mesi','Kontrol Alt�nda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (25,'Kemik K�r���','Kontrol Alt�nda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Karaci�er Problemi','Stabil','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (20,'B�brek �ltihab�','Kontrol Alt�nda','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Kalp Rahats�zl���','Kontrol Alt�nda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (26,'Mide �lseri','Kontrol Alt�nda','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Kemik �ltihab�','Kritik','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (24,'Kulak Enfeksiyonu','Kontrol Alt�nda','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Alerji','Kontrol Alt�nda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (22,'G�z Enfeksiyonu','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Solunum Problemi','Kontrol Alt�nda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Yara �yile�mesi','Stabil','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Kemik K�r���','Kontrol Alt�nda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (27,'Karaci�er Problemi','Kritik','2023-4-15');



-------------ASI_TEST_BILGILERI------------------------
ALTER TABLE Asi_Test_Bilgileri ADD CONSTRAINT fk_hasta FOREIGN KEY (hastaId) REFERENCES hasta_bilgi(id);
select * from hasta_bilgi
INSERT INTO Asi_Test_Bilgileri (hastaId, testTur, testSonuc, AsiDozaj, AsiTur, Tarih)
VALUES
  (1, 'Kan Testi', 'Normal', 0.3, 'Kuduz A��s�', '2023-01-01'),
  (1, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-01-05'),
  (2, 'Kan Testi', 'Y�ksek', 0.6, 'K�pek Distemper A��s�', '2023-02-10'),
  (2, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-02-15'),
  (3, 'Kan Testi', 'Normal', 0.4, 'Kedi Panleukopenia A��s�', '2023-03-20'),
  (3, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-03-25'),
  (4, 'Kan Testi', 'Y�ksek', 0.1, 'K�pek Parvovirus A��s�', '2023-04-05'),
  (4, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-04-10'),
  (5, 'Kan Testi', 'Normal', 0.7, 'K�pek Leptospirosis A��s�', '2023-05-15'),
  (5, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-05-20'),
  (6, 'Kan Testi', 'Y�ksek', 0.4, 'Kuduz A��s�', '2023-06-01'),
  (6, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-06-05'),
  (7, 'Kan Testi', 'Normal', 0.3, 'K�pek Distemper A��s�', '2023-07-10'),
  (7, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-07-15'),
  (8, 'Kan Testi', 'Y�ksek', 0.7, 'Kedi Panleukopenia A��s�', '2023-08-20'),
  (8, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-08-25'),
  (9, 'Kan Testi', 'Normal', 0.4, 'K�pek Parvovirus A��s�', '2023-09-30'),
  (9, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-10-05'),
  (10, 'Kan Testi', 'Y�ksek', 0.3, 'K�pek Leptospirosis A��s�', '2023-11-10'),
  (10, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-11-15')


-------------------------KATEGORILER------------------------
INSERT INTO kategori (kategoriAd) VALUES ('Veteriner �la�lar�')
INSERT INTO kategori (kategoriAd) VALUES ('Mama')
INSERT INTO kategori (kategoriAd) VALUES ('Oyuncaklar')
INSERT INTO kategori (kategoriAd) VALUES ('K�pek Yataklar�')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi T�rmalama Tahtalar�')
INSERT INTO kategori (kategoriAd) VALUES ('�ampuan')
INSERT INTO kategori (kategoriAd) VALUES ('F�r�a')
INSERT INTO kategori (kategoriAd) VALUES ('Tasma ve Kay��')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Kumu ve Tuvaletleri')
INSERT INTO kategori (kategoriAd) VALUES ('Evcil Hayvan Bak�m �r�nleri')
INSERT INTO kategori (kategoriAd) VALUES ('Veteriner Kitaplar�')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Yataklar�')
INSERT INTO kategori (kategoriAd) VALUES ('K�pek E�itim Malzemeleri')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Ta��ma �antalar�')
INSERT INTO kategori (kategoriAd) VALUES ('K�pek Sa�l�k Kontrolleri')

-----------TEDARIKCI----------------

INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Aslan T�bbi �r�nler', '�stanbul, Merkez Mahallesi, Ticaret Caddesi No:25', 'aslan_t�p_urunleri@info.com', '5551790034')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Kaya Sa�l�k �r�nleri', 'Ankara, K�z�lay Mahallesi, Sanayi Bulvar� No:18', 'kaya_saglik@info.com', '5556310006')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Panda Oyuncak��l�k', '�zmir, Alsancak Mahallesi, Liman Caddesi No:10', 'panda_oyuncakcilik@info.com', '5559810035')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Samsun Pet Mamalar�', 'Samsun, Osmangazi Mahallesi, Organize Sanayi B�lgesi No:7', 'samsun_pet_mamalari@info.com', '5554180016')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Antalya Pet Tekstil', 'Antalya, Muratpa�a Mahallesi, Turizm Bulvar� No:12', 'antalya_pet_tekstil@info.com', '5551870007')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('�stanbul Pet G�da', '�stanbul, Cumhuriyet Mahallesi, Bankalar Caddesi No:32', 'istanbul_pet_gida@info.com', '5551870037')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Ankara Pet Ev �r�nleri', 'Ankara, �ankaya Mahallesi, Kurtulu� Caddesi No:30', 'ankara_pet_ev_urunleri@info.com', '5559071006')


--------------------URUNLER--------------
INSERT INTO urun_bilgi (kategoriId, tedarikId, urunAd, urunFiyat) VALUES
    (1, 1, 'Saral Calm 5 Htp Sakinle�tirici �la�', 25.99),
    (2, 1, 'Reflex Yeti�kin Tavuklu Renkli Kedi Mamas�', 35.99),
    (3, 1, 'Elastik Kedi Oyun Oltas�', 10.99),
    (6, 1, 'Metapet Kedi Bit Kar��t� �ampuan', 15.99),
    (2, 2, 'Royal Canin Sterilised K�s�rla�t�r�lm�� Kedi Mamas�', 30.99),
    (3, 2, 'BioFeline Kedi Nanesi Oyun Topu', 12.99),
    (4, 2, 'MOLMEKS K�pek Yata��', 45.99),
    (5, 2, 'hayystore Kedi T�rmalama Tahtas�', 20.99),
    (6, 3, 'PetPlus K�pek �ampuan�', 18.99),
    (7, 3, 'FurryFriends K�pek T�y F�r�as�', 8.99),
    (8, 3, 'PawParadise K�pek Tasma', 14.99),
    (9, 3, 'CatComfort Kokulu Kedi Kumu', 22.99),
    (10, 4, 'VetCare Kulak Temizleme S�v�s�', 9.99),
    (11, 4, 'VetLibrary K�pek E�itimi Kitab�', 27.99),
    (12, 4, 'CozyCats Yumu�ak Kedi Yata��', 34.99),
    (13, 4, 'TrainMaster Clicker E�itim Aleti', 6.99),
    (14, 5, 'PetPorter Kedi Ta��ma �antas�', 29.99),
    (15, 5, 'HealthGuard K�pek Sa�l�k Seti', 42.99),
    (1, 5, 'VetMed K�pek Antibiyotik', 19.99),
    (2, 5, 'HappyPaws Puppy K�pek Mamas�', 23.99),
    (14, 6, 'SoftCat Kedi Seyahat �antas�', 17.99),
    (15, 6, 'CheckUpMate K�pek Sa�l�k Kontrol Cihaz�', 54.99),
    (1, 6, 'PetRx Kedi Antibiyotik', 21.99),
    (2, 6, 'NutriMax Senior K�pek Mamas�', 28.99),
    (1, 7, 'HealthGuard Kedi �drar Yolu Enfeksiyonu �la�', 32.99),
    (2, 7, 'ProVita Adult K�pek Mamas�', 38.99),
    (3, 7, 'PawJoy K�pek Kemik Oyuncak', 14.99),
    (6, 7, 'HappyPets Kedi Mantar Kar��t� �ampuan', 19.99);

---------------REL_URUN-----------------
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (3,6,0);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,7,94);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (5,9,57);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,20,60);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,5,31);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,8,40);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,12,100);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,13,10);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,19,50);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (5,21,65);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,24,30);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,23,54);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (3,15,10);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,13,90);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (3,11,20);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,27,70);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,22,400);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (5,26,50);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,2,60);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,3,100);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,4,0);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,25,43);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (3,28,32);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (2,14,87);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (1,10,79);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (3,16,73);
INSERT INTO rel_urun (klinikId , urunId,urunAdet) VALUES (4,17,55);

--------URUN_FATURA_BILGI-------------------
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (2,300,'Erna','Arikan',140.00,'2023-12-14','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (3,900,'Mustafa','Arif',200.00,'2023-4-19','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (4,1000,'Ali','Balta',210.00,'2023-6-10','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (5,400,'Co�kun','Ba�ar',180.00,'2023-3-25','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (6,900,'Bensu','Belge',190.00,'2023-1-26','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (7,700,'Mehmet','Bural',170.00,'2023-11-19','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (8,300,'O�uzcan','�a�an',2300.00,'2023-2-8','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (9,500,'Elif','�ark',200.00,'2023-10-13','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (10,1200,'Sena','�elik',160.00,'2023-9-5','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (11,300,'G�rb�z','�uhadar',140.00,'2023-3-6','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (12,900,'Ezgin','Davuto�lu',180.00,'2023-12-2','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (13,500,'Mira�','Dikba�',180.00,'2023-2-23','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (14,600,'Firuze','Co�an',210.00,'2023-6-16','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (15,400,'Alya','Dur',200.00,'2023-1-8','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (16,200,'Bahar','Erkovan',210.00,'2022-12-12','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (17,500,'Melike','G�r�r',240.00,'2022-12-12','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (18,1000,'Katya','Kudu',190.00,'2022-8-9','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (19,900,'Zehra','Meng��',170.00,'2022-10-25','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (20,800,'Barbaros','Mumcu',180.00,'2022-9-22','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (21,600,'Melike','Mas�r',190.00,'2022-4-16','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (22,700,'�lker','Oduncu',210.00,'2022-7-10','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (23,1000,'�zel','�nen',180.00,'2022-9-13','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (24,300,'Ebru','�zdel',190.00,'2022-7-8','Kredi Kart�')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (25,500,'�lay','�zg�l',200.00,'2022-12-2','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (26,700,'Merve','�z�berk',210.00,'2022-9-3','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (27,900,'Zeynep','Po�an',170.00,'2022-1-6','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (28,600,'Ay�e','Sar',180.00,'2022-8-22','Banka Havale')
---------------------SORGULAR-----------------------
select * from urun_bilgi 
--Personelin t�m �r�nler tablosunu g�rmesini sa�lar.

select * from urun_bilgi where tedarikId =1 
--Personelin Tedarik idsi sadece 1 olan �r�nleri g�rmesini sa�lar.

select id, urunAd,urunFiyat from urun_bilgi 
-- Personelin se�ti�i kay�tlar� g�rmesini sa�lar

select id, urunAd,urunFiyat from urun_bilgi where tedarikId = 1 order by urunAd asc 
-- Personelin se�ti�i �r�nleri a�dan z� ye s�ral� bir �ekilde g�sterir

select id, urunAd,urunFiyat from urun_bilgi where tedarikId = 1 order by urunAd desc 
--Personelin se�ti�i �r�nleri z�den a�ya s�ral� bir �ekilde g�sterir

select max(urunFiyat) as 'max_urun_fiyat' from urun_bilgi 
-- Personelin Birim fiyat� en y�ksek �r�n� g�rmesini sa�lar.

select min(urunFiyat) as 'min_urun_fiyat' from urun_bilgi 
--Personelin birim fiyat� en d���k �r�n� g�rmesini sa�lar.

select sum(urunFiyat) as 'top_urun_fiyat' from urun_bilgi 
--Personelin t�m birim fiyatlar�n� toplay�p total olarak fiyat� g�rmesini sa�lar.

select avg(urunFiyat) as 'ort_urun_fiyat' from urun_bilgi 
--Personelin toplam birim fiyatlar�n�n ortalamas�n� g�rmesini sa�lar

select count(urunFiyat) as 'tum_urun_fiyatlari' from urun_bilgi
--Personelin toplam �r�n fiyat� giri�lerinin say�s�n� g�rmesini sa�lar

select distinct(musteriId) from musteri_faturalari 
--Personelin ayn� m��teri kimli�ine sahip olan t�m tekrarlayan kay�tlar� g�rmesini sa�lar

select reverse(UrunAd) from urun_bilgi 
--Personelin �r�nad s�tunundaki �r�n adlar�n� ters �evirip g�rmesini sa�lar.

select replace(faturaDetay , 'A��', '******') from musteri_faturalari
--Personelin faturabilgisi s�tunundaki metinlerdeki "A��" ifadesini bulur ve bu ifadeyi "******"  ile de�i�tirmesini sa�lar.

select id , urunAd, CEILING(urunFiyat) from urun_bilgi 
--Personelin �r�nfiyat s�tunundaki fiyatlar� yukar�ya do�ru yuvarlay�p g�rmesini sa�lar

select id , urunAd, FLOOR(urunFiyat) from urun_bilgi 
--Personelin �r�nfiyat s�tunundaki fiyatlar� a�a��ya do�ru yuvarlay�p g�rmesini sa�lar

select id , urunAd, ROUND(urunFiyat , 0) from urun_bilgi 
--Personelin belirtilen say�y� en yak�n tam say�ya yuvarlay�p g�rmesini sa�lar.

select getDate() 
-- Bilgisayar�n g�ncel tarih ve saatini g�sterir.

select * from personel_bilgi 
-- T�m �r�nler tablosunu se�er.

select ad , soyad , DATEPART(YEAR ,dogumTarihi ) as 'Dogum Yili' from personel_bilgi
-- Personellerin ad�n� soyad�n� ve do�um y�l�n� g�sterir ve s�tunun ismini do�um y�l� yapar.

select ad , soyad , DATEPART(MONTH ,dogumTarihi ) as 'Dogum Yili' from personel_bilgi 
-- Personellerin ad�n� soyad�n� ve Do�du�u ay� g�sterir ve s�tunun ismini do�um y�l� yapar.

select ad , soyad , Replace(DATEPART(MONTH ,dogumTarihi ) , 12 , 'Aral�k') as 'Dogum Yili' from personel_bilgi 
-- Personellerin ad�n� soyad�n� ve Do�du�u ay� g�sterir ve s�tunun ismini do�um y�l� yapar.

select ad , soyad , DATEPART(DAY ,dogumTarihi)  as 'Dogum G�n�' from personel_bilgi 
-- Personellerin ad�n� soyad�n� ve Do�du�u G�n� g�sterir ve s�tunun ismini do�um y�l� yapar.

select ad , soyad , DATEPART(WEEK ,dogumTarihi)  as 'Dogum Haftas�' from personel_bilgi 
-- Y�l�n ka��nc� haftas�na tekab�l etti�ini g�sterir

select ad , soyad , DATEPART(QUARTER ,dogumTarihi)  as 'Dogum Haftas�' from personel_bilgi 
-- Y�l�n ka��nc� �e�reyi oldu�unu g�sterir.




select left(ad,2) as 'sol2' , right(cins,3) as 'sag2', SUBSTRING(tur,2,3) as '2,3' from hasta_bilgi 
--Left soldan sa�a 2 karakter, right sa�adan sola 3 karakter, substring se�ilen
--yerden se�ilen yere kadar kesip ekrana ��kt�y� yazd�r�r.

select CHARINDEX('A' , ad) as 'A' , len(ad) as 'karakter uzunlugu' from hasta_bilgi 
-- Charindex s�tunun i�erisinde ka��nc� karakter oldu�unu s�yler, len karakter uzunlu�unu yazar.

select lower(kisirlikDurumu), upper(ad) from hasta_bilgi 
--lower karakterleri k���k harfe �evirir, upper karakterleri b�y�k harfe �evirir.

select testTur,testSonuc, isnull(AsiTur, 'A�� yok') as 'A�� Durumu' from Asi_Test_Bilgileri 
-- Null k�s�mlar yerine B�lge yok yazar

select  testTur,testSonuc, coalesce(AsiTur , 'A�� yok') as 'A�� Durumu' from Asi_Test_Bilgileri 
--Null k�sm�n�n yerine B�lge yok yazar.

select id, urunId, sum(topAdet*tutar) from urun_fatura_bilgi  group by id, urunId with rollup 
--ara toplam urun_fatura_bilgi tablosunun id'sine g�re s�ralar.

select id, UrunID, sum(topAdet*tutar) from urun_fatura_bilgi  group by id, UrunID with cube 
--ara toplam urun_fatura_bilgi tablosunun urunID'sine g�re s�ralar

select ad, sum(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir m��teriye yap�lan toplam sat�� tutar�n� g�sterir

select ad, avg(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir m��teriye yap�lan ortalama sat�� turar�n� g�sterir

select ad, min(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir m��teriye yap�lan minimum sat�� tutar�n� g�sterir.

select id, sum(topAdet*tutar) as 'Toplam' into AraToplam from urun_fatura_bilgi group by id 
--Stoplam adl� yeni bir tablo olu�turur ve verileri girer

select S.ad,AT.id, min(Toplam) from sahip_bilgi S join urun_fatura_bilgi U on S.id=U.id join 
AraToplam AT on AT.id=S.id group by S.ad, AT.id with rollup order by AT.id asc 
--Sat�� toplamlar�n�n hangi m��teriye ait oldu�unu g�sterir.

select id, UrunID, sum(topAdet*tutar) from urun_fatura_bilgi 
where(topAdet*tutar)>50000 group by id, UrunID with rollup 
--Ara toplam 50000'den b�y�kse listeler

select urunId, sum(topAdet) as 'Toplam' from urun_fatura_bilgi 
group by UrunID having sum(topAdet)>150 order by Toplam asc 
--Toplam adeti 150'den b�y�k olan UrunID gruplar�n� i�erecek ve bu gruplar Toplam adet de�erine g�re artan s�rayla listelenecektir.

Select id, case when topAdet= 0 then 'T�kendi' when topAdet between 1 and 30 then 'Yetersziz' when topAdet 
between 31 and 50 then 'Yeterli' when topAdet between 51 and 75 then 'Yeterli' when topAdet>76 then 'Fazla Stok'
else 'Hedef Yok' end from urun_fatura_bilgi
--urun_bilgi tablosundaki her bir �r�n�n adet (stok adedi) de�erine 
--ba�l� olarak belirli bir kategoriyi atayan bir hesaplama yapar ve bu kategoriyi d�nd�r�r.
--Bu kategori, belirli bir hedef stok d�zeyine (HSD) g�re belirlenir. HSD'nin de�erlendirilmesine g�re,
--�r�nler "T�kendi," "Yetersiz," "Yeterli," "Fazla Stok," veya "Hedef Yok" olarak ��kt�s�n� g�sterir


create function hastaadi  (@hastaad nvarchar(20)) returns table as 
	return select hb.id , hb.ad as 'Hasta ad�' , sb.ad as 'Sahip Ad�' from hasta_bilgi hb join sahip_bilgi sb 
	on hb.sahipId = sb.id where hb.ad = @hastaad
	select * from hastaadi('Luna')
--hastaadi ad�nda bir fonksiyon olusturur.  girilen hastaad'�na g�re hastan�n idsini , ad�n� ve sahip ad�n� getirir.

create function hastab (@ID int) returns table as 
    return
    select hb.id , ad from hasta_bilgi hb join hastalik_gecmisi hg on hb.id=hg.id where hg.id=@ID

	select * from dbo.hastab(3)

--hastab ad�nda bir fonskiyon olusturur. hasta_bilgi ve hastalik_gecmisi tablolar�n�
--birle�tirerek bilgileri getirir. girilen hastanin id'sine g�re idsini ve adini getirir.

create function Personel_Satis_Bilgi () returns table as 
    return
    select P.ad , P.soyad, S.id,(adet*tutar) as 'Toplam' from personel_bilgi P join sahip_bilgi
	S on P.id=S.id join urun_fatura_bilgi U on U.id=S.id
    select * from dbo.Personel_Satis_Bilgi()

--Ad� girilen personelin yapt�g� sat�slar�n idsi ve yapt��� toplam sat�� tutar�

create function UrunBilgi () returns table as 
    return
    select ad ,kategoriId, UrunAd, urunFiyat from urun_fatura_bilgi join
	urun_bilgi on urun_fatura_bilgi.id=urun_bilgi.id
    select * from dbo.UrunBilgi()

--�r�nlerin fiyat�, �r�n ad�n�, idsini ve m��terinin ad�n� veren sorgu

Create view RandevuListesi with Encryption as 
select h.id,h.ad as 'Hasta ad�', h.sonGelmeTarihi , s.ad as 'Sahip Ad�', s.telNo 
from hasta_bilgi h inner join sahip_bilgi s on h.sahipId = s.id where 3 < DATEDIFF(MONTH , sonGelmeTarihi ,GETDATE())

--randevulistetsi adinde �ifreli bir wiev olu�turur. hasta_bilgi ve sahip_bilgi tablolar�n�n birle�tirerek 
--i�lem yapar. 3 aydan daha �nce muayene olan hastalar�n ve bu hastalar�n sahip bilgilerine ula�abailiriz

Create view yasli3 with schemabinding as select tur, cins, ad, yas from dbo.hasta_bilgi

-- yasli3 ad�nda bir wiev olusturur. bu wiev hasta_bilgi tablosundan belirli  sut�nlar� i�erir. 
--hasta_bilgi tablosunun belirli s�tunlar�n� ald�g� i�in bu s�tunlar� daha kolay ve h�zl� eri�im sa�lanabilir. design ile d�zenlenebilir.

Create view yasli2 with encryption as select tur, cins, ad, yas from hasta_bilgi

--yasli2 adinda bir wiev olusturur. bu wiev hasta_bilgi tablosunun belirli s�tunlar� i�erir. 
--hasta_bilgi tablosunun belirli s�tunlar�n� ald�g� i�in bu s�tunlar� daha kolay ve h�zl� eri�im sa�lanabilir. design ile d�zenlenemez

---------------------------------------------

Create view yasli1 as Select tur, cins, ad, yas from hasta_bilgi

--yasli1 adinda bir wiev olusturur. bu wiev hasta_bilgi tablosunun belirli s�tunlar� i�erir.
--hasta_bilgi tablosunun belirli s�tunlar�n� ald�g� i�in bu s�tunlar� daha kolay ve h�zl� eri�im sa�lanabilir.

Create view yasli as Select tur, cins, ad, yas from hasta_bilgi where yas > 12

-- 12 ya��n�n �zerinde olan hayvanlar� ya�l� olarak isteler.

select top 1 with ties ad, soyad, maas from personel_bilgi order by maas desc

--Bu sorgu, ada g�re azalan s�ralama yapar ve en y�ksek maa�a sahip personeli getirir.
--E�er ayn� maa�a sahip di�er personeller de varsa, onlar� da sonu� setinde tutar.

select top 1 with ties ad, soyad, maas from personel_bilgi order by maas asc

--Bu sorgu, ada g�re artan ayn� maa�a sahip olan personeller aras�nda sadece birinci s�radakileri getirecektir.

select ad, soyad, maas from personel_bilgi order by maas desc

--Bu sorgu Maa�a g�re personelleri azalan s�rayla s�ralar

select ad, soyad, maas from personel_bilgi order by maas asc

--Bu sorgu Maa�a g�re personelleri artan s�rayla s�ralar

Select avg(maas) AS OrtalamaMaas from personel_bilgi

--Bu sorgu maa�lar�n ortalamas�n� bulur

Select max(maas) AS EnYuksekMaas from personel_bilgi

--Bu sorgu en y�ksek maa�� bulur

Select min(maas) AS EnDusukMaas from personel_bilgi

--Bu sorgu en d���k maa�� bulur

select top 1 * from personel_bilgi

--Bu sorgu, "personel_bilgi" tablosundan ilk kayd� se�ecektir.


select ad, soyad, girisTarihi from personel_bilgi
WHERE DATEPART(MONTH, girisTarihi) = 1

--Bu sorgu, "personel_bilgi" tablosundaki "girisTarihi" s�tunundaki ay de�eri 1 (Ocak) olan personelleri se�er.


select ad,soyad, datediff(Month, girisTarihi, GETDATE()) AS calisma_ayi from personel_bilgi

--Bu sorgu, her bir �al��an�n ad�n�, soyad�n� ve "girisTarihi" ile �u anki tarih aras�ndaki ay� 
--hesaplayarak ka� ayd�r �al��t���n� g�sterir. 


select ad,soyad, datediff(YEAR, girisTarihi, GETDATE()) AS calisma_yili from personel_bilgi 

--Bu sorgu, her bir �al��an�n ad�n�, soyad�n� ve "girisTarihi" ile �u anki tarih aras�ndaki y�l�
--hesaplayarak ka� y�ld�r �al��t���n� g�sterir. 


Select  ad,soyad, datediff(YEAR, dogumTarihi, girisTarihi) AS yas From personel_bilgi 

-- Bu sorgu, her bir �al��an�n ad�n�, soyad�n� ve "dogum_tarihi" ile "giris_tarihi" aras�ndaki y�l� hesaplayarak 
--ya��n� g�sterir. 

select id, sum(urunFiyat*topa) from urun_bilgi group by id -- SONRA YAPILACAK
select id, sum(urunFiyat*
--Satis toplam�n�n ortalamas�

---------------------------------------------

UPDATE top(3) BitmisUrun set UrunAd='SoftCat Kedi Seyahat �antasi'  

--  BitmisUrun tablosundaki ilk 3  UrunAd'�n� 'SoftCat Kedi Seyahat �antasi' olarak de�i�tirir.

--------------------------------------------

insert BitmisUrun select UrunAd , tedarikId from urun_bilgi where adet<60 

-- varolan tabloya kay�t aktarma

-----------------------------------------------

select LEFT (Ad,4)+UPPER(Left(Soyad,1))+SUBSTRING(Unvan,Charindex(' ',Unvan)+1,3) as '��FRE' from personel_bilgi 

--  Ad s�tununun ilk 4 karakterini al�r sonra soyadinin ilk karakterini alir , onu b�y�k harfle yazar  ve unvan s�tunundaki ilk bo�luktan sonraki 3 karakteri al�r.

---------------------------------------------

select Ad+' '+Soyad+'-'+convert(nvarchar,id) from  personel_bilgi 

-- convert fonksiyonu ile say�sal olmayan bir de�eri nvarchar yapabiliriz.

----------------------------------------------

SELECT ad AS Adi, soyad AS Soyadi INTO YeniPersonel FROM personel_bilgi;

--personel_bilgi tablosundan ad ve soyad alanlar�n� se�er ve YeniPersonel ad�nda yeni bir tabloya kopyalar.

select * from YeniPersonel

-------------------------------------------------

TRUNCATE TABLE #gecici_hasta_bilgi;

--#gecici_hasta_bilgi tablosundaki t�m kay�tlar� siler.

-------------------------------------------

DELETE FROM #gecici_hasta_bilgi;
--#gecici_hasta_bilgi tablosundaki t�m kay�tlar�, WHERE ko�ulu belirtilmedi�i i�in, ko�ulsuz olarak siler. 

--------------------------------------------

DROP TABLE #gecici_hasta_bilgi;

--#gecici_hasta_bilgi adl� tabloyu ve tablodaki t�m verileri siler.

----------------------------------------------

CREATE TABLE #gecici_hasta_bilgi (
    id INT NOT NULL PRIMARY KEY,
    sahipId INT NOT NULL,
    tur VARCHAR(30) NOT NULL,
    cins VARCHAR(30) NOT NULL,
    ad VARCHAR(30) NOT NULL,
    sonGelmeTarihi DATE,
    yas INT NOT NULL,
    agirlik FLOAT NOT NULL,
    kisirlikDurumu VARCHAR(1) NOT NULL,
    cipDurumu VARCHAR(1) NOT NULL,
    FOREIGN KEY (sahipId) REFERENCES sahip_bilgi(id)
)

--sahip bilgilerine ba�l� olarak ge�ici hasta bilgilerini depolamak i�in ge�ici bir tablo olu�turur. Tablo, hastan�n t�r�, cinsiyeti, ad�, son geli� tarihi, ya��, a��rl���, k�s�rl�k durumu ve �ip durumunu i�erir.

------------------------------------------------

IF @degisken1 > 300
BEGIN
    SELECT MAX(urunFiyat) FROM urun_bilgi;
    SELECT MIN(urunFiyat) FROM urun_bilgi;
    SET @degisken1 = @degisken1 + 1;
END
ELSE  
BEGIN
    SELECT @degisken1;
    SET @degisken1 = @degisken1 + 2;
    SELECT @degisken1;
END;

--degisken1 ad�nda bir de�i�kenin de�erini kontrol eder. De�i�kenin de�eri 300'den b�y�kse, urun_bilgi tablosundan maksimum ve minimum �r�n fiyatlar�n� se�er ve ard�ndan de�i�kenin de�erini 1 art�r�r. De�i�kenin de�eri 300'den k���kse, de�i�kenin de�erini ve ard�ndan de�erini 2 art�rarak se�er.

--------------------------------------------------

DECLARE @degisken1 FLOAT = (SELECT MAX(urunFiyat) FROM urun_bilgi);

--urun_bilgi tablosundan urunFiyat s�tununun en b�y�k de�erini degisken1 ad�nda bir float de�i�kenine atar.

-----------------------------------------------

UPDATE urun_bilgi SET urunFiyat = (SELECT MAX(urunFiyat)FROM urun_bilgi) WHERE id = (SELECT TOP 1 id FROM urun_bilgi)

--"urun_bilgi" tablosunda en y�ksek fiyat� olan �r�n�n fiyat�, o �r�n�n id'si ile e�le�en t�m �r�nler i�in g�nceller.

--------------------------------------------------
