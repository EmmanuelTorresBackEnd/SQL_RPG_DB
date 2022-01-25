--DDL
CREATE DATABASE RpgOnlineDB

USE RpgOnlineDB

CREATE TABLE Usuarios(
	UsuarioId INT PRIMARY KEY IDENTITY,
	Email VARCHAR (100) UNIQUE NOT NULL,
	Senha VARCHAR (255) UNIQUE NOT NULL
)

CREATE TABLE Classes(
	ClasseId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (50) UNIQUE NOT NULL,
	Descricao VARCHAR (255)
)

CREATE TABLE Personagens(
	PersonagemId INT PRIMARY KEY IDENTITY,
	NomePersonagem VARCHAR (15) UNIQUE NOT NULL,
	UsuarioId INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioId),
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId)
)

CREATE TABLE Habilidades(
	HabilidadeId INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseId INT FOREIGN KEY REFERENCES Classes(ClasseId),
	HabilidadeId INT FOREIGN KEY REFERENCES Habilidades(HabilidadeId)
)

--DML
INSERT INTO Usuarios VALUES ('Email@email.com', '123456')
INSERT INTO Classes VALUES ('Bárbaro', 'Descrição do Bárbaro')
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('DeuBug' , 1 , 1)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (1, 1) , (1, 2)

INSERT INTO Usuarios VALUES ('Email2@email2.com' , '123456')
INSERT INTO Classes VALUES ('Monge' , 'Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar vida' , 'Escudo Supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, ClasseId) VALUES ('Bitbug' , 2 , 2)
INSERT INTO ClasseHabilidade (ClasseId, HabilidadeId) VALUES (2, 2) , (2, 3)

UPDATE Usuarios 
SET Senha = 654321
WHERE UsuarioId = 1

--DQL

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidade


SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.ClasseId = Classes.ClasseId

SELECT * FROM Personagens AS P
INNER JOIN Classes AS C 
ON P.ClasseId = C.ClasseId