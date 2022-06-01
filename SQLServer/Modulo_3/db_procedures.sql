CREATE DATABASE db_procedures
GO
CREATE TABLE Contato(
	codigo INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(100) NULL UNIQUE,
	ativo BIT NOT NULL
)
GO
CREATE TABLE Telefone(
	codigo INT PRIMARY KEY,
	codContato INT NOT NULL,
	tipoTelefone VARCHAR(15) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	ramal VARCHAR(4) NULL,
	FOREIGN KEY(codContato) REFERENCES Contato(codigo)
)
GO
CREATE TABLE Endereco(
	codigo INT NOT NULL PRIMARY KEY,
	codContato INT NOT NULL,
	endereco VARCHAR(80) NOT NULL,
	numero INT NOT NULL,
	complemento VARCHAR(30) NULL,
	bairro VARCHAR(30) NULL,
	cidade VARCHAR(30) NULL,
	estado VARCHAR(2) NULL,
	cep VARCHAR(9) NULL,
	FOREIGN KEY(codContato) REFERENCES Contato(codigo)
)
GO
-- 1. Crie 3 procedures para inserção de dados nas 3 tabelas, uma para cada tabela, calculando 
-- os campos de código e checando se o dado já existe na tabela, conforme condições 
-- abaixo:
-- a. Antes de inserir o contato, checar se o e-mail já existe antes de inserir o cliente
CREATE PROCEDURE InsereContato
@nome VARCHAR(50),
@email VARCHAR(100),
@ativo BIT
AS
BEGIN
	DECLARE @existe INT
	SET @existe = (SELECT COUNT(codigo) FROM Contato WHERE email = @email)
	IF @existe > 0
		PRINT 'Contato já existe'
	ELSE
	BEGIN
		DECLARE @codigo INT
		SET @codigo = ISNULL((SELECT MAX(codigo) FROM Contato), 0) + 1
		INSERT INTO Contato
		VALUES (@codigo, @nome, @email, @ativo)
	END
END
GO

-- b. Antes de inserir o telefone, checar se o telefone já existe para este contato
CREATE PROCEDURE InsereTelefone
@codContato INT,
@tipo VARCHAR(15),
@telefone VARCHAR(15),
@ramal VARCHAR(4) = NULL
AS
BEGIN
	DECLARE @existe INT
	SET @existe = (SELECT COUNT(telefone) FROM telefone WHERE telefone= @telefone AND codContato = @codContato)
	IF @existe > 0
		PRINT 'Telefone já existe para este contato'
	ELSE
	BEGIN
		DECLARE @codigo INT
		SET @codigo = ISNULL((SELECT MAX(codigo) FROM telefone), 0) + 1
		INSERT INTO Telefone
		VALUES (@Codigo,@codContato,@tipo,@telefone,@ramal)
	END
END
GO

-- c. Antes de inserir o endereço, checar se o cep já existe para este contato
CREATE PROCEDURE InsereEndereco
@codcontato INT,
@endereco VARCHAR(80),
@numero INT,
@complemento VARCHAR(30) = NULL,
@bairro VARCHAR(30),
@cidade VARCHAR(30),
@estado VARCHAR(2),
@cep VARCHAR(9)
AS
BEGIN
	DECLARE @existe INT
	SET @existe = (SELECT COUNT(cep) FROM Endereco WHERE codContato = @codContato AND cep = @cep)
IF @existe > 0
	PRINT 'Endereço já existe para este contato'
ELSE
	BEGIN
		DECLARE @codigo INT
		SET @codigo = ISNULL((SELECT MAX(codigo) FROM endereco), 0) + 1
		INSERT INTO Endereco 
		VALUES(
           @codigo, 
           @codcontato, 
           @endereco, 
           @numero, 
           @complemento,
           @bairro, 
           @cidade,
           @estado,
           @cep)
	END
END
GO
InsereContato 'Ana Bia', 'ana@bia.com.br', 1
GO
InsereTelefone 1,'Celular','11971697955'
GO
InsereEndereco 1,'Rua Chico Pontes', 35, null, 'Casa', 'São Paulo', 'SP',02067000