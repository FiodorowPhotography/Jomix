DROP DATABASE If EXISTS m28441_jomix;
CREATE DATABASE m28441_jomix;
use m28441_jomix;



DROP TABLE IF EXISTS uzytkownicy;
CREATE TABLE uzytkownicy
(
    userID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    imie varchar(55),
    nazwisko varchar(55),
    login varchar(55),
    haslo varchar(256),
    admin tinyint NOT NULL DEFAULT 0,
    email varchar(55)
    
);

DROP TABLE IF EXISTS koszyk;
CREATE TABLE koszyk
(
    koszykID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID int(11) NOT NULL,
    szczegoly_produktID int(11) NOT NULL,
    ilosc int NOT NULL DEFAULT 1,
    cena float(11) NOT NULL
  
);

ALTER TABLE koszyk
ADD CONSTRAINT FOREIGN KEY (userID) REFERENCES uzytkownicy (userID);


DROP TABLE IF EXISTS zamowienia;
CREATE TABLE zamowienia
(
    zamowienieID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID int(11) NOT NULL,
    status_zamowienia tinyint NOT NULL DEFAULT 0,
    kwota_zamowienia float(11) NOT NULL,
    platnoscID int(11) NOT NULL,
    dostawaID int(11) NOT NULL,
    data_zamowienia DATE NOT NULL,
    email varchar(55),
    nr_tel varchar(12),
    kraj varchar(55),
    kod_pocztowy varchar(6),
    poczta varchar(55),
    adres1 varchar(55),
    adres2 varchar(55)
    
);

ALTER TABLE zamowienia
ADD CONSTRAINT FOREIGN KEY (userID) REFERENCES uzytkownicy (userID);


DROP TABLE IF EXISTS szczegoly_zamowienia;
CREATE TABLE szczegoly_zamowienia
(
    szczegoly_zamowieniaID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    zamowienieID int(11) NOT NULL,
    szczegoly_produktuID int(11) NOT NULL,
    ilosc int NOT NULL DEFAULT 1,
    cena float(11)
);

ALTER TABLE szczegoly_zamowienia
ADD CONSTRAINT FOREIGN KEY (zamowienieID) REFERENCES zamowienia (zamowienieID);


DROP TABLE IF EXISTS produkty;
CREATE TABLE produkty
(
    produktID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userID int(11),
    kategoriaID int(11) NOT NULL,
    nazwa_produktu varchar(55) NOT NULL,
    opis_produktu varchar(300),
    cena float(6) NOT NULL,
    promocja float NOT NULL DEFAULT 0,
    SKU varchar(100) NOT NULL,
    img_url varchar(256)
);





DROP TABLE IF EXISTS rozmiary;
CREATE TABLE rozmiary
(
    rozmiarID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa_rozmiaru varchar(11)
);


DROP TABLE IF EXISTS szczegoly_produktu;
CREATE TABLE szczegoly_produktu
(
    szczegoly_produktuID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    produktID int(11) NOT NULL,
    rozmiarID int(11) NOT NULL,
    ilosc int(11) NOT NULL
);

ALTER TABLE szczegoly_zamowienia
ADD CONSTRAINT FOREIGN KEY (szczegoly_produktuID) REFERENCES szczegoly_produktu (szczegoly_produktuID);

ALTER TABLE szczegoly_produktu
ADD CONSTRAINT FOREIGN KEY (produktID) REFERENCES produkty (produktID);
ALTER TABLE szczegoly_produktu
ADD CONSTRAINT FOREIGN KEY (rozmiarID) REFERENCES rozmiary (rozmiarID);



DROP TABLE IF EXISTS kategorie;
CREATE TABLE kategorie
(
    kategoriaID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa_kategorii varchar(55) NOT NULL
);


ALTER TABLE produkty
ADD CONSTRAINT FOREIGN KEY (kategoriaID) REFERENCES kategorie (kategoriaID);

DROP TABLE IF EXISTS platnosc;
CREATE TABLE platnosc
(
    platnoscID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    metoda_platnosci varchar(55) NOT NULL
);

ALTER TABLE zamowienia
ADD CONSTRAINT FOREIGN KEY (platnoscID) REFERENCES platnosc (platnoscID);



DROP TABLE IF EXISTS dostawcy;
CREATE TABLE dostawcy
(
    dostawcyID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nazwa_dostawcy varchar(55) NOT NULL,
    cena_dostawy float(11) NOT NULL
);

ALTER TABLE zamowienia
ADD CONSTRAINT FOREIGN KEY (dostawaID) REFERENCES dostawcy (dostawcyID);


INSERT INTO uzytkownicy (imie, nazwisko, login, haslo, admin, email)
    values ("Admin", "Admin","admin","$argon2i$v=19$m=65536,t=4,p=1$NzF6Y0VmM0tRVDZ1M2VKOQ$8ZrB9DstC3ukZAHUD/QdCExsVLbQYeulcqHVbMAPdRE",1, "admin@gmail.com");


INSERT INTO rozmiary (nazwa_rozmiaru)
    values ("S"),("M"),("L"),("XL");


INSERT INTO kategorie (nazwa_kategorii)
    values ("Sukienki"),("Bluzki"),("Komplety"),("Sp??dnice"),("Spodnie");

INSERT INTO produkty (    
    userID, kategoriaID, nazwa_produktu, opis_produktu, cena, promocja, SKU, img_url)
values (1,1,"Sukienka dresowa Tessa musztardowy","Sukienka dresowa Tessa idealnie sprawdzi si?? w wielu jesiennych stylizacjach. Posiada rozci??cia na bokach, kt??re dodaj?? jej oryginalnego charakteru. Golf w formie komina to doskona??a opcja na wietrzne dni, dodatkowo jest ??wietnym elementem ozdobnym.",79.99,0,6873,"zdjecia/Sukienka_dresowa_Tessa_musztardowy.jpg"),
       (1,1,"Lniana sukienka Emma be??owy","Lniana sukienka  Emma o lu??nym kroju w stylu oversize. Sukienka posiada dekolt w kszta??cie litery V  oraz odci??cie, kt??re daje efekt delikatnej falbany. Wywini??ty r??kaw nadaje sukience sportowego stylu. Sukienka Emma zosta??a wykonana z przewiewnego, lnianego materia??u. Idealnie sprawdzi si?? w wiosennych oraz letnich stylizacjach.",99.99,0,2531,"zdjecia/Lniana_sukienka_Emma_be??owy.jpg"),
       (1,1,"Wiskozowa sukienka Charlotte czerwony","Klasyczna sukienka z rozkloszowaniem, zak??adany dekolt w kszta??cie litery V, r??kaw 3/4. Wykonana z wiskozy, dost??pna w czterech kolorach. Idealna propozycja na wyj??tkowe okazje, jak i na co dzie??.",89.99,0,3275,"zdjecia/Wiskozowa_sukienka_Charlotte_czerwony.jpg"),
       (1,1,"Bawe??niana Sukiena Molly be??owa","Zimowa wersja sukienki Molly, kt??ra skrad??a Wasze serca. Oversizowy fason z falbankami, kt??re ukryj?? drobne niedoskona??o??ci. D??ugi r??kaw, dekolt typu ????dka. Ponadczasowy kr??j, w kt??rym si?? zakochasz. Wykonana z przyjemnego dla cia??a, bawe??nianego materia??u. Totalny must-have tego sezonu!",89.99,69.99,6245,"zdjecia/Bawe??niana_Sukiena_Molly_be??owa.jpg"),
       (1,2,"Bluzka basic w paski","Bawe??niana bluzka basic w paski. Lu??ny kr??j, dekolt typu serek. Dost??pna w dw??ch wersjach kolorystycznych.",59.99,0,7301,"zdjecia/Bluzka_basic_w_paski.jpg"),
       (1,2,"Bluzka Victoria","Bawe??niana bluzka Victoria o prostym, eleganckim kroju. Uroku dodaj?? bufiaste falbanki na ramionach. Bluzka Victoria to nasza propozycja na sezon wiosenno-letni, kt??ra sprawdzi si?? w wielu stylizacjach. Wykonana z najwy??szej jako??ci dzianiny bawe??nianej, dost??pna w dw??ch wersjach kolorystycznych.",69.99,0,8822,"zdjecia/Bluzka_Victoria.jpg"),
       (1,2,"T-SHIRT basic V","Bawe??niana bluzka z dekoldem w serek o eleganckim kroju. Bluzka ta nasza propozycja na sezon wiosenno-letni, kt??ra sprawdzi si?? w wielu stylizacjach. Wykonana z najwy??szej jako??ci dzianiny bawe??nianej.",59.99,0,3564,"zdjecia/T-SHIRT_basic_V.jpg"),
       (1,3,"Klasyczny komplet w krat??","Komplet damski w krat?? to niezawodna stylizacja na wyj??tkowe okazje. Eleganckie spodnie w po????czeniu z taliowan?? marynark?? stanowi?? ??wietn?? ca??o????. Marynarka posiada r??kaw 3/4. Klasyczny kr??j wraz z modn?? krat?? to must have, kt??ry musi znale???? si?? w twojej szafie.",139.99,0,2645,"zdjecia/Klasyczny_komplet_w_krat??.jpg"),
       (1,3,"Komplet dresowy Holly","Klasyczny, a zarazem kobiecy komplet dresowy Holly, kt??ry ??wietnie sprawdzi si?? w okresie wiosenno-letnim. Niezb??dny w garderobie ka??dej kobiety, kt??ra ceni sobie wygod?? i styl. Bluza posiada kaptur oraz kieszonk?? kangurk??. Spodnie z gumk?? na dole oraz kieszeniami po bokach.",129.99,0,9648,"zdjecia/Komplet_dresowy_Holly_bluza.jpg"),
       (1,5,"Spodnie w kratk??","Klasyczne spodnie z efektown?? zak??adk??. Materia?? w czarno-bia???? kratk?? z czerwonym akcentem. Idealnie sprawdz?? si?? w codziennych i eleganckich stylizacjach.",59.99,0,5945,"zdjecia/Spodnie_w_kratk??.jpg"),
       (1,5,"Klasyczne spodnie w krat??","Klasyczne spodnie w krat?? to niezawodny element, kt??ry ??wietnie sprawdzi si?? przy wielu stylizacjach. Spodnie posiadaj?? zak??adki, kt??re nadaj?? im elegancji i szyku. Prosty kr??j wraz z modn?? krat?? to must have, kt??ry musi znale???? si?? w twojej szafie.",69.99,0,5642,"zdjecia/Klasyczne_spodnie_w_krat??.jpg"),
       (1,4,"Sp??dnica Maxi","Bawe??niana sp??dniczka Maxi jest po????czeniem lekkiego, sportowego stylu z odrobin?? elegancji. Idealnie nadaje si?? do trampek oraz eleganckich but??w, mo??esz nosi?? j?? tak jak lubisz. ",99.99,0,3672,"zdjecia/Sp??dnica_Maxi.jpg"),
       (1,4,"Sp??dnica Caroline liliowy","Bawe??niana sp??dniczka Caroline jest po????czeniem lekkiego, sportowego stylu z odrobin?? elegancji. Sp??dnica posiada mini falbank??, kt??ra dodaje jej delikatno??ci. Idealnie nadaje si?? do trampek oraz eleganckich but??w, mo??esz nosi?? j?? tak jak lubisz.",79.99,0,5673,"zdjecia/Sp??dnica_Caroline_liliowy.jpg"),
       (1,1,"Dopasowana sukienka Mona","Sukienka Mona o dopasowanym kroju. R??kaw 3/4, dekolt typu ????dka. Idealnie podkre??li atuty kobiecej sylwetki. Wykonana z najwy??szej jako??ci dzianiny wiskozowej.",79.99,69.99,5596,"zdjecia/Dopasowana_sukienka_Mona.jpg"),
       (1,1,"Sukienka Isabelle z falban??","Sukienka z odci??ciem w pasie i falban??. Lu??ny fason nadaje jej lekkiego charakteru. Idealnie tuszuje mankamenty sylwetki. Wykonana z wysokiej jako??ci dzianiny bawe??nianej.",79.99,0,6695,"zdjecia/Sukienka_Isabelle_z_falban??.jpg");


INSERT INTO szczegoly_produktu (produktID, rozmiarID, ilosc)
    values
        (1,1,9),(1,2,0),(1,3,10),(1,4,10),
        (2,1,10),(2,2,3),(2,3,10),(2,4,10),
        (3,1,10),(3,2,10),(3,3,4),(3,4,10),
        (4,1,10),(4,2,10),(4,3,10),(4,4,10),
        (5,1,10),(5,2,10),(5,3,10),(5,4,10),
        (6,1,10),(6,2,10),(6,3,10),(6,4,10),
        (7,1,10),(7,2,10),(7,3,10),(7,4,10),
        (8,1,10),(8,2,10),(8,3,10),(8,4,10),
        (9,1,10),(9,2,10),(9,3,10),(9,4,10),
        (10,1,10),(10,2,10),(10,3,7),(10,4,10),
        (11,1,10),(11,2,7),(11,3,10),(11,4,10),
        (12,1,10),(12,2,10),(12,3,10),(12,4,10),
        (13,1,10),(13,2,10),(13,3,10),(13,4,10),
        (14,1,10),(14,2,10),(14,3,10),(14,4,10),
        (15,1,10),(15,2,10),(15,3,10),(15,4,10);

INSERT INTO dostawcy (nazwa_dostawcy, cena_dostawy)
    values ("Kurier DHL",15.25),("Kurier DPD",15.11), ("Poczta Polska",12.40), ("Paczkomat InPost",10.99);

INSERT INTO platnosc (metoda_platnosci)
    values ("Przelew tradycyjny"), ("Przelew bankowy"), ("BLIK"), ("Google Pay");