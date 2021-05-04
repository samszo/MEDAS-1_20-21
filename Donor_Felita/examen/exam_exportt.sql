-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 04 mai 2021 à 11:20
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exam`
--

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idtable1` int(11) NOT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `date de naissance` date DEFAULT NULL,
  `vacciné` tinyint(4) DEFAULT NULL,
  `comorbidités` int(11) DEFAULT NULL,
  `rendez_vous_idrendez_vous` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous`
--

CREATE TABLE `rendez_vous` (
  `idrendez_vous` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `patient` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendez_vous_has_test`
--

CREATE TABLE `rendez_vous_has_test` (
  `rendez_vous_idrendez-vous` int(11) NOT NULL,
  `test_idtest` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `idtest` int(11) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `disponibilité` int(11) DEFAULT NULL,
  `utilisé` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idtable1`,`rendez_vous_idrendez_vous`),
  ADD KEY `fk_patient_rendez-vous1` (`rendez_vous_idrendez_vous`);

--
-- Index pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  ADD PRIMARY KEY (`idrendez_vous`);

--
-- Index pour la table `rendez_vous_has_test`
--
ALTER TABLE `rendez_vous_has_test`
  ADD PRIMARY KEY (`rendez_vous_idrendez-vous`,`test_idtest`),
  ADD KEY `fk_rendez-vous_has_test_test1` (`test_idtest`);

--
-- Index pour la table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`idtest`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `idtable1` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rendez_vous`
--
ALTER TABLE `rendez_vous`
  MODIFY `idrendez_vous` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test`
--
ALTER TABLE `test`
  MODIFY `idtest` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_patient_rendez-vous1` FOREIGN KEY (`rendez_vous_idrendez_vous`) REFERENCES `rendez_vous` (`idrendez_vous`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `rendez_vous_has_test`
--
ALTER TABLE `rendez_vous_has_test`
  ADD CONSTRAINT `fk_rendez-vous_has_test_rendez-vous` FOREIGN KEY (`rendez_vous_idrendez-vous`) REFERENCES `rendez_vous` (`idrendez_vous`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rendez-vous_has_test_test1` FOREIGN KEY (`test_idtest`) REFERENCES `test` (`idtest`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
