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
VALUES ('AgdagVet', 'Ýstanbul', 'Esenyurt', 'info@agdagvet.com.tr','05334073133')
INSERT INTO klinik_bilgi ( klinikAd, konumu, bolge, mail, telNo)
VALUES ('KurtVet', 'Ankara', 'KeçiÖren', 'info@kurtVet.com.tr','05334077542')
INSERT INTO klinik_bilgi ( klinikAd, konumu, bolge, mail, telNo)
VALUES ('KayaVet', 'Ýzmir', 'Bornova', 'info@kayaVet.com.tr','05334075323')
INSERT INTO klinik_bilgi (klinikAd, konumu, bolge, mail, telNo)
VALUES ('YildizVet', 'Samsun', 'Atakum', 'info@yildizvet.com.tr' ,'05334073654')
INSERT INTO klinik_bilgi (klinikAd, konumu, bolge, mail, telNo)
VALUES ('OzturkVet', 'Antalya', 'Konyaaltý', 'info@yildizvet.com.tr' , '05334073689')

--------------------PERSONEL BILGILERI-------------------
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Çilem','Akay','1998-8-5','Veteriner Hekim',24000,'2009-7-26','akçilem@gmail.com','05491645134');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Erna','Arikan','1994-4-14','Veteriner Cerrah',22000,'2015-9-6','erarikan@gmail.com','05487695132');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Mustafa','Arif','2002-12-2','Veteriner Hekim',24000,'2022-1-8','muarif@gmail.com','05761243657');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Ali','Balta','1999-11-30','Veteriner Diþ Hekimi',20000,'2019-5-22','albalta@gmail.com','05431246597');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Coþkun','Baþar','1995-3-26','Veteriner Beslenme Uzmaný',21000,'2014-11-10','cobasar@gmail.com','05461237514');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Bensu','Belge','1996-7-17','Veteriner Diþ Hekimi',20000,'2016-08-25','bebelge@gmail.com','05431267854');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Mehmet','Bural','1994-12-24','Veteriner Hekim',24000,'2018-6-18','mebural@gmail.com','05463219658');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(5,'Oðuzcan','Çaðan','1998-11-9','Veteriner Cerrah',22000,'2019-7-30','ogcagan@gmail.com','05462158765');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(2,'Elif','Çark','1987-5-31','Veteriner Hekim',24000,'2008-5-8','elcark@gmail.com','05461784593');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Sena','Çelik','1989-7-16','Veteriner Hekim',24000,'2014-4-10','secelik@gmail.com','05436257890');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Gürbüz','Çuhadar','1992-3-10','Veteriner Beslenme Uzmaný',24000,'2015-9-16','gücuhadar@gmail.com','05461248752');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Ezgin','Davutoðlu','1985-8-22','Veteriner Cerrah',22000,'2015-7-24','ezdavut@gmail.com','05481246359');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Miraç','Dikbaþ','1994-3-3','Veteriner Diþ Hekimi',20000,'2016-5-10','midik@gmail.com','05497643120');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES(5,'Firuze','Coþan','1992-7-24','Veteriner Diþ Hekimi',21000,'2017-9-17','fircosan@gmail.com','05431254678');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Alya','Dur','1984-3-4','Veteriner Cerrah',22000,'2008-10-24','aldur@gmail.com','05431246597');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Bahar','Erkovan','1994-4-10','Veteriner Cerrah',22000,'2014-6-2','baher@gmail.com','05431246785');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Melike','Görür','1995-9-23','Veteriner Beslenme Uzmaný',21000,'2015-9-12','melgör@gmail.com','05491325467');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Katya','Kudu','1990-12-19','Veteriner Beslenme Uzmaný',21000,'2016-5-5','katdu@gmail.com','05462348752');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Hüseyin','Yýldýz','1992-3-8','Veteriner Beslenme Uzmaný',21000,'2013-9-9','hüyýl@gmail.com','05432645785');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Zehra','Mengüç','1995-11-25','Veteriner Diþ Hekimi',20000,'2018-12-30','zehmen@gmail.com','05461235203');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Barbaros','Mumcu','1980-12-7','CEO',50000,'2010-1-9','barbmum@gmail.com','05842134562');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Melike','Masýr','1994-4-10','Sekreter',12000,'2020-5-4','memasýr@gmail.com','05421326587');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Ülker','Oduncu','1993-6-17','Sekreter',12000,'2023-6-3','ülodun@gmail.com','05421023465');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Ýzel','Önen','1990-8-23','Sekreter',12000,'2022-12-3','izöne@gmail.com','05423120451');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Ebru','Özdel','1989-3-24','Sekreter',12000,'2021-7-9','eböz@gmail.com','05421325420');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Ýlay','Özgül','1999-11-30','Sekreter',12000,'2020-6-5','ilöz@gmail.com','05423164204');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (4,'Melis','Mezarcý','1995-9-23','Patron',26000,'2015-8-5','melmez@gmail.com','05431234562');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (3,'Anýl','Özdil','1990-12-1','Patron',26000,'2014-5-9','anöz@gmail.com','05531234513');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (5,'Merve','Özüberk','1999-5-8','Patron',26000,'2013-2-3','meröz@gmail.com','05632514852');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (1,'Zeynep','Poçan','1986-2-20','Patron',26000,'2016-9-19','zeypo@gmail.com','05632145784');
INSERT INTO personel_bilgi (klinikId, ad, soyad, dogumTarihi, unvan, maas, girisTarihi, mail, telNo) VALUES (2,'Ayþe','Sar','1993-4-10','Patron',26000,'2015-9-10','aysar@gmail.com','05421234658');

-----------------------SAHÝP BÝLGÝLERÝ-------------------------
INSERT INTO sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Aylin','Yýlmaz','Ýstanbul, Beþiktaþ Mahallesi, Barbaros Caddesi No:15','aylinyilmaz@gmail.com','05551234567');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Kaan','Þahin','Ýzmir, Alsancak Mahallesi, Kýbrýs Þehitleri Caddesi No:23','kaansahin@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Elif','Çelik','Antalya, Lara Mahallesi, Kundu Caddesi No:7','elifcelik@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Barýþ','Kaya','Samsun, Atakum Mahallesi, Sahil Yolu No:45','bariskaya@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Zeynep','Aksoy','Ankara, Kýzýlay Mahallesi, Atatürk Bulvarý No:30','zeynepaksoy@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Emre','Demir','Ýstanbul, Kadýköy Mahallesi, Moda Caddesi No:12','emredemir@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Gizem','Öztürk','Ýzmir, Bornova Mahallesi, Ege Caddesi No:18','gizemozturk@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Caner','Arslan','Antalya, Konyaaltý Mahallesi, 100. Yýl Bulvarý No:5','canerarslan@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Melis','Gür','Samsun, Ýlkadým Mahallesi, Gazi Caddesi No:33','melisgur@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Berkay','Yýldýz','Ankara, Bahçelievler Mahallesi, 7. Cadde No:21','berkayyildiz@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Aslýhan','Özdemir','Ýstanbul, Üsküdar Mahallesi, Baðlarbaþý Caddesi No:8','aslihanozdemir@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Burak','Topçu','Ýzmir, Karþýyaka Mahallesi, Mithatpaþa Caddesi No:16','buraktopcu@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ceren','Korkmaz','Antalya, Muratpaþa Mahallesi, Çaðlayan Bulvarý No:42','cerenkorkmaz@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Oðuzhan','Kýlýç','Samsun, Atakum Mahallesi, Sahil Yolu No:28','oguzhankilic@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Selin','Demirci','Ankara, Çankaya Mahallesi, Tunalý Hilmi Caddesi No:11','selindemirci@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Tolga','Avcý','Ýstanbul, Beylikdüzü Mahallesi, Barýþ Bulvarý No:3','tolgaavci@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ece','Koçak','Ýzmir, Gaziemir Mahallesi, Gazi Caddesi No:37','ecekokak@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Furkan','Akýn','Antalya, Kepez Mahallesi, 5. Cadde No:14','furkanakin@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Dilara','Türk','Samsun, Ýlkadým Mahallesi, Cumhuriyet Caddesi No:25','dilaraturk@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Deniz','Yaman','Ankara, Etimesgut Mahallesi, Yýldýrým Beyazýt Caddesi No:9','denizyaman@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Burcu','Þen','Ýstanbul, Þiþli Mahallesi, Abide-i Hürriyet Caddesi No:36','burcusen@gmail.com','05553456789');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Serkan','Gök','Ýzmir, Karabaðlar Mahallesi, Adnan Menderes Bulvarý No:22','serkangok@gmail.com','05554567890');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Seda','Aydýn','Antalya, Lara Mahallesi, Fener Caddesi No:13','sedaaydin@gmail.com','05555678901');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Onur','Yalçýn','Samsun, Atakum Mahallesi, Atatürk Bulvarý No:17','onuryalcin@gmail.com','05556789012');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Yasemin','Yýldýrým','Ankara, Keçiören Mahallesi, 1. Cadde No:29','yaseminyildirim@gmail.com','05557890123');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Hüseyin','Özbek','Ýstanbul, Ümraniye Mahallesi, Libadye Caddesi No:31','huseyinozbek@gmail.com','05558901234');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Ayþe','Toprak','Ýzmir, Buca Mahallesi, Fevzi Çakmak Caddesi No:14','aysetoprak@gmail.com','05559012345');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Emirhan','Yýldýz','Antalya, Konyaaltý Mahallesi, Lara Caddesi No:5','emirhanyildiz@gmail.com','05550123456');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Þeyma','Taþkýn','Samsun, Ýlkadým Mahallesi, Gazi Caddesi No:20','seymataskin@gmail.com','05552345678');
INSERT INTO  sahip_bilgi (ad, soyad, evAdresi, mail, telNo) VALUES ('Baran','Güneþ','Ankara, Yenimahalle Mahallesi, Fatih Caddesi No:24','barangunes@gmail.com','05553456789');

----------------------MUSTERÝ FATURALARI--------------------------------------

select * from sahip_bilgi

INSERT INTO musteri_faturalari (musteriId, faturaDetay, tutar, kesimTarihi, odemeTuru)
VALUES
(1, 'Veteriner Kontrolü', 150.50, '2023-01-01', 'Kredi Kartý'),
(2, 'Aþý Uygulamasý', 75.25, '2023-01-02', 'Nakit'),
(3, 'Parazit Tedavisi', 200.00, '2023-01-03', 'Banka Havalesi'),
(4, 'Operasyon Masrafý', 120.75, '2023-01-04', 'Nakit'),
(5, 'Göz Muayenesi', 50.30, '2023-01-05', 'Kredi Kartý'),
(6, 'Kulak Temizleme', 80.00, '2023-01-06', 'Nakit'),
(7, 'Diþ Bakýmý', 170.25, '2023-01-07', 'Banka Havalesi'),
(8, 'Röntgen Çekimi', 220.50, '2023-01-08', 'Nakit'),
(9, 'Kan Testi', 130.00, '2023-01-09', 'Kredi Kartý'),
(10, 'Týrnak Kesimi', 60.75, '2023-01-10', 'Banka Havalesi'),
(11, 'Aþý Uygulamasý', 90.25, '2023-01-11', 'Nakit'),
(12, 'Operasyon Masrafý', 180.50, '2023-01-12', 'Kredi Kartý'),
(13, 'Kulak Temizleme', 210.75, '2023-01-13', 'Banka Havalesi'),
(14, 'Göz Muayenesi', 110.00, '2023-01-14', 'Nakit'),
(15, 'Diþ Bakýmý', 70.30, '2023-01-15', 'Kredi Kartý'),
(16, 'Aþý Uygulamasý', 85.00, '2023-01-16', 'Banka Havalesi'),
(17, 'Veteriner Kontrolü', 160.25, '2023-01-17', 'Nakit'),
(18, 'Röntgen Çekimi', 230.50, '2023-01-18', 'Kredi Kartý'),
(19, 'Operasyon Masrafý', 145.00, '2023-01-19', 'Nakit'),
(20, 'Göz Muayenesi', 65.75, '2023-01-20', 'Banka Havalesi'),
(21, 'Diþ Bakýmý', 95.75, '2023-01-21', 'Kredi Kartý'),
(22, 'Týrnak Kesimi', 190.00, '2023-01-22', 'Banka Havalesi'),
(23, 'Göz Muayenesi', 245.25, '2023-01-23', 'Nakit'),
(24, 'Veteriner Kontrolü', 125.50, '2023-01-24', 'Kredi Kartý'),
(25, 'Aþý Uygulamasý', 80.30, '2023-01-25', 'Banka Havalesi'),
(26, 'Parazit Tedavisi', 100.00, '2023-01-26', 'Nakit'),
(27, 'Röntgen Çekimi', 175.25, '2023-01-27', 'Kredi Kartý'),
(28, 'Kan Testi', 260.50, '2023-01-28', 'Banka Havalesi'),
(29, 'Veteriner Kontrolü', 135.00, '2023-01-29', 'Nakit'),
(30, 'Aþý Uygulamasý', 70.75, '2023-01-30', 'Kredi Kartý'),
(31, 'Diþ Bakýmý', 95.75, '2023-02-01', 'Kredi Kartý'),
(32, 'Týrnak Kesimi', 190.00, '2023-02-02', 'Banka Havalesi'),
(33, 'Veteriner Kontrolü', 245.25, '2023-02-03', 'Nakit'),
(34, 'Aþý Uygulamasý', 125.50, '2023-02-04', 'Kredi Kartý'),
(35, 'Parazit Tedavisi', 80.30, '2023-02-05', 'Banka Havalesi'),
(36, 'Diþ Bakýmý', 100.00, '2023-02-06', 'Nakit'),
(37, 'Týrnak Kesimi', 175.25, '2023-02-07', 'Kredi Kartý'),
(38, 'Veteriner Kontrolü', 260.50, '2023-02-08', 'Banka Havalesi'),
(39, 'Aþý Uygulamasý', 135.00, '2023-02-09', 'Nakit'),
(40, 'Parazit Tedavisi', 70.75, '2023-02-10', 'Kredi Kartý');

----------------HASTA BÝLGÝLERÝ--------------------

INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (1,5,'Köpek','Golden Retriever','Max','2021-6-15',3,5.8,'H','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (2,14,'Kedi','Scottish Fold','Luna','2021-4-20',1,2.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (3,14,'Köpek','Labrador Retriever','Bella','2021-7-5',2,4.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (4,14,'Kedi','British Shorthair','Charlie','2021-8-10',3,3.5,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (5,3,'Köpek','German Shepherd','Rocky','2021-9-15',4,6.9,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (6,3,'Kedi','Persian','Lucy','2021-3-20',2,2.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (6,3,'Köpek','French Bulldog','Cooper','2021-10-5',1,3.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (7,3,'Kedi','Siamese','Oliver','2021-11-10',3,4.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (8,8,'Köpek','Poodle','Milo','2021-12-15',2,5.8,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (9,8,'Kedi','Maine Coon','Simba','2022-1-20',2,4.6,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (10,8,'Köpek','Bulldog','Maximus','2022-2-5',3,7.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (10,9,'Kedi','Ragdoll','Lily','2022-3-10',1,3.3,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (11,9,'Köpek','Siberian Husky','Luna','2022-4-15',2,5.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (12,7,'Kedi','Sphynx','Milo','2022-5-20',3,2.9,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (13,7,'Köpek','Rottweiler','Rocko','2022-6-5',4,8.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (14,12,'Kedi','Bengal','Leo','2022-7-10',2,3.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (15,12,'Köpek','Chihuahua','Bella','2022-8-15',1,2.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (15,12,'Kedi','Norwegian Forest','Mia','2022-9-20',3,4.1,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (16,12,'Köpek','Boxer','Max','2022-10-5',2,6.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (17,13,'Kedi','Persian','Milo','2022-11-10',2,3.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (18,13,'Köpek','Labrador Retriever','Charlie','2022-12-15',3,5.9,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (19,13,'Kedi','Siamese','Oliver','2023-1-20',1,4.2,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (20,11,'Köpek','Golden Retriever','Maximus','2023-2-5',2,7.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (21,11,'Kedi','Scottish Fold','Luna','2023-3-10',3,3.1,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (22,11,'Köpek','German Shepherd','Rocky','2023-4-15',4,6.5,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'Kedi','British Shorthair','Lucy','2023-5-20',2,2.9,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'Köpek','French Bulldog','Cooper','2023-6-5',1,3.6,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (23,19,'Kedi','Maine Coon','Oliver','2023-7-10',3,4.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (24,4,'Köpek','Poodle','Milo','2023-8-15',2,5.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (25,4,'Kedi','Ragdoll','Lily','2023-9-20',1,3.7,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (26,4,'Köpek','Siberian Husky','Luna','2023-10-5',2,5.2,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (26,18,'Kedi','Sphynx','Milo','2023-11-10',3,2.8,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (27,18,'Köpek','Rottweiler','Rocko','2023-12-15',4,8.3,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (28,18,'Kedi','Bengal','Leo','2023-1-20',2,3.5,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,20,'Köpek','Chihuahua','Bella','2023-2-5',1,2.7,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,20,'Kedi','Norwegian Forest','Mia','2023-3-10',3,4.4,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (29,17,'Köpek','Boxer','Max','2023-4-15',2,6.1,'E','E')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (30,17,'Kedi','Persian','Milo','2023-5-20',2,3.2,'H','H')
INSERT INTO hasta_bilgi (sahipId,veterinerId,tur,cins,ad,sonGelmeTarihi,yas,agirlik,kisirlikDurumu,cipDurumu) VALUES (30,17,'Köpek','Labrador Retriever','Charlie','2023-6-5',3,5.7,'E','E')
----------------------HÝZMET BÝLGÝ----------------------------------------
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (34, 'Muayene ve Teþhis', '08-12-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (12, 'Cerrahi Müdahaleler',  '03-25-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (3, 'Laboratuvar Testleri',  '11-08-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (26, 'Hasta Bakýmý ve Tedavi', '06-17-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (29, 'Diþ Bakýmý', '02-04-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (7, 'Dermatoloji Hizmetleri', '09-30-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (23, 'Ultrason', '05-21-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (19, 'Yara Bakýmý', '12-11-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (14, 'Ýç Hastalýklar',  '07-02-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (6, 'Beslenme Danýþmanlýðý',  '01-19-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (8, 'Aþýlar ve Baðýþýklama', '10-14-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (17, 'Davranýþ Danýþmanlýðý',  '04-07-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (32, 'Aþýlar ve Baðýþýklama',  '11-26-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (9, 'Kanser Tedavisi',  '06-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (38, 'Anestezi ve Aðrý Kontrolü',  '02-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (5, 'Beslenme Danýþmanlýðý',  '09-15-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (36, 'Anestezi ve Aðrý Kontrolü',  '05-05-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (22, 'Göz Saðlýðý Hizmetleri', '12-27-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (29, 'Beslenme Danýþmanlýðý',  '07-08-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (20, 'Alerji Testleri',  '01-31-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (1, 'Röntgen ve Görüntüleme',  '10-23-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (11, 'Aðrý Yönetimi',  '04-15-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (4, 'Ortopedik Cerrahi',  '11-04-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (39, 'Davranýþ Danýþmanlýðý',  '06-28-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (30, 'Beslenme Danýþmanlýðý',  '03-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (13, 'Ortopedik Cerrahi',  '08-02-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (31, 'Röntgen ve Görüntüleme',  '07-11-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (16, 'Nöroloji Hizmetleri',  '12-19-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (25, 'Beslenme Danýþmanlýðý',  '02-01-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (2, 'Göz Saðlýðý Hizmetleri', '09-20-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (27, 'Evcil Hayvan Saðlýk Eðitimi',  '05-13-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (18, 'Röntgen ve Görüntüleme',  '01-05-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (21, 'Ultrason', '10-30-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (15, 'Nöroloji Hizmetleri',  '04-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (10, 'Ultrason',  '04-22-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (28, 'Evcil Hayvan Saðlýk Eðitimi',  '06-03-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (35, 'Göz Saðlýðý Hizmetleri', '06-03-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (24, 'Kanser Tedavisi',  '02-16-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (37, 'Kanser Tedavisi', '09-09-2023')
INSERT INTO hizmet_bilgi (hastaId, hizmetAd, hizmetTarih) VALUES (33, 'Alerji Testleri', '07-24-2023')
----------------------HASTALIK GECMISI----------------------------------------

INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (1,'Ýshal','Kontrol Altýnda','2021-5-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (2,'Kulak Enfeksiyonu','Stabil','2021-6-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (8,'Alerji','Stabil','2021-7-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'Göz Enfeksiyonu','Kontrol Altýnda','2021-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (5,'Solunum Problemi','Kontrol Altýnda','2021-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'Yara Ýyileþmesi','Kontrol Altýnda','2021-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (7,'Kemik Kýrýðý','Kontrol Altýnda','2021-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Karaciðer Problemi','Stabil','2021-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (4,'Böbrek Ýltihabý','Kontrol Altýnda','2022-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (10,'Kalp Rahatsýzlýðý','Kritik','2022-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Mide Ülseri','Kontrol Altýnda','2022-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Kemik Ýltihabý','Kontrol Altýnda','2022-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (13,'Kulak Enfeksiyonu','Kontrol Altýnda','2022-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (14,'Alerji','Stabil','2022-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (15,'Göz Enfeksiyonu','Kontrol Altýnda','2022-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (16,'Solunum Problemi','Kritik','2022-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Yara Ýyileþmesi','Kontrol Altýnda','2022-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (18,'Kemik Kýrýðý','Kontrol Altýnda','2022-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Karaciðer Problemi','Stabil','2022-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (20,'Böbrek Ýltihabý','Kontrol Altýnda','2022-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (21,'Kalp Rahatsýzlýðý','Kontrol Altýnda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (22,'Mide Ülseri','Kontrol Altýnda','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Kemik Ýltihabý','Kritik','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (24,'Kulak Enfeksiyonu','Kontrol Altýnda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (25,'Alerji','Kontrol Altýnda','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (26,'Göz Enfeksiyonu','Stabil','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (27,'Solunum Problemi','Kontrol Altýnda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Yara Ýyileþmesi','Stabil','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Kemik Kýrýðý','Kontrol Altýnda','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Karaciðer Problemi','Kritik','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (6,'Halsizlik','Kontrol Altýnda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (2,'Kulak Enfeksiyonu','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (8,'Alerji','Stabil','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Göz Enfeksiyonu','Kontrol Altýnda','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Solunum Problemi','Kontrol Altýnda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Yara Ýyileþmesi','Kontrol Altýnda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (7,'Kemik Kýrýðý','Kontrol Altýnda','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Karaciðer Problemi','Stabil','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (4,'Böbrek Ýltihabý','Kontrol Altýnda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (10,'Kalp Rahatsýzlýðý','Kritik','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Mide Ülseri','Kontrol Altýnda','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (11,'Kemik Ýltihabý','Kontrol Altýnda','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (13,'Kulak Enfeksiyonu','Kontrol Altýnda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (14,'Alerji','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (15,'Göz Enfeksiyonu','Kontrol Altýnda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (16,'Solunum Problemi','Kritik','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Yara Ýyileþmesi','Kontrol Altýnda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (25,'Kemik Kýrýðý','Kontrol Altýnda','2023-4-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (19,'Karaciðer Problemi','Stabil','2023-5-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (20,'Böbrek Ýltihabý','Kontrol Altýnda','2023-6-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Kalp Rahatsýzlýðý','Kontrol Altýnda','2023-7-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (26,'Mide Ülseri','Kontrol Altýnda','2023-8-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (23,'Kemik Ýltihabý','Kritik','2023-9-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (24,'Kulak Enfeksiyonu','Kontrol Altýnda','2023-10-15');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Alerji','Kontrol Altýnda','2023-11-20');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (22,'Göz Enfeksiyonu','Stabil','2023-12-25');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (30,'Solunum Problemi','Kontrol Altýnda','2023-1-30');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (28,'Yara Ýyileþmesi','Stabil','2023-2-5');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (29,'Kemik Kýrýðý','Kontrol Altýnda','2023-3-10');
INSERT INTO hastalik_gecmisi(hastaId,hastalikAd,durum,tehsisTarihi) VALUES (27,'Karaciðer Problemi','Kritik','2023-4-15');



-------------ASI_TEST_BILGILERI------------------------
ALTER TABLE Asi_Test_Bilgileri ADD CONSTRAINT fk_hasta FOREIGN KEY (hastaId) REFERENCES hasta_bilgi(id);
select * from hasta_bilgi
INSERT INTO Asi_Test_Bilgileri (hastaId, testTur, testSonuc, AsiDozaj, AsiTur, Tarih)
VALUES
  (1, 'Kan Testi', 'Normal', 0.3, 'Kuduz Aþýsý', '2023-01-01'),
  (1, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-01-05'),
  (2, 'Kan Testi', 'Yüksek', 0.6, 'Köpek Distemper Aþýsý', '2023-02-10'),
  (2, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-02-15'),
  (3, 'Kan Testi', 'Normal', 0.4, 'Kedi Panleukopenia Aþýsý', '2023-03-20'),
  (3, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-03-25'),
  (4, 'Kan Testi', 'Yüksek', 0.1, 'Köpek Parvovirus Aþýsý', '2023-04-05'),
  (4, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-04-10'),
  (5, 'Kan Testi', 'Normal', 0.7, 'Köpek Leptospirosis Aþýsý', '2023-05-15'),
  (5, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-05-20'),
  (6, 'Kan Testi', 'Yüksek', 0.4, 'Kuduz Aþýsý', '2023-06-01'),
  (6, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-06-05'),
  (7, 'Kan Testi', 'Normal', 0.3, 'Köpek Distemper Aþýsý', '2023-07-10'),
  (7, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-07-15'),
  (8, 'Kan Testi', 'Yüksek', 0.7, 'Kedi Panleukopenia Aþýsý', '2023-08-20'),
  (8, 'Parazit Testi', 'Negatif', NULL, NULL, '2023-08-25'),
  (9, 'Kan Testi', 'Normal', 0.4, 'Köpek Parvovirus Aþýsý', '2023-09-30'),
  (9, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-10-05'),
  (10, 'Kan Testi', 'Yüksek', 0.3, 'Köpek Leptospirosis Aþýsý', '2023-11-10'),
  (10, 'Parazit Testi', 'Pozitif', NULL, NULL, '2023-11-15')


-------------------------KATEGORILER------------------------
INSERT INTO kategori (kategoriAd) VALUES ('Veteriner Ýlaçlarý')
INSERT INTO kategori (kategoriAd) VALUES ('Mama')
INSERT INTO kategori (kategoriAd) VALUES ('Oyuncaklar')
INSERT INTO kategori (kategoriAd) VALUES ('Köpek Yataklarý')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Týrmalama Tahtalarý')
INSERT INTO kategori (kategoriAd) VALUES ('Þampuan')
INSERT INTO kategori (kategoriAd) VALUES ('Fýrça')
INSERT INTO kategori (kategoriAd) VALUES ('Tasma ve Kayýþ')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Kumu ve Tuvaletleri')
INSERT INTO kategori (kategoriAd) VALUES ('Evcil Hayvan Bakým Ürünleri')
INSERT INTO kategori (kategoriAd) VALUES ('Veteriner Kitaplarý')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Yataklarý')
INSERT INTO kategori (kategoriAd) VALUES ('Köpek Eðitim Malzemeleri')
INSERT INTO kategori (kategoriAd) VALUES ('Kedi Taþýma Çantalarý')
INSERT INTO kategori (kategoriAd) VALUES ('Köpek Saðlýk Kontrolleri')

-----------TEDARIKCI----------------

INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Aslan Týbbi Ürünler', 'Ýstanbul, Merkez Mahallesi, Ticaret Caddesi No:25', 'aslan_týp_urunleri@info.com', '5551790034')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Kaya Saðlýk Ürünleri', 'Ankara, Kýzýlay Mahallesi, Sanayi Bulvarý No:18', 'kaya_saglik@info.com', '5556310006')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Panda Oyuncakçýlýk', 'Ýzmir, Alsancak Mahallesi, Liman Caddesi No:10', 'panda_oyuncakcilik@info.com', '5559810035')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Samsun Pet Mamalarý', 'Samsun, Osmangazi Mahallesi, Organize Sanayi Bölgesi No:7', 'samsun_pet_mamalari@info.com', '5554180016')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Antalya Pet Tekstil', 'Antalya, Muratpaþa Mahallesi, Turizm Bulvarý No:12', 'antalya_pet_tekstil@info.com', '5551870007')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Ýstanbul Pet Gýda', 'Ýstanbul, Cumhuriyet Mahallesi, Bankalar Caddesi No:32', 'istanbul_pet_gida@info.com', '5551870037')
INSERT INTO tedarikci_bilgi (ad, konum, mail, telNo) VALUES
('Ankara Pet Ev Ürünleri', 'Ankara, Çankaya Mahallesi, Kurtuluþ Caddesi No:30', 'ankara_pet_ev_urunleri@info.com', '5559071006')


--------------------URUNLER--------------
INSERT INTO urun_bilgi (kategoriId, tedarikId, urunAd, urunFiyat) VALUES
    (1, 1, 'Saral Calm 5 Htp Sakinleþtirici Ýlaç', 25.99),
    (2, 1, 'Reflex Yetiþkin Tavuklu Renkli Kedi Mamasý', 35.99),
    (3, 1, 'Elastik Kedi Oyun Oltasý', 10.99),
    (6, 1, 'Metapet Kedi Bit Karþýtý Þampuan', 15.99),
    (2, 2, 'Royal Canin Sterilised Kýsýrlaþtýrýlmýþ Kedi Mamasý', 30.99),
    (3, 2, 'BioFeline Kedi Nanesi Oyun Topu', 12.99),
    (4, 2, 'MOLMEKS Köpek Yataðý', 45.99),
    (5, 2, 'hayystore Kedi Týrmalama Tahtasý', 20.99),
    (6, 3, 'PetPlus Köpek Þampuaný', 18.99),
    (7, 3, 'FurryFriends Köpek Tüy Fýrçasý', 8.99),
    (8, 3, 'PawParadise Köpek Tasma', 14.99),
    (9, 3, 'CatComfort Kokulu Kedi Kumu', 22.99),
    (10, 4, 'VetCare Kulak Temizleme Sývýsý', 9.99),
    (11, 4, 'VetLibrary Köpek Eðitimi Kitabý', 27.99),
    (12, 4, 'CozyCats Yumuþak Kedi Yataðý', 34.99),
    (13, 4, 'TrainMaster Clicker Eðitim Aleti', 6.99),
    (14, 5, 'PetPorter Kedi Taþýma Çantasý', 29.99),
    (15, 5, 'HealthGuard Köpek Saðlýk Seti', 42.99),
    (1, 5, 'VetMed Köpek Antibiyotik', 19.99),
    (2, 5, 'HappyPaws Puppy Köpek Mamasý', 23.99),
    (14, 6, 'SoftCat Kedi Seyahat Çantasý', 17.99),
    (15, 6, 'CheckUpMate Köpek Saðlýk Kontrol Cihazý', 54.99),
    (1, 6, 'PetRx Kedi Antibiyotik', 21.99),
    (2, 6, 'NutriMax Senior Köpek Mamasý', 28.99),
    (1, 7, 'HealthGuard Kedi Ýdrar Yolu Enfeksiyonu Ýlaç', 32.99),
    (2, 7, 'ProVita Adult Köpek Mamasý', 38.99),
    (3, 7, 'PawJoy Köpek Kemik Oyuncak', 14.99),
    (6, 7, 'HappyPets Kedi Mantar Karþýtý Þampuan', 19.99);

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
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (5,400,'Coþkun','Baþar',180.00,'2023-3-25','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (6,900,'Bensu','Belge',190.00,'2023-1-26','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (7,700,'Mehmet','Bural',170.00,'2023-11-19','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (8,300,'Oðuzcan','Çaðan',2300.00,'2023-2-8','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (9,500,'Elif','Çark',200.00,'2023-10-13','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (10,1200,'Sena','Çelik',160.00,'2023-9-5','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (11,300,'Gürbüz','Çuhadar',140.00,'2023-3-6','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (12,900,'Ezgin','Davutoðlu',180.00,'2023-12-2','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (13,500,'Miraç','Dikbaþ',180.00,'2023-2-23','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (14,600,'Firuze','Coþan',210.00,'2023-6-16','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (15,400,'Alya','Dur',200.00,'2023-1-8','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (16,200,'Bahar','Erkovan',210.00,'2022-12-12','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (17,500,'Melike','Görür',240.00,'2022-12-12','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (18,1000,'Katya','Kudu',190.00,'2022-8-9','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (19,900,'Zehra','Mengüç',170.00,'2022-10-25','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (20,800,'Barbaros','Mumcu',180.00,'2022-9-22','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (21,600,'Melike','Masýr',190.00,'2022-4-16','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (22,700,'Ülker','Oduncu',210.00,'2022-7-10','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (23,1000,'Ýzel','Önen',180.00,'2022-9-13','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (24,300,'Ebru','Özdel',190.00,'2022-7-8','Kredi Kartý')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (25,500,'Ýlay','Özgül',200.00,'2022-12-2','Banka Havale')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (26,700,'Merve','Özüberk',210.00,'2022-9-3','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (27,900,'Zeynep','Poçan',170.00,'2022-1-6','Nakit')
INSERT INTO urun_fatura_bilgi (urunId,topAdet,ad,soyad,tutar,kesimTarihi,odemeTuru) VALUES (28,600,'Ayþe','Sar',180.00,'2022-8-22','Banka Havale')
---------------------SORGULAR-----------------------
select * from urun_bilgi 
--Personelin tüm ürünler tablosunu görmesini saðlar.

select * from urun_bilgi where tedarikId =1 
--Personelin Tedarik idsi sadece 1 olan ürünleri görmesini saðlar.

select id, urunAd,urunFiyat from urun_bilgi 
-- Personelin seçtiði kayýtlarý görmesini saðlar

select id, urunAd,urunFiyat from urun_bilgi where tedarikId = 1 order by urunAd asc 
-- Personelin seçtiði ürünleri a’dan z’ ye sýralý bir þekilde gösterir

select id, urunAd,urunFiyat from urun_bilgi where tedarikId = 1 order by urunAd desc 
--Personelin seçtiði ürünleri z’den a’ya sýralý bir þekilde gösterir

select max(urunFiyat) as 'max_urun_fiyat' from urun_bilgi 
-- Personelin Birim fiyatý en yüksek ürünü görmesini saðlar.

select min(urunFiyat) as 'min_urun_fiyat' from urun_bilgi 
--Personelin birim fiyatý en düþük ürünü görmesini saðlar.

select sum(urunFiyat) as 'top_urun_fiyat' from urun_bilgi 
--Personelin tüm birim fiyatlarýný toplayýp total olarak fiyatý görmesini saðlar.

select avg(urunFiyat) as 'ort_urun_fiyat' from urun_bilgi 
--Personelin toplam birim fiyatlarýnýn ortalamasýný görmesini saðlar

select count(urunFiyat) as 'tum_urun_fiyatlari' from urun_bilgi
--Personelin toplam ürün fiyatý giriþlerinin sayýsýný görmesini saðlar

select distinct(musteriId) from musteri_faturalari 
--Personelin ayný müþteri kimliðine sahip olan tüm tekrarlayan kayýtlarý görmesini saðlar

select reverse(UrunAd) from urun_bilgi 
--Personelin ürünad sütunundaki ürün adlarýný ters çevirip görmesini saðlar.

select replace(faturaDetay , 'Aþý', '******') from musteri_faturalari
--Personelin faturabilgisi sütunundaki metinlerdeki "Aþý" ifadesini bulur ve bu ifadeyi "******"  ile deðiþtirmesini saðlar.

select id , urunAd, CEILING(urunFiyat) from urun_bilgi 
--Personelin ürünfiyat sütunundaki fiyatlarý yukarýya doðru yuvarlayýp görmesini saðlar

select id , urunAd, FLOOR(urunFiyat) from urun_bilgi 
--Personelin ürünfiyat sütunundaki fiyatlarý aþaðýya doðru yuvarlayýp görmesini saðlar

select id , urunAd, ROUND(urunFiyat , 0) from urun_bilgi 
--Personelin belirtilen sayýyý en yakýn tam sayýya yuvarlayýp görmesini saðlar.

select getDate() 
-- Bilgisayarýn güncel tarih ve saatini gösterir.

select * from personel_bilgi 
-- Tüm ürünler tablosunu seçer.

select ad , soyad , DATEPART(YEAR ,dogumTarihi ) as 'Dogum Yili' from personel_bilgi
-- Personellerin adýný soyadýný ve doðum yýlýný gösterir ve sütunun ismini doðum yýlý yapar.

select ad , soyad , DATEPART(MONTH ,dogumTarihi ) as 'Dogum Yili' from personel_bilgi 
-- Personellerin adýný soyadýný ve Doðduðu ayý gösterir ve sütunun ismini doðum yýlý yapar.

select ad , soyad , Replace(DATEPART(MONTH ,dogumTarihi ) , 12 , 'Aralýk') as 'Dogum Yili' from personel_bilgi 
-- Personellerin adýný soyadýný ve Doðduðu ayý gösterir ve sütunun ismini doðum yýlý yapar.

select ad , soyad , DATEPART(DAY ,dogumTarihi)  as 'Dogum Günü' from personel_bilgi 
-- Personellerin adýný soyadýný ve Doðduðu Günü gösterir ve sütunun ismini doðum yýlý yapar.

select ad , soyad , DATEPART(WEEK ,dogumTarihi)  as 'Dogum Haftasý' from personel_bilgi 
-- Yýlýn kaçýncý haftasýna tekabül ettiðini gösterir

select ad , soyad , DATEPART(QUARTER ,dogumTarihi)  as 'Dogum Haftasý' from personel_bilgi 
-- Yýlýn kaçýncý çeðreyi olduðunu gösterir.




select left(ad,2) as 'sol2' , right(cins,3) as 'sag2', SUBSTRING(tur,2,3) as '2,3' from hasta_bilgi 
--Left soldan saða 2 karakter, right saðadan sola 3 karakter, substring seçilen
--yerden seçilen yere kadar kesip ekrana çýktýyý yazdýrýr.

select CHARINDEX('A' , ad) as 'A' , len(ad) as 'karakter uzunlugu' from hasta_bilgi 
-- Charindex sütunun içerisinde kaçýncý karakter olduðunu söyler, len karakter uzunluðunu yazar.

select lower(kisirlikDurumu), upper(ad) from hasta_bilgi 
--lower karakterleri küçük harfe çevirir, upper karakterleri büyük harfe çevirir.

select testTur,testSonuc, isnull(AsiTur, 'Aþý yok') as 'Aþý Durumu' from Asi_Test_Bilgileri 
-- Null kýsýmlar yerine Bölge yok yazar

select  testTur,testSonuc, coalesce(AsiTur , 'Aþý yok') as 'Aþý Durumu' from Asi_Test_Bilgileri 
--Null kýsmýnýn yerine Bölge yok yazar.

select id, urunId, sum(topAdet*tutar) from urun_fatura_bilgi  group by id, urunId with rollup 
--ara toplam urun_fatura_bilgi tablosunun id'sine göre sýralar.

select id, UrunID, sum(topAdet*tutar) from urun_fatura_bilgi  group by id, UrunID with cube 
--ara toplam urun_fatura_bilgi tablosunun urunID'sine göre sýralar

select ad, sum(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir müþteriye yapýlan toplam satýþ tutarýný gösterir

select ad, avg(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir müþteriye yapýlan ortalama satýþ turarýný gösterir

select ad, min(topAdet*U.tutar) from urun_fatura_bilgi U join musteri_faturalari MF on U.id=MF.id group by ad 
--her bir müþteriye yapýlan minimum satýþ tutarýný gösterir.

select id, sum(topAdet*tutar) as 'Toplam' into AraToplam from urun_fatura_bilgi group by id 
--Stoplam adlý yeni bir tablo oluþturur ve verileri girer

select S.ad,AT.id, min(Toplam) from sahip_bilgi S join urun_fatura_bilgi U on S.id=U.id join 
AraToplam AT on AT.id=S.id group by S.ad, AT.id with rollup order by AT.id asc 
--Satýþ toplamlarýnýn hangi müþteriye ait olduðunu gösterir.

select id, UrunID, sum(topAdet*tutar) from urun_fatura_bilgi 
where(topAdet*tutar)>50000 group by id, UrunID with rollup 
--Ara toplam 50000'den büyükse listeler

select urunId, sum(topAdet) as 'Toplam' from urun_fatura_bilgi 
group by UrunID having sum(topAdet)>150 order by Toplam asc 
--Toplam adeti 150'den büyük olan UrunID gruplarýný içerecek ve bu gruplar Toplam adet deðerine göre artan sýrayla listelenecektir.

Select id, case when topAdet= 0 then 'Tükendi' when topAdet between 1 and 30 then 'Yetersziz' when topAdet 
between 31 and 50 then 'Yeterli' when topAdet between 51 and 75 then 'Yeterli' when topAdet>76 then 'Fazla Stok'
else 'Hedef Yok' end from urun_fatura_bilgi
--urun_bilgi tablosundaki her bir ürünün adet (stok adedi) deðerine 
--baðlý olarak belirli bir kategoriyi atayan bir hesaplama yapar ve bu kategoriyi döndürür.
--Bu kategori, belirli bir hedef stok düzeyine (HSD) göre belirlenir. HSD'nin deðerlendirilmesine göre,
--ürünler "Tükendi," "Yetersiz," "Yeterli," "Fazla Stok," veya "Hedef Yok" olarak çýktýsýný gösterir


create function hastaadi  (@hastaad nvarchar(20)) returns table as 
	return select hb.id , hb.ad as 'Hasta adý' , sb.ad as 'Sahip Adý' from hasta_bilgi hb join sahip_bilgi sb 
	on hb.sahipId = sb.id where hb.ad = @hastaad
	select * from hastaadi('Luna')
--hastaadi adýnda bir fonksiyon olusturur.  girilen hastaad'ýna göre hastanýn idsini , adýný ve sahip adýný getirir.

create function hastab (@ID int) returns table as 
    return
    select hb.id , ad from hasta_bilgi hb join hastalik_gecmisi hg on hb.id=hg.id where hg.id=@ID

	select * from dbo.hastab(3)

--hastab adýnda bir fonskiyon olusturur. hasta_bilgi ve hastalik_gecmisi tablolarýný
--birleþtirerek bilgileri getirir. girilen hastanin id'sine göre idsini ve adini getirir.

create function Personel_Satis_Bilgi () returns table as 
    return
    select P.ad , P.soyad, S.id,(adet*tutar) as 'Toplam' from personel_bilgi P join sahip_bilgi
	S on P.id=S.id join urun_fatura_bilgi U on U.id=S.id
    select * from dbo.Personel_Satis_Bilgi()

--Adý girilen personelin yaptýgý satýslarýn idsi ve yaptýðý toplam satýþ tutarý

create function UrunBilgi () returns table as 
    return
    select ad ,kategoriId, UrunAd, urunFiyat from urun_fatura_bilgi join
	urun_bilgi on urun_fatura_bilgi.id=urun_bilgi.id
    select * from dbo.UrunBilgi()

--Ürünlerin fiyatý, Ürün adýný, idsini ve müþterinin adýný veren sorgu

Create view RandevuListesi with Encryption as 
select h.id,h.ad as 'Hasta adý', h.sonGelmeTarihi , s.ad as 'Sahip Adý', s.telNo 
from hasta_bilgi h inner join sahip_bilgi s on h.sahipId = s.id where 3 < DATEDIFF(MONTH , sonGelmeTarihi ,GETDATE())

--randevulistetsi adinde þifreli bir wiev oluþturur. hasta_bilgi ve sahip_bilgi tablolarýnýn birleþtirerek 
--iþlem yapar. 3 aydan daha önce muayene olan hastalarýn ve bu hastalarýn sahip bilgilerine ulaþabailiriz

Create view yasli3 with schemabinding as select tur, cins, ad, yas from dbo.hasta_bilgi

-- yasli3 adýnda bir wiev olusturur. bu wiev hasta_bilgi tablosundan belirli  sutünlarý içerir. 
--hasta_bilgi tablosunun belirli sütunlarýný aldýgý için bu sütunlarý daha kolay ve hýzlý eriþim saðlanabilir. design ile düzenlenebilir.

Create view yasli2 with encryption as select tur, cins, ad, yas from hasta_bilgi

--yasli2 adinda bir wiev olusturur. bu wiev hasta_bilgi tablosunun belirli sütunlarý içerir. 
--hasta_bilgi tablosunun belirli sütunlarýný aldýgý için bu sütunlarý daha kolay ve hýzlý eriþim saðlanabilir. design ile düzenlenemez

---------------------------------------------

Create view yasli1 as Select tur, cins, ad, yas from hasta_bilgi

--yasli1 adinda bir wiev olusturur. bu wiev hasta_bilgi tablosunun belirli sütunlarý içerir.
--hasta_bilgi tablosunun belirli sütunlarýný aldýgý için bu sütunlarý daha kolay ve hýzlý eriþim saðlanabilir.

Create view yasli as Select tur, cins, ad, yas from hasta_bilgi where yas > 12

-- 12 yaþýnýn üzerinde olan hayvanlarý yaþlý olarak isteler.

select top 1 with ties ad, soyad, maas from personel_bilgi order by maas desc

--Bu sorgu, ada göre azalan sýralama yapar ve en yüksek maaþa sahip personeli getirir.
--Eðer ayný maaþa sahip diðer personeller de varsa, onlarý da sonuç setinde tutar.

select top 1 with ties ad, soyad, maas from personel_bilgi order by maas asc

--Bu sorgu, ada göre artan ayný maaþa sahip olan personeller arasýnda sadece birinci sýradakileri getirecektir.

select ad, soyad, maas from personel_bilgi order by maas desc

--Bu sorgu Maaþa göre personelleri azalan sýrayla sýralar

select ad, soyad, maas from personel_bilgi order by maas asc

--Bu sorgu Maaþa göre personelleri artan sýrayla sýralar

Select avg(maas) AS OrtalamaMaas from personel_bilgi

--Bu sorgu maaþlarýn ortalamasýný bulur

Select max(maas) AS EnYuksekMaas from personel_bilgi

--Bu sorgu en yüksek maaþý bulur

Select min(maas) AS EnDusukMaas from personel_bilgi

--Bu sorgu en düþük maaþý bulur

select top 1 * from personel_bilgi

--Bu sorgu, "personel_bilgi" tablosundan ilk kaydý seçecektir.


select ad, soyad, girisTarihi from personel_bilgi
WHERE DATEPART(MONTH, girisTarihi) = 1

--Bu sorgu, "personel_bilgi" tablosundaki "girisTarihi" sütunundaki ay deðeri 1 (Ocak) olan personelleri seçer.


select ad,soyad, datediff(Month, girisTarihi, GETDATE()) AS calisma_ayi from personel_bilgi

--Bu sorgu, her bir çalýþanýn adýný, soyadýný ve "girisTarihi" ile þu anki tarih arasýndaki ayý 
--hesaplayarak kaç aydýr çalýþtýðýný gösterir. 


select ad,soyad, datediff(YEAR, girisTarihi, GETDATE()) AS calisma_yili from personel_bilgi 

--Bu sorgu, her bir çalýþanýn adýný, soyadýný ve "girisTarihi" ile þu anki tarih arasýndaki yýlý
--hesaplayarak kaç yýldýr çalýþtýðýný gösterir. 


Select  ad,soyad, datediff(YEAR, dogumTarihi, girisTarihi) AS yas From personel_bilgi 

-- Bu sorgu, her bir çalýþanýn adýný, soyadýný ve "dogum_tarihi" ile "giris_tarihi" arasýndaki yýlý hesaplayarak 
--yaþýný gösterir. 

select id, sum(urunFiyat*topa) from urun_bilgi group by id -- SONRA YAPILACAK
select id, sum(urunFiyat*
--Satis toplamýnýn ortalamasý

---------------------------------------------

UPDATE top(3) BitmisUrun set UrunAd='SoftCat Kedi Seyahat Çantasi'  

--  BitmisUrun tablosundaki ilk 3  UrunAd'ýný 'SoftCat Kedi Seyahat Çantasi' olarak deðiþtirir.

--------------------------------------------

insert BitmisUrun select UrunAd , tedarikId from urun_bilgi where adet<60 

-- varolan tabloya kayýt aktarma

-----------------------------------------------

select LEFT (Ad,4)+UPPER(Left(Soyad,1))+SUBSTRING(Unvan,Charindex(' ',Unvan)+1,3) as 'ÞÝFRE' from personel_bilgi 

--  Ad sütununun ilk 4 karakterini alýr sonra soyadinin ilk karakterini alir , onu büyük harfle yazar  ve unvan sütunundaki ilk boþluktan sonraki 3 karakteri alýr.

---------------------------------------------

select Ad+' '+Soyad+'-'+convert(nvarchar,id) from  personel_bilgi 

-- convert fonksiyonu ile sayýsal olmayan bir deðeri nvarchar yapabiliriz.

----------------------------------------------

SELECT ad AS Adi, soyad AS Soyadi INTO YeniPersonel FROM personel_bilgi;

--personel_bilgi tablosundan ad ve soyad alanlarýný seçer ve YeniPersonel adýnda yeni bir tabloya kopyalar.

select * from YeniPersonel

-------------------------------------------------

TRUNCATE TABLE #gecici_hasta_bilgi;

--#gecici_hasta_bilgi tablosundaki tüm kayýtlarý siler.

-------------------------------------------

DELETE FROM #gecici_hasta_bilgi;
--#gecici_hasta_bilgi tablosundaki tüm kayýtlarý, WHERE koþulu belirtilmediði için, koþulsuz olarak siler. 

--------------------------------------------

DROP TABLE #gecici_hasta_bilgi;

--#gecici_hasta_bilgi adlý tabloyu ve tablodaki tüm verileri siler.

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

--sahip bilgilerine baðlý olarak geçici hasta bilgilerini depolamak için geçici bir tablo oluþturur. Tablo, hastanýn türü, cinsiyeti, adý, son geliþ tarihi, yaþý, aðýrlýðý, kýsýrlýk durumu ve çip durumunu içerir.

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

--degisken1 adýnda bir deðiþkenin deðerini kontrol eder. Deðiþkenin deðeri 300'den büyükse, urun_bilgi tablosundan maksimum ve minimum ürün fiyatlarýný seçer ve ardýndan deðiþkenin deðerini 1 artýrýr. Deðiþkenin deðeri 300'den küçükse, deðiþkenin deðerini ve ardýndan deðerini 2 artýrarak seçer.

--------------------------------------------------

DECLARE @degisken1 FLOAT = (SELECT MAX(urunFiyat) FROM urun_bilgi);

--urun_bilgi tablosundan urunFiyat sütununun en büyük deðerini degisken1 adýnda bir float deðiþkenine atar.

-----------------------------------------------

UPDATE urun_bilgi SET urunFiyat = (SELECT MAX(urunFiyat)FROM urun_bilgi) WHERE id = (SELECT TOP 1 id FROM urun_bilgi)

--"urun_bilgi" tablosunda en yüksek fiyatý olan ürünün fiyatý, o ürünün id'si ile eþleþen tüm ürünler için günceller.

--------------------------------------------------
