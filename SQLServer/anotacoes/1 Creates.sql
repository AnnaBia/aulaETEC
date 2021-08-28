-- COMENTÁRIO DE UMA LINHA
/* 
	COMENTÁRIO EM BLOCO
*/
USE master

IF  EXISTS (
SELECT name 
FROM sys.databases 
WHERE name = 'cd_rom')
DROP DATABASE cd_rom
GO

USE master
GO
--COMANDO DE CRIAÇÃO DE BANCO DE DADOS: CREATE DATABASE
--Criação do Banco de Dados cd_rom
CREATE DATABASE cd_rom ON 
(	
	NAME = cdrom_db, --nome lógico
	FILENAME = "C:\SQL\cd_rom.mdf", --nome físico
	SIZE = 5 Mb, --tamanho
	MAXSIZE = 10 Mb, --tamanho máximo
	FILEGROWTH = 1 Mb --taxa de crescimento
) 
LOG ON -- criação do log, continuação do create database
( 
	NAME = cdrom_log, 
	FILENAME = "C:\SQL\cd_rom.ldf",
	SIZE = 1 Mb,
	MAXSIZE = 5 Mb,
	FILEGROWTH = 1 Mb
)
GO
--COMANDO PARA CRIAÇÃO DE TABELAS: CREATE TABLE
--Criação da TABELA CLIENTES
CREATE TABLE cd_rom.dbo.Clientes
(
	codigo 		INT 			NOT NULL UNIQUE,
	nome 		VARCHAR (50) 	NOT NULL,
 	RG 			VARCHAR (20)	NOT NULL,
 	CPF 		VARCHAR (20)	NOT NULL UNIQUE,
 	telefone	VARCHAR(15) 	NOT NULL,
 	endereco	VARCHAR(100) 	NOT NULL,
 	bairro 		VARCHAR(50) 	NOT NULL,
 	cidade 		VARCHAR(40) 	NOT NULL,
	estado 		VARCHAR(2) 		NOT NULL,
 	CEP 		VARCHAR(9) 		NOT NULL, 
	email 		VARCHAR(50) 	NOT NULL,
	PRIMARY KEY (codigo ASC)
)
GO
-- Criação da Tabela Vendedor
CREATE TABLE cd_rom.dbo.Vendedor
(
	codigo 		INT 			NOT NULL UNIQUE,
	nome 		VARCHAR(50) 	NOT NULL,
 	telefone	VARCHAR(15) 	NOT NULL,
 	endereco	VARCHAR(100) 	NOT NULL,
 	bairro 		VARCHAR(50) 	NOT NULL,
 	cidade 		VARCHAR(40) 	NOT NULL DEFAULT 'SÃO PAULO',
	estado 		VARCHAR(2) 		NOT NULL,
 	CEP 		VARCHAR(9) 		NOT NULL, 
	email 		VARCHAR(50) 	NOT NULL,
	genero		VARCHAR(1)		NOT NULL CHECK (GENERO='F' OR GENERO='M') DEFAULT ('M'),
	nascimento  SMALLDATETIME   NOT NULL
	PRIMARY KEY (codigo ASC)
)
GO
--Criação da Tabela Produtos
CREATE TABLE cd_rom.dbo.Produtos
(
	codigo 		INT 			NOT NULL UNIQUE,
	descrição	VARCHAR(80) 	NOT NULL,
 	preco_unit	MONEY			NOT NULL CHECK (PRECO_UNIT >=0),
 	categoria 	VARCHAR(40) 	NOT NULL,
		PRIMARY KEY (codigo ASC)
)
GO
--Criação da Tabela NF - Nota Fiscal
CREATE TABLE cd_rom.dbo.NF
(
	codigo			INT			NOT NULL UNIQUE,
	data_venda		DATETIME 	NOT NULL DEFAULT GETDATE(),
	codigo_vendedor INT 		NOT NULL,
	codigo_cliente	INT 		NOT NULL,
	PRIMARY KEY (codigo ASC),
	FOREIGN KEY (codigo_vendedor) 	REFERENCES cd_rom.dbo.Vendedor,
	FOREIGN KEY (codigo_cliente) 	REFERENCES cd_rom.dbo.Clientes
)
GO
--Criação da Tabela ItensNF
CREATE TABLE cd_rom.dbo.ItensNF
(
	quantidade	INT	NOT NULL,
	desconto INT NOT NULL,
	codigo_nf INT NOT NULL,
	codigo_produto INT NOT NULL,
	PRIMARY KEY (codigo_NF, codigo_produto),
	FOREIGN KEY	(codigo_nf) 	 REFERENCES cd_rom.dbo.NF,
	FOREIGN KEY (codigo_produto) REFERENCES cd_rom.dbo.Produtos
)
GO
--Criação da Tabela Estado
CREATE TABLE cd_rom.dbo.ESTADO
(
	codigo  INT			NOT NULL IDENTITY(1,1),
	sigla   VARCHAR(2)  NOT NULL,
	estado  VARCHAR(50) NOT NULL,
	capital VARCHAR(40) NOT NULL
	
)
GO

