CREATE DATABASE IF NOT EXISTS db_discoteca
CHARSET utf8mb4
COLLATE utf8mb4_general_ci;

USE db_discoteca;

CREATE TABLE tb_gravadora (
	id_gravadora INT NOT NULL,
    nome_gravadora VARCHAR (20) NOT NULL,
PRIMARY KEY (id_gravadora)
);

CREATE TABLE tb_artista (
	id_artista INT NOT NULL,
    nome_artista VARCHAR (20) NOT NULL,
    dt_nasc_artista DATE,
PRIMARY KEY (id_artista)
);

CREATE TABLE tb_genero (
	id_genero INT NOT NULL,
    nome_genero VARCHAR (20) NOT NULL,
PRIMARY KEY (id_genero)
);

CREATE TABLE tb_disco (
	id_disco INT NOT NULL,
    titulo_disco INT NOT NULL,
    tempo_disco FLOAT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    id_artista INT NOT NULL,
    id_gravadora INT NOT NULL,
    id_genero INT NOT NULL,
PRIMARY KEY (id_disco),
CONSTRAINT FK_id_artista FOREIGN KEY (id_artista) REFERENCES tb_artista (id_artista),
CONSTRAINT FK_id_gravadora FOREIGN KEY (id_gravadora) REFERENCES tb_gravadora (id_gravadora),
CONSTRAINT FK_id_genero FOREIGN KEY (id_genero) REFERENCES tb_genero (id_genero)
);

CREATE TABLE tb_musica (
	id_musica INT NOT NULL,
    nome_musica VARCHAR (50) NOT NULL,
    tempo_musica FLOAT NOT NULL,
    id_disco INT NOT NULL,
PRIMARY KEY (id_musica),
CONSTRAINT FK_id_disco FOREIGN KEY (id_disco) REFERENCES tb_disco (id_disco)
);
    
ALTER TABLE tb_disco
	DROP CONSTRAINT FK_id_artista;
    
ALTER TABLE tb_disco
	DROP CONSTRAINT FK_id_gravadora;
    
ALTER TABLE tb_disco
	DROP CONSTRAINT FK_id_genero;

ALTER TABLE tb_gravadora
	MODIFY id_gravadora INT NOT NULL AUTO_INCREMENT;
    
ALTER TABLE tb_artista
	MODIFY id_artista INT NOT NULL AUTO_INCREMENT;
    
ALTER TABLE tb_genero
	MODIFY id_genero INT NOT NULL AUTO_INCREMENT;

ALTER TABLE tb_disco
	ADD CONSTRAINT FK_id_gravadora FOREIGN KEY (id_gravadora) REFERENCES tb_gravadora (id_gravadora),
    ADD CONSTRAINT FK_id_artista FOREIGN KEY (id_artista) REFERENCES tb_artista (id_artista),
    ADD CONSTRAINT FK_id_genero FOREIGN KEY (id_genero) REFERENCES tb_genero (id_genero);

ALTER TABLE tb_musica
	DROP CONSTRAINT FK_id_disco;
    
ALTER TABLE tb_disco
	MODIFY id_disco INT NOT NULL AUTO_INCREMENT;
    
ALTER TABLE tb_musica
	ADD CONSTRAINT FK_id_disco FOREIGN KEY (id_disco) REFERENCES tb_disco (id_disco);
    
ALTER TABLE tb_musica
	MODIFY id_musica INT NOT NULL AUTO_INCREMENT;
    
ALTER TABLE tb_disco
	MODIFY titulo_disco VARCHAR (30);
    
INSERT INTO tb_gravadora
	(nome_gravadora)
VALUES ('AB Records'), ('Balaclava Records'),('CID Entertainment'),('Honey Bomb Records'),('Indie Records'),('Kairós Music'),('Graça Music'),('Phonomotor Records'),('Selo RISCO'),('Digital Music');

SELECT * FROM tb_gravadora;

INSERT INTO tb_artista
	(nome_artista, dt_nasc_artista)
VALUES ('Antônio Carlos Jobim','1927-01-25'),('João Gilberto','1931-06-10'),('Chico Buarque','1944-06-19'),('Caetano Veloso','1942-08-07'),
('Jorge Ben Jor','1939-03-22'),('Roberto Carlos','1941-04-19'),('Noel Rosa','1910-12-11'),('Cartola','1909-08-12'),('Tim Maia','1942-09-28'),('Gilberto Gil','1942-06-26'),
('Dorival Caymmi','1946-04-30'),('Luiz Gonzaga','1912-12-13'),('Elis Regina','1945-03-17'),('Rita Lee','1947-12-31'),('Paulinho da Viola','1942-11-12'),('Vinicius de Moraes','1913-08-13'),
('Raul Seixas','1945-06-28'),('Maria Bethânia','1946-06-18'),('Heitor Villa-Lobos','1887-03-05'),('Mano Brown','1970-04-22');

SELECT * FROM tb_artista;

INSERT INTO tb_genero
	(nome_genero)
VALUES ('Hip Hop'), ('Rock'),('Sertanejo'),('MPB'),('Forró'),('Funk'),('Góspel'),('Blues');

SELECT * FROM tb_genero;

INSERT INTO tb_disco
	(titulo_disco, tempo_disco, ano_lancamento, id_artista, id_gravadora, id_genero)
VALUES ('Acabou Chorare', '36,00', '1972',1,1,1),('Tropicalia ou Panis et Circencis', '37,00', '1968',2,2,2),('Construção', '47,00', '1971',3,3,3),('Chega de Saudade', '57,00', '1959',4,4,4),
('Secos & Molhados', '37,00', '1973',5,5,5),('A Tábua de Esmeralda', '35,00', '1974',6,6,6),('Clube da Esquina', '37,00', '1972',7,7,7),('Cartola', '47,00', '1972',8,8,8),('Os Mutantes', '57,00', '1979',13,4,2),
('Elis & Tom', '37,00', '1974',1,2,8),('Krig-ha, Bandolo!', '47,00', '1974',16,6,2),('Sobrevivendo no Inferno', '57,00', '1997',20,3,1),('Samba Esquema Novo', '45,00', '1977',5,6,4),
('Fruto Proibido', '35,00', '1975',13,10,2),('Racional', '35,00', '1975',9,9,4),('A Divina Comédia ou Ando Meio Desligado', '35,00', '1975',13,8,2),('Roberto Carlos Em Ritmo de Aventura', '55,00', '1970',15,7,8),
('Tim Maia', '45,00', '1970',8,1,4),('Expresso 2222', '35,00', '1977',2,4,8),('Roberto Carlos', '45,00', '1971',6,3,2);


INSERT INTO tb_musica
	(nome_musica, tempo_musica, id_disco)
VALUES (1,'Brasil Pandeiro',3,1),(2,'Preta Pretinha',6.4,1),(3,'Tinindo Trincando',3.26,1),(4,'Swing de Campo Grande',3.1,1),(5,'Acabou Chorare',4.13,1),(6,'Mistério do Planeta',4.24,1),(7,'A Menina Dança',3.51,1),
(8,'Besta é Tu  ',4.26,1),(9,'Um Bilhete Pra Didi ',2.53,1),(10,'Miserere Nóbis',3.44,2),(11,'Coração Materno ',4.17,2),(12,'Panis et Circencis',3.35,2),(13,'Lindoneia',2.14,2),(14,'Parque Industrial',3.16,2),(15,'Geleia Geral',3.42,2),
(16,'Baby',3.31,2),(17,'Três Caravelas (Las Tres Carabelas)',3.06,2),(18,'Enquanto seu Lobo Não Vem',2.31,2),(19,'Mamãe, Coragem',2.3,3),(20,'Bat Macumba',2.3,3),(21,'Hino ao Senhor do Bonfim',3.39,3),(22,'Deus Lhe Pague',3.19,3),(23,'Cotidiano',2.49,3),
(24,'Desalento',2.48,3),(25,'Construção',6.24,3),(26,'Cordão',2.31,3),(27,'Olha Maria (Amparo)',3.56,3),(28,'Samba de Orly',2.4,3),(29,'Valsinha',2,4),(30,'Minha História',3.01,4),(31,'Acalanto ',1.38,4),(32,'Chega de Saudade',2.01,4),(33,'Lobo Bobo',1.2,4),
(34,'Brigas, Nunca Mais',2.05,4),(35,'Hô-bá-lá-lá',2.15,4),(36,'Saudade Fez um Samba',2.01,4),(37,'Maria Ninguém',2.21,4),(38,'Desafinado',1.58,5),(39,'Rosa Morena',2.04,5),(40,'Morena Boca de Ouro',1.58,5),(41,'Aos Pés da Cruz',1.34,5),(42,'É Luxo Só',1.56,5),
(43,'Sangue Latino',2.07,5),(44,'O Vira',2.12,5),(45,'O Patrão Nosso de Cada Dia',3.19,5),(46,'Amor',2.14,5),(47,'Primavera nos Dentes',4.5,6),(48,'Assim Assado',2.58,6),(49,'El Rey',2.58,6),(50,'Rosa de Hiroshima  ',2.58,6),(51,'Prece Cósmica  ',1.57,6),
(52,'Rondó do Capitão  ',1.01,6),(53,'As Andorinhas  ',0.58,6),(54,'Fala  ',3.13,6),(55,'Os Alquimistas Estão Chegando os Alquimistas  ',3.14,6),(56,'O Homem da Gravata Florida (A Gravata Florida de P',3.05,7),(57,'Errare Humanum Est  ',4.5,7),(58,'Menina Mulher da Pele Preta  ',2.57,7),
(59,'Eu Vou Torcer  ',3.15,7),(60,'Magnólia  ',3.14,7),(61,'Minha Teimosia, Uma Arma pra te Conquistar  ',2.41,7),(62,'Zumbi  ',3.3,7),(63,'Brother  ',2.54,7),(64,'O Namorado da Viúva  ',2.03,7),(65,'Hermes Trismegisto e sua Celeste Tábua de Esmerald',5.3,8),
(66,'Cinco Minutos (5 minutos)  ',2.56,8),(67,'Tudo Que Você Podia Ser (Interpretação. Milton Nas',2.56,8),(68,'Cais (Interpretação. Milton Nascimento)',2.45,8),(69,'O Trem Azul (Interpretação. Lô Borges)',4.05,8),(70,'Saídas e Bandeiras nº 1 (Interpretação. Beto Guede',4.05,8),
(71,'Nuvem Cigana (Interpretação. Milton Nascimento)',2.32,8),(72,'Cravo e Canela (Interpretação. Lô Borges e Milton ',2.32,8),(73,'Dos Cruces (Interpretação. Milton Nascimento)',5.22,8),(74,'Um Girassol da Cor do Seu Cabelo (Interpretação. L',4.13,9),(75,'San Vicente (Interpretação. Milton Nascimento)',2.47,9),
(76,'Estrelas (Interpretação. Lô Borges)',0.29,9),(77,'Clube da Esquina nº 2 (Interpretação. Milton Nasci',3.39,9),(78,'Paisagem da Janela (Interpretação. Lô Borges)',2.58,9),(79,'Me Deixa em Paz (Interpretação. Alaíde Costa e Mil',3.06,9),(80,'Os Povos (Interpretação. Milton Nascimento)',4.31,9),
(81,'Saídas e Bandeiras nº 2 (Interpretação. Beto Guede',1.31,9),(82,'Um Gosto de Sol (Interpretação. Milton Nascimento)',4.21,9),(83,'Pelo Amor de Deus (Interpretação. Milton Nasciment',2.06,10),(84,'Lilia (Interpretação. Milton Nascimento)',2.34,10),(85,'Trem de Doido (Interpretação. Lô Borges)',3.58,10),
(86,'Nada Será Como Antes (Interpretação. Beto Guedes e',3.24,10),(87,'Ao Que Vai Nascer (Interpretação. Milton Nasciment',3.21,10),(88,'O Mundo É um Moinho  ',3.53,10),(89,'Minha  ',2.16,10),(90,'Sala de Recepção (participação. Creusa)',3.24,10),(91,'Não Posso Viver Sem Ela  ',2.4,10),
(92,'Preciso Me Encontrar  ',2.57,11),(93,'Peito Vazio  ',2.5,11),(94,'Aconteceu  ',2.5,11),(95,'As Rosas não Falam  ',3.53,11),(96,'Sei Chorar  ',2.51,11),(97,'Ensaboa (participação. Creusa)',2.26,11),(98,'Senhora Tentação  ',3.24,11),(99,'Cordas de Aço  ',3.03,11),(100,'Panis et Circenses  ',2.15,11),
(101,'A Minha Menina  ',3.38,12),(102,'O Relógio  ',4.42,12),(103,'Maria Fulô  ',3.3,12),(104,'Baby  ',3.04,12),(105,'Senhor F  ',3.01,12),(106,'Bat Macumba  ',2.33,12),(107,'Le Premier Bonheur du Jour  ',3.1,12),(108,'Trem Fantasma  ',3.36,12),(109,'Tempo no Tempo  ',3.16,12),
(110,'Ave Gencis Khan  ',1.47,13),(111,'Águas de Março  ',3.48,13),(112,'Pois É  ',3.32,13),(113,'Só Tinha de Ser com Você  ',1.43,13),(114,'Modinha  ',3.49,13),(115,'Triste  ',2.16,13),(116,'Corcovado  ',2.39,13),(117,'O Que Tinha de Ser  ',3.53,13),(118,'Retrato em Branco e Preto  ',1.43,13),
(119,'Brigas, Nunca Mais  ',3.03,14),(120,'Por toda a Minha Vida  ',1.39,14),(121,'Fotografia  ',2.04,14),(122,'Soneto de Separação  ',2.46,14),(123,'Chovendo na Roseira  ',2.2,14),(124,'Inútil Paisagem  ',3.11,14),(125,'Fotografia (versão alternativa)  ',3.08,14),(126,'Bonita  ',4.36,14),
(127,'Introdução. Good Rockin\' Tonight  ',3.07,14),(128,'Mosca na Sopa  ',0.5,15),(129,'Metamorfose Ambulante  ',3.58,15),(130,'Dentadura Postiça  ',3.5,15),(131,'As Minas do Rei Salomão  ',1.3,15),(132,'A Hora do Trem Passar  ',2.22,15),(133,'Al Capone  ',1.5,15),(134,'How Could I Know  ',14.2,15),
(135,'Rockixe  ',2.38,15),(136,'Cachorro Urubu  ',2.36,15),(137,'Ouro de Tolo  ',3.44,16),(138,'Meu Nome É Raul Santos Seixas (Vinheta)  ',2.08,16),(139,'Monólogo ao Pé do Ouvido  ',2.51,16),(140,'Banditismo por Uma Questão de Classe  ',0.51,16),(141,'Rios, Pontes & Overdrives  ',1.07,16),
(142,'A Cidade (música incidental. Boa Noite do Velho Fa',3.59,16),(143,'A Praieira  ',4.03,16),(144,'Samba Makossa  ',4.46,16),(145,'Da Lama ao Caos  ',3.36,16),(146,'Maracatu de Tiro Certeiro  ',3.03,17),(147,'Salustiano Song (instrumental)',4.31,17),(148,'Antene-se  ',4.11,17),
(149,'Risoflora  ',1.28,17),(150,'Lixo do Mangue (instrumental)',3.35,17),(151,'Computadores Fazem Arte  ',4.08,17),(152,'Côco Dub (Afrociberdelia)  ',1.45,17),(153,'(Monólogo ao Pé do Ouvido) (vinheta) / Banditismo ',3.13,17),(154,'Rios, Pontes & Overdrives  ',6.45,17),
(155,'A Cidade (música incidental. Boa Noite do Velho Fa',5.06,18),(156,'A Praieira  ',4.03,18),(157,'Samba Makossa  ',4.46,18),(158,'Da Lama ao Caos  ',3.36,18),(159,'Maracatu de Tiro Certeiro  ',3.03,18),(160,'Salustiano Song (instrumental)',4.31,18),(161,'Antene-se  ',4.11,18),
(162,'Risoflora  ',1.28,18),(163,'Lixo do Mangue (instrumental)',3.35,18),(164,'Mas que Nada  ',4.08,19),(165,'Tim, Dom, Dom  ',1.45,19),(166,'Balança Pema  ',3.01,19),(167,'Vem, Morena, Vem  ',2.21,19),(168,'Chove Chuva  ',1.29,19),(169,'É Só Sambar  ',1.59,19),(170,'Rosa, Menina Rosa  ',3.02,19),
(171,'Quero Esquecer Você  ',2.06,19),(172,'Uala Uala-la  ',2.15,19),(173,'A Tamba  ',2.22,20),(174,'Menina Bonita Não Chora  ',2.09,20),(175,'Por Causa de Você Menina  ',3.04,20),(176,'Dançar pra não Dançar (Rita Lee)',4.13,20),(177,'Agora só Falta Você (Luis Sérgio Carlini / Rita Le',3.25,20),
(178,'Cartão Postal (Paulo Coelho / Rita Lee)',3.25,20),(179,'Fruto Proibido (Rita Lee)',2.04,20),(180,'Esse Tal de Roque Enrow (Paulo Coelho / Rita Lee)',3.53,20),(181,'O Toque (Paulo Coelho / Rita Lee)',5.2,20),(182,'Pirataria (Lee Marcucci / Rita Lee)',4.29,21),(183,'Luz del Fuego (Rita Lee)',4.42,21),
(184,'Ovelha Negra (Rita Lee)',5.39,21),(185,'Imunização Racional (Que Beleza)  ',5.08,21),(186,'O Grão Mestre Varonil  ',0.24,21),(187,'Bom Senso  ',5.08,21),(188,'Energia Racional  ',0.15,21),(189,'Leia o Livro Universo em Desencanto  ',2.5,21),(190,'Contato com o Mundo Racional  ',3.06,21),
(191,'Universo em Desencanto  ',3.43,22),(192,'You Don\'t Know What I Know  ',0.35,22),(193,'Rational Culture  ',12.09,22),(194,'Mateus Enter  ',0.33,22),(195,'O Cidadão do Mundo  ',3.21,22),(196,'Etnia  ',2.33,22),(197,'Quilombo Groove (instrumental)',2.32,22),(198,'Macô  ',4.1,22),
(199,'Um Passeio no Mundo Livre  ',4.1,22),(200,'Samba do Lado  ',3.47,23),(201,'Maracatu Atômico  ',4.45,23),(202,'O Encontro de Isaac Asimov com Santos Dumont no Cé',1.39,23),(203,'Corpo de Lama  ',3.53,23),(204,'Sobremesa  ',3.53,23),(205,'Manguetown  ',3.15,23),
(206,'Um Satélite na Cabeça (Bitnik Generation)  ',2.07,23),(207,'Baião Ambiental (instrumental)',2.33,23),(208,'Sangue de Bairro  ',2.12,23),(209,'Enquanto o Mundo Explode  ',1.29,24),(210,'Interlude Zumbi  ',1.12,24),(211,'Criança de Domingo  ',3.28,24),(212,'Amor de Muito  ',2.55,24),
(213,'Samidarish (instrumental)',4.32,24),(214,'Maracatu Atômico (Atomic Version)',4.33,24),(215,'Maracatu Atômico (Ragga Mix)',3.3,24),(216,'Maracatu Atômico (Trip Hop)',3.41,24),(217,'Cabeça Dinossauro  ',2.19,24),(218,'AA UU  ',3.01,25),(219,'Igreja  ',2.47,25),(220,'Polícia  ',2.07,25),
(221,'Estado Violência  ',3.07,25),(222,'A Face do Destruidor  ',0.34,25),(223,'Porrada  ',2.49,25),(224,'Tô Cansado  ',2.16,25),(225,'Bichos Escrotos  ',3.14,25),(226,'Família  ',3.32,25),(227,'Homem Primata  ',3.27,26),(228,'Dívidas  ',3.06,26),(229,'O Que  ',5.38,26),
(230,'Cabeça Dinossauro (Demo)  ',1.58,26),(231,'AA UU (Demo)  ',1.58,26),(232,'Igreja (Demo)  ',2.48,26),(233,'Polícia (Demo)  ',2.01,26),(234,'Estado Violência (Demo)  ',2.33,26),(235,'A Face do Destruidor (Demo)  ',0.44,26),(236,'Vai pra Rua (Demo)  ',2.18,27),(237,'Tô Cansado (Demo)  ',2.2,27),
(238,'Bichos Escrotos (Demo)  ',3.17,27),(239,'Família (Demo)  ',4.09,27),(240,'Homem Primata (Demo)  ',3.13,27),(241,'Dívidas (Demo)  ',3.09,27),(242,'O Que (Demo)  ',2.12,27),(243,'Daniel Na Cova Dos Leões  ',2.12,27),(244,'Quase Sem Querer  ',4.4,27),(245,'Acrilic On Canvas  ',4.4,28),
(246,'Eduardo e Mônica  ',4.31,28),(247,'Central Do Brasil  ',1.34,28),(248,'Tempo Perdido  ',5.02,28),(249,'Metrópole  ',2.49,28),(250,'Plantas Embaixo do Aquário  ',2.54,28),(251,'Música Urbana 2  ',2.4,28),(252,'Andrea Doria  ',4.53,28),(253,'Fábrica  ',4.56,28),(254,'Índios  ',4.17,29),
(255,'Química (Faixa escondida apenas na versão em fita ',2.15,29),(256,'Ando Meio Desligado  ',3.02,29),(257,'Quem Tem Medo de Brincar de Amor  ',3.36,29),(258,'Ave, Lúcifer  ',2.2,29),(259,'Desculpe, Babe  ',2.49,29),(260,'Meu Refrigerador Não Funciona  ',6.23,29),(261,'Hey Boy  ',2.47,29),
(262,'Preciso Urgentemente Encontrar Um Amigo  ',3.52,29),(263,'Chão de Estrelas  ',3.13,30),(264,'Jogo de Calçada  ',3.29,30),(265,'Haleluia  ',3.42,30),(266,'Oh! Mulher Infiel  ',4.2,30),(267,'Coroné Antônio Bento  ',2.16,30),(268,'Cristina  ',2.09,30),(269,'Jurema  ',1.18,30),
(270,'Padre Cícero  ',2.25,30),(271,'Flamengo  ',2.06,30),(272,'Você Fingiu  ',4.04,31),(273,'Eu Amo Você  ',4.07,31),(274,'Primavera (Vai Chuva)  ',2.15,31),(275,'Risos  ',2.39,31),(276,'Azul da Cor do Mar  ',3.22,31),(277,'Cristina Nº 2  ',1.34,31),(278,'Tributo a Booker Pittman  ',2.48,31),
(279,'Pipoca Moderna (com a Banda de Pífanos de Caruaru)',1.57,31),(280,'Back in Bahia  ',4.35,31),(281,'O Canto da Ema  ',6.2,32),(282,'Chiclete com Banana  ',3.23,32),(283,'Ele e Eu  ',2.17,32),(284,'Sai do Sereno (participação de Gal Costa)',3.2,32),(285,'Expresso 2222  ',2.38,32),
(286,'O Sonho Acabou  ',3.32,32),(287,'Oriente  ',3.32,32),(288,'Nós Vamos Invadir sua Praia  ',4.18,32),(289,'Rebelde sem Causa  ',3.23,32),(290,'Mim Quer Tocar  ',3.51,33),(291,'Zoraide  ',3.28,33),(292,'Ciúme  ',4.09,33),(293,'Inútil  ',3.37,33),(294,'Marylou  ',2.18,33),
(295,'Jesse Go  ',3.52,33),(296,'Eu Me Amo  ',3.34,33),(297,'Se Você Sabia  ',3.39,33),(298,'Independente Futebol Clube  ',2.35,33),(299,'Inútil (Versão Single-1983)',2.51,34),(300,'Mim Quer Tocar (Lado B de Inútil-1983)',3.03,34),(301,'Hino dos Cafajestes (Single)',3.02,34),
(302,'Marylou (Versão Carnaval)',2.24,34),(303,'Ricota (Faixa Previamente Não Lançada)',3.08,34),(304,'De Noite na Cama  ',3.21,34),(305,'Masculino, Feminino  ',4.38,34),(306,'É Preciso Dar Um Jeito, Meu Amigo  ',3.49,34),(307,'Dois Animais na Selva Suja da Rua  ',3.11,34),
(308,'Gente Aberta  ',2.23,35),(309,'Agora Ninguém Chora Mais  ',2.39,35),(310,'Sodoma e Gomorra  ',2.2,35),(311,'Mundo Deserto  ',2.35,35),(312,'Não Te Quero Santa  ',2.48,35),(313,'Ciça, Cecília  ',3.38,35),(314,'Em Busca das Canções Perdidas nº 2  ',2.47,35),
(315,'26 Anos de Vida Normal  ',2.21,35),(316,'Maria Joana  ',3.49,35),(317,'Será que Eu Vou Virar Bolor?  ',3.5,36),(318,'Uma Pessoa Só  ',3.5,36),(319,'Não Estou nem Aí  ',3.2,36),(320,'Vou Me Afundar na Lingerie  ',3.25,36),(321,'Honky Tonky (Patrulha do Espaço)  ',2.15,36),
(322,'Cê Tá Pensando que Eu Sou Lóki?  ',3.25,36),(323,'Desculpe  ',3.1,36),(324,'Navegar de Novo  ',5.3,36),(325,'Te Amo Podes Crer  ',2.5,36),(326,'É Fácil  ',1.55,37),(327,'Como Nossos Pais  ',4.21,37),(328,'Velha Roupa Colorida  ',4.11,37),(329,'Los Hermanos  ',3.33,37),
(330,'Um por Todos  ',2.24,37),(331,'Fascinação (Fascination)',3.01,37),(332,'Jardins de Infância  ',2.49,37),(333,'Quero  ',3.43,37),(334,'Gracias a la Vida  ',4.23,37),(335,'O Cavaleiro e os Moinhos  ',2.04,38),(336,'Tatuagem  ',4.21,38),(337,'Tropicália  ',3.4,38),
(338,'Clarice  ',5.31,38),(339,'No Dia Em Que Eu Vim-me Embora  ',2.26,38),(340,'Alegria, Alegria  ',2.43,38),(341,'Onde Andarás  ',1.55,38),(342,'Anunciação  ',1.55,38),(343,'Superbacana  ',1.28,38),(344,'Paisagem Útil  ',2.35,39),(345,'Clara (com Gal Costa)',2.43,39),
(346,'Soy Loco Por Ti, América  ',3.4,39),(347,'Ave Maria  ',2.06,39),(348,'Eles  ',4.4,39),(349,'Maria Fumaça  ',2.22,39),(350,'Na Baixa do Sapateiro  ',3.02,39),(351,'Mr. Funky Samba  ',3.36,39),(352,'Caminho da Roça  ',2.57,39),(353,'Metalúrgica  ',2.3,40),(354,'Baião  ',3.26,40),
(355,'Casa Forte  ',2.22,40),(356,'Leblon Via Vaz Lôbo  ',3.02,40),(357,'Urubu Malandro  ',2.28,40),(358,'Junia  ',3.39,40),(359,'Alagados  ',3.39,40),(360,'Teerã  ',4.27,40),(361,'A Novidade  ',3.1,40),(362,'Melô do Marinheiro (letra por João Barone)',3.27,1),(363,'Marujo Dub (instrumental)',2.48,2),
(364,'Selvagem  ',4.04,3),(365,'A Dama e o Vagabundo  ',4.2,4),(366,'There\'s a Party  ',2.26,5),(367,'O Homem  ',4.05,6),(368,'Você (versão cover de Tim Maia)',3.2,7),(369,'Será  ',2.3,8),(370,'A Dança  ',4.01,9),(371,'Petróleo do Futuro  ',3.02,10),(372,'Ainda É Cedo  ',3.57,11),
(373,'Perdidos no Espaço  ',2.57,12),(374,'Geração Coca-Cola  ',2.22,13),(375,'O Reggae  ',3.33,14),(376,'Baader-Meinhof Blues  ',3.27,15),(377,'Soldados   ',4.5,16),(378,'Teorema  ',3.06,17),(379,'Por Enquanto  ',3.16,18),(380,'Geração Coca-Cola (demo 1983)  ',2.2,19),
(381,'Ainda é cedo (demo 1983)  ',4.41,20),(382,'A Dança (demo 1983) - part Herbert Vianna  ',3.03,21),(383,'Química (Clip Pirata)  ',3.55,22),(384,'Perdidos no Espaço (Outtake)  ',3.21,23),(385,'O Reggae (Outtake)  ',4.09,24),(386,'Renato Apresenta  ',3.28,25),
(387,'Ainda é cedo (take 9)  ',1.15,26),(388,'Será (Outtake)  ',2.31,27),(389,'Chamadas de rádio  ',1.04,28),(390,'Petróleo do Futuro (demo BSB)  ',2.42,29),(391,'Ainda é cedo (demo BSB)  ',4.23,30),(392,'Teorema (demo BSB)  ',2.35,31),(393,'Aduuuuuuhhh!! (ao vivo)  ',2.4,32),
(394,'Profecia de Renato  ',1.39,33),(395,'Por Enquanto (Outtake)  ',2.49,34),(396,'A Dança (remix Mario Caldato) part Herbert Vianna ',3.04,35),(397,'O Reggae (remix Liminha)  ',3.48,36),(398,'Todo Carnaval Tem Seu Fim (Marcelo Camelo)',4.23,37),(399,'A Flor (Rodrigo Amarante, Marcelo Camelo)',3.27,38),
(400,'Retrato Pra Iaiá (Rodrigo Amarante, Marcelo Camelo',3.57,39),(401,'Assim Será (Marcelo Camelo)',3.36,40);


CREATE VIEW vw_gravadora AS
SELECT g.id_gravadora ID, 
g.nome_gravadora NOME, 
COUNT(d.id_disco) DISCOS 
FROM tb_gravadora g
JOIN tb_disco d
ON d.id_gravadora = g.id_gravadora GROUP BY g.id_gravadora;


-- vw_disco - deve conter todos os dados do disco, porem as fks devem ser substituidas pelo nome do item que a mesma representa.
CREATE VIEW vw_disco AS
SELECT d.id_disco ID,
		d.titulo_disco TITULO,
        d.tempo_disco TEMPO,
        d.ano_lancamento ANO,
        a.nome_artista ARTISTA,
        g.nome_gravadora GRAVADORA,
        e.nome_genero GENERO 
FROM tb_disco d
INNER JOIN tb_artista a
ON a.id_artista = d.id_artista
INNER JOIN tb_gravadora g
ON g.id_gravadora = d.id_gravadora
INNER JOIN tb_genero e
ON e.id_genero = d.id_genero;


-- vw_artista - deve conter id, nome completo, idade, total de discos
CREATE VIEW vw_artista AS
SELECT a.id_artista ID, 
	CONCAT(a.nome_artista,' ', a.sobrenome_artista) NOME,
        a.idade_artista IDADE,
        COUNT(d.id_disco) DISCOS
FROM tb_artista a
INNER JOIN tb_disco d
ON d.id_artista = a.id_artista GROUP BY d.id_artista;

-- vw_musicas - deve conter nome da musica, duração, o disco e o artista.

CREATE VIEW vw_musica AS
SELECT m.nome_musica MUSICA,
	   m.tempo_musica TEMPO,
       d.titulo_disco DISCO,
       CONCAT(a.nome_artista,' ', a.sobrenome_artista) ARTISTA
FROM tb_musica m
INNER JOIN tb_disco d
	ON d.id_disco = m.id_disco
INNER JOIN tb_artista a
	ON d.id_artista = a.id_artista;
	
	
DELIMITER $$
CREATE PROCEDURE sp_insertGravadora(nome_g VARCHAR (20))
BEGIN
	INSERT INTO tb_gravadora (nome_gravadora)
    VALUES (RemoveAcento(nome_g));
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sp_insertArtista(nome_a VARCHAR (20), sobrenome_a VARCHAR (30), dtnasc_a DATE, idade_a INT)
BEGIN
	INSERT INTO tb_artista (nome_artista, sobrenome_artista, dt_nasc_artista, idade_artista)
    VALUES (RemoveAcento(nome_a), RemoveAcento(sobrenome_a), dtnasc_a, idade_a);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sp_insertGenero(nome_e VARCHAR(20))
BEGIN
	INSERT INTO tb_genero (nome_genero)
    VALUES (RemoveAcento(nome_e));
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sp_insertMusica (nome_m VARCHAR(20), tempo_musica_m FLOAT, id_disco_m INT)
BEGIN
	INSERT INTO tb_musica (nome_musica, tempo_musica, id_disco)
    VALUES (RemoveAcento(nome_m), tempo_musica_m, id_disco_m);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE sp_insertDisco(titulo_disco_d VARCHAR(20), tempo_disco_d FLOAT, ano_lancamento_d YEAR, id_artista_d INT, id_gravadora_d INT, id_genero_d INT)
BEGIN
	INSERT INTO tb_disco (titulo_disco, tempo_disco, ano_lancamento, id_artista, id_gravadora, id_genero)
    VALUES (RemoveAcento(titulo_disco_d), tempo_disco_d, ano_lancamento_d, id_artista_d, id_gravadora_d, id_genero_d);
END $$
DELIMITER ;
