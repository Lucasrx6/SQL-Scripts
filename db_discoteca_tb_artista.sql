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
-- Table structure for table `tb_artista`
--

DROP TABLE IF EXISTS `tb_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_artista` (
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `nome_artista` varchar(20) NOT NULL,
  `sobrenome_artista` varchar(30) DEFAULT NULL,
  `dt_nasc_artista` date DEFAULT NULL,
  `idade_artista` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_artista`
--

LOCK TABLES `tb_artista` WRITE;
/*!40000 ALTER TABLE `tb_artista` DISABLE KEYS */;
INSERT INTO `tb_artista` VALUES (1,'Antônio','Carlos Jobim','1927-01-25',95),(2,'João','Gilberto','1931-06-10',91),(3,'Chico','Buarque','1944-06-19',78),(4,'Caetano','Veloso','1942-08-07',80),(5,'Jorge','Ben Jor','1939-03-22',83),(6,'Jorge','Ben Jor','1941-04-19',83),(7,'Noel','Rosa','1910-12-11',112),(8,'Cartola','Silva','1909-08-12',113),(9,'Tim','Maia','1942-09-28',80),(10,'Gilberto','Gil','1942-06-26',80),(11,'Dorival','Caymmi','1946-04-30',76),(12,'Luiz','Gonzaga','1912-12-13',110),(13,'Elis','Regina','1945-03-17',77),(14,'Rita','Lee','1947-12-31',74),(15,'Paulinho','da Viola','1942-11-12',80),(16,'Vinicius','de Moraes','1913-08-13',109),(17,'Raul','Seixas','1945-06-28',77),(18,'Maria','Bethânia','1946-06-18',76),(19,'Heitor','Villa-Lobos','1887-03-05',135),(20,'Mano','Brown','1970-04-22',52),(43,'George','Amaro','1996-11-25',26);
/*!40000 ALTER TABLE `tb_artista` ENABLE KEYS */;
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
