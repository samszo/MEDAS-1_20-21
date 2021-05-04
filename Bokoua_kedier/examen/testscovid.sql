-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3307
-- Généré le : mar. 04 mai 2021 à 09:28
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `testscovid`
--

-- --------------------------------------------------------

--
-- Structure de la table `personnes testées`
--

CREATE TABLE `personnes testées` (
  `pk_id_personnes testées` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `sexe` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `pk_id_rendezvous` int(11) NOT NULL,
  `lieu du rendezvous` varchar(45) NOT NULL,
  `date du rendezvous` date NOT NULL,
  `nom_personne a tester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous_has_personnes testées`
--

CREATE TABLE `rendezvous_has_personnes testées` (
  `rendezvous_has_personnes testées` int(11) NOT NULL,
  `fk_id_rendezvous` int(11) NOT NULL,
  `fk_fk_id_personnes testées` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `test disponible`
--

CREATE TABLE `test disponible` (
  `pk_id_test disponible` int(11) NOT NULL,
  `num_test` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `personnes testées`
--
ALTER TABLE `personnes testées`
  ADD PRIMARY KEY (`pk_id_personnes testées`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`pk_id_rendezvous`);

--
-- Index pour la table `test disponible`
--
ALTER TABLE `test disponible`
  ADD PRIMARY KEY (`pk_id_test disponible`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `personnes testées`
--
ALTER TABLE `personnes testées`
  MODIFY `pk_id_personnes testées` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `pk_id_rendezvous` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `test disponible`
--
ALTER TABLE `test disponible`
  MODIFY `pk_id_test disponible` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
