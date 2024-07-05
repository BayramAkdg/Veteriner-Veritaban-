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
