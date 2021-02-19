-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 19 fév. 2021 à 19:05
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
-- Base de données : `livre`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `id_auteur` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `date_de_naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id_auteur`, `nom`, `prenom`, `date_de_naissance`) VALUES
(1, 'de Saint-Exupéry', 'Antoine', '1900-06-29'),
(2, 'Dumas', 'Alexandre', '1802-07-24'),
(3, 'Frank', 'Anne', '1929-06-12'),
(4, 'Huxley', 'Aldous', '1894-07-26'),
(5, 'Camus', 'Albert', '1913-11-07'),
(6, 'Verne', 'Jules', '1828-03-24'),
(7, 'Baudelaire', 'Charles', '1824-04-09'),
(8, 'Levi', 'Primo', '1919-07-31');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `nom_genre` varchar(45) NOT NULL,
  `livre_id_livre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id_genre`, `nom_genre`, `livre_id_livre`) VALUES
(1, 'fantastique', 1),
(2, 'jeunesse', 1),
(3, 'litterature italienne', 9),
(4, 'histoire vraie', 4),
(5, 'science-fiction', 2),
(6, 'anticipation', 5),
(7, 'litterature francaise', 3),
(8, 'litterature francaise', 7),
(9, 'epidemie', 6),
(10, 'poesie', 8);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id_livre` int(11) NOT NULL,
  `titre` varchar(45) NOT NULL,
  `nb_pages` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id_livre`, `titre`, `nb_pages`) VALUES
(1, 'Le Petit Prince', 97),
(2, 'Vingt Mille Lieues sous les mers', 133),
(3, 'Les Trois Mousquetaires', 888),
(4, 'Le Journal d\'Anne Frank', 415),
(5, 'Le Meilleur des mondes', 320),
(6, 'La Peste', 288),
(7, 'L\'Étranger', 191),
(8, 'Les Fleurs du mal', 374),
(9, 'Si c\'est un homme', 213);

-- --------------------------------------------------------

--
-- Structure de la table `livre_has_auteur`
--

CREATE TABLE `livre_has_auteur` (
  `livre_id_livre` int(11) NOT NULL,
  `auteur_id_auteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre_has_auteur`
--

INSERT INTO `livre_has_auteur` (`livre_id_livre`, `auteur_id_auteur`) VALUES
(1, 1),
(4, 3),
(5, 4),
(6, 5),
(7, 5),
(2, 6),
(8, 7),
(9, 8);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`),
  ADD KEY `livre_id_livre` (`livre_id_livre`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`);

--
-- Index pour la table `livre_has_auteur`
--
ALTER TABLE `livre_has_auteur`
  ADD PRIMARY KEY (`livre_id_livre`,`auteur_id_auteur`),
  ADD KEY `fk_livre_has_auteur_auteur1` (`auteur_id_auteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `id_auteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `genre_ibfk_1` FOREIGN KEY (`livre_id_livre`) REFERENCES `livre` (`id_livre`);

--
-- Contraintes pour la table `livre_has_auteur`
--
ALTER TABLE `livre_has_auteur`
  ADD CONSTRAINT `fk_livre_has_auteur_auteur1` FOREIGN KEY (`auteur_id_auteur`) REFERENCES `auteur` (`id_auteur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_has_auteur_livre` FOREIGN KEY (`livre_id_livre`) REFERENCES `livre` (`id_livre`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
