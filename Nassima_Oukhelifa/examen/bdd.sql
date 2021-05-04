-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: covid
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `n_carte_vitale` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--
-- ORDER BY:  `id`

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'OUKHELIFA','Nassima','123'),(2,'OUKHELIFA','Sofiane','12352'),(3,'YOUSFI','Hannana','124385'),(4,'YOUSFI','Yanis','858123'),(5,'OUABA','Dalil','544235'),(6,'AIT MEDRI','Belka','1235222'),(7,'FITOUSSI','Yanick','524235'),(8,'COUGET','PASCALE','12578');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rdv`
--

DROP TABLE IF EXISTS `rdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rdv` (
  `id` int(11) NOT NULL,
  `id_patient` int(11) DEFAULT NULL,
  `id_test` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `effectue` char(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rdv_patient_idx` (`id_patient`),
  KEY `fk_rdv_test_idx` (`id_test`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rdv`
--
-- ORDER BY:  `id`

LOCK TABLES `rdv` WRITE;
/*!40000 ALTER TABLE `rdv` DISABLE KEYS */;
INSERT INTO `rdv` VALUES (1,1,1,'2021-05-04 00:00:00','O'),(2,2,1,'2021-05-04 00:00:00','O'),(3,3,1,'2021-05-04 00:00:00','O'),(4,4,1,'2021-05-04 00:00:00','N'),(5,5,2,'2021-05-04 00:00:00','O'),(6,6,2,'2021-05-04 00:00:00','O'),(7,7,3,'2021-05-04 00:00:00','O'),(8,8,3,'2021-05-04 00:00:00','O');
/*!40000 ALTER TABLE `rdv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `id_test` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_stock_idx` (`id_test`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--
-- ORDER BY:  `id`

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (2,1,100,'2021-05-01 00:00:00'),(3,1,15,'2021-05-02 00:00:00'),(4,1,25,'2021-05-03 00:00:00'),(5,1,200,'2021-05-04 00:00:00'),(6,2,100,'2021-05-01 00:00:00'),(7,2,15,'2021-05-02 00:00:00'),(8,2,25,'2021-05-03 00:00:00'),(9,2,200,'2021-05-04 00:00:00'),(10,3,15,'2021-05-01 00:00:00'),(11,3,23,'2021-05-02 00:00:00'),(12,3,35,'2021-05-03 00:00:00'),(13,3,10,'2021-05-04 00:00:00');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_covid`
--

DROP TABLE IF EXISTS `test_covid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `test_covid` (
  `id` int(11) NOT NULL,
  `libelle` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_covid`
--
-- ORDER BY:  `id`

LOCK TABLES `test_covid` WRITE;
/*!40000 ALTER TABLE `test_covid` DISABLE KEYS */;
INSERT INTO `test_covid` VALUES (1,'PCR','PCR'),(2,'antigénique','antigénique'),(3,'salivaire','salivaire');
/*!40000 ALTER TABLE `test_covid` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-04 12:42:18
