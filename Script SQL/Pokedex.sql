CREATE DATABASE Pokedex
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE Pokedex;

CREATE TABLE Tipo(
	idTipo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    
    CONSTRAINT uk_Tipo UNIQUE(nome),
    CONSTRAINT pk_Tipo PRIMARY KEY (idTipo)
);

CREATE TABLE Pokemon(
	
    idTipo INT,
    idEvolucao INT,
    idLocalizacao INT,
    idPokemon INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    Peso INT,
    Defesa INT NOT NULL,
    Ataque INT NOT NULL,
    
    
    CONSTRAINT uk_Pokemon UNIQUE(Nome),
    CONSTRAINT pk_Pokemon Primary key (idPokemon),
    
    CONSTRAINT fk_Pokemon_Evo FOREIGN KEY (idEvolucao)
    REFERENCES Pokemon(idPokemon),
    
    CONSTRAINT fk_Pokemon_Localizacao FOREIGN KEY (idLocalizacao)
    REFERENCES Localizacao(idLocalizacao),
    
    CONSTRAINT fk_Pokemon_Tipo FOREIGN KEY (idTipo)
    REFERENCES Tipo(idTipo)
    ON DELETE CASCADE
)DEFAULT CHARSET = utf8;

CREATE TABLE Localizacao(
	
	idLocalizacao INT NOT NULL AUTO_INCREMENT,
    locali VARCHAR(30) NOT NULL,
    latitude DECIMAL(18,15),
    longitude DECIMAL(18,15),
    
    CONSTRAINT pk_localizacao PRIMARY KEY(idLocalizacao),
)DEFAULT CHARSET = utf8;

-- INSERT INTO Tipo(nome) 
-- VALUES ("Eletrico");

-- INSERT INTO Pokemon(idTipo,idEvo,idPokemon,nome,Peso,Defesa,Ataque) 
-- VALUES(1,null,0,"Raichu",500,500,500);
-- INSERT INTO Pokemon(idTipo,idEvo,idPokemon,nome,Peso,Defesa,Ataque) 
-- VALUES(1,1,0,"Pikachu",500,500,500);
-- INSERT INTO Pokemon(idTipo,idEvo,idPokemon,nome,Peso,Defesa,Ataque) 
-- VALUES(1,2,0,"Pichu",500,500,500);



-- DESC Pokemon;
-- 
-- DROP TABLES Pokemon;
-- DROP TABLES Tipo;
-- SELECT * FROM Tipo;
-- SELECT * FROM Pokemon;