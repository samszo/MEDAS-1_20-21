-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: May 04, 2021 at 10:14 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_tests_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id_COMMANDE` int(11) NOT NULL,
  `Date_commande` datetime NOT NULL,
  `Quantite` varchar(45) NOT NULL,
  `TEST_id_TEST` int(11) NOT NULL,
  `FOURNISSEUR_id_FOURNISSEUR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id_COMMANDE`, `Date_commande`, `Quantite`, `TEST_id_TEST`, `FOURNISSEUR_id_FOURNISSEUR`) VALUES
(1, '2020-05-02 08:00:00', '50', 1, 1),
(1, '2020-05-02 08:30:00', '60', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_FOURNISSEUR` int(11) NOT NULL,
  `Nom_fournisseur` varchar(45) DEFAULT NULL,
  `Adresse_fournisseur` varchar(45) DEFAULT NULL,
  `Ville_fournisseur` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id_FOURNISSEUR`, `Nom_fournisseur`, `Adresse_fournisseur`, `Ville_fournisseur`) VALUES
(1, 'VEGEA', '5 Avenue Caroline', 'Saint Cloud');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id_PATIENT` int(11) NOT NULL,
  `Nom_patient` varchar(45) NOT NULL,
  `Prenom_patient` varchar(45) NOT NULL,
  `Sexe` varchar(45) DEFAULT NULL,
  `Adresse_patient` varchar(45) DEFAULT NULL,
  `Ville_patient` varchar(45) DEFAULT NULL,
  `Code_postal` varchar(45) DEFAULT NULL,
  `Date_naissance` datetime NOT NULL,
  `Lieu_naissance` varchar(45) DEFAULT NULL,
  `NIR` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Pro_sante` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id_PATIENT`, `Nom_patient`, `Prenom_patient`, `Sexe`, `Adresse_patient`, `Ville_patient`, `Code_postal`, `Date_naissance`, `Lieu_naissance`, `NIR`, `Email`, `Pro_sante`) VALUES
(1, 'JEAN', 'YVES', 'M', '1 rue clos beauvoys', 'Pithiviers', '45300', '1961-02-07 00:00:00', 'Aubervilliers', '16102456258', NULL, 'Non'),
(2, 'DUPONT', 'SOPHIE', 'F', '18 rue mademoiselle', 'Paris', '75015', '1987-04-24 00:00:00', 'Nantes', '28704526987', NULL, 'Non'),
(3, 'MARTINS', 'JEREMY', 'M', '1 rue 11 novembre 1918', 'Villeneuve la Garenne', '92390', '1995-01-31 00:00:00', 'Villeneuve la Garenne', '19501411225', NULL, 'Non'),
(4, 'DUMONT', 'CORALIE', 'F', '16 rue notre dame de lorette', 'Paris', '75009', '1994-11-05 00:00:00', 'Aulnay Sous Bois', '29411155672', NULL, 'Non');

-- --------------------------------------------------------

--
-- Table structure for table `rdv_test`
--

CREATE TABLE `rdv_test` (
  `id_RDV_TEST` int(11) NOT NULL,
  `Date_rdv` datetime NOT NULL,
  `Motif_depistage` varchar(45) DEFAULT NULL,
  `PATIENT_id_PATIENT` int(11) NOT NULL,
  `TEST_id_TEST` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rdv_test`
--

INSERT INTO `rdv_test` (`id_RDV_TEST`, `Date_rdv`, `Motif_depistage`, `PATIENT_id_PATIENT`, `TEST_id_TEST`) VALUES
(1, '2020-05-04 09:00:00', 'Deplacement', 1, 1),
(2, '2020-05-04 09:30:00', 'Symptomes legers', 2, 2),
(3, '2020-05-04 10:00:00', 'Deplacement', 3, 1),
(4, '2020-05-04 11:00:00', 'Symptomes legers', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id_TEST` int(11) NOT NULL,
  `Libelle` varchar(45) DEFAULT NULL,
  `Marque` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id_TEST`, `Libelle`, `Marque`) VALUES
(1, 'Antigenique', 'AMP'),
(2, 'PCR', 'ROCHE DIAGNOSTICS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_COMMANDE`,`TEST_id_TEST`,`FOURNISSEUR_id_FOURNISSEUR`),
  ADD KEY `fk_COMMANDE_TEST1_idx` (`TEST_id_TEST`),
  ADD KEY `fk_COMMANDE_FOURNISSEUR1_idx` (`FOURNISSEUR_id_FOURNISSEUR`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_FOURNISSEUR`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id_PATIENT`);

--
-- Indexes for table `rdv_test`
--
ALTER TABLE `rdv_test`
  ADD PRIMARY KEY (`id_RDV_TEST`,`PATIENT_id_PATIENT`,`TEST_id_TEST`),
  ADD KEY `fk_RDV_TEST_PATIENT_idx` (`PATIENT_id_PATIENT`),
  ADD KEY `fk_RDV_TEST_TEST1_idx` (`TEST_id_TEST`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id_TEST`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_COMMANDE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `id_PATIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rdv_test`
--
ALTER TABLE `rdv_test`
  MODIFY `id_RDV_TEST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id_TEST` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_COMMANDE_FOURNISSEUR1` FOREIGN KEY (`FOURNISSEUR_id_FOURNISSEUR`) REFERENCES `fournisseur` (`id_FOURNISSEUR`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_COMMANDE_TEST1` FOREIGN KEY (`TEST_id_TEST`) REFERENCES `test` (`id_TEST`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `rdv_test`
--
ALTER TABLE `rdv_test`
  ADD CONSTRAINT `fk_RDV_TEST_PATIENT` FOREIGN KEY (`PATIENT_id_PATIENT`) REFERENCES `patient` (`id_PATIENT`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_RDV_TEST_TEST1` FOREIGN KEY (`TEST_id_TEST`) REFERENCES `test` (`id_TEST`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
