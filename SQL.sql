--kreiranje tablice
drop table Poveznica_Racun_Traktori;
drop table Poveznica_Racun_Dijelovi;
drop table Poveznica_Racun_Prikljucci;
drop table Racun;
drop table Servisi;
drop table Dio_za_servis;
drop table Kupac;
drop table Dijelovi;
drop table Serviser;
drop table  Trgovac;
drop table  Prikljucci;
drop table Traktori;


CREATE TABLE Kupac (
    Kupac_ID number(5) primary key,
    OIB number(12) not null,
    Ime varchar(100) not null,
    Prezime varchar(100) not null,
    email varchar(50) not null,
    Mjesto_stanovanja varchar(100) not null,
    Ulica varchar(100) not null
);

CREATE TABLE Serviser(
    Serviser_ID VARCHAR(20) PRIMARY KEY,
    Ime VARCHAR(20) NOT NULL,
    Prezime VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Broj_telefona VARCHAR(10) NOT NULL,
    OIB NUMBER(12) NOT NULL,
    Datum_rodenja VARCHAR(50) NOT NULL
);


CREATE TABLE Trgovac(
    Trgovac_ID VARCHAR(20) PRIMARY KEY,
    Ime VARCHAR(20) NOT NULL,
    Prezime VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Broj_telefona VARCHAR(10) NOT NULL,
    OIB NUMBER(12) NOT NULL,
    Datum_rodenja VARCHAR(50) NOT NULL
);

CREATE TABLE Prikljucci(
    Prikljucci_ID VARCHAR(20) PRIMARY KEY,
    Serijski_broj_prikljucka VARCHAR(20) NOT NULL,
    Naziv VARCHAR(50) NOT NULL,
    Godina_Proizvodnje VARCHAR(12) NOT NULL,
    Cijena number(16) NOT NULL
);

CREATE TABLE Traktori(
    Traktori_ID number(20) PRIMARY KEY,
    Serijski_broj_traktora VARCHAR(20) NOT NULL,
    Marka VARCHAR (50) NOT NULL,
    KS number (4) NOT NULL,
    Godina_proizvodnje_traktora VARCHAR (12) NOT NULL,
    Cijena_Traktora_KN number(16) NOT NULL
  
);

CREATE TABLE Dijelovi(
    Skladisni_broj VARCHAR(20) PRIMARY KEY,
    Kataloski_broj VARCHAR(20) NOT NULL,
    Naziv VARCHAR(50) NOT NULL,
    Cijena_dijela_kn number(16) NOT NULL
);



CREATE TABLE Dio_za_servis(
    Dio_za_servis Varchar(100) PRIMARY KEY,
    Opis VARCHAR(100) NOT NULL,
    Godina_proizvodnje VARCHAR(20) NOT NULL,
    Kupac_ID number(5) NOT NULL REFERENCES Kupac(Kupac_ID)
);

CREATE TABLE Servisi(
    Servis_ID VARCHAR(11) PRIMARY KEY,
    Datum_pocetka_servisa DATE NOT NULL,
    Datum_zavrsetka_servisa DATE,
    Opis_servisa VARCHAR(100) ,
    Mjesto_servisiranja VARCHAR(100) NOT NULL,
    Serviser_ID VARCHAR(20) NOT NULL REFERENCES Serviser(Serviser_ID),
    Dio_za_servis Varchar(100) NOT NULL REFERENCES Dio_za_servis(Dio_za_servis),
    Kupac_ID number(5) NOT NULL REFERENCES Kupac(Kupac_ID)
    );
    
    
CREATE TABLE Racun(
    Broj_racuna VARCHAR(20) PRIMARY KEY,
    Vrsta_placanja VARCHAR(20) NOT NULL,
    Kupac_ID number(5) NOT NULL REFERENCES Kupac(Kupac_ID),
    Trgovac_ID VARCHAR(20) NOT NULL REFERENCES Trgovac(Trgovac_ID),
    Datum VARCHAR(20) NOT NULL,
    Trosak number (15) NOT NULL
);


CREATE TABLE Poveznica_Racun_Dijelovi(
      Poveznica_RD VARCHAR(20) PRIMARY KEY,
      Broj_racuna VARCHAR(20) NOT NULL REFERENCES Racun(Broj_racuna),
      Skladisni_broj VARCHAR(20) NOT NULL REFERENCES Dijelovi(Skladisni_broj)
);

CREATE TABLE Poveznica_Racun_Traktori(
      Poveznica_RT VARCHAR(20) PRIMARY KEY,
      Broj_racuna VARCHAR(20) NOT NULL REFERENCES Racun(Broj_racuna),
      Traktori_ID NUMBER(20) NOT NULL REFERENCES Traktori(Traktori_ID)
);

CREATE TABLE Poveznica_Racun_Prikljucci(
      Poveznica_RP VARCHAR(20) PRIMARY KEY,
      Broj_racuna VARCHAR(20) NOT NULL REFERENCES Racun(Broj_racuna),
      Prikljucci_ID VARCHAR(20) NOT NULL REFERENCES Prikljucci(Prikljucci_ID)
);







--Kupac
INSERT INTO Kupac VALUES('1431', 723578830824 ,'Vid','Marusic','vid.marusic@gmail.com', 'Ferbecari','dakovacka ulica 2');
INSERT INTO Kupac VALUES('1432', 621552857832 ,'Frane','Galic','frane.galic@gmail.com ', 'Visinada','Ulica Ivana Nepomuka Petrovi?a 213');
INSERT INTO Kupac VALUES('1433', 566833182447 ,'Borka','Ivancic','ivancic.borka@hotmail.com', 'Dalj','Ulica Otona ?upan?i?a 68');
INSERT INTO Kupac VALUES('1434', 524527319223 ,'Roberto','Jelic','roberto.jelic@gmail.com', 'Tedrovec','Rapska ulica 38');
INSERT INTO Kupac VALUES('1435', 792804527376 ,'Branka','Jurisic','jurisic.branka@gmail.com', 'Tenja ','Gospodarska ulica 56');
INSERT INTO Kupac VALUES('1436', 845529374192 ,'Vidoslav','Vukovic','vido123@gmail.com', 'Amatovci','Ulica Tomislava Miskulina  178');
INSERT INTO Kupac VALUES('1437', 501971441301 ,'Jan','Stojanovic','jan.stojan@gmail.com', 'Dakovo','Ulica brace Radi? 45');
INSERT INTO Kupac VALUES('1438', 122064562133 ,'Nikola','Pavlovic','pavlovic.nikola@gmail.com', 'Nasice','Vara?dinska ulica 77');
INSERT INTO Kupac VALUES('1439', 206814727068 ,'Veceslav','Klobucar','klobucar.veceslav3@gmail.com', 'Novaki','Plitvi?ka ulica 12');
INSERT INTO Kupac VALUES('1440', 356846545356 ,'Vjera','Kovacic','verakovacic@gmail.com', 'Hrastina','Ulica Ru?era Bo?kovi?a 76');
INSERT INTO Kupac VALUES('1441', 308628592574 ,'Andelka','Tadic','tadic.andelka@gmail.com', 'Razbojiste','Ulica Vatroslava Kolandera 165');
INSERT INTO Kupac VALUES('1442', 513580472677 ,'Fabijan','Ilic','fabijan.ilic@gmail.com', 'Orahovica','Kordunska ulica 98');
INSERT INTO Kupac VALUES('1443', 124471654988 ,'Zvonimir','Vidakovic','zvone.vidak@gmail.com', 'Valica','Ulica Milke Trnine 55');
INSERT INTO Kupac VALUES('1444', 839328881052 ,'Grubica','Kolar','grubisa.kolar@gmail.com', 'Varazdin','Baka?eva ulica 23');
INSERT INTO Kupac VALUES('1445', 417945575912 ,'Trpimir','Petkovic','trpimir.petrovcic@gmail.com', 'Civljane','Cvjetna ulica 83');
INSERT INTO Kupac VALUES('1446', 316860430086 ,'Vlatka','Ivanec','vlatka.ivanec@gmail.com', 'Pozega','Marofska ulica 34');
INSERT INTO Kupac VALUES('1447', 133418975816 ,'Ranko','Bosanac','ranko.bosanac@gmail.com', 'Krizevci','Omladinska ulica 48');
INSERT INTO Kupac VALUES('1448', 487922563389 ,'Grgur','Ðuric','grgur.duric@gmail.com', 'Velika Gorica','Ulica Ljudevita Gaja 21 ');
INSERT INTO Kupac VALUES('1449', 197244505684 ,'Milan','Jozic','jolic.milan@gmail.com', 'Visnjan','Li?ka ulica  174');
INSERT INTO Kupac VALUES('1450', 706345410921 ,'Berivoj','Markovic','berivoj.markovic@gmai.com', 'Kutjevo','Ulica Tina Ujevi?a 1');
INSERT INTO Kupac VALUES('1451', 387779404712 ,'Ljerka','Ivancic','ljerka.i@gmail.com', 'Bizovac','Ulica Silvija Strahimira Kranjèeviæa 32');
INSERT INTO Kupac VALUES('1452', 534045470173 ,'Antonio','Kovac','antonio.kava@gmail.com', 'Viljevo','Ulica Vatroslava Lisinskog  44');
INSERT INTO Kupac VALUES('1453', 681150684000 ,'Margareta','Petrovic','mardi241@gmail.com', 'Lepoglava','Kolodvorska ulica 25');
INSERT INTO Kupac VALUES('1454', 823255201498 ,'Renato','Jerkovic','jerkovic.renato@gmail.com', 'Sisak','Primorska ulica 25');
INSERT INTO Kupac VALUES('1455', 102093346934 ,'Mihovil','Jaksic','jaskic.mihovil@gmail.com', 'Cabar','Slavenska ulica  88');
INSERT INTO Kupac VALUES('1456', 235678032414 ,'Braslav','Jovic','jovic.braslav@gmail.com', 'Suhopolje','Ulica Adolfa Wisserta 47');
INSERT INTO Kupac VALUES('1457', 300295151388 ,'Jakov','Stojanovic','stojanovic.jakov@gmail.com', 'Krasic','Ulica Boidara Vanèika 86');
INSERT INTO Kupac VALUES('1458', 559877258038 ,'Davorin','Blazevic','blazevic@davorin@gmail.com', 'Vrbovsko','Ulica Franje Starea 78');
INSERT INTO Kupac VALUES('1459', 694369808918 ,'Emil','Knezevic','knezevic.emil@gmail.com', 'Lastovo','Ulica Janka Leskovara  89');
INSERT INTO Kupac VALUES('1460', 282569931154 ,'Velimir','Jozic','velimir.jozic@gmail.com', 'Karlovac','Ulica Julija Merliæa 22');
INSERT INTO Kupac VALUES('1461', 756084324586 ,'Neven','Pavicic','neven.pavicic@gmail.com', 'Poega','Ulica Mihovila Pavleka Mikine 12');

--Trgovac
INSERT INTO Trgovac VALUES('7-32','Ivan', 'Marjanovic','ivan.marjanovi@poljo.hr','014810535',419525211312,'1965-04-300');
INSERT INTO Trgovac VALUES('7-33','Rajko', 'Hrvatin','rajko.hrvatin@poljo.hr','013734599',262676814115,'1971-09-23');


--Serviser
INSERT INTO Serviser VALUES('4-04','Svetoslav', 'Barisic','svetoslav.barisic@poljo.hr','098269302',561894735211,'1991-11-29');
INSERT INTO Serviser VALUES('4-05','Adam', 'Vukelic','adam.vukelic@poljo.hr','034422101',449683752623,'1983-12-30');
INSERT INTO Serviser VALUES('4-06','Tonci', 'Petkoviæ','tonci.petrovic@poljo.hr','051515888',583859929097,'1978-04-04');
INSERT INTO Serviser VALUES('4-07','Stipe', 'Tadic','stipe.tadic@poljo.hr','051515737',473749035826,'1988-04-04');
INSERT INTO Serviser VALUES('4-08','Pero', 'Nikolic','pero.nikolic@poljo.hr','098226413',917347948696,'1985-02-26');

--Traktori
INSERT INTO Traktori VALUES('1245','2599-1967','SAMA-VIRTUS 140','136','2019','300000');
INSERT INTO Traktori VALUES('1246','2599-1967','SAMA-VIRTUS 140','136','2019','300000');
INSERT INTO Traktori VALUES('1247','2599-1967','SAMA-VIRTUS 140','136','2019','300000');
INSERT INTO Traktori VALUES('1248','2599-1967','SAMA-VIRTUS 140','136','2019','300000');
INSERT INTO Traktori VALUES('1249','2599-1967','SAMA-VIRTUS 140','136','2019','300000');
INSERT INTO Traktori VALUES('2230','7980-9816','SAMA-EXPLORER 100','102','2020','230000');
INSERT INTO Traktori VALUES('2231','7980-9816','SAMA-EXPLORER 100','102','2020','230000');
INSERT INTO Traktori VALUES('3221','1432-2340','SAMA-DORADO 90.4','88','2020','200000');
INSERT INTO Traktori VALUES('3222','1432-2340','SAMA-DORADO 90.4','88','2020','200000');
INSERT INTO Traktori VALUES('3223','1432-2340','SAMA-DORADO 90.4','88','2020','200000');
INSERT INTO Traktori VALUES('4254','7340-6680','SAMA-DORADO 80','75','2020','180000');
INSERT INTO Traktori VALUES('4255','7340-6680','SAMA-DORADO 80','75','2020','180000');
INSERT INTO Traktori VALUES('4256','7340-6680','SAMA-DORADO 80','75','2020','180000');
INSERT INTO Traktori VALUES('4257','7340-6680','SAMA-DORADO 80','75','2020','180000');
INSERT INTO Traktori VALUES('5262','1237-4807','SAMA-ARGON 80','75','2019', '175000');
INSERT INTO Traktori VALUES('5263','1237-4807','SAMA-ARGON 80','75','2019', '175000');
INSERT INTO Traktori VALUES('5264','1237-4807','SAMA-ARGON 80','75','2019', '175000');
INSERT INTO Traktori VALUES('5265','1237-4807','SAMA-ARGON 80','75','2019', '175000');
INSERT INTO Traktori VALUES('6232','7319-1790','SAMA-FRUTTETO','75','2020', '160000');
INSERT INTO Traktori VALUES('6233','7319-1790','SAMA-FRUTTETO','75','2020', '160000');
INSERT INTO Traktori VALUES('6234','7319-1790','SAMA-FRUTTETO','75','2020', '160000');
INSERT INTO Traktori VALUES('6235','7319-1790','SAMA-FRUTTETO','75','2020', '160000');
INSERT INTO Traktori VALUES('6236','7319-1790','SAMA-FRUTTETO','75','2020', '160000');
INSERT INTO Traktori VALUES('7542','4873-8873','DORADO NATURAL','80','2018', '200000');
INSERT INTO Traktori VALUES('7543','4873-8873','DORADO NATURAL','80','2018', '200000');
INSERT INTO Traktori VALUES('7544','4873-8873','DORADO NATURAL','80','2018', '200000');
INSERT INTO Traktori VALUES('7545','4873-8873','DORADO NATURAL','80','2018', '200000');
INSERT INTO Traktori VALUES('7546','2422 6400','DEUTZ-FAHR SERIJA 6 (6155-6215)','212','2020','500000');
INSERT INTO Traktori VALUES('7547','2422 6400','DEUTZ-FAHR SERIJA 6 (6155-6215)','212','2020','500000');
INSERT INTO Traktori VALUES('7548','2422 6400','DEUTZ-FAHR SERIJA 6 (6155-6215)','212','2020','500000');
INSERT INTO Traktori VALUES('8234','8672 5299','DEUTZ-FAHR SERIJA 5D','125','2020','450000');
INSERT INTO Traktori VALUES('8235','8672 5299','DEUTZ-FAHR SERIJA 5D','125','2020','450000');
INSERT INTO Traktori VALUES('8236','8672 5299','DEUTZ-FAHR SERIJA 5D','125','2020','450000');
INSERT INTO Traktori VALUES('9132','7861 1288','DEUTZ-FAHR SERIJA 11','440','2020','1000000');
INSERT INTO Traktori VALUES('9133','7861 1288','DEUTZ-FAHR SERIJA 11','440','2020','1000000');
INSERT INTO Traktori VALUES('9134','7861 1288','DEUTZ-FAHR SERIJA 11','440','2020','1000000');
--Prikljucci
INSERT INTO Prikljucci VALUES('11-0','7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','60000');
INSERT INTO Prikljucci VALUES('11-1','7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','60000');
INSERT INTO Prikljucci VALUES('11-2','7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','60000');
INSERT INTO Prikljucci VALUES('11-3','7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','60000');
INSERT INTO Prikljucci VALUES('11-4','7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','60000');
INSERT INTO Prikljucci VALUES('11.1-0','2142','KUHN-Rotodrljaca MOD.HR 304 D','2019','85000');
INSERT INTO Prikljucci VALUES('11.1-1','2142','KUHN-Rotodrljaca MOD.HR 304 D','2019','85000');
INSERT INTO Prikljucci VALUES('11.1-2','2142','KUHN-Rotodrljaca MOD.HR 304 D','2019','85000');
INSERT INTO Prikljucci VALUES('11.1-3','2142','KUHN-Rotodrljaca MOD.HR 304 D','2019','85000');
INSERT INTO Prikljucci VALUES('11.2-0','5471','CONCEPT PERUGINI-Rotodrljaca MOD. PK 300','2019','35000');
INSERT INTO Prikljucci VALUES('11.2-1','5471','CONCEPT PERUGINI-Rotodrljaca MOD. PK 300','2019','35000');
INSERT INTO Prikljucci VALUES('11.2-2','5471','CONCEPT PERUGINI-Rotodrljaca MOD. PK 300','2019','35000');
INSERT INTO Prikljucci VALUES('11.2-3','5471','CONCEPT PERUGINI-Rotodrljaca MOD. PK 300','2019','35000');
INSERT INTO Prikljucci VALUES('12-0','5131','KUHN-Sijacica MOD. PREMIA 3000 24 MD','2020','90000');
INSERT INTO Prikljucci VALUES('12-1','5131','KUHN-Sijacica MOD. PREMIA 3000 24 MD','2020','90000');
INSERT INTO Prikljucci VALUES('12-2','5131','KUHN-Sijacica MOD. PREMIA 3000 24 MD','2020','90000');
INSERT INTO Prikljucci VALUES('12-3','5131','KUHN-Sijacica MOD. PREMIA 3000 24 MD','2020','90000');
INSERT INTO Prikljucci VALUES('12.1-0','5413','KUHN-Sijacica MOD. INTEGRA 3003 24 SD','2020','95000');
INSERT INTO Prikljucci VALUES('12.1-1','5413','KUHN-Sijacica MOD. INTEGRA 3003 24 SD','2020','95000');
INSERT INTO Prikljucci VALUES('12.1-2','5413','KUHN-Sijacica MOD. INTEGRA 3003 24 SD','2020','95000');
INSERT INTO Prikljucci VALUES('12.1-3','5413','KUHN-Sijacica MOD. INTEGRA 3003 24 SD','2020','95000');
INSERT INTO Prikljucci VALUES('12.1-4','5413','KUHN-Sijacica MOD. INTEGRA 3003 24 SD','2020','95000');
INSERT INTO Prikljucci VALUES('13.1-0','3532','KUHN-Rasipac MOD. MDS 19.1 R2','2019','25000');
INSERT INTO Prikljucci VALUES('13.1-1','3532','KUHN-Rasipac MOD. MDS 19.1 R2','2019','25000');
INSERT INTO Prikljucci VALUES('13.1-2','3532','KUHN-Rasipac MOD. MDS 19.1 R2','2019','25000');
INSERT INTO Prikljucci VALUES('13.1-3','3532','KUHN-Rasipac MOD. MDS 19.1 R2','2019','25000');
INSERT INTO Prikljucci VALUES('13.2-0','2516','KUHN-Rasipac MOD. AXIS 40.2 M-EMC VS 4','2020','60000');
INSERT INTO Prikljucci VALUES('13.2-1','2516','KUHN-Rasipac MOD. AXIS 40.2 M-EMC VS 4','2020','60000');
INSERT INTO Prikljucci VALUES('13.2-2','2516','KUHN-Rasipac MOD. AXIS 40.2 M-EMC VS 4','2020','60000');
INSERT INTO Prikljucci VALUES('13.2-3','2516','KUHN-Rasipac MOD. AXIS 40.2 M-EMC VS 4','2020','60000');
INSERT INTO Prikljucci VALUES('13.2-4','2516','KUHN-Rasipac MOD. AXIS 40.2 M-EMC VS 4','2020','60000');
INSERT INTO Prikljucci VALUES('14-0','6812','KUHN-Prskalica MOD. DELTIS 2','2019','100000');
INSERT INTO Prikljucci VALUES('14-1','6812','KUHN-Prskalica MOD. DELTIS 2','2019','100000');
INSERT INTO Prikljucci VALUES('14-2','6812','KUHN-Prskalica MOD. DELTIS 2','2019','100000');
INSERT INTO Prikljucci VALUES('14-3','6812','KUHN-Prskalica MOD. DELTIS 2','2019','100000');
INSERT INTO Prikljucci VALUES('14-4','6812','KUHN-Prskalica MOD. DELTIS 2','2019','100000');

--Dijelovi
INSERT INTO Dijelovi VALUES('20.0','3611 1914','REMEN 13x1625','30');
INSERT INTO Dijelovi VALUES('20.1','3611 1914','REMEN 13x1625','30');
INSERT INTO Dijelovi VALUES('20.2','3611 1914','REMEN 13x1625','30');
INSERT INTO Dijelovi VALUES('20.3','3611 1914','REMEN 13x1625','30');
INSERT INTO Dijelovi VALUES('21.0','3451 9596','REMEN 17X1650','100');
INSERT INTO Dijelovi VALUES('21.1','3451 9596','REMEN 17X1650','100');
INSERT INTO Dijelovi VALUES('21.2','3451 9596','REMEN 17X1650','100');
INSERT INTO Dijelovi VALUES('21.3','3451 9596','REMEN 17X1650','100');
INSERT INTO Dijelovi VALUES('22.0','1021 9432','REMEN 17X2100','150');
INSERT INTO Dijelovi VALUES('22.1','1021 9432','REMEN 17X2100','150');
INSERT INTO Dijelovi VALUES('22.2','1021 9432','REMEN 17X2100','150');
INSERT INTO Dijelovi VALUES('22.3','1021 9432','REMEN 17X2100','150');
INSERT INTO Dijelovi VALUES('23.0','6501 2443','REMEN 17X6300','500');
INSERT INTO Dijelovi VALUES('23.1','6501 2443','REMEN 17X6300','500');
INSERT INTO Dijelovi VALUES('23.2','6501 2443','REMEN 17X6300','500');
INSERT INTO Dijelovi VALUES('23.3','6501 2443','REMEN 17X6300','500');
INSERT INTO Dijelovi VALUES('24.0','9488 6208','REMEN 22x7300','620');
INSERT INTO Dijelovi VALUES('24.1','9488 6208','REMEN 22x7300','620');
INSERT INTO Dijelovi VALUES('24.2','9488 6208','REMEN 22x7300','620');
INSERT INTO Dijelovi VALUES('24.3','9488 6208','REMEN 22x7300','620');
INSERT INTO Dijelovi VALUES('25.0','5706 0875','Motor DEUTZ','8000');
INSERT INTO Dijelovi VALUES('25.1','5706 0875','Motor DEUTZ','8000');
INSERT INTO Dijelovi VALUES('26.0','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.1','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.2','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.3','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.4','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.5','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.6','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.7','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('26.8','1239 7291','Dupli prst original Schumacher','90');
INSERT INTO Dijelovi VALUES('27.0','7982 0950','Reduktor','500');
INSERT INTO Dijelovi VALUES('27.1','7982 0950','Reduktor','500');
INSERT INTO Dijelovi VALUES('28.0','3977 9349','Remenice fahr 1600','500');
INSERT INTO Dijelovi VALUES('28.1','3977 9349','Remenice fahr 1600','500');
INSERT INTO Dijelovi VALUES('28.2','3977 9349','Remenice fahr 1600','500');
INSERT INTO Dijelovi VALUES('29.0','5253 4582','Opruga cilindra','400');
INSERT INTO Dijelovi VALUES('29.1','5253 4582','Opruga cilindra','400');
INSERT INTO Dijelovi VALUES('29.2','5253 4582','Opruga cilindra','400');
INSERT INTO Dijelovi VALUES('29.3','5253 4582','Opruga cilindra','400');
INSERT INTO Dijelovi VALUES('29.4','9934 9018','lancanik z13','100');
INSERT INTO Dijelovi VALUES('29.5','9934 9018','lancanik z13','100');
INSERT INTO Dijelovi VALUES('29.6','9934 9018','lancanik z13','100');


--Dio za servis i servisi
INSERT INTO Dio_za_servis VALUES('2721 1469','DEUTZ FAHR SERIJA 11','2015','1431');
INSERT INTO Servisi VALUES('1.1','26.01.2018','27.02.2018','','Ferbecari','4-04','2721 1469','1431');
INSERT INTO Dio_za_servis VALUES('9738 6558','DEUTZ FAHR SERIJA 3','2014','1432');
INSERT INTO Servisi VALUES('1.2','24.01.2018','26.08.2018','','Visinada','4-05','9738 6558','1432');
INSERT INTO Dio_za_servis VALUES('2147 2792','DEUTZ FAHR SERIJA 5 DF-DS-D','2000','1447');
INSERT INTO Servisi VALUES('1.3','06.05.2018','06.08.2018','','Krizevci','4-05','2147 2792','1447');
INSERT INTO Dio_za_servis VALUES('9595 2303','DEUTZ FAHR SERIJA 5G','2005','1433');
INSERT INTO Servisi VALUES('1.4','20.08.2018','30.09.2018','','Dalj','4-08','9595 2303','1433');
INSERT INTO Dio_za_servis VALUES('7626 1226','DEUTZ FAHR SERIJA 6','2007','1452');
INSERT INTO Servisi VALUES('1.5','25.09.2018','12.09.2018','','Viljevo','4-08','7626 1226','1452');
INSERT INTO Dio_za_servis VALUES('3126 3653','DEUTZ FAHR SERIJA 6 (6155-6215)','2004','1454');
INSERT INTO Servisi VALUES('1.6','25.05.2018','26.07.2018','Ponjeti specijalnu opremu','Sisak','4-07','3126 3653','1454');
INSERT INTO Dio_za_servis VALUES('5075 4416','KUHN-Rotodrljaca MOD.HR 302 D','2018','1457');
INSERT INTO Servisi VALUES('1.7','25.12.2018','30.02.2019','','Krasic','4-04','5075 4416','1457');
INSERT INTO Dio_za_servis VALUES('5809 4365','KUHN-Prskalica MOD. DELTIS 15','2020','1460');
INSERT INTO Servisi VALUES('1.8','20.02.2018','30.03.2018','','Karlovac','4-08','5809 4365','1460');
INSERT INTO Dio_za_servis VALUES('7319 1790','SAMA-FRUTTETO','2020','1431');
INSERT INTO Servisi VALUES('1.9','20.02.2019','04.05.2019','','Ferbecari','4-05','7319 1790','1431');
INSERT INTO Dio_za_servis VALUES('8291 4454','DEUTZ FAHR SERIJA 7','2016','1461');
INSERT INTO Servisi VALUES('1.10','05.07.2019','10.08.2019','','Pozega','4-06','8291 4454','1461');
INSERT INTO Dio_za_servis VALUES('8338 1867','SAMA-ARGON 80','2015','1434');
INSERT INTO Servisi VALUES('1.11','04.12.2019','15.01.2020','','Tedrovec','4-07','8338 1867','1434');
INSERT INTO Dio_za_servis VALUES('3573 8396','CONCEPT PERUGINI-Rotodrljaca MOD. PK 290','2017','1447');
INSERT INTO Servisi VALUES('1.12','01.01.2020','25.01.2020','','Krizevci','4-06','3573 8396','1447');
INSERT INTO Dio_za_servis VALUES('1559 4385','DEUTZ FAHR SERIJA 7','2020','1436');
INSERT INTO Servisi VALUES('1.13','10.01.2020','30.03.2020','','Amatovci','4-04','1559 4385','1436');
INSERT INTO Dio_za_servis VALUES('7451 5328','DEUTZ FAHR SERIJA 8','2017','1442');
INSERT INTO Servisi VALUES('1.14','25.02.2020','25.03.2020','','Orahovica','4-06','7451 5328','1442');
INSERT INTO Dio_za_servis VALUES('7302','KUHN-Rotodrljaca MOD. HRB 302 D','2019','1449');
INSERT INTO Servisi VALUES('1.15','19.4.2020','20.05.2020','','Vukovar','4-08','7302','1449');
INSERT INTO Dio_za_servis VALUES('7929-4192','DEUTZ-FAHR kombajn SERIJA C9000','2018','1448');
INSERT INTO Servisi VALUES('1.16','21.08.2020','','','Velika Gorica','4-07','7929-4192','1448');
INSERT INTO Dio_za_servis VALUES('9741-7229','DEUTZ-FAHR kombajn SERIJA C9000','2013','1455');
INSERT INTO Servisi VALUES('1.17','20.04.2020','','Krasic','Cabar','4-06','9741-7229','1455');
INSERT INTO Dio_za_servis VALUES('1218 5986','DEUTZ FAHR SERIJA 5','2016','1457');
INSERT INTO Servisi VALUES('1.18','20.9.2020','','','Osijek','4-05','1218 5986','1457');
INSERT INTO Dio_za_servis VALUES('1480 2665','DEUTZ FAHR SERIJA 6','2019','1451');
INSERT INTO Servisi VALUES('1.19','22.09.2020','','','Bizovac','4-08','1480 2665','1451');
INSERT INTO Dio_za_servis VALUES('4873-8873','DORADO NATURAL','2018','1458');
INSERT INTO Servisi VALUES('1.20','25.09.2020','27.09.2020','','Vrbovsko','4-08','4873-8873','1458');

--Racun i RT

INSERT INTO Racun VALUES('R-01','Gotovina','1437','7-32','27.01.2020','1000000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-01','R-01','9132');
INSERT INTO Racun VALUES('R-02','Gotovina','1443','7-32','02.02.2020','230000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-02','R-02','2231');
INSERT INTO Racun VALUES('R-03','Karticno placanje','1441','7-33','25.02.2020','200000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-03','R-03','3223');
INSERT INTO Racun VALUES('R-04','Gotovina','1445','7-33','27.03.2020','175000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-04','R-04','5263');
INSERT INTO Racun VALUES('R-05','Karticno placanje','1444','7-32','03.04.2020','160000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-05','R-05','6233');
INSERT INTO Racun VALUES('R-06','Gotovina','1453','7-33','05.04.2020','175000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-06','R-06','5262');
INSERT INTO Racun VALUES('R-07','Gotovina','1450','7-32','16.04.2020.','500000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-07','R-07','7548');
INSERT INTO Racun VALUES('R-08','Karticno placanje','1453','7-32','25.05.2020','1000000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-08','R-08','9134');
INSERT INTO Racun VALUES('R-09','Karticno placanje','1446','7-32','10.06.2020','475000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-09','R-09','1245');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-10','R-09','5264');
INSERT INTO Racun VALUES('R-10','Karticno placanje','1435','7-33','25.06.2020','230000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-11','R-10','2230');
INSERT INTO Racun VALUES('R-10.1','Karticno placanje','1458','7-33','25.06.2020','200000');
INSERT INTO Poveznica_Racun_Traktori VALUES('RT-12','R-10.1','2230');


--Racun i RP
INSERT INTO Racun VALUES('R-11','Karticno placanje','1433','7-32','02.02.2020','60000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-01','R-11','11-0');
INSERT INTO Racun VALUES('R-12','Karticno placanje','1438','7-33','15.02.2020','85000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-02','R-12','11.1-3');
INSERT INTO Racun VALUES('R-13','Karticno placanje','1441','7-32','17.03.2020','120000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-03','R-13','12.1-1');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-04','R-13','13.1-3');
INSERT INTO Racun VALUES('R-14','Gotovina','1450','7-32','21.03.2020','100000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-05','R-14','14-0');
INSERT INTO Racun VALUES('R-15','Karticno placanje','1452','7-33','05.06.2020','85000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-06','R-15','11.1-0');
INSERT INTO Racun VALUES('R-16','Karticno placanje','1456','7-33','20.06.2020','60000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-07','R-16','11-1');
INSERT INTO Racun VALUES('R-17','Gotovina','1458','7-33','25.06.2020','190000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-08','R-17','12.1-4');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-09','R-17','11.2-2');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-10','R-17','11-2');
INSERT INTO Racun VALUES('R-18','Karticno placanje','1460','7-32','30.07.2020','90000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-11','R-18','12-3');
INSERT INTO Racun VALUES('R-19','Gotovina','1444','7-32','05.08.2020','95000');
INSERT INTO Poveznica_Racun_Prikljucci VALUES('RP-12','R-19','12.1-3');

--Racun i RD
INSERT INTO Racun VALUES('R-20','Gotovina','1435','7-32','20.01.2020','30');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-01','R-20','20.0');
INSERT INTO Racun VALUES('R-21','Karticno placanje','1437','7-32','25.01.2020','400');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-02','R-21','29.3');
INSERT INTO Racun VALUES('R-22','Gotovina','1441','7-33','03.02.2020','500');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-03','R-22','29.0');
INSERT INTO Racun VALUES('R-23','Gotovina','1443','7-32','07.02.2020','90');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-04','R-23','26.0');
INSERT INTO Racun VALUES('R-24','Gotovina','1456','7-32','25.02.2020','150');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-05','R-24','22.1');
INSERT INTO Racun VALUES('R-25','Karticno placanje','1459','7-33','06.03.2020','400');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-06','R-25','29.2');
INSERT INTO Racun VALUES('R-26','Gotovina','1457','7-33','16.03.2020','620');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-07','R-26','24.1');
INSERT INTO Racun VALUES('R-27','Gotovina','1452','7-32','05.04.2020','150');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-08','R-27','22.0');
INSERT INTO Racun VALUES('R-28','Gotovina','1433','7-32','15.04.2020','990');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-09','R-28','23.1');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-10','R-28','26.2');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-11','R-28','29.1');
INSERT INTO Racun VALUES('R-29','Karticno placanje','1447','7-32','10.05.2020','530');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-12','R-29','20.3');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-13','R-29','23.3');
INSERT INTO Racun VALUES('R-30','Gotovina','1457','7-33','30.05.2020','620');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-14','R-30','24.3');
INSERT INTO Racun VALUES('R-31','Gotovina','1433','7-33','24.06.2020','8000');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-1','R-31','25.1');
INSERT INTO Racun VALUES('R-32','Karticno placanje','1458','7-32','05.07.2020','1250');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-15','R-32','24.0');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-16','R-32','20.2');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-17','R-32','27.1');
INSERT INTO Poveznica_Racun_Dijelovi VALUES('RD-18','R-32','29.4');





--upiti
--Upit 1: Zelimo popis svih kupaca koji su potrosili preko 10000 kn i manje od 450000, koji su kupili kod trgovca s Id-em 7-32, datum kada su nesto kupili,
--kolicinu potrosenog novca ,one koji su platili gotovinom,  i ime trgovca,
Select DISTINCT Kupac.ime,Kupac.prezime,Racun.Datum,Racun.Trosak ,
Trgovac.Ime as "Ime trgovca",Trgovac.Prezime as "Prezime trgovca"
FROM Kupac,Racun,Trgovac
WHERE Trgovac.Trgovac_ID='7-32'
and Racun.Trosak>'10000'
AND Racun.Trosak<'450000' 
AND Racun.VRSTA_PLACANJA='Gotovina'
and Racun.KUPAC_ID = Kupac.KUPAC_ID
ORDER BY Kupac.ime;



--Upit 2: Kupac trazi traktor kojem je cjena ispod 300000 kn,jacina traktora u konjskim snagama iznad 80 ks
SELECT Traktori.Marka, Traktori.Cijena_Traktora_KN as "Cijena Traktora" , Traktori.KS
FROM Traktori inner join Poveznica_Racun_Traktori on Traktori.Traktori_ID=Poveznica_Racun_Traktori.Traktori_ID 
inner join Racun on Poveznica_Racun_Traktori.Broj_racuna=Racun.BROJ_RACUNA 
inner join Trgovac on Racun.Trgovac_ID=Trgovac.Trgovac_ID
WHERE  Cijena_Traktora_KN<='300000'
AND Traktori.KS>'80';


--Upit 3: Vracamo racune prikljucaka kojima je trosak  manji od prosjeka
SELECT Prikljucci.NAZIV
FROM Racun,Poveznica_Racun_Prikljucci,Prikljucci
WHERE Racun.Broj_racuna=Poveznica_Racun_Prikljucci.Broj_racuna
and Poveznica_Racun_Prikljucci.Prikljucci_ID=Prikljucci.Prikljucci_ID
AND Prikljucci.Cijena<ALL
(SELECT AVG(Trosak)
FROM Racun,Poveznica_Racun_Prikljucci
WHERE Racun.Broj_racuna=Poveznica_Racun_Prikljucci.Broj_racuna);

--Upit 4: Popis  svih servisa koji su napravljeni od strane servisera Adama vukelica , dio za servis i datum servisiranja i ime kupca
SELECT  Dio_za_servis.Opis, Servisi.Servis_ID, Servisi.Datum_pocetka_servisa, 
Servisi.Datum_zavrsetka_servisa, Servisi.Mjesto_servisiranja, Servisi.Dio_za_servis,
Servisi.Kupac_ID, Kupac.IME,Kupac.PREZIME
FROM Servisi, Dio_za_servis,Serviser,Kupac
WHERE Serviser.Ime ='Adam'
and Serviser.PREZIME='Vukelic'
and Dio_za_servis.DIO_ZA_SERVIS=Servisi.Dio_za_servis
and Servisi.SERVISER_ID=Serviser.SERVISER_ID
and Servisi.Kupac_ID=Kupac.KUPAC_ID;


--Upit 5: Osoba koja je kupila traktor i dovezla taj isti trakor na servis, marku tog traktora i godinu proizvodnje
SELECT distinct Traktori.Marka, Traktori.Godina_proizvodnje_traktora, Kupac.Ime,Kupac.Prezime
FROM Traktori,Dio_za_servis,Kupac, Racun
where Traktori.SERIJSKI_BROJ_TRAKTORA=Dio_za_servis.DIO_ZA_SERVIS
and Kupac.Kupac_ID=Racun.Kupac_ID
and Kupac.Kupac_ID=Dio_za_servis.Kupac_ID;


--Upit 6:



--Procedura 1:Procedura unosa novog traktora 
SELECT * FROM Traktori WHERE Traktori_ID=(SELECT MAX(Traktori_ID) FROM Traktori);

CREATE SEQUENCE Traktori_Sequence
START WITH 9134
INCREMENT BY 1
NOCACHE;

CREATE PROCEDURE  unos_traktora(
unos_traktora_Traktori_ID in Traktori.Traktori_ID%TYPE,
unos_traktora_Serijski_broj_traktora in Traktori.Serijski_broj_traktora%TYPE,
unos_traktora_Marka in Traktori.Marka%TYPE,
unos_traktora_KS in Traktori.KS%TYPE,
unos_traktora_Godina_proizvodnje_traktora in Traktori.Godina_proizvodnje_traktora%TYPE,
unos_traktora_Cijena_Traktora_KN in Traktori.Cijena_Traktora_KN%TYPE
)as
traktor_c1 INTEGER;

BEGIN 
SELECT COUNT(*)
INTO traktor_c1
FROM Traktori
where Traktori_ID=unos_traktora_Traktori_ID;

IF traktor_c1=0 THEN
INSERT INTO Traktori(Traktori_ID,Serijski_broj_traktora,Marka,KS,Godina_proizvodnje_traktora,Cijena_Traktora_KN)
values(Traktori_Sequence.NEXTVAL,unos_traktora_Serijski_broj_traktora,unos_traktora_Marka,unos_traktora_KS,
unos_traktora_Godina_proizvodnje_traktora,unos_traktora_Cijena_Traktora_KN);
COMMIT;
END IF;
END unos_traktora;


CALL unos_traktora('9135','9215 8182','John Deere 8R 280', '280','2020', '700000');

SELECT *FROM TRAKTORI
ORDER BY TRAKTORI_id;

drop procedure unos_traktora;
drop sequence Traktori_Sequence;



--Procedura 2:Auriranje podataka o kupcu

CREATE OR REPLACE PROCEDURE azuriranje_kupca(
azuriranje_kupca_Kupac_ID   in Kupac.Kupac_ID%TYPE,
azuriranje_kupca_OIB  in Kupac.OIB%TYPE,
azuriranje_kupca_Ime in Kupac.Ime%TYPE,
azuriranje_kupca_Prezime in Kupac.Prezime%TYPE,
azuriranje_kupca_email in Kupac.email%TYPE,
azuriranje_kupca_Mjesto_stanovanja in Kupac.Mjesto_stanovanja%TYPE,
azuriranje_kupca_Ulica in Kupac.Ulica%TYPE
)AS KUP_A_C_1 INTEGER;

BEGIN

SELECT COUNT(*)
INTO KUP_A_C_1
FROM Kupac
WHERE OIB=azuriranje_kupca_OIB;

IF KUP_A_C_1=1 then
UPDATE Kupac
set Kupac.Kupac_ID=azuriranje_kupca_Kupac_ID,Kupac.OIB=azuriranje_kupca_OIB,Kupac.Ime=azuriranje_kupca_Ime,Kupac.Prezime=azuriranje_kupca_Prezime,
Kupac.email=azuriranje_kupca_email,Kupac.Mjesto_stanovanja=azuriranje_kupca_Mjesto_stanovanja,Kupac.Ulica=azuriranje_kupca_Ulica
where Kupac_ID=azuriranje_kupca_Kupac_ID;
COMMIT;
END IF;
END azuriranje_kupca;
 


CALL azuriranje_kupca('1435', 792804527376 ,'Branka','Jurisic','jurisic.branka@gmail.com', 'Poganovci','Gospodarska ulica 56');

Select *
from Kupac;
drop procedure azuriranje_kupca;

--Procedura 3: Ispis podataka o Kupcu
CREATE PROCEDURE ispis_kupca(
ispis_kupca_Kupac_ID NUMBER) IS 
Kupac1 Kupac%ROWTYPE;
BEGIN
SELECT *
INTO Kupac1
FROM Kupac
WHERE Kupac_ID=ispis_kupca_Kupac_ID;
dbms_output.put_line(Kupac1.Ime ||' ' || Kupac1.Prezime || ', ' || Kupac1.OIB || ', ' || Kupac1.email);
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line( SQLERRM );
END;

EXEC ispis_kupca(1444);
DROP PROCEDURE ispis_kupca;


---Okidac 1: koji nam ne doputa da Troak na raèunu jendak nuli
CREATE OR REPLACE TRIGGER racraznul
BEFORE UPDATE OR INSERT ON Racun
FOR EACH ROW WHEN (new.Trosak=0)
BEGIN
    raise_application_error(-20122, 'Nemoguc unos');
END racraznul;

DROP TRIGGER racraznul;


--Okidac 2:Ako nema Opisa servisa to je oke
CREATE OR REPLACE  TRIGGER tr_opis
AFTER INSERT ON Servisi 
BEGIN 
    UPDATE Servisi
    SET Opis_servisa='Nema dodatnog opisa'
    WHERE Opis_servisa IS NULL;
END tr_opis;

DROP TRIGGER tr_opis;


------Indexi
CREATE INDEX index_traktor_ID ON Poveznica_Racun_Traktori(Traktori_ID);
CREATE INDEX index_Kupac_ID ON Traktori_ID(Kupac_ID);

drop index index_traktor_ID;
drop index index_Kupac_ID;
