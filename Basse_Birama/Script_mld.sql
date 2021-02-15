-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Etudiant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Etudiant` (
  `id_Etudiant` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NULL,
  `Prenom` VARCHAR(45) NULL,
  `Date_Naissance` VARCHAR(45) NULL,
  `Genre` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Etudiant`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professeur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professeur` (
  `id_Professeur` INT NOT NULL AUTO_INCREMENT,
  `Nom_Professeur` VARCHAR(45) NULL,
  `Prenom_Professeur` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Professeur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matieres_principales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matieres_principales` (
  `id_Matieres` INT NOT NULL AUTO_INCREMENT,
  `Matieres` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Matieres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cours_Spécifiques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cours_Spécifiques` (
  `id_Cours` INT NOT NULL AUTO_INCREMENT,
  `Nom_Cours` INT NULL,
  `Matieres_principales` VARCHAR(45) NULL,
  `Prix` INT NULL,
  `Professeur` VARCHAR(45) NULL,
  `Professeur_id_Professeur` INT NOT NULL,
  `Matieres_principales_id_Matieres1` INT NOT NULL,
  PRIMARY KEY (`id_Cours`),
  INDEX `fk_Cours_Spécifiques_Professeur1_idx` (`Professeur_id_Professeur` ASC) VISIBLE,
  INDEX `fk_Cours_Spécifiques_Matieres_principales2_idx` (`Matieres_principales_id_Matieres1` ASC) VISIBLE,
  CONSTRAINT `fk_Cours_Spécifiques_Professeur1`
    FOREIGN KEY (`Professeur_id_Professeur`)
    REFERENCES `mydb`.`Professeur` (`id_Professeur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cours_Spécifiques_Matieres_principales2`
    FOREIGN KEY (`Matieres_principales_id_Matieres1`)
    REFERENCES `mydb`.`Matieres_principales` (`id_Matieres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Seance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Seance` (
  `Cours` VARCHAR(45) NULL,
  `Jours` DATE NULL,
  `horaire` DATE NULL,
  `Cours_Spécifiques_id_Cours` INT NOT NULL,
  INDEX `fk_Seance_Cours_Spécifiques1_idx` (`Cours_Spécifiques_id_Cours` ASC) VISIBLE,
  CONSTRAINT `fk_Seance_Cours_Spécifiques1`
    FOREIGN KEY (`Cours_Spécifiques_id_Cours`)
    REFERENCES `mydb`.`Cours_Spécifiques` (`id_Cours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Etudiant_has_Cours_Spécifiques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Etudiant_has_Cours_Spécifiques` (
  `Etudiant_id_Etudiant` INT NOT NULL,
  `Cours_Spécifiques_id_Cours` INT NOT NULL,
  PRIMARY KEY (`Etudiant_id_Etudiant`, `Cours_Spécifiques_id_Cours`),
  INDEX `fk_Etudiant_has_Cours_Spécifiques_Cours_Spécifiques1_idx` (`Cours_Spécifiques_id_Cours` ASC) VISIBLE,
  INDEX `fk_Etudiant_has_Cours_Spécifiques_Etudiant1_idx` (`Etudiant_id_Etudiant` ASC) VISIBLE,
  CONSTRAINT `fk_Etudiant_has_Cours_Spécifiques_Etudiant1`
    FOREIGN KEY (`Etudiant_id_Etudiant`)
    REFERENCES `mydb`.`Etudiant` (`id_Etudiant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Etudiant_has_Cours_Spécifiques_Cours_Spécifiques1`
    FOREIGN KEY (`Cours_Spécifiques_id_Cours`)
    REFERENCES `mydb`.`Cours_Spécifiques` (`id_Cours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
