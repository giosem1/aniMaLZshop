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
'pettorina.png', '5');
INSERT INTO prodotti VALUES(NULL, 'Royal Canin Puppy', '16.99', 'Cibo', 'Cane', 'M', 'Royal Canin', 'Medium Puppy bocconcini in salsa è un alimento umido completo e bilanciato appositamente formulato per soddisfare i fabbisogni nutrizionali dei cuccioli di taglia media (peso da adulto tra 11 e 25 kg) sino al raggiungimento dei 12 mesi di età .
La dimensione, la consistenza ed il gusto ottimali rendono questi bocconcini in salsa particolarmente adatti ai cuccioli di taglia media durante la crescita.', 
'royal-canin.png', '10');
INSERT INTO prodotti VALUES(NULL, 'Adtab Compresse 48 Mg Gatti', '26.75', 'Farmaceutici', 'Gatto', 'Tutte le taglie', 'Adtab', 'Per il trattamento delle infestazioni da pulci e zecche nei gatti. Questo medicinale veterinario fornisce immediata e persistente attivita pulcicida (Ctenocephalides felis e C. canis) e zecchicida (Ixodes ricinus) per 1 mese.
Pulci e zecche devono attaccarsi all ospite ed iniziare ad alimentarsi per essere esposte alla sostanza attiva.', 
'adtab-compresse.jpg', '35');
INSERT INTO prodotti VALUES(NULL, 'MigliorGatto Vaschetta Pollo e Coniglio 100 g', '0.59', 'Cibo', 'Gatto', 'Tutte le taglie', 'Miglior gatto', 'Miglior Gatto è il pasto completo ed equilibrato per il tuo gatto. Ad alta digeribilità è il pasto perfetto, ricco di carni per una massa muscolare più tonica e Vitamina E per l’azione antiossidante, per mantenere il tuo gatto sempre snello, energico e vitale. Il gusto dei bocconcini,
al Pollo e Tacchino, conferisce l’alta appetibilità.', 
'miglior-gatto.jpg', '32');
INSERT INTO prodotti VALUES(NULL, 'Repti Carbon Heater 50w', '22.59', 'Accessori', 'Rettile', 'Tutte le taglie', 'Repti Carbon Heater', 'Lampada riscaldante in fibra di carbonio. Emette calore senza luce, il calore emesso da questa lampada è molto più simile al calore dei raggi solari rispetto alle classiche lampade in ceramica, il calore emesso entra più a fondo nei tessuti degli animali. Dotata di griglia di protezione, a parità di wattaggio emette più calore rispetto ad una lampada in ceramica.
 50W di questa lampada emettono lo stesso calore di una lampada in ceramica da 100W', 
'repti-carbon-heater.jpg', '0');
INSERT INTO prodotti VALUES(NULL, 'Repti Planet Omnivore Diet - Dieta in gel per rettili onnivori', '6.59', 'Cibo', 'Rettile', 'Tutte le taglie', 'Repti Planet', 'Omnivore Diet è un mangime completo e totalmente bilanciato in gel per tutte le specie di rettili onnivori. Contiene; veri insetti, uova, carne, frutti, verdure, Fiori, miele, polline, vitamine e minerali.
Omnivore Diet è fatto in Inghilterra, alimento completo per animali onnivori inclusa la tiliqua dalla lingua blu. Il mix contiene la corretta formulazione di piante/vegetali, carne/insetti, frutta, vitamine e minerali. Tutti prodotti naturali.
Alimento in polvere, va aggiunta acqua per creare un alimento completo in gel probiotico per specie onnivore di rettili, come tiliqua, varie specie di agama, varani e altre lucertole. Fornisce un livello equilibrato di proteine, vitamine e minerali e fibre. Adatto a tutte le fasi della vita.', 
'omnivore-diet.png', '10');
INSERT INTO prodotti VALUES(NULL, 'Bunny Sogno BASIC per Criceti', '16.59', 'Cibo', 'Roditore', 'Tutte le taglie', 'Bunny', 'La fisiologia nutrizionale del criceto e il relativo fabbisogno alimentare, in combinazione con le più recenti conoscenze scientifiche, sono la base a partire da cui è stato sviluppato il mangime per criceti Bunny Sogno BASIC (Bunny Traum BASIC). La sua composizione è ottimale, perché calibrata sulle esigenze naturali dei criceti,
 e gli componenti sono stati scelti tenendo in considerazione l habitat naturale del criceto', 
'bunny.jpg', '10');
INSERT INTO prodotti VALUES(NULL, 'FRONTLINE Triact,6 pippette, Antiparassitario per Cani', '28.99', 'Farmaceutici', 'Cane', 'M', 'FRONTLINE', 'FRONTLINE TriAct Cani Taglia M (10-20 kg). TRATTAMENTO OTTIMALE: elimina in modo rapido e duraturo pulci, zecche, zanzare e pappataci; protegge dal rischio di trasmissione della Leishmaniosi DURATA: un unica applicazione protegge da: zecche: insetticida e repellente fino a 4 settimane dopo il trattamento',
'frontline-antip.jpg','20');
INSERT INTO prodotti VALUES(NULL, 'FOzo-Vet – Contro Otiti Acute e Croniche', '24.99', 'Farmaceutici', 'Cane', 'M', 'FOzo-Vet', 'BENEFICI CANE: Prodotto particolarmente indicato nelle otiti acute dei Cani e Croniche di origine Allergica, Batterica e Micotica.
TERAPIE: Può essere utilizzato in associazione ai farmaci otologici comunemente utilizzati per i cani(quelli contenenti antibiotici, antimicotici e cortisone) e, successivamente, anche per lunghi periodi come prevenzione delle recidive di otiti batteriche e micotiche in quanto non crea alcuna resistenza',
'ozo-vet-orecchie.jpg','26');
INSERT INTO prodotti VALUES(NULL, 'Seresto Collare Antipulci per Cani', '27.39', 'Farmaceutici', 'Cane', 'Tutte le taglie', 'Seresto', 'Il tuo cane merita attenzione. Il collare antiparassitario Seresto, ti aiuta a prenderti cura del tuo amico a quattro zampe. Seresto elimina le pulci ed ha azione repellente contro le zecche prima che possano pungere. Inoltre, riduce il rischio di trasmissione della leishmaniosi fino a 8 mesi.',
'seresto-collare.jpg','26');
INSERT INTO prodotti VALUES(NULL, 'Special Dog Paté Con Vitello e Verdure', '2.49', 'Cibo', 'Cane', 'Tutte le taglie', 'Special Dog', 'Paté premium preparato con carni fresche di vitello e verdure, adatto all’alimentazione quotidiana di cani di tutte le razze, senza coloranti, conservanti e zuccheri aggiunti.',
'special-dog.jpg','58');
INSERT INTO prodotti VALUES(NULL, 'Ferplast - Cuccia per gatti - piccole dimensioni', '12.99', 'Accessori', 'Gatto', 'S', 'Ferplast', 'COMODO CUSCINO PER ANIMALI - Relax è un cuscino per cani e gatti di forma ovale con una morbida imbottitura; Può essere utilizzato da solo come letto accogliente o come luogo di riposo per i vostri amici a quattro zampe; Questo prodotto misura 43 x 30 CM',
'ferplast-cuccia.jpg','14');
INSERT INTO prodotti VALUES(NULL, 'Perfect Lettiera in Silicio per Gatti', '10.99', 'Igienici', 'Gatto', 'Tutte le taglie', 'PERFECT', 'Il marchio Perfect è il tuo alleato a 360° per garantire l igiene e la bellezza del tuo prezioso amico a quattro zampe. La loro gamma di prodotti altamente specializzati è progettata per promuovere l igiene e la salute di cani e gatti, offrendo soluzioni mirate per soddisfare le esigenze degli animali più esigenti e sensibili.
Inoltre, Perfect si dedica anche a preservare l ambiente in cui vivono i tuoi animali domestici, mettendo a disposizione spray e detergenti per la casa. Con competenza e affetto per gli animali, Perfect si contraddistingue come la scelta ottimale per chiunque voglia garantire ai propri amici pelosi soltanto il meglio in termini di cura e benessere.', 
'lettiera.png', '10');
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
INSERT INTO ordine VALUES(NULL,'2024-06-18', '22.35', '2', '1');
INSERT INTO ordine VALUES(NULL,'2024-06-18', '54.99', '1', '2');
INSERT INTO ordine VALUES(NULL,'2024-06-18', '59.73', '3', '3');
DROP TABLE IF EXISTS news;
CREATE TABLE news(
	ID_news INT NOT NULL AUTO_INCREMENT,
    titolo VARCHAR(100) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    data_publicazione DATE NOT NULL,
    animale VARCHAR(10) NOT NULL,
    immagine VARCHAR(100), 
    autore VARCHAR(15) NOT NULL,
    contenuto TEXT DEFAULT NULL,
    PRIMARY KEY(ID_news)
);
INSERT INTO news VALUES(NULL, 'Sterilizzazione della gatta: come avviene, cosa fare e quanto costa', 'Benessere e Salute', '2024-06-18', 'Gatti','gattino.png', 'Giovanni', 'Quando si affronta il tema della sterilizzazione della gatta, emergono una serie di considerazioni cruciali per il benessere del nostro pet. La sterilizzazione è un intervento comune, condotto con l’obiettivo di controllare la riproduzione, migliorare la salute generale e prevenire comportamenti indesiderati.
In questo articolo, esploreremo le ragioni dietro la scelta di sterilizzare una gatta, i benefici associati e i potenziali rischi.
Inoltre, risponderemo a domande comuni sulla procedura e vedremo come affrontare al meglio il periodo post-operatorio, in modo da fornire alla tua gatta sterilizzata la migliore assistenza possibile per il suo benessere.');
INSERT INTO news VALUES(NULL, 'Come fare amicizzia con un cagnolino', 'Comportamento e Gioco', '2024-07-10', 'Cani','cane.png', 'Giuseppe', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

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
	ID_ordine INT NOT NULL,
    ID_prodotti INT NOT NULL,
	nome VARCHAR(100) NOT NULL,
	prezzo DOUBLE NOT NULL,
    quantita INT NOT NULL,
    PRIMARY KEY(ID_ordine,ID_prodotti),
	FOREIGN KEY(ID_ordine) REFERENCES ordine(ID_ordine)
);
INSERT INTO inseriti VALUES('1', '16','Mangime per Pesci Discus in Granuli','6.99','1');
INSERT INTO inseriti VALUES('1', '17','Neo Foractil Spray per Uccelli 300 ml','15.36','1');
INSERT INTO inseriti VALUES('2', '15','MultiFit Snack per Roditori Drops Mix Senza Cereali','54.99','1');
INSERT INTO inseriti VALUES('3', '1','Anione Pettorina Classic Verde','15.99','1');
INSERT INTO inseriti VALUES('3', '2','Royal Canin Puppy','16.99','1');
INSERT INTO inseriti VALUES('3', '3','Adtab Compresse 48 Mg Gatti','26.75','1');
