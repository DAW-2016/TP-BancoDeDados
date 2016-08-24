-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo` (
  `nome`  NULL COMMENT '',
  `id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '');


-- -----------------------------------------------------
-- Table `mydb`.`localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`localizacao` (
  `local`  NULL COMMENT '',
  `longitude` INT NULL COMMENT '',
  `latitute` INT NULL COMMENT '',
  `id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '');


-- -----------------------------------------------------
-- Table `mydb`.`pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pokemon` (
  `nome`  NULL COMMENT '',
  `id` INT NOT NULL COMMENT '',
  `peso` INT NULL COMMENT '',
  `ataque` INT NULL COMMENT '',
  `defesa` INT NULL COMMENT '',
  `tipo_id` INT NOT NULL COMMENT '',
  `localizacao_local`  NOT NULL COMMENT '',
  `pokemon_evolucao` INT NULL COMMENT '',
  `localizacao_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_pokemon_tipo_idx` (`tipo_id` ASC)  COMMENT '',
  INDEX `fk_pokemon_pokemon1_idx` (`pokemon_evolucao` ASC)  COMMENT '',
  INDEX `fk_pokemon_localizacao1_idx` (`localizacao_id` ASC)  COMMENT '',
  CONSTRAINT `fk_pokemon_tipo`
    FOREIGN KEY (`tipo_id`)
    REFERENCES `mydb`.`tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_pokemon1`
    FOREIGN KEY (`pokemon_evolucao`)
    REFERENCES `mydb`.`pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokemon_localizacao1`
    FOREIGN KEY (`localizacao_id`)
    REFERENCES `mydb`.`localizacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
