-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: theatre
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `proprietaire`
--

DROP TABLE IF EXISTS `proprietaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietaire` (
  `id_proprietaire` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_proprietaire`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietaire`
--

LOCK TABLES `proprietaire` WRITE;
/*!40000 ALTER TABLE `proprietaire` DISABLE KEYS */;
INSERT INTO `proprietaire` VALUES (1,'toi','Tom'),(2,'moi','Sam'),(3,'elle','Lucie'),(4,'sam','szo');
/*!40000 ALTER TABLE `proprietaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `propriostheatre`
--

DROP TABLE IF EXISTS `propriostheatre`;
/*!50001 DROP VIEW IF EXISTS `propriostheatre`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `propriostheatre` AS SELECT 
 1 AS `nomTheatre`,
 1 AS `nomProprio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `siege`
--

DROP TABLE IF EXISTS `siege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siege` (
  `id_siege` int NOT NULL AUTO_INCREMENT,
  `num` varchar(45) DEFAULT NULL,
  `theatre_id_theatre` int NOT NULL,
  PRIMARY KEY (`id_siege`,`theatre_id_theatre`),
  KEY `fk_siege_theatre1_idx` (`theatre_id_theatre`),
  CONSTRAINT `fk_siege_theatre1` FOREIGN KEY (`theatre_id_theatre`) REFERENCES `theatre` (`id_theatre`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siege`
--

LOCK TABLES `siege` WRITE;
/*!40000 ALTER TABLE `siege` DISABLE KEYS */;
INSERT INTO `siege` VALUES (1,'B1',1),(2,'B2',1),(3,'B3',1),(4,'B4',1),(5,'B5',1),(6,'B6',1);
/*!40000 ALTER TABLE `siege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `id_tarif` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `validite` datetime DEFAULT NULL,
  `siege_id_siege` int NOT NULL,
  PRIMARY KEY (`id_tarif`),
  KEY `fk_tarif_siege1_idx` (`siege_id_siege`),
  CONSTRAINT `fk_tarif_siege1` FOREIGN KEY (`siege_id_siege`) REFERENCES `siege` (`id_siege`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre`
--

DROP TABLE IF EXISTS `theatre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre` (
  `id_theatre` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `proprietaire` varchar(45) DEFAULT NULL,
  `date_construction` date DEFAULT NULL,
  PRIMARY KEY (`id_theatre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre`
--

LOCK TABLES `theatre` WRITE;
/*!40000 ALTER TABLE `theatre` DISABLE KEYS */;
INSERT INTO `theatre` VALUES (1,'Gerard Philippe','1','1948-01-01'),(2,'la colinne','2','1957-01-01'),(3,'Théâtre de Paris','1','1996-01-01');
/*!40000 ALTER TABLE `theatre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theatre_has_proprietaire`
--

DROP TABLE IF EXISTS `theatre_has_proprietaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theatre_has_proprietaire` (
  `theatre_id_theatre` int NOT NULL,
  `proprietaire_id_proprietaire` int NOT NULL,
  PRIMARY KEY (`theatre_id_theatre`,`proprietaire_id_proprietaire`),
  KEY `fk_theatre_has_proprietaire_proprietaire1_idx` (`proprietaire_id_proprietaire`),
  KEY `fk_theatre_has_proprietaire_theatre_idx` (`theatre_id_theatre`),
  CONSTRAINT `fk_theatre_has_proprietaire_proprietaire1` FOREIGN KEY (`proprietaire_id_proprietaire`) REFERENCES `proprietaire` (`id_proprietaire`),
  CONSTRAINT `fk_theatre_has_proprietaire_theatre` FOREIGN KEY (`theatre_id_theatre`) REFERENCES `theatre` (`id_theatre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theatre_has_proprietaire`
--

LOCK TABLES `theatre_has_proprietaire` WRITE;
/*!40000 ALTER TABLE `theatre_has_proprietaire` DISABLE KEYS */;
INSERT INTO `theatre_has_proprietaire` VALUES (1,1),(3,1),(1,2),(2,2),(1,3),(3,3);
/*!40000 ALTER TABLE `theatre_has_proprietaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `propriostheatre`
--

/*!50001 DROP VIEW IF EXISTS `propriostheatre`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `propriostheatre` (`nomTheatre`,`nomProprio`) AS select `t`.`nom` AS `nomTheatre`,group_concat(concat(`p`.`prenom`,' ',`p`.`nom`) separator ',') AS `nomProprio` from ((`proprietaire` `p` join `theatre_has_proprietaire` `thp` on((`thp`.`proprietaire_id_proprietaire` = `p`.`id_proprietaire`))) join `theatre` `t` on((`thp`.`theatre_id_theatre` = `t`.`id_theatre`))) group by `t`.`nom` */;
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

-- Dump completed on 2021-02-23  9:57:03
