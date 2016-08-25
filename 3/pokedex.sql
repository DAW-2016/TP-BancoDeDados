
CREATE TABLE IF NOT EXISTS `pokedex`.`tbPOKEMON` (
  `id` INT NOT NULL,
  `NOME` VARCHAR(50) NOT NULL,
  `ATAQUE` FLOAT NOT NULL,
  `DEFESA` FLOAT NOT NULL,
  `PESO` FLOAT NOT NULL,
  `ALTURA` FLOAT NOT NULL,
  `EVOLUÇÃO` INT NOT NULL,
  PRIMARY KEY (`id`, `EVOLUÇÃO`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_tbPOKEMON_tbPOKEMON1_idx` (`EVOLUÇÃO` ASC),
  CONSTRAINT `fk_tbPOKEMON_tbPOKEMON1`
    FOREIGN KEY (`EVOLUÇÃO`)
    REFERENCES `mydb`.`tbPOKEMON` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbLOCALIZAÇÃO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedex`.`tbLOCALIZAÇÃO` (
  `id` INT NOT NULL,
  `LATITUDE` FLOAT NULL,
  `LONGITUDE` FLOAT NULL,
  `LOCAL` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbTIPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedex`.`tbTIPO` (
  `id` INT NOT NULL,
  `NOME` VARCHAR(50) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbPOKEMON_has_tbLOCALIZAÇÃO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokedex`.`tbPOKEMON_has_tbLOCALIZAÇÃO` (
  `tbPOKEMON_id` INT NOT NULL,
  `tbLOCALIZAÇÃO_id` INT NOT NULL,
  PRIMARY KEY (`tbPOKEMON_id`, `tbLOCALIZAÇÃO_id`),
  INDEX `fk_tbPOKEMON_has_tbLOCALIZAÇÃO_tbLOCALIZAÇÃO1_idx` (`tbLOCALIZAÇÃO_id` ASC),
  INDEX `fk_tbPOKEMON_has_tbLOCALIZAÇÃO_tbPOKEMON1_idx` (`tbPOKEMON_id` ASC),
  CONSTRAINT `fk_tbPOKEMON_has_tbLOCALIZAÇÃO_tbPOKEMON1`
    FOREIGN KEY (`tbPOKEMON_id`)
    REFERENCES `mydb`.`tbPOKEMON` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbPOKEMON_has_tbLOCALIZAÇÃO_tbLOCALIZAÇÃO1`
    FOREIGN KEY (`tbLOCALIZAÇÃO_id`)
    REFERENCES `mydb`.`tbLOCALIZAÇÃO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tbPOKEMON_has_tbTIPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pokdex`.`tbPOKEMON_has_tbTIPO` (
  `tbPOKEMON_id` INT NOT NULL,
  `tbTIPO_id` INT NOT NULL,
  PRIMARY KEY (`tbPOKEMON_id`, `tbTIPO_id`),
  INDEX `fk_tbPOKEMON_has_tbTIPO_tbTIPO1_idx` (`tbTIPO_id` ASC),
  INDEX `fk_tbPOKEMON_has_tbTIPO_tbPOKEMON1_idx` (`tbPOKEMON_id` ASC),
  CONSTRAINT `fk_tbPOKEMON_has_tbTIPO_tbPOKEMON1`
    FOREIGN KEY (`tbPOKEMON_id`)
    REFERENCES `mydb`.`tbPOKEMON` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbPOKEMON_has_tbTIPO_tbTIPO1`
    FOREIGN KEY (`tbTIPO_id`)
    REFERENCES `mydb`.`tbTIPO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

