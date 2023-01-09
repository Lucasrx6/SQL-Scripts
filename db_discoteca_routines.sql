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
-- Temporary table structure for view `vw_musica`
--

DROP TABLE IF EXISTS `vw_musica`;
/*!50001 DROP VIEW IF EXISTS `vw_musica`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_musica` (
  `MUSICA` tinyint NOT NULL,
  `TEMPO` tinyint NOT NULL,
  `DISCO` tinyint NOT NULL,
  `ARTISTA` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_gravadora`
--

DROP TABLE IF EXISTS `vw_gravadora`;
/*!50001 DROP VIEW IF EXISTS `vw_gravadora`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_gravadora` (
  `ID` tinyint NOT NULL,
  `NOME` tinyint NOT NULL,
  `DISCOS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_disco`
--

DROP TABLE IF EXISTS `vw_disco`;
/*!50001 DROP VIEW IF EXISTS `vw_disco`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_disco` (
  `ID` tinyint NOT NULL,
  `TITULO` tinyint NOT NULL,
  `TEMPO` tinyint NOT NULL,
  `ANO` tinyint NOT NULL,
  `ARTISTA` tinyint NOT NULL,
  `GRAVADORA` tinyint NOT NULL,
  `GENERO` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_artista`
--

DROP TABLE IF EXISTS `vw_artista`;
/*!50001 DROP VIEW IF EXISTS `vw_artista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_artista` (
  `ID` tinyint NOT NULL,
  `NOME` tinyint NOT NULL,
  `IDADE` tinyint NOT NULL,
  `DISCOS` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_musica`
--

/*!50001 DROP TABLE IF EXISTS `vw_musica`*/;
/*!50001 DROP VIEW IF EXISTS `vw_musica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_musica` AS select `m`.`nome_musica` AS `MUSICA`,`m`.`tempo_musica` AS `TEMPO`,`d`.`titulo_disco` AS `DISCO`,concat(`a`.`nome_artista`,' ',`a`.`sobrenome_artista`) AS `ARTISTA` from ((`tb_musica` `m` join `tb_disco` `d` on(`d`.`id_disco` = `m`.`id_disco`)) join `tb_artista` `a` on(`d`.`id_artista` = `a`.`id_artista`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gravadora`
--

/*!50001 DROP TABLE IF EXISTS `vw_gravadora`*/;
/*!50001 DROP VIEW IF EXISTS `vw_gravadora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gravadora` AS select `g`.`id_gravadora` AS `ID`,`g`.`nome_gravadora` AS `NOME`,count(`d`.`id_disco`) AS `DISCOS` from (`tb_gravadora` `g` join `tb_disco` `d` on(`d`.`id_gravadora` = `g`.`id_gravadora`)) group by `g`.`id_gravadora` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_disco`
--

/*!50001 DROP TABLE IF EXISTS `vw_disco`*/;
/*!50001 DROP VIEW IF EXISTS `vw_disco`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_disco` AS select `d`.`id_disco` AS `ID`,`d`.`titulo_disco` AS `TITULO`,`d`.`tempo_disco` AS `TEMPO`,`d`.`ano_lancamento` AS `ANO`,`a`.`nome_artista` AS `ARTISTA`,`g`.`nome_gravadora` AS `GRAVADORA`,`e`.`nome_genero` AS `GENERO` from (((`tb_disco` `d` join `tb_artista` `a` on(`a`.`id_artista` = `d`.`id_artista`)) join `tb_gravadora` `g` on(`g`.`id_gravadora` = `d`.`id_gravadora`)) join `tb_genero` `e` on(`e`.`id_genero` = `d`.`id_genero`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_artista`
--

/*!50001 DROP TABLE IF EXISTS `vw_artista`*/;
/*!50001 DROP VIEW IF EXISTS `vw_artista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_artista` AS select `a`.`id_artista` AS `ID`,concat(`a`.`nome_artista`,' ',`a`.`sobrenome_artista`) AS `NOME`,`a`.`idade_artista` AS `IDADE`,count(`d`.`id_disco`) AS `DISCOS` from (`tb_artista` `a` join `tb_disco` `d` on(`d`.`id_artista` = `a`.`id_artista`)) group by `a`.`id_artista` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 11:27:22
