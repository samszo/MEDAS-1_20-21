-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 04, 2021 at 10:33 AM
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
-- Database: `test_covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

CREATE TABLE `medecin` (
  `idMedecin` int(11) NOT NULL,
  `NomMed` varchar(45) NOT NULL,
  `PrenomMed` varchar(45) NOT NULL,
  `Qualification` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `NomPatient` varchar(45) NOT NULL,
  `PrenomPatient` varchar(45) NOT NULL,
  `DateNaiss` date NOT NULL,
  `NumSS` int(11) NOT NULL,
  `Genre` varchar(45) NOT NULL,
  `Adresse` varchar(45) NOT NULL,
  `Tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `idRdv` int(11) NOT NULL,
  `DateRdv` date NOT NULL,
  `HeureRdv` time NOT NULL,
  `LieuRdv` varchar(45) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `idMedecin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `idTest` int(11) NOT NULL,
  `DateTest` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL,
  `idMedecin` int(11) NOT NULL,
  `idRdv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`idMedecin`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`);

--
-- Indexes for table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`idRdv`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idMedecin` (`idMedecin`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`idTest`),
  ADD KEY `idPatient` (`idPatient`),
  ADD KEY `idMedecin` (`idMedecin`),
  ADD KEY `idRdv` (`idRdv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `idMedecin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `idRdv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `idTest` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `rendezvous_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `medecin` (`idMedecin`),
  ADD CONSTRAINT `rendezvous_ibfk_2` FOREIGN KEY (`idPatient`) REFERENCES `patient` (`idPatient`),
  ADD CONSTRAINT `rendezvous_ibfk_3` FOREIGN KEY (`idRdv`) REFERENCES `test` (`idRdv`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`idPatient`) REFERENCES `patient` (`idPatient`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
