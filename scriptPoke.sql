--TIPO BÁSICO
CREATE TABLE IF NOT EXISTS `tipo` (
  `nome` VARCHAR(10) NOT NULL,
  `id` INTEGER(2) NOT NULL,	
  PRIMARY KEY (`id`))
  ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UN` ON `tipo` (`nome` ASC);


--POKEMON
CREATE TABLE IF NOT EXISTS `pokemon` (
  `id` INT NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(25) NOT NULL,
  `local` varchar(100) NOT NULL,	
  `ataque` INT NULL,
  `defesa` INT NULL,
  `peso` DECIMAL(4,2) NULL,
  PRIMARY KEY (`id`, `nome`),
  CONSTRAINT `fk_Pokemon_Tipo`
    FOREIGN KEY (`tipo`)
    REFERENCES `Tipo` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `pokemon` (`id` ASC);

CREATE INDEX `fk_Pokemon_Tipo_idx` ON `pokemon` (`tipo` ASC);

--LOCALIZACAO
CREATE TABLE IF NOT EXISTS `Localizacao` (

  `local` varchar(100) NULL,
  `latitude` DECIMAL(2,2) NOT NULL,
  `longitude` DECIMAL(2,2) NOT NULL,
  PRIMARY KEY (`local`))
ENGINE = InnoDB;


--EVOLUCAO
CREATE TABLE IF NOT EXISTS `Evolucao` (
  `id` INT NOT NULL,
  `pokemon` INT NOT NULL,
    PRIMARY KEY (`id`, `pokemon`),
  CONSTRAINT `fk_Evolucao_Pokemon_id`
    FOREIGN KEY (`pokemon`)
    REFERENCES `Pokemon` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pokemon_Pokemon_id`)
     
ENGINE = InnoDB;

CREATE INDEX `Evolucao_Pokemon_id` ON `Evolucao` (`pokemon` ASC);

CREATE UNIQUE INDEX `evolucao_UN` ON `Evolucao` (`evolucao` ASC);

    


