-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 04 mai 2021 à 11:17
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_covid`
--

-- --------------------------------------------------------

--
-- Structure de la table `avoir_rendez_vous`
--

DROP TABLE IF EXISTS `avoir_rendez_vous`;
CREATE TABLE IF NOT EXISTS `avoir_rendez_vous` (
  `centre_ID_C` int(11) NOT NULL,
  `patient_ID_P` int(11) NOT NULL,
  `Rv` datetime DEFAULT NULL,
  PRIMARY KEY (`centre_ID_C`,`patient_ID_P`),
  KEY `fk_centre_has_patient_patient2_idx` (`patient_ID_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `avoir_rendez_vous`
--

INSERT INTO `avoir_rendez_vous` (`centre_ID_C`, `patient_ID_P`, `Rv`) VALUES
(2, 2, '2021-05-04 13:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `centre`
--

DROP TABLE IF EXISTS `centre`;
CREATE TABLE IF NOT EXISTS `centre` (
  `ID_C` int(11) NOT NULL AUTO_INCREMENT,
  `Adr_C` varchar(45) DEFAULT NULL,
  `Ville_C` varchar(45) DEFAULT NULL,
  `CP_C` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_C`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `centre`
--

INSERT INTO `centre` (`ID_C`, `Adr_C`, `Ville_C`, `CP_C`) VALUES
(1, '6 Cours des Bougainvillées', 'Rueil-Malmaison', '92500'),
(2, '97 Avenue Albert 1er ', 'Rueil-Malmaison', '92500'),
(3, '1 Place Hérold', 'Courbevoie', '92400'),
(4, '3 Rue Garnier ', 'Neuilly-sur-Seine', '92200');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

DROP TABLE IF EXISTS `contenir`;
CREATE TABLE IF NOT EXISTS `contenir` (
  `centre_ID_C` int(11) NOT NULL,
  `tests_ID_T` int(11) NOT NULL,
  `Stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`centre_ID_C`,`tests_ID_T`),
  KEY `fk_centre_has_tests_tests1_idx` (`tests_ID_T`),
  KEY `fk_centre_has_tests_centre1_idx` (`centre_ID_C`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contenir`
--

INSERT INTO `contenir` (`centre_ID_C`, `tests_ID_T`, `Stock`) VALUES
(1, 1, 40),
(1, 2, 50),
(1, 3, 30),
(2, 1, 80),
(2, 2, 100),
(3, 2, 50),
(3, 4, 100),
(4, 1, 50),
(4, 2, 50),
(4, 3, 50);

-- --------------------------------------------------------

--
-- Structure de la table `depister`
--

DROP TABLE IF EXISTS `depister`;
CREATE TABLE IF NOT EXISTS `depister` (
  `centre_ID_C` int(11) NOT NULL,
  `patient_ID_P` int(11) NOT NULL,
  `Tests_ID_T` int(11) NOT NULL,
  `Jour_D` date DEFAULT NULL,
  `Resultat` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`centre_ID_C`,`patient_ID_P`,`Tests_ID_T`),
  KEY `fk_centre_has_patient_centre_idx` (`centre_ID_C`),
  KEY `fk_Depister_Patient1_idx` (`patient_ID_P`),
  KEY `fk_Depister_Tests1_idx` (`Tests_ID_T`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `depister`
--

INSERT INTO `depister` (`centre_ID_C`, `patient_ID_P`, `Tests_ID_T`, `Jour_D`, `Resultat`) VALUES
(1, 1, 1, '2021-05-01', 0),
(1, 1, 2, '2021-05-04', 1),
(2, 2, 4, '2021-05-04', 1),
(3, 2, 1, '2021-04-15', 0),
(4, 3, 4, '2021-05-03', 0);

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `ID_P` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_P` varchar(45) DEFAULT NULL,
  `Prenom_P` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_P`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`ID_P`, `Nom_P`, `Prenom_P`) VALUES
(1, 'BON', 'Jean'),
(2, 'YLE', 'Fleur'),
(3, 'LOU', 'Lisa');

-- --------------------------------------------------------

--
-- Structure de la table `tests`
--

DROP TABLE IF EXISTS `tests`;
CREATE TABLE IF NOT EXISTS `tests` (
  `ID_T` int(11) NOT NULL AUTO_INCREMENT,
  `Type_T` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_T`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tests`
--

INSERT INTO `tests` (`ID_T`, `Type_T`) VALUES
(1, 'RP-PCR'),
(2, 'Antigénique'),
(3, 'Dépistage salivaire'),
(4, 'Sérologiques');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `avoir_rendez_vous`
--
ALTER TABLE `avoir_rendez_vous`
  ADD CONSTRAINT `fk_avoir_rendez_vous_Cent` FOREIGN KEY (`centre_ID_C`) REFERENCES `centre` (`ID_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_avoir_rendez_vous_Pat` FOREIGN KEY (`patient_ID_P`) REFERENCES `patient` (`ID_P`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `fk_contenir_Cent` FOREIGN KEY (`centre_ID_C`) REFERENCES `centre` (`ID_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contenir_Test` FOREIGN KEY (`tests_ID_T`) REFERENCES `tests` (`ID_T`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `depister`
--
ALTER TABLE `depister`
  ADD CONSTRAINT `fk_Depister_Cent` FOREIGN KEY (`centre_ID_C`) REFERENCES `centre` (`ID_C`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Depister_Pat` FOREIGN KEY (`patient_ID_P`) REFERENCES `patient` (`ID_P`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Depister_Test` FOREIGN KEY (`Tests_ID_T`) REFERENCES `tests` (`ID_T`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
