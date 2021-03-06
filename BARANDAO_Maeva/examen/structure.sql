-- MySQL Script generated by MySQL Workbench
-- Tue May  4 10:40:17 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestion_test_covid
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `gestion_test_covid` ;

-- -----------------------------------------------------
-- Schema gestion_test_covid
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestion_test_covid` DEFAULT CHARACTER SET utf8 ;
USE `gestion_test_covid` ;

-- -----------------------------------------------------
-- Table `gestion_test_covid`.`Personne`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_test_covid`.`Personne` ;

CREATE TABLE IF NOT EXISTS `gestion_test_covid`.`Personne` (
  `idPersonne` INT NOT NULL AUTO_INCREMENT,
  `Nom_personne` VARCHAR(45) NULL,
  `Prenom_personne` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Adresse` VARCHAR(45) NULL,
  `Tel` VARCHAR(45) NULL,
  PRIMARY KEY (`idPersonne`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_test_covid`.`Test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_test_covid`.`Test` ;

CREATE TABLE IF NOT EXISTS `gestion_test_covid`.`Test` (
  `idTest` INT NOT NULL AUTO_INCREMENT,
  `Nom_test` VARCHAR(45) NULL,
  `Lieu` VARCHAR(45) NULL,
  `Nb_dispo` INT NULL,
  PRIMARY KEY (`idTest`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_test_covid`.`Encadrant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_test_covid`.`Encadrant` ;

CREATE TABLE IF NOT EXISTS `gestion_test_covid`.`Encadrant` (
  `idEncadrant` INT NOT NULL AUTO_INCREMENT,
  `Nom_encadrant` VARCHAR(45) NULL,
  `Prenom_encadrant` VARCHAR(45) NULL,
  `Poste` VARCHAR(45) NULL,
  `Tel_pro` VARCHAR(45) NULL,
  PRIMARY KEY (`idEncadrant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_test_covid`.`RDV`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_test_covid`.`RDV` ;

CREATE TABLE IF NOT EXISTS `gestion_test_covid`.`RDV` (
  `idRDV` INT NOT NULL AUTO_INCREMENT,
  `date_rdv` DATE NULL,
  `heure_rdv` TIME NULL,
  `avec_ordonnance` VARCHAR(3) NULL,
  `lieu` VARCHAR(45) NULL,
  `Personne_idPersonne` INT NOT NULL,
  `Test_idTest` INT NOT NULL,
  `Encadrant_idEncadrant` INT NOT NULL,
  PRIMARY KEY (`idRDV`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`),
  INDEX `fk_RDV_Personne1_idx` (`Personne_idPersonne` ASC),
  INDEX `fk_RDV_Test1_idx` (`Test_idTest` ASC),
  INDEX `fk_RDV_Encadrant1_idx` (`Encadrant_idEncadrant` ASC),
  CONSTRAINT `fk_RDV_Personne1`
    FOREIGN KEY (`Personne_idPersonne`)
    REFERENCES `gestion_test_covid`.`Personne` (`idPersonne`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RDV_Test1`
    FOREIGN KEY (`Test_idTest`)
    REFERENCES `gestion_test_covid`.`Test` (`idTest`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RDV_Encadrant1`
    FOREIGN KEY (`Encadrant_idEncadrant`)
    REFERENCES `gestion_test_covid`.`Encadrant` (`idEncadrant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_test_covid`.`Resultat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gestion_test_covid`.`Resultat` ;

CREATE TABLE IF NOT EXISTS `gestion_test_covid`.`Resultat` (
  `idResultat` INT NOT NULL AUTO_INCREMENT,
  `pos_ou_neg` VARCHAR(15) NULL,
  `Commentaire` VARCHAR(45) NULL,
  `RDV_idRDV` INT NOT NULL,
  PRIMARY KEY (`idResultat`, `RDV_idRDV`),
  INDEX `fk_Resultat_RDV_idx` (`RDV_idRDV` ASC),
  CONSTRAINT `fk_Resultat_RDV`
    FOREIGN KEY (`RDV_idRDV`)
    REFERENCES `gestion_test_covid`.`RDV` (`idRDV`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `gestion_test_covid`.`encadrant`
-- -----------------------------------------------------
START TRANSACTION;
USE `gestion_test_covid`;
INSERT INTO `gestion_test_covid`.`encadrant` (`Nom_encadrant`, `Prenom_encadrant`, `Poste`, `Tel_pro`) VALUES ('albo', 'pablo', 'infirmier_e', '06 51 XX XX XX');
INSERT INTO `gestion_test_covid`.`encadrant` (`Nom_encadrant`, `Prenom_encadrant`, `Poste`, `Tel_pro`) VALUES ('hasma', 'maud', 'infirmier_e', '06 50 XX XX XX');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gestion_test_covid`.`personne`
-- -----------------------------------------------------
START TRANSACTION;
USE `gestion_test_covid`;
INSERT INTO `gestion_test_covid`.`personne` (`Nom_personne`, `Prenom_personne`, `Age`, `Adresse`, `Tel`) VALUES ('martin', 'martin', 21, 'ici', '06 12 XX XX XX');
INSERT INTO `gestion_test_covid`.`personne` (`Nom_personne`, `Prenom_personne`, `Age`, `Adresse`, `Tel`) VALUES ('dupont', 'sophie', 68, 'là', '06 45 XX XX XX');
INSERT INTO `gestion_test_covid`.`personne` (`Nom_personne`, `Prenom_personne`, `Age`, `Adresse`, `Tel`) VALUES ('smith', 'john', 54, 'here', '06 77 XX XX XX');
INSERT INTO `gestion_test_covid`.`personne` (`Nom_personne`, `Prenom_personne`, `Age`, `Adresse`, `Tel`) VALUES ('doe', 'jane', 33, 'where', '06 XX XX XX XX');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gestion_test_covid`.`test`
-- -----------------------------------------------------
START TRANSACTION;
USE `gestion_test_covid`;
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('pcr', 50, 'Marseille');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('antigenique', 30, 'Marseille');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('salivaire', 40, 'Marseille');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('serologique', 20, 'Marseille');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('pcr', 50, 'Paris');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('antigenique', 30, 'Paris');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('salivaire', 40, 'Paris');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('serologique', 20, 'Paris');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('pcr', 50, 'Lyon');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('antigenique', 30, 'Lyon');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('salivaire', 40, 'Lyon');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('serologique', 20, 'Lyon');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('pcr', 50, 'Nantes');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('antigenique', 30, 'Nantes');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('salivaire', 40, 'Nantes');
INSERT INTO `gestion_test_covid`.`test` (`Nom_test`, `Nb_dispo`, `Lieu`) VALUES ('serologique', 20, 'Nantes');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gestion_test_covid`.`rdv`
-- -----------------------------------------------------
START TRANSACTION;
USE `gestion_test_covid`;
INSERT INTO `gestion_test_covid`.`rdv` (`date_rdv`, `heure_rdv`, `avec_ordonnance`,`lieu`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`) VALUES ('2021-04-26', '14:00', 'oui','Marseille', 02, 02, 02);
INSERT INTO `gestion_test_covid`.`rdv` (`date_rdv`, `heure_rdv`, `avec_ordonnance`,`lieu`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`) VALUES ('2021-04-28', '17:00', 'non','Lyon', 01, 01, 02);
INSERT INTO `gestion_test_covid`.`rdv` (`date_rdv`, `heure_rdv`, `avec_ordonnance`,`lieu`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`) VALUES ('2021-04-30', '11:30', 'oui','Nantes', 04, 03, 01);
INSERT INTO `gestion_test_covid`.`rdv` (`date_rdv`, `heure_rdv`, `avec_ordonnance`,`lieu`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`) VALUES ('2021-05-03', '12:15', 'non','Paris', 03, 01, 01);
INSERT INTO `gestion_test_covid`.`rdv` (`date_rdv`, `heure_rdv`, `avec_ordonnance`,`lieu`, `Personne_idPersonne`, `Test_idTest`, `Encadrant_idEncadrant`) VALUES ('2021-05-04', '16:45', 'non','Nantes', 01, 02, 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `gestion_test_covid`.`resultat`
-- -----------------------------------------------------
START TRANSACTION;
USE `gestion_test_covid`;
INSERT INTO `gestion_test_covid`.`resultat` (`pos_ou_neg`, `Commentaire`, `RDV_idRDV`) VALUES ('positif', 'sans symptome', 01);
INSERT INTO `gestion_test_covid`.`resultat` (`pos_ou_neg`, `Commentaire`, `RDV_idRDV`) VALUES ('negatif', 'ras', 03);
INSERT INTO `gestion_test_covid`.`resultat` (`pos_ou_neg`, `Commentaire`, `RDV_idRDV`) VALUES ('positif', 'avec maux de tête', 02);

COMMIT;


