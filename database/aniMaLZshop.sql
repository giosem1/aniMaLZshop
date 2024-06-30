DROP DATABASE IF EXISTS aniMaLZshop;
 CREATE DATABASE aniMaLZshop;
 USE aniMaLZshop;
 
DROP TABLE IF EXISTS utente;
CREATE TABLE utente(
		ID_utente INT NOT NULL AUTO_INCREMENT,
        pwd VARCHAR(50) NOT NULL,
        email VARCHAR(50) NOT NULL,
        nome VARCHAR(20) NOT NULL,
        cognome VARCHAR(20) NOT NULL,
        data_di_nascita DATE NOT NULL,
        via VARCHAR(30) DEFAULT NULL,
        num_civico INT  DEFAULT NULL,
        cap INT DEFAULT NULL,
        telefono CHAR(10) NOT NULL, 
		carta_di_credito CHAR(16) DEFAULT NULL,
        isAmm BOOLEAN NOT NULL,
	
		PRIMARY KEY(ID_utente)
);	

INSERT INTO utente VALUES(NULL, 'gio', 'giovanni@gmail.com', 'Giovanni', 'Semioli', '2001-12-20', 'Via Roma', '30', '84127', '1234567890', '1111222233334444', true);
INSERT INTO utente VALUES(NULL, 'giuse', 'giuseppe@gmail.com', 'Giuseppe', 'Ballacchino', '2003-05-12', 'Via Milano', '40', '84127', '2345678901', '2222111133334444', false);
INSERT INTO utente VALUES(NULL, 'vale', 'valeria@gmail.com', 'Valeria', 'Zaccaro', '2003-10-10', 'Via Salerno', '60', '84127', '3456789012', '2222333311114444', false);

DROP TABLE IF EXISTS prodotti;
CREATE TABLE prodotti(
	ID_prodotti INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
	prezzo DOUBLE NOT NULL,
	genere VARCHAR(50) NOT NULL,
    animale VARCHAR(50) NOT NULL,
	taglia VARCHAR(20) NOT NULL,
    Marca VARCHAR(20) NOT NULL,
	descrizione TEXT DEFAULT NULL,
    immagine VARCHAR(100) DEFAULT NULL, 
    quantita int,
    
    PRIMARY KEY(ID_prodotti)
);
INSERT INTO prodotti VALUES(NULL, 'Anione Pettorina Classic Verde', '15.99', 'Accessori', 'Cane', 'L', 'AniOne', 'L imbracatura AniOne Classic è realizzata in robusto materiale di nylon di alta qualità. Disponibile in molti colori e dimensioni.', 
'cane.png', '5');
INSERT INTO prodotti VALUES(NULL, 'Perfect Lettiera in Silicio per Gatti', '10.99', 'Igienici', 'Gatto', 'Tutte le taglie', 'PERFECT', 'Il marchio Perfect è il tuo alleato a 360° per garantire l igiene e la bellezza del tuo prezioso amico a quattro zampe. La loro gamma di prodotti altamente specializzati è progettata per promuovere l igiene e la salute di cani e gatti, offrendo soluzioni mirate per soddisfare le esigenze degli animali più esigenti e sensibili.
Inoltre, Perfect si dedica anche a preservare l ambiente in cui vivono i tuoi animali domestici, mettendo a disposizione spray e detergenti per la casa. Con competenza e affetto per gli animali, Perfect si contraddistingue come la scelta ottimale per chiunque voglia garantire ai propri amici pelosi soltanto il meglio in termini di cura e benessere.', 
'gattino.png', '10');
INSERT INTO prodotti VALUES(NULL,'Incubatore Digitale Per Uova Reptibator', '300.00', 'Farmaceutici', 'Rettile', 'Tutte le taglie','CROCI','L incubatore Digitale per uova di Croci è il luogo perfetto in cui tenere le uova dei rettili fino alla loro naturale schiusura: la presenza contemporanea di serbatoi di acqua e inserti in spugna consentono di mantenere il livello di umidità ideale',
'rettili.png','1');
INSERT INTO prodotti VALUES(NULL,'MultiFit Snack per Roditori Drops Mix Senza Cereali', '54.99', 'Snack', 'Roditore', 'Tutte le taglie', 'MULTIFIT', 'MultiFit Grain Free Drops è uno snack senza cereali disponibile in diverse versioni e offre deliziosi snack per il tuo piccolo animale domestico.',
'roditori.png', '30');
INSERT INTO prodotti VALUES(NULL,'Neo Foractil Spray per Uccelli 300 ml', '15.36', 'Farmaceutici', 'Uccello', 'TUtte le taglie', 'CROCI','Soluzione spray per uso esterno, per uccelli da gabbia e voliera.',
'uccelli.png', '5');
INSERT INTO prodotti VALUES(NULL,'Mangime per Pesci Discus in Granuli', '6.99', 'Cibo','Pesce', 'Tutte le taglie', 'Tetra','Il mangime per pesci di Tetra è ideale per lalimentazione dei pesci Discus, realizzato in piccoli granuli per favorire una dieta ricca di vitamine e proteine e povera di grassi. Stai cercando il cibo ideale per il re dell acqua dolce Discus? Il pesce Discus, tra i più belli e affascinanti negli acquari dolci, ha bisogno di un alimentazione adatta per la sua natura pacifica. Tetra Discus è la nutrizione giusta per il pesce Disco.',
'pesci.png', '20');

DROP TABLE IF EXISTS ordine;
CREATE TABLE ordine(
	ID_ordine INT NOT NULL AUTO_INCREMENT,
    data_ordine DATE NOT NULL,
    importo DOUBLE, 
    quantita INT,
    ID_utente INT NOT NULL,
    PRIMARY KEY(ID_ordine),
    FOREIGN KEY(ID_utente) REFERENCES utente(ID_utente) 
);

DROP TABLE IF EXISTS news;
CREATE TABLE news(
	ID_news INT NOT NULL AUTO_INCREMENT,
    titolo VARCHAR(100) NOT NULL,
    categoria VARCHAR(15) NOT NULL,
    data_publicazione DATE NOT NULL,
    animale VARCHAR(10) NOT NULL,
    immagine VARCHAR(100), 
    autore VARCHAR(15) NOT NULL,
    contenuto TEXT DEFAULT NULL,
    PRIMARY KEY(ID_news)
);
INSERT INTO news VALUES(NULL, 'Sterilizzazione della gatta: come avviene, cosa fare e quanto costa', 'Veterinaia', '2024-06-18', 'Gatti',NULL, 'Giovanni', 'Quando si affronta il tema della sterilizzazione della gatta, emergono una serie di considerazioni cruciali per il benessere del nostro pet. La sterilizzazione è un intervento comune, condotto con l’obiettivo di controllare la riproduzione, migliorare la salute generale e prevenire comportamenti indesiderati.
In questo articolo, esploreremo le ragioni dietro la scelta di sterilizzare una gatta, i benefici associati e i potenziali rischi.
Inoltre, risponderemo a domande comuni sulla procedura e vedremo come affrontare al meglio il periodo post-operatorio, in modo da fornire alla tua gatta sterilizzata la migliore assistenza possibile per il suo benessere.');
DROP TABLE IF EXISTS recensisce;
CREATE TABLE recensisce(
	ID_utente INT NOT NULL AUTO_INCREMENT,
    ID_prodotti INT NOT NULL,
    voto DOUBLE,
    recensione TEXT DEFAULT NULL,
    
    PRIMARY KEY(ID_utente, ID_prodotti),
	FOREIGN KEY(ID_utente) REFERENCES utente(ID_utente), 
    FOREIGN KEY(ID_prodotti) REFERENCES prodotti(ID_prodotti) 
);
DROP TABLE IF EXISTS aggiunge;
CREATE TABLE aggiunge(
	ID_utente INT NOT NULL AUTO_INCREMENT,
    ID_news INT NOT NULL,
    PRIMARY KEY(ID_utente, ID_news),
	FOREIGN KEY(ID_utente) REFERENCES utente(ID_utente), 
    FOREIGN KEY(ID_news) REFERENCES news(ID_news) 
);
DROP TABLE IF EXISTS inseriti;
CREATE TABLE inseriti(
	ID_ordine INT NOT NULL AUTO_INCREMENT,
    ID_prodotti INT NOT NULL,
    voto DOUBLE,
    recensione TEXT DEFAULT NULL,
    
    PRIMARY KEY(ID_ordine, ID_prodotti),
	FOREIGN KEY(ID_ordine) REFERENCES ordine(ID_ordine), 
    FOREIGN KEY(ID_prodotti) REFERENCES prodotti(ID_prodotti) 
);