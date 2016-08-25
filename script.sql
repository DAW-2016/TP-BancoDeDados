-- -----------------------------------------------------
-- pokedex Database
-- -----------------------------------------------------
DROP DATABASE IF EXISTS pokedex;
CREATE DATABASE IF NOT EXISTS pokedex;
USE pokedex;

-- -----------------------------------------------------
-- tbTipo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbTipo` (
  `nome` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`nome`));

CREATE UNIQUE INDEX `nome_UN` ON `tbTipo` (`nome` ASC);


-- -----------------------------------------------------
-- cria tbPokemon
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbPokemon`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(25) NOT NULL,
  `ataque` INT NULL,
  `defesa` INT NULL,
  `peso` DECIMAL(4,2) NULL,
  PRIMARY KEY (`id`, `nome`),
  CONSTRAINT `fk_Pokemon_Tipo`
    FOREIGN KEY (`tipo`)
    REFERENCES `tbTipo` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE UNIQUE INDEX `nome_UNIQUE` ON `tbPokemon` (`nome` ASC);

CREATE INDEX `fk_Pokemon_Tipo_idx` ON `tbPokemon` (`tipo` ASC);


-- -----------------------------------------------------
-- cria tbLocalizacao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Localizacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `local` TEXT NULL,
  `lat` DECIMAL(2,2) NOT NULL,
  `lon` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`id`));


-------------------------------------------------------
-- cria tbPokemonLocalizacao
-------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbPokemonLocalizacao` (
  `Pokemon_id` INT NOT NULL,
  `Pokemon_nome` VARCHAR(25) NOT NULL,
  `Localizacao_id` INT NOT NULL,
  PRIMARY KEY (`Pokemon_id`, `Pokemon_nome`, `Localizacao_id`),
  CONSTRAINT `fk_PokemonLocalizacao_Pokemon`
    FOREIGN KEY (`Pokemon_id` , `Pokemon_nome`)
    REFERENCES `tbPokemon` (`id` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PokemonLocalizacao_Localizacao`
    FOREIGN KEY (`Localizacao_id`)
    REFERENCES `tbLocalizacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `PokemonLocalizacao_Localizacao` ON `tbPokemonLocalizacao` (`Localizacao_id` ASC);

CREATE INDEX `PokemonLocalizacao_Pokemon` ON `tbPokemonLocalizacao` (`Pokemon_id` ASC, `Pokemon_nome` ASC);


-----------------------------------------------------
-- Cria tbEvolucao
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tbEvolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pokemon` INT NOT NULL,
  `evolucao` INT NULL,
  PRIMARY KEY (`id`, `pokemon`),
  CONSTRAINT `fk_Evolucao_Pokemon_id`
    FOREIGN KEY (`pokemon`)
    REFERENCES `tbPokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_Pokemon_id`
    FOREIGN KEY (`evolucao`)
    REFERENCES `tbPokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `Evolucao_Pokemon_id` ON `Evolucao` (`pokemon` ASC);

CREATE UNIQUE INDEX `evolucao_UN` ON `Evolucao` (`evolucao` ASC);
