-- -----------------------------------------------------
-- Database pokedex
-- -----------------------------------------------------
DROP DATABASE IF EXISTS pokedex;
CREATE DATABASE IF NOT EXISTS pokedex;
USE pokedex;

-- -----------------------------------------------------
-- Table `Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tipo` (
  `nome` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`nome`));


-- -----------------------------------------------------
-- Table `Pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pokemon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `peso` DECIMAL(4,2) NULL,
  `ataque` INT NULL,
  `defesa` INT NULL,
  `tipo` VARCHAR(25) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Pokemon_Tipo1`
    FOREIGN KEY (`tipo`)
    REFERENCES `Tipo` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE UNIQUE INDEX `nome_UNIQUE` ON `Pokemon` (`nome` ASC);

CREATE INDEX `fk_Pokemon_Tipo1_idx` ON `Pokemon` (`tipo` ASC);


-- -----------------------------------------------------
-- Table `Evolução`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Evolução` (
  `id` INT NOT NULL,
  `Pokemon` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Evolução_Pokemon1`
    FOREIGN KEY (`Pokemon`)
    REFERENCES `Pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_Evolução_Pokemon1_idx` ON `Evolução` (`Pokemon` ASC);

ALTER TABLE `Pokemon` ADD
	`evolução` INT NULL;
ALTER TABLE `Pokemon` ADD
	CONSTRAINT `fk_Pokemon_Evolução` 
    FOREIGN KEY (`evolução`)
    REFERENCES `Evolução` (`id`);
    
CREATE INDEX `fk_Pokemon_Evolução_idx` ON `Pokemon` (`evolução` ASC);

-- -----------------------------------------------------
-- Table `Localização`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Localização` (
  `local` VARCHAR(50) NOT NULL,
  `latitude` DECIMAL(3,2) NULL,
  `longitude` DECIMAL(3,2) NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`));
  
-- -----------------------------------------------------
-- Table `Pokemon_has_Localização`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pokemon_has_Localização` (
  `Pokemon_id` INT NOT NULL,
  `Localização_id` INT NOT NULL,
  PRIMARY KEY (`Pokemon_id`, `Localização_id`),
  CONSTRAINT `fk_Pokemon_has_Localização_Pokemon1`
    FOREIGN KEY (`Pokemon_id`)
    REFERENCES `Pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_has_Localização_Localização1`
    FOREIGN KEY (`Localização_id`)
    REFERENCES `Localização` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_Pokemon_has_Localização_Localização1_idx` ON `Pokemon_has_Localização` (`Localização_id` ASC);

CREATE INDEX `fk_Pokemon_has_Localização_Pokemon1_idx` ON `Pokemon_has_Localização` (`Pokemon_id` ASC);
