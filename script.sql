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
  `nome` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`nome`));

CREATE UNIQUE INDEX `nome_UN` ON `Tipo` (`nome` ASC);


-- -----------------------------------------------------
-- Table `Pokemon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pokemon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(25) NOT NULL,
  `atk` INT NULL,
  `def` INT NULL,
  `peso` DECIMAL(4,2) NULL,
  PRIMARY KEY (`id`, `nome`),
  CONSTRAINT `fk_Pokemon_Tipo`
    FOREIGN KEY (`tipo`)
    REFERENCES `Tipo` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE UNIQUE INDEX `nome_UNIQUE` ON `Pokemon` (`nome` ASC);

CREATE INDEX `fk_Pokemon_Tipo_idx` ON `Pokemon` (`tipo` ASC);


-- -----------------------------------------------------
-- Table `Localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Localizacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `local` TEXT NULL,
  `lat` DECIMAL(2,2) NOT NULL,
  `lon` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `PokemonLocalizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PokemonLocalizacao` (
  `Pokemon_id` INT NOT NULL,
  `Pokemon_nome` VARCHAR(25) NOT NULL,
  `Localizacao_id` INT NOT NULL,
  PRIMARY KEY (`Pokemon_id`, `Pokemon_nome`, `Localizacao_id`),
  CONSTRAINT `fk_PokemonLocalizacao_Pokemon`
    FOREIGN KEY (`Pokemon_id` , `Pokemon_nome`)
    REFERENCES `Pokemon` (`id` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PokemonLocalizacao_Localizacao`
    FOREIGN KEY (`Localizacao_id`)
    REFERENCES `Localizacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `PokemonLocalizacao_Localizacao` ON `PokemonLocalizacao` (`Localizacao_id` ASC);

CREATE INDEX `PokemonLocalizacao_Pokemon` ON `PokemonLocalizacao` (`Pokemon_id` ASC, `Pokemon_nome` ASC);


-- -----------------------------------------------------
-- Table `Evolucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Evolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pokemon` INT NOT NULL,
  `evolucao` INT NULL,
  PRIMARY KEY (`id`, `pokemon`),
  CONSTRAINT `fk_Evolucao_Pokemon_id`
    FOREIGN KEY (`pokemon`)
    REFERENCES `Pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_Pokemon_id`
    FOREIGN KEY (`evolucao`)
    REFERENCES `Pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `Evolucao_Pokemon_id` ON `Evolucao` (`pokemon` ASC);

CREATE UNIQUE INDEX `evolucao_UN` ON `Evolucao` (`evolucao` ASC);
