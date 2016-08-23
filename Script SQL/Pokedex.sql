CREATE DATABASE IF NOT EXISTS Pokedex
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE Pokedex;

CREATE TABLE IF NOT EXISTS Tipo(
	
    idTipo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
	
    CONSTRAINT uk_tipo UNIQUE (nome),
    CONSTRAINT pk_tipo PRIMARY KEY (idTipo)
);

CREATE TABLE IF NOT EXISTS Pokemon(
		
	idPokemon INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    peso DECIMAL(10,2) NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    idTipo INT NOT NULL,
    idEvolucao INT,
    
    CONSTRAINT pk_pokemon PRIMARY KEY (idPokemon),
    CONSTRAINT uk_pokemon UNIQUE (nome),
    CONSTRAINT fk_tipo FOREIGN KEY (idTipo)
    REFERENCES Tipo(idTipo)
	ON DELETE CASCADE,
    CONSTRAINT fk_evolucao FOREIGN KEY (idEvolucao)
    REFERENCES Pokemon(idPokemon)
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Localizacao(

	idLocalizacao INT NOT NULL AUTO_INCREMENT,
	Locall VARCHAR(45) NOT NULL,
    Latitude DECIMAL(10,2) NOT NULL,
    Longitude DECIMAL(10,2) NOT NULL,
    
    CONSTRAINT pk_Localizacao PRIMARY KEY(idLocalizacao)
);


CREATE TABLE IF NOT EXISTS Pokemon_has_Localizacao(

	idPokemon INT NOT NULL,
    idLocalizacao INT NOT NULL,
    
    CONSTRAINT pk_Pokemon_has_Localizacao PRIMARY KEY(idPokemon,idLocalizacao),
    
    CONSTRAINT fk_Pokemon_has_Localizacao_Pokemon FOREIGN KEY (idPokemon)
    REFERENCES Pokemon(idPokemon)
    ON DELETE CASCADE,
    
    CONSTRAINT fk_Pokemon_has_Localizacao_Localizacao FOREIGN KEY (idLocalizacao)
    REFERENCES Localizacao(idLocalizacao)
    ON DELETE CASCADE
    
);
