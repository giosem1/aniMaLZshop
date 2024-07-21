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

INSERT INTO utente VALUES(NULL, '2bb55d712c4dcbda95497e811b696352', 'giovanni@gmail.com', 'Giovanni', 'Semioli', '2001-12-20', 'Via Roma', '30', '84127', '1234567890', '1111222233334444', true);
INSERT INTO utente VALUES(NULL, '10811bb33b160b9ba4caf374fd8e11cb', 'giuseppe@gmail.com', 'Giuseppe', 'Ballacchino', '2003-05-12', 'Via Milano', '40', '84127', '2345678901', '2222111133334444', false);
INSERT INTO utente VALUES(NULL, '9617aef4427f40deea8d811371f75dc6', 'valeria@gmail.com', 'Valeria', 'Zaccaro', '2003-10-10', 'Via Salerno', '60', '84127', '3456789012', '2222333311114444', false);

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
INSERT INTO prodotti VALUES(NULL, 'Perfect Lettiera in Silicio per Gatti', '10.99', 'Igenici', 'Gatto', 'Tutte le taglie', 'PERFECT', 'Il marchio Perfect è il tuo alleato a 360° per garantire l igiene e la bellezza del tuo prezioso amico a quattro zampe. La loro gamma di prodotti altamente specializzati è progettata per promuovere l igiene e la salute di cani e gatti, offrendo soluzioni mirate per soddisfare le esigenze degli animali più esigenti e sensibili.
Inoltre, Perfect si dedica anche a preservare l ambiente in cui vivono i tuoi animali domestici, mettendo a disposizione spray e detergenti per la casa. Con competenza e affetto per gli animali, Perfect si contraddistingue come la scelta ottimale per chiunque voglia garantire ai propri amici pelosi soltanto il meglio in termini di cura e benessere.', 
'lettiera.png', '10');
INSERT INTO prodotti VALUES(NULL, 'Pallina erba gatta', '6.50', 'Giochi', 'Gatto', 'Tutte le taglie', 'Lifelong', 'Trovate un giocattolo per il vostro gatto: l erba gatta è lo snack preferito del gatto e la palla è il giocattolo preferito del gatto, la loro combinazione rende impossibile per il gatto smettere di amarlo ed è una scelta di prim ordine per gli animali domestici.
Il set contiene una pallina di erba gatta più 1 pallina di erba gatta sostituibile.
Palla di erba gatta naturale: l erba gatta è una pianta naturale che viene essiccata e sminuzzata in una forma friabile.', 
'pallina_erba_gatta.jpg', '20');
INSERT INTO prodotti VALUES(NULL,'Incubatore Digitale Per Uova Reptibator', '300.00', 'Farmaceutici', 'Rettile', 'Tutte le taglie','CROCI','L incubatore Digitale per uova di Croci è il luogo perfetto in cui tenere le uova dei rettili fino alla loro naturale schiusura: la presenza contemporanea di serbatoi di acqua e inserti in spugna consentono di mantenere il livello di umidità ideale',
'rettili.png','1');
INSERT INTO prodotti VALUES(NULL,'MultiFit Snack per Roditori Drops Mix Senza Cereali', '54.99', 'Snack', 'Roditore', 'Tutte le taglie', 'MULTIFIT', 'MultiFit Grain Free Drops è uno snack senza cereali disponibile in diverse versioni e offre deliziosi snack per il tuo piccolo animale domestico.',
'roditori.png', '30');
INSERT INTO prodotti VALUES(NULL,'Neo Foractil Spray per Uccelli 300 ml', '15.36', 'Farmaceutici', 'Uccello', 'Tutte le taglie', 'CROCI','Soluzione spray per uso esterno, per uccelli da gabbia e voliera.',
'uccelli.png', '5');
INSERT INTO prodotti VALUES(NULL,'Mangime per Pesci Discus in Granuli', '6.99', 'Cibo','Pesce', 'Tutte le taglie', 'Tetra','Il mangime per pesci di Tetra è ideale per lalimentazione dei pesci Discus, realizzato in piccoli granuli per favorire una dieta ricca di vitamine e proteine e povera di grassi. Stai cercando il cibo ideale per il re dell acqua dolce Discus? Il pesce Discus, tra i più belli e affascinanti negli acquari dolci, ha bisogno di un alimentazione adatta per la sua natura pacifica. Tetra Discus è la nutrizione giusta per il pesce Disco.',
'pesci.png', '20');
INSERT INTO prodotti VALUES(NULL,'Acquario Xcube Black Led', '90.39', 'Accessori','Pesce', 'Tutte le taglie', 'Amtra','Acquario Xcube Black Led è un acquario dal design raffinato e moderno, ideale per creare un piccolo angolo di natura acquatica in casa. Questo acquario è realizzato con un vetro frontale curvato e privo di spigoli, offrendo una visione chiara e piacevole del mondo sottomarino. Le siliconature trasparenti e gli angoli frontali arrotondati, insieme a cornici e coperchio in plastica resistente, conferiscono al Xcube Black Led un aspetto pulito ed elegante.',
'acquario.png', '40');
INSERT INTO prodotti VALUES(NULL,'Mangiatoia Uccelli Naturale', '13.51', 'Accessori','Uccello', 'Tutte le taglie', 'Trixie','La Mangiatoia per Uccelli Naturale di Trixie è un accessorio per volatili con un ottima resistenza alle intemperie e ai parassiti, puoi appenderla al muro, composta da legno di cedro, robusto e durevole nel tempo.',
'mangiatoia.png', '25');
INSERT INTO prodotti VALUES(NULL,'Ciotola in ceramica per criceti', '3.44', 'Accessori','Roditore', 'Tutte le taglie', 'Trixie','La Ciotola in ceramica per criceti, firmata Trixie, è disponibile in diversi colori .Questa ciotola per roditori è comodamente lavabile in lavastoviglie.',
'ciotola.png', '54');
INSERT INTO prodotti VALUES(NULL,'Palla per Cane Snack Labirint Gomma', '7.19', 'Giochi','Cane', 'Tutte le taglie', 'Trixie','La palla snack Labirint in gomma naturale di Trixie è un gioco d intelligenza, indicato per cani piccoli. Il gioco, in gomma naturale, abbina divertimento e alimentazione: la palla può essere riempita con leccornie che scendono lentamente grazie al labirinto interno, che rallentano quindi l uscita per un esperienza più duratura. La palla Snack Labirint rotola dolcemente e rimbalza in modo imprevedibile. Nota: i colori di questo prodotto sono assortiti, non possono dunque essere selezionati. Stimola la creatività e intelligenza del tuo amico a quattro zampe, garantendo divertimento e gusto',
'palla.png', '31');
INSERT INTO prodotti VALUES(NULL,'AniOne Tappetini Assorbenti', '9.19', 'Igenici','Cane', 'Tutte le taglie', 'AniOne','I tappetini assorbenti AniOne sono una soluzione pratica e versatile per l addestramento del cucciolo alla pulizia in casa e per gestire eventuali problemi di incontinenza nei cani adulti. Offrono un ottima assorbenza, protezione dalle perdite e facilità d uso, aiutando a mantenere l ambiente del tuo animale domestico pulito e igienico.',
'traversine.png', '22');
INSERT INTO prodotti VALUES(NULL,'Virtus Dog Snack Soft Trota con Aneto 150G', '2.99', 'Snack', 'Cane', 'Tutte le taglie', 'Virtus', 'Il Virtus Dog Snack Soft Trota e Aneto è un premietto per cani ideale per gratificare il tuo amico a quattro zampe durante l addestramento, per tenerlo occupato o semplicemente per favorire ligiene dei suoi denti.Sicuramente tieni molto al benessere del tuo cane; infatti, nutrirlo con prodotti di qualità è fondamentale per preservare la loro salute. Gli snack sono un complemento molto importante nella normale alimentazione del cane.',
'snackc.png', '16');
INSERT INTO prodotti VALUES(NULL,'Felpa per Cani Cotton Brushed Star Wars', '19.95', 'Abbigliamento', 'Cane', 'Tutte le taglie', 'Virtus', 'Felpa per cani Star Wars traspirante ed elastica. Appositamente disegnata e dedicata per i cani di piccola e media taglia. Design esclusivo stile casual. L apertura sul retro permette a qualsiasi guinzaglio di essere facilmente agganciato attraverso la felpa alla pettorina o all’anello del collare. Morbida fodera, 35% tessuto cotone COTTON BRUSHED 280 gsm e 65% POLIESTERE. Elastici per le zampe posteriori. Logo della licenza nella parte inferiore della schiena. Prodotto ufficiale DISNEY.',
'starwars.png', '27');
INSERT INTO prodotti VALUES(NULL,'Catisfactions Snack Gatto con Salmone ', '4.65', 'Snack', 'Gatto', 'Tutte le taglie', 'Catisfactions', 'Lo snack al salmone per gatti e gattini Catisfactions nel formato Maxi Pack è uno spuntino prelibato con una consistenza speciale. Un alimento complementare sfizioso con un ripieno racchiuso in un croccante confetto. Una ricompensa o uno spuntino ideale da consumare fuori dai pasti.',
'snackg.png', '12');
INSERT INTO prodotti VALUES(NULL,'Body Post Operatorio Gatto', '10.75', 'Abbigliamento', 'Gatto', 'Tutte le taglie', 'orienrace', 'Body per gatto post-operatorio, tuta per il recupero del gatto, tutina per gatto post-operatoria sterilizzata, tuta professionale per il recupero del gatto per ferite addominali o malattie della pelle.',
'tutina.png', '4');
INSERT INTO prodotti VALUES(NULL,'Barbecue Essiccato Grilli per Rettili', '10.48', 'Igenici', 'Rettile', 'Tutte le taglie', 'Trixie', 'Trixie offre anche prodotti per piccoli animali domestici, attivando nei settori Ornitologia, Roditori e piccoli animali, Terrariofilia e Acquariofilia.Adatto anche per piccoli mammiferi.',
'barbecue.png', '8');
INSERT INTO prodotti VALUES(NULL,'Vermi della farina essiccati', '24.58', 'Snack', 'Rettile', 'Tutte le taglie', 'EWL Natur', 'I nostri vermi da pasto sono essiccati con particolare delicatezza, in modo da conservare tutte le sostanze nutritive importanti. Sono poi confezionati con cura per evitare rotture.Grazie al loro elevato contenuto proteico, i nostri vermi da pasto essiccati sono una fonte di energia ideale per tutti i rettili, i roditori e i pesci durante tutto l anno.',
'vermi.png', '3');
INSERT INTO prodotti VALUES(NULL,'Advantage Antiparassitario Spot on per Gatti', '19.99', 'Farmaceutici', 'Roditore', 'Tutte le taglie', 'Advantage', 'Soluzione Spot-On per gatti e conigli piccoli 0-4KG.',
'parassiti.png', '9');
INSERT INTO prodotti VALUES(NULL,'Kit per la Cura dei Roditori', '12.50', 'Igenici', 'Roditore', 'Tutte le taglie', 'Anione', 'Il set per la cura AniOne è composto da forbici da artiglio, una spazzola per affettare con un pettine per la pulizia e un pettine per pulci e polvere.Il regolare taglio delle unghie è importante per il benessere e la libertà di movimento dell animale. I manici antiscivolo delle forbici da artiglio consentono un fissaggio e un taglio mirati.',
'kit.png', '28');
INSERT INTO prodotti VALUES(NULL,'Set di giochi in paglia roditore', '2.30', 'Giochi', 'Roditore', 'Tutte le taglie', 'Trixie', 'La pannocchie e la carota di Trixe sono un set di giochi in paglia per piccoli animali come porcellini d India e conigli,la confezione contiene 2 pezzi. 100% materiale naturale per un passatempo in tutta sicurezza. Dimensione: 15 cm.',
'carote.png', '13');
INSERT INTO prodotti VALUES(NULL,'Medicinale Cura malattia Puntini Bianchi Sera Protazol', '29.00', 'Farmaceutici', 'Pesce', 'Tutte le taglie', 'Sera', 'I pesci ornamentali sbianchiano la pelle torbida e le impurità delimitate, lo fanno arrivare a una infestazione con individui parassiti. L agente patogeno della malattia dei puntini nei pesci d acqua dolce (Ichtiofthirius multifiliis), ad esempio, causa piccoli soffioni. Altri parassiti della pelle monocellulare come Ichthyobodo sp., Chilodonella sp. o piscinoodinium pillulare nell acqua dolce garantiscono anche piccoli puntini sulla pelle.',
'pescip.png', '6');
INSERT INTO prodotti VALUES(NULL,'Aspirapolvere Acquario per Cambio Acqua', '34.09', 'Igenici', 'Pesce', 'Tutte le taglie', 'Weigudoc', 'Detergente multifunzionale per acquari: questo kit per il lavaggio della sabbia dell acquario include uno scambiatore d acqua, una testa di lavaggio della sabbia trasparente, una testa di aspirazione con ugello piatto, una testa di lavaggio della sabbia rotonda, un sacchetto filtro e un soffione doccia, che possono pulire efficacemente la sabbia, rimuovere lo sporco e filtrare. Ideale per la pulizia quotidiana dell acquario per mantenere sani e vivi pesci, tartarughe e altre creature.',
'pescik.png', '50');
INSERT INTO prodotti VALUES(NULL,'Fiocchi per Pesci Rossi', '2.08', 'Snack', 'Pesce', 'Tutte le taglie', 'Next', 'Next Fiocchi per Pesci Rossi è un mangime per tutti i pesci ornamentali, si contraddistingue per la sua elevata appetibilità. L alimento galleggia sulla superficie della acqua, per poi andare va verso il fondo molto lentamente, sono quindi il mangime ideale per i pesci piccoli. I fiocchi Next sono un concentrato di nutrienti e bastano poche quantità per soddisfare il fabbisogno giornaliero del pesce rosso, si raccomanda quindi di rispettare con attenzione la dose giornaliera. Prodotto disponibile in pack da 50gr e 200gr.',
'snackpesci.png', '44');
INSERT INTO prodotti VALUES(NULL,'Nekton Tonic K - Tonico (200 G)', '13.99', 'Igenici','Uccello', 'Tutte le taglie', 'Nekton','Preparato per varie specie di uccelli. Aiuta ad alleviare le malattie, lo stress, le pareti, l allevamento della covata e ad acclimatarsi a nuove accessioni o trapianti.',
'Nekton.jpg', '40');
INSERT INTO prodotti VALUES(NULL,'wildtier herz Mangime Uccelli Selvatici', '31.45', 'Cibo','Uccello', 'Tutte le taglie', 'wildtier','Mangime senza guscio: mangime di alta qualità per uccelli selvatici con semi di girasole, cereali, arachidi e uva sultanina finissima. Equilibrato e ricco di energia, senza grano e con tutti i nutrienti necessari per gli uccelli selvatici.
Attrae la biodiversità: il mangime senza guscio attira una vasta gamma di specie di uccelli nel tuo giardino, fornendo loro una fonte di cibo naturale e di alta qualità. Adatto per mangiatoie, casette per uccelli, mangiatoie da fondo o ciotole.',
'uccellomangime.jpg', '40');
INSERT INTO prodotti VALUES(NULL,'Lafeber Parrot Tropical Nutriberries', '15.45', 'Snack','Uccello', 'Tutte le taglie', 'Lafeber','Tropical Nutriberries KT/TL 300g - Per Piccoli e Medi Pappagalli 32640E Tropical Nutri-Berries è un alimento completo con papaya, ananas e mango Tutte le Nutri-Berries sono gustosissime e studiate per essere nutrizionalmente bilanciate oltre che per favorire l’esercizio del becco e della lingua. Questo permette un arricchimento sia nutritivo che comportamentale per piccoli e medi uncinati e pappagalli! Sono senza coloranti e aromi artificiali.',
'uccellimangia.jpg', '40');
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
INSERT INTO news VALUES(NULL, 'Sterilizzazione della gatta: come avviene, cosa fare e quanto costa', 'Benessere e Salute', '2024-06-18', 'Gatti','gattino.jpg', 'Giovanni', 'Quando si affronta il tema della sterilizzazione della gatta, emergono una serie di considerazioni cruciali per il benessere del nostro pet. La sterilizzazione è un intervento comune, condotto con l’obiettivo di controllare la riproduzione, migliorare la salute generale e prevenire comportamenti indesiderati.
In questo articolo, esploreremo le ragioni dietro la scelta di sterilizzare una gatta, i benefici associati e i potenziali rischi.
Inoltre, risponderemo a domande comuni sulla procedura e vedremo come affrontare al meglio il periodo post-operatorio, in modo da fornire alla tua gatta sterilizzata la migliore assistenza possibile per il suo benessere.');
INSERT INTO news VALUES(NULL, 'Come prendersi cura di uccelli tropicali', 'Benessere e Salute', '2024-06-18', 'Uccelli','uccelli.png', 'Giovanni', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO news VALUES(NULL, 'Come fare amicizia con un cagnolino', 'Comportamento e Gioco', '2024-07-10', 'Cani','amicizia.png', 'Giuseppe', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');
INSERT INTO news VALUES(NULL, 'Cosa magiano i cuccioli?', 'Alimentazione', '2024-05-30', 'Cani','cuccioli.png', 'Valeria', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

DROP TABLE IF EXISTS recensisce;
CREATE TABLE recensisce(
	ID_utente INT NOT NULL,
    ID_prodotti INT NOT NULL,
    voto INT,
    recensione TEXT DEFAULT NULL,
	data_publicazione DATE NOT NULL,
    
    PRIMARY KEY(ID_utente, ID_prodotti),
	FOREIGN KEY(ID_utente) REFERENCES utente(ID_utente)
);
INSERT INTO recensisce VALUE('3', '1', '2','TROPPO GRANDE PER IL MIO CHIWAWA, CONSIGLIO UNA TAGLIA PIU PICCOLA PER GLI ALTRI UTENTI, AGGIORNATE UN PO STO DATABASE!!!!!','2024-05-28');
INSERT INTO recensisce VALUE('1', '13', '4','Ottima per non sentire odori, anche se la mia gatta non vuole utilizzare la lettiera, è allergica alla sabbia della lettiera','2024-02-05');
INSERT INTO recensisce VALUE('2', '10', '5','Funziona subito dopo il bagnetto, sono scomparse anche le zanzare da casa, lo consiglio a tutti gli utenti','2024-03-18');

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
