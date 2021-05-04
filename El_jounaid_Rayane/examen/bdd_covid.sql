-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mar. 04 mai 2021 à 12:32
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `covid`
--

-- --------------------------------------------------------

--
-- Structure de la table `centre_medical`
--

CREATE TABLE `centre_medical` (
  `idCentre_medical` int(11) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `stock_vaccin` int(11) DEFAULT NULL,
  `stock_test` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `centre_medical`
--

INSERT INTO `centre_medical` (`idCentre_medical`, `Nom`, `stock_vaccin`, `stock_test`) VALUES
(1, 'Europe', 750, 1205),
(2, 'Bauer', 640, 900);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `idLivraison` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `nb` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `idCentre_medical` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livraison`
--

INSERT INTO `livraison` (`idLivraison`, `type`, `nb`, `date`, `idCentre_medical`) VALUES
(1, 'vaccin', 600, '2021-05-09', 2),
(2, 'test', 800, '2021-05-18', 1),
(3, 'vaccin', 950, '2021-05-25', 2);

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idPersonne` int(11) NOT NULL,
  `Nom` varchar(45) DEFAULT NULL,
  `Prenom` varchar(45) DEFAULT NULL,
  `Age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`idPersonne`, `Nom`, `Prenom`, `Age`) VALUES
(1, 'MARTIN', 'William', 25),
(2, 'BERNARD', 'Noah', 64),
(3, 'THOMAS', 'Sofia', 52),
(4, 'PETIT', 'Emma', 32);

-- --------------------------------------------------------

--
-- Structure de la table `rdv`
--

CREATE TABLE `rdv` (
  `idRDV` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `type_rdv` varchar(45) DEFAULT NULL,
  `idPersonne` int(11) NOT NULL,
  `idCentre_medical` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rdv`
--

INSERT INTO `rdv` (`idRDV`, `date`, `type_rdv`, `idPersonne`, `idCentre_medical`) VALUES
(1, '2021-05-04', 'test', 1, 1),
(2, '2021-05-05', 'vaccin', 2, 1),
(3, '2021-05-05', 'test', 3, 2),
(4, '2021-05-06', 'vaccin', 4, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `centre_medical`
--
ALTER TABLE `centre_medical`
  ADD PRIMARY KEY (`idCentre_medical`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`idLivraison`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idPersonne`);

--
-- Index pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD PRIMARY KEY (`idRDV`),
  ADD KEY `idPersonne` (`idPersonne`),
  ADD KEY `idCentre_medical` (`idCentre_medical`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `rdv`
--
ALTER TABLE `rdv`
  ADD CONSTRAINT `idCentre_medical` FOREIGN KEY (`idCentre_medical`) REFERENCES `centre_medical` (`idCentre_medical`),
  ADD CONSTRAINT `idPersonne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`idPersonne`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
