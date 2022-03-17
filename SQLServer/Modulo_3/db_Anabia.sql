CREATE DATABASE Anabia;
GO
CREATE TABLE estado(
	codigo INT IDENTITY(1, 1),
	estado VARCHAR(30) NOT NULL DEFAULT 'São Paulo',
	sigla VARCHAR(2) NOT NULL DEFAULT 'SP',
	capital INT NULL,

	CONSTRAINT pk_estado PRIMARY KEY (codigo),
	CONSTRAINT valida_sigla CHECK(sigla LIKE '[A-Z][A-Z]')
);
GO
CREATE TABLE  cidade(
	codigo INT IDENTITY(1, 1),
	cidade VARCHAR(50) NOT NULL DEFAULT 'São Paulo',
	estado INT NOT NULL,

	CONSTRAINT pk_cidade PRIMARY KEY(codigo),
	CONSTRAINT fk_estado_cidade FOREIGN KEY(estado) REFERENCES estado(codigo)
);
GO
ALTER TABLE estado ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (capital) REFERENCES cidade(codigo);
GO
CREATE TABLE  cliente(
	codigo INT IDENTITY(1, 1),
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(150) NOT NULL,
	numero INT NOT NULL,
	complem VARCHAR(15) NULL,
	bairro VARCHAR(20) NOT NULL,
	cidade INT NOT NULL,
	estado INT NOT NULL,
	cep VARCHAR(9) NOT NULL,
	genero VARCHAR(1) NOT NULL,
	escolaridade VARCHAR(25) NULL DEFAULT 'Ensino Médio',
	email VARCHAR(150) NULL,
	cpf VARCHAR(20) NOT NULL,

	CONSTRAINT pk_cliente PRIMARY KEY(codigo),
	CONSTRAINT fk_cidade_cliente FOREIGN KEY(cidade) REFERENCES cidade(codigo),
	CONSTRAINT fk_estado_cliente FOREIGN KEY(estado) REFERENCES estado(codigo),
	CONSTRAINT valida_nome CHECK (nome LIKE '[A-Z]%'),
	CONSTRAINT valida_cep CHECK (cep LIKE '[0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9]'),
	CONSTRAINT valida_genero CHECK (genero LIKE 'F' OR genero LIKE 'M'),
	CONSTRAINT valida_email CHECK (email LIKE '[a-z]%@[a-z]%'),
	CONSTRAINT valida_cpf CHECK (cpf LIKE '[0-9][0-9][0-9][.][0-9][0-9][0-9][.][0-9][0-9][0-9][-][0-9][0-9]')
);
GO
CREATE TABLE  telefone (
	codigo INT IDENTITY(1, 1),
	cliente INT NOT NULL,
	pais VARCHAR(3) NOT NULL DEFAULT '55',
	ddd VARCHAR(2) NOT NULL DEFAULT '11',
	telefone VARCHAR(10) NOT NULL,

	CONSTRAINT pk_telefone PRIMARY KEY (codigo),
	CONSTRAINT fk_cliente_telefone FOREIGN KEY (cliente) REFERENCES cliente(codigo),
	CONSTRAINT valida_pais CHECK (pais LIKE '[0-9][0-9]%'),
	CONSTRAINT valida_ddd CHECK (ddd LIKE '[0-9][0-9]'),
	CONSTRAINT valida_telefone CHECK (telefone LIKE '[0-9][0-9][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]')
);
GO
-- insert table estado
INSERT INTO estado (estado, sigla) VALUES ('Acre', 'AC');
INSERT INTO estado (estado, sigla) VALUES ('Alagoas', 'AL');
INSERT INTO estado (estado, sigla) VALUES ('Amapá', 'AP');
INSERT INTO estado (estado, sigla) VALUES ('Amazonas', 'AM');
INSERT INTO estado (estado, sigla) VALUES ('Bahia', 'BA');
INSERT INTO estado (estado, sigla) VALUES ('Minas Gerais', 'MG');

-- insert table cidade
INSERT INTO cidade (cidade, estado) VALUES ('Rio Branco', 1);
INSERT INTO cidade (cidade, estado) VALUES ('Maceió', 2);
INSERT INTO cidade (cidade, estado) VALUES ('Macapá', 3);
INSERT INTO cidade (cidade, estado) VALUES ('Manaus', 4);
INSERT INTO cidade (cidade, estado) VALUES ('Salvador', 5);
INSERT INTO cidade (cidade, estado) VALUES ('Belo Horizonte', 6);

-- insert table cliente
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Letibo', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'etibo@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Alejado', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'alejado@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Gary', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'gary@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Fanily', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'family@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Jersel', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'jersel@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Angel', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'angel@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Gaybriel', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'gaybriel@email.com', '111.111.111-11');
INSERT INTO cliente (nome, endereco, numero, complem, bairro, cidade, estado, cep, genero, escolaridade, email, cpf) VALUES ('Chéli', 'Rua das Goiabas', 22, 'fazenda', 'Interior', 6, 6, '11111-999', 'F', 'Ensino Superior', 'cheli@email.com', '111.111.111-11');

-- insert table telefone
INSERT INTO telefone (cliente, telefone) VALUES (1, '11111-2345');
INSERT INTO telefone (cliente, telefone) VALUES (2, '11111-3456');
INSERT INTO telefone (cliente, telefone) VALUES (3, '11111-4567');
INSERT INTO telefone (cliente, telefone) VALUES (4, '11111-5678');
INSERT INTO telefone (cliente, telefone) VALUES (5, '11111-6789');
INSERT INTO telefone (cliente, telefone) VALUES (6, '11111-7890');
INSERT INTO telefone (cliente, telefone) VALUES (7, '11111-0123');
INSERT INTO telefone (cliente, telefone) VALUES (8, '11111-1234');