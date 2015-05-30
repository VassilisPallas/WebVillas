-- MySQL Script generated by MySQL Workbench
-- 05/28/14 02:28:44
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema webvillas
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `webvillas` ;
CREATE SCHEMA IF NOT EXISTS `webvillas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `webvillas` ;

-- -----------------------------------------------------
-- Table `webvillas`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `webvillas`.`users` ;

CREATE TABLE IF NOT EXISTS `webvillas`.`users` (
  `username` VARCHAR(20) BINARY NOT NULL UNIQUE,
  `firstName` VARCHAR(30) NOT NULL,
  `surName` VARCHAR(45) NOT NULL,
  `password` VARCHAR(150) BINARY NOT NULL,
  `salt` VARCHAR(8) BINARY NOT NULL,
  `email` VARCHAR(45) BINARY NOT NULL UNIQUE,
  `verificationCode` VARCHAR(5) NOT NULL,
  `active` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webvillas`.`villas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `webvillas`.`villas` ;

CREATE TABLE IF NOT EXISTS `webvillas`.`villas` (
  `villaID` INT NOT NULL AUTO_INCREMENT,
  `villasName` VARCHAR(50) NOT NULL,
  `area` VARCHAR(120) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `addressNumber` INT NOT NULL,
  `postalCode` INT NOT NULL,
  `telephone` VARCHAR(10) NOT NULL,
  `mobilePhone` VARCHAR(10),
  `squareMeter` DOUBLE NOT NULL,
  `price` DOUBLE NOT NULL,
  `capacity` TINYINT NOT NULL,
  `garage` TINYINT(1) NULL DEFAULT 0,
  `wifi` TINYINT(1) NULL DEFAULT 0,
  `pool` TINYINT(1) NULL DEFAULT 0,
  `jacuzzi` TINYINT(1) NULL DEFAULT 0,
  `spa` TINYINT(1) NULL DEFAULT 0,
  `gym` TINYINT(1) NULL DEFAULT 0,
  `rating` TINYINT NULL,
  `coords` VARCHAR(40) NOT NULL,
  `villasDescr` MEDIUMTEXT NULL,
  `mainImageName` VARCHAR(100) NOT NULL,
  `users_username` VARCHAR(20) BINARY NOT NULL,
  PRIMARY KEY (`villaID`, `users_username`),
  INDEX `fk_villas_users1_idx` (`users_username` ASC),
  CONSTRAINT `fk_villas_users1`
    FOREIGN KEY (`users_username`)
    REFERENCES `webvillas`.`users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `webvillas`.`photos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `webvillas`.`photos` ;

CREATE TABLE IF NOT EXISTS `webvillas`.`photos` (
  `photoID` INT NOT NULL AUTO_INCREMENT,
  `photoName` VARCHAR(100) NULL,
  `photoDescr` MEDIUMTEXT NULL,
  `villas_villaID` INT NOT NULL,
  `villas_users_username` VARCHAR(20) BINARY NOT NULL,
  PRIMARY KEY (`photoID`, `villas_villaID`, `villas_users_username`),
  INDEX `fk_photos_villas1_idx` (`villas_villaID` ASC, `villas_users_username` ASC),
  CONSTRAINT `fk_photos_villas1`
    FOREIGN KEY (`villas_villaID` , `villas_users_username`)
    REFERENCES `webvillas`.`villas` (`villaID` , `users_username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;