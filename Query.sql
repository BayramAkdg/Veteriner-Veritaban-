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
