-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: db_discoteca
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_disco`
--

DROP TABLE IF EXISTS `tb_disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_disco` (
  `id_disco` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_disco` varchar(30) DEFAULT NULL,
  `tempo_disco` float NOT NULL,
  `ano_lancamento` year(4) NOT NULL,
  `id_artista` int(11) NOT NULL,
  `id_gravadora` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  PRIMARY KEY (`id_disco`),
  KEY `FK_id_gravadora` (`id_gravadora`),
  KEY `FK_id_artista` (`id_artista`),
  KEY `FK_id_genero` (`id_genero`),
  CONSTRAINT `FK_id_artista` FOREIGN KEY (`id_artista`) REFERENCES `tb_artista` (`id_artista`),
  CONSTRAINT `FK_id_genero` FOREIGN KEY (`id_genero`) REFERENCES `tb_genero` (`id_genero`),
  CONSTRAINT `FK_id_gravadora` FOREIGN KEY (`id_gravadora`) REFERENCES `tb_gravadora` (`id_gravadora`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_disco`
--

LOCK TABLES `tb_disco` WRITE;
/*!40000 ALTER TABLE `tb_disco` DISABLE KEYS */;
INSERT INTO `tb_disco` VALUES (1,'Acabou Chorare',36,1972,1,1,1),(2,'Tropicalia ou Panis et Circenc',31,1968,2,2,2),(3,'Construção',42,1971,3,3,3),(4,'Chega de Saudade',44,1959,4,4,4),(5,'Secos & Molhados',37,1973,5,5,5),(6,'A Tábua de Esmeralda',35,1974,6,6,6),(7,'Clube da Esquina',41,1972,7,7,7),(8,'Cartola',47,1972,8,8,8),(9,'Os Mutantes',31,1979,13,4,2),(10,'Elis & Tom',37,1974,1,2,8),(11,'Krig-ha, Bandolo!',41,1974,16,6,2),(12,'Sobrevivendo no Inferno',57,1997,20,3,1),(13,'Samba Esquema Novo',45,1977,5,6,4),(14,'Fruto Proibido',35,1975,13,10,2),(15,'Racional',35,1975,9,9,4),(16,'A Divina Comédia ou Ando Meio ',35,1975,13,8,2),(17,'Roberto Carlos Em Ritmo de Ave',55,1970,15,7,8),(18,'Tim Maia',45,1970,8,1,4),(19,'Expresso 2222',35,1977,2,4,8),(20,'Roberto Carlos',45,1971,6,3,2),(21,'Circense',45,1980,20,9,7),(22,'Revoluções por Minuto',44,1982,18,8,2),(23,'Araçá Azul',44,1973,16,6,3),(24,'A Sétima Efervescência',43,1997,14,5,1),(25,'Doces Bárbaros',42,1976,12,3,4),(26,'Vivendo e Não Aprendendo',41,1996,10,1,5),(27,'Lado B Lado A',40,1995,8,4,2),(28,'Wave',39,1994,1,2,6),(29,'Cantar',38,1993,3,1,1),(30,'Quem é Quem',37,1992,5,5,5),(31,'Nada como um Dia após o Outro ',38,1999,20,10,8),(32,'Verde, Anil, Amarelo, Cor-de-R',39,2002,19,10,7),(33,'Beleléu, Leléu, Eu',40,2001,18,9,6),(34,'Jovem Guarda',35,2000,17,1,4),(35,'Qualquer Coisa/Jóia',36,1983,15,4,2),(36,'Matita Perê',38,1993,13,5,3),(37,'O Inimitável',40,1996,11,7,4),(38,'Psicoacústica',33,1992,9,6,3),(39,'Álibi',36,1995,7,4,6),(40,'Canções Praieiras',38,1996,2,2,2),(45,'Um Dia Azul',32.12,1996,5,3,6);
/*!40000 ALTER TABLE `tb_disco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 11:27:22
