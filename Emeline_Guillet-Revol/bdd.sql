CREATE DATABASE  IF NOT EXISTS `Cinemas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Cinemas`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: Cinemas
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `acteur`
--

DROP TABLE IF EXISTS `acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acteur` (
  `ACT_Code` int(11) NOT NULL AUTO_INCREMENT,
  `ACT_DateNaiss` date DEFAULT NULL,
  `ACT_Nationalite` varchar(25) DEFAULT NULL,
  `ACT_Nom` varchar(45) DEFAULT NULL,
  `ACT_Prenom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ACT_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acteur`
--

LOCK TABLES `acteur` WRITE;
/*!40000 ALTER TABLE `acteur` DISABLE KEYS */;
INSERT INTO `acteur` VALUES (1,'1988-12-07','Australienne','Browning','Emily');
/*!40000 ALTER TABLE `acteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `CIN_Code` int(11) NOT NULL AUTO_INCREMENT,
  `CIN_Nom` varchar(45) DEFAULT NULL,
  `CIN_Adr` varchar(45) DEFAULT NULL,
  `CIN_Ville` varchar(45) DEFAULT NULL,
  `CIN_CP` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CIN_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinema`
--

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;
INSERT INTO `cinema` VALUES (1,'Ariel Hauts-de-Rueil','58 avenue de Fouilleuse','Reuil-Malmaison','92500'),(2,'Ariel Centre-Ville','99 avenue Paul Doumer','Reuil-Malmaison','92500');
/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `CLI_Code` int(11) NOT NULL AUTO_INCREMENT,
  `CLI_Prenom` varchar(45) DEFAULT NULL,
  `CLI_Nom` varchar(45) DEFAULT NULL,
  `CLI_Adr` varchar(45) DEFAULT NULL,
  `CLI_Ville` varchar(45) DEFAULT NULL,
  `CLI_CP` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CLI_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Emeline','Guillet-Revol','14 rue Joyeuse','Rueil-Malmaison','92500'),(2,'Alexandre','Hugon','8 rue Bravoure','Rueil-Malmaison','92500');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `FI_Code` int(11) NOT NULL AUTO_INCREMENT,
  `FI_Nom` varchar(45) DEFAULT NULL,
  `FI_Duree` int(11) DEFAULT NULL,
  PRIMARY KEY (`FI_Code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'SuckerPunch',110),(2,'Princesse Mononoké',135),(3,'Le voyage de Chihiro',122);
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_has_acteur`
--

DROP TABLE IF EXISTS `film_has_acteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_has_acteur` (
  `FILM_FI_Code` int(11) NOT NULL,
  `ACTEUR_ACT_Code` int(11) NOT NULL,
  PRIMARY KEY (`FILM_FI_Code`,`ACTEUR_ACT_Code`),
  KEY `fk_FILM_has_ACTEUR_ACTEUR1_idx` (`ACTEUR_ACT_Code`),
  KEY `fk_FILM_has_ACTEUR_FILM_idx` (`FILM_FI_Code`),
  CONSTRAINT `fk_FILM_has_ACTEUR_ACTEUR1` FOREIGN KEY (`ACTEUR_ACT_Code`) REFERENCES `acteur` (`ACT_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILM_has_ACTEUR_FILM` FOREIGN KEY (`FILM_FI_Code`) REFERENCES `film` (`FI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_has_acteur`
--

LOCK TABLES `film_has_acteur` WRITE;
/*!40000 ALTER TABLE `film_has_acteur` DISABLE KEYS */;
INSERT INTO `film_has_acteur` VALUES (1,1);
/*!40000 ALTER TABLE `film_has_acteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_has_cinema`
--

DROP TABLE IF EXISTS `film_has_cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_has_cinema` (
  `FILM_FI_Code` int(11) NOT NULL,
  `CINEMA_CIN_Code` int(11) NOT NULL,
  PRIMARY KEY (`FILM_FI_Code`,`CINEMA_CIN_Code`),
  KEY `fk_FILM_has_CINEMA_CINEMA1_idx` (`CINEMA_CIN_Code`),
  KEY `fk_FILM_has_CINEMA_FILM1_idx` (`FILM_FI_Code`),
  CONSTRAINT `fk_FILM_has_CINEMA_CINEMA1` FOREIGN KEY (`CINEMA_CIN_Code`) REFERENCES `cinema` (`CIN_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FILM_has_CINEMA_FILM1` FOREIGN KEY (`FILM_FI_Code`) REFERENCES `film` (`FI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_has_cinema`
--

LOCK TABLES `film_has_cinema` WRITE;
/*!40000 ALTER TABLE `film_has_cinema` DISABLE KEYS */;
INSERT INTO `film_has_cinema` VALUES (1,1),(2,2),(3,2);
/*!40000 ALTER TABLE `film_has_cinema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle`
--

DROP TABLE IF EXISTS `salle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salle` (
  `SA_Code` int(11) NOT NULL AUTO_INCREMENT,
  `SA_NbPlace` int(11) DEFAULT NULL,
  `CINEMA_CIN_Code` int(11) NOT NULL,
  PRIMARY KEY (`SA_Code`,`CINEMA_CIN_Code`),
  KEY `fk_SALLE_CINEMA1_idx` (`CINEMA_CIN_Code`),
  CONSTRAINT `fk_SALLE_CINEMA1` FOREIGN KEY (`CINEMA_CIN_Code`) REFERENCES `cinema` (`CIN_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (1,80,1),(2,50,1),(3,45,1),(4,60,2),(5,65,2);
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salle_has_film`
--

DROP TABLE IF EXISTS `salle_has_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salle_has_film` (
  `SALLE_SA_Code` int(11) NOT NULL,
  `SALLE_CINEMA_CIN_Code` int(11) NOT NULL,
  `FILM_FI_Code` int(11) NOT NULL,
  PRIMARY KEY (`SALLE_SA_Code`,`SALLE_CINEMA_CIN_Code`,`FILM_FI_Code`),
  KEY `fk_SALLE_has_FILM_FILM1_idx` (`FILM_FI_Code`),
  KEY `fk_SALLE_has_FILM_SALLE1_idx` (`SALLE_SA_Code`,`SALLE_CINEMA_CIN_Code`),
  CONSTRAINT `fk_SALLE_has_FILM_FILM1` FOREIGN KEY (`FILM_FI_Code`) REFERENCES `film` (`FI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SALLE_has_FILM_SALLE1` FOREIGN KEY (`SALLE_SA_Code`, `SALLE_CINEMA_CIN_Code`) REFERENCES `salle` (`SA_Code`, `CINEMA_CIN_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salle_has_film`
--

LOCK TABLES `salle_has_film` WRITE;
/*!40000 ALTER TABLE `salle_has_film` DISABLE KEYS */;
INSERT INTO `salle_has_film` VALUES (4,2,1),(5,2,1),(1,1,2),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `salle_has_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance`
--

DROP TABLE IF EXISTS `seance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance` (
  `SE_Code` int(11) NOT NULL AUTO_INCREMENT,
  `SE_Prix` float DEFAULT NULL,
  `SE_Date` date DEFAULT NULL,
  `SE_Horraire` time DEFAULT NULL,
  `SALLE_has_FILM_SALLE_SA_Code` int(11) NOT NULL,
  `SALLE_has_FILM_SALLE_CINEMA_CIN_Code` int(11) NOT NULL,
  `SALLE_has_FILM_FILM_FI_Code` int(11) NOT NULL,
  PRIMARY KEY (`SE_Code`,`SALLE_has_FILM_SALLE_SA_Code`,`SALLE_has_FILM_SALLE_CINEMA_CIN_Code`,`SALLE_has_FILM_FILM_FI_Code`),
  KEY `fk_SEANCE_SALLE_has_FILM1_idx` (`SALLE_has_FILM_SALLE_SA_Code`,`SALLE_has_FILM_SALLE_CINEMA_CIN_Code`,`SALLE_has_FILM_FILM_FI_Code`),
  CONSTRAINT `fk_SEANCE_SALLE_has_FILM1` FOREIGN KEY (`SALLE_has_FILM_SALLE_SA_Code`, `SALLE_has_FILM_SALLE_CINEMA_CIN_Code`, `SALLE_has_FILM_FILM_FI_Code`) REFERENCES `salle_has_film` (`SALLE_SA_Code`, `SALLE_CINEMA_CIN_Code`, `FILM_FI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance`
--

LOCK TABLES `seance` WRITE;
/*!40000 ALTER TABLE `seance` DISABLE KEYS */;
INSERT INTO `seance` VALUES (1,6,'2021-02-15','13:00:00',2,2,1),(2,6,'2021-02-16','13:30:00',2,2,1);
/*!40000 ALTER TABLE `seance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seance_has_client`
--

DROP TABLE IF EXISTS `seance_has_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seance_has_client` (
  `SEANCE_SE_Code` int(11) NOT NULL,
  `SEANCE_SALLE_has_FILM_SALLE_SA_Code` int(11) NOT NULL,
  `SEANCE_SALLE_has_FILM_SALLE_CINEMA_CIN_Code` int(11) NOT NULL,
  `SEANCE_SALLE_has_FILM_FILM_FI_Code` int(11) NOT NULL,
  `CLIENT_CLI_Code` int(11) NOT NULL,
  PRIMARY KEY (`SEANCE_SE_Code`,`SEANCE_SALLE_has_FILM_SALLE_SA_Code`,`SEANCE_SALLE_has_FILM_SALLE_CINEMA_CIN_Code`,`SEANCE_SALLE_has_FILM_FILM_FI_Code`,`CLIENT_CLI_Code`),
  KEY `fk_SEANCE_has_CLIENT_CLIENT1_idx` (`CLIENT_CLI_Code`),
  KEY `fk_SEANCE_has_CLIENT_SEANCE1_idx` (`SEANCE_SE_Code`,`SEANCE_SALLE_has_FILM_SALLE_SA_Code`,`SEANCE_SALLE_has_FILM_SALLE_CINEMA_CIN_Code`,`SEANCE_SALLE_has_FILM_FILM_FI_Code`),
  CONSTRAINT `fk_SEANCE_has_CLIENT_CLIENT1` FOREIGN KEY (`CLIENT_CLI_Code`) REFERENCES `client` (`CLI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SEANCE_has_CLIENT_SEANCE1` FOREIGN KEY (`SEANCE_SE_Code`, `SEANCE_SALLE_has_FILM_SALLE_SA_Code`, `SEANCE_SALLE_has_FILM_SALLE_CINEMA_CIN_Code`, `SEANCE_SALLE_has_FILM_FILM_FI_Code`) REFERENCES `seance` (`SE_Code`, `SALLE_has_FILM_SALLE_SA_Code`, `SALLE_has_FILM_SALLE_CINEMA_CIN_Code`, `SALLE_has_FILM_FILM_FI_Code`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seance_has_client`
--

LOCK TABLES `seance_has_client` WRITE;
/*!40000 ALTER TABLE `seance_has_client` DISABLE KEYS */;
INSERT INTO `seance_has_client` VALUES (1,2,2,1,1);
/*!40000 ALTER TABLE `seance_has_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-15 14:20:56
