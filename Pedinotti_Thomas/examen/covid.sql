-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 04 mai 2021 à 12:26
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `covid`
--

-- --------------------------------------------------------

--
-- Structure de la table `centres de depistage`
--

CREATE TABLE `centres de depistage` (
  `id_centre` int(11) NOT NULL,
  `code_insee_d` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `nbr_test` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `centres de depistage`
--

INSERT INTO `centres de depistage` (`id_centre`, `code_insee_d`, `name`, `nbr_test`) VALUES
(1, 92, 'hopital_a', 55),
(2, 75, 'hopital_b', 60),
(3, 75, 'hopital_c', 90);

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `code_insee_d` int(11) NOT NULL,
  `code_insee_r` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`code_insee_d`, `code_insee_r`, `name`) VALUES
(75, 11, 'Paris'),
(92, 11, 'Haut-de-Seine');

-- --------------------------------------------------------

--
-- Structure de la table `patients`
--

CREATE TABLE `patients` (
  `id_patient` int(11) NOT NULL,
  `name_patient` varchar(45) DEFAULT NULL,
  `id_centre` int(11) DEFAULT NULL,
  `date_rdv` date DEFAULT NULL,
  `date_depistage` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patients`
--

INSERT INTO `patients` (`id_patient`, `name_patient`, `id_centre`, `date_rdv`, `date_depistage`) VALUES
(1, 'Dupont ', 2, '2021-01-22', '2021-01-22'),
(2, 'Dupont ', 2, '2021-05-04', '2021-05-04'),
(3, 'Dubois ', 3, '2021-05-04', NULL),
(4, 'Dutotal', 3, NULL, '2021-05-04');

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

CREATE TABLE `regions` (
  `code_insee_r` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `regions`
--

INSERT INTO `regions` (`code_insee_r`, `name`) VALUES
(11, 'ile_de_france');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `centres de depistage`
--
ALTER TABLE `centres de depistage`
  ADD PRIMARY KEY (`id_centre`),
  ADD KEY `code_insee_d` (`code_insee_d`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`code_insee_d`);

--
-- Index pour la table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id_patient`),
  ADD KEY `id_centre` (`id_centre`);

--
-- Index pour la table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`code_insee_r`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `centres de depistage`
--
ALTER TABLE `centres de depistage`
  ADD CONSTRAINT `centres de depistage_ibfk_1` FOREIGN KEY (`code_insee_d`) REFERENCES `departements` (`code_insee_d`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`id_centre`) REFERENCES `centres de depistage` (`id_centre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
