-- COMENTÁRIO DE UMA LINHA
/* 
	COMENTÁRIO EM BLOCO
*/
USE master
GO
--COMANDO DE CRIAÇÃO DE BANCO DE DADOS: CREATE DATABASE
--Criação do Banco de Dados Biblioteca
CREATE DATABASE biblioteca 
go

use Biblioteca
CREATE TABLE biblioteca.dbo.Leitor
(
	idleitor 	INT 			NOT NULL UNIQUE,
	nome 		VARCHAR (50) 	NOT NULL,
  	endereco	VARCHAR(100) 	NOT NULL,
 	bairro 		VARCHAR(50) 	NOT NULL,
 	cidade 		VARCHAR(40) 	NOT NULL,
	estado 		VARCHAR(2) 		NOT NULL,
 	CEP 		VARCHAR(5) 		NOT NULL, 
	ativo		bit				not null,
	
	PRIMARY KEY (idleitor ASC)
)
GO

CREATE TABLE biblioteca.dbo.Autor
(
	idautor 		INT 			NOT NULL UNIQUE,
	sobrenome 		VARCHAR (50) 	NOT NULL,
	nomedomeio		varchar(50)		null,
    nome			VARCHAR (20)	NOT NULL,
 	nacionalidade	VARCHAR(18) 	NOT NULL,
	PRIMARY KEY (idautor ASC)
)
go

CREATE TABLE biblioteca.dbo.editora
(
	ideditora	INT 			NOT NULL,
	nome		VARCHAR (20) 	NOT NULL,
	razao		VARCHAR (30) 	NOT NULL,
	site		VARCHAR(30) 	NOT NULL
 
 	
	PRIMARY KEY (ideditora ASC)
)
GO

CREATE TABLE biblioteca.dbo.categoria
(
	idcategoria			INT 			NOT NULL,
	descrição			VARCHAR(20) 	NOT NULL,
	PRIMARY KEY (idcategoria ASC) 

)
GO

CREATE TABLE biblioteca.dbo.Colecao
(
	idcol		INT 			NOT NULL UNIQUE,
	nome		VARCHAR (28) 	NOT NULL,
 	
	PRIMARY KEY (idcol ASC)
)
GO

create table biblioteca.dbo.tipo
(
	idtipo		int not null,
	tipo		varchar(15) not null,
	primary key (idtipo),
	
)
go

CREATE TABLE biblioteca.dbo.livro
(
	idlivro		INT 			NOT NULL UNIQUE,
	titulo		VARCHAR (28) 	NOT NULL,
	ideditora	INT 			NOT NULL,
	idcategoria	INT 			NOT NULL,
 	paginas		int				not null,
	dataaqui	datetime		not null,
	anopublicacao	int			not null,
	diponivel	bit,
 	
		PRIMARY KEY (idlivro ASC),
		Foreign key	(ideditora) references editora,
		Foreign key	(idcategoria) references categoria
)
GO

CREATE TABLE biblioteca.dbo.livrocol
(
	idcol		INT 			NOT NULL,
	idlivro		INT 			NOT NULL, 

	Foreign key	(idlivro) references livro,
	foreign key (idcol) references colecao
)
Go

CREATE TABLE biblioteca.dbo.espera
(
	idespera		INT 			NOT NULL, 
	idlivro			INT 			NOT NULL, 
	idleitor 		INT 			NOT NULL, 

 	
	PRIMARY KEY (idespera ASC),
	Foreign key	(idlivro) references livro,
	foreign key(idleitor) references leitor

)
GO

CREATE TABLE biblioteca.dbo.emprestimo
(	
	idemprest		int			not null,
	dataemprest		datetime	not null,
	dataprevista	datetime	not null,
	datadevol		datetime	not null,
	idleitor 		INT 			NOT NULL,

	PRIMARY KEY (idemprest ASC),
	Foreign key	(idleitor) references leitor
)
go

CREATE TABLE biblioteca.dbo.ItemEmprestado
(
	iditem		INT 			NOT NULL, 
	idlivro		INT 			NOT NULL, 
	idemprest 	INT 			NOT NULL,

	PRIMARY KEY (iditem ASC),
	Foreign key	(idlivro) references livro,
	Foreign key	(idemprest) references emprestimo

)
go

CREATE TABLE biblioteca.dbo.livroautor
(
	idlivro			INT 			NOT NULL,
	idautor 		INT 			NOT NULL,
	Foreign key	(idlivro) references livro,
	Foreign key	(idautor) references autor

)
go

create table biblioteca.dbo.telefone
(
	idtel		int	not null,
	idleitor	int not null,
	idtipo		int	not null,
	telefone	varchar (15) not null,
	primary key (idtel ),
	foreign key (idleitor) references leitor,
	foreign key (idtipo) references tipo
)
go

use biblioteca
go

set dateformat dmy
go
	
-- Inserir dados
-- Insert into <tabela> (campo1,campo2)
Insert into Colecao(idcol,nome) values (1,'Osho Forever')
Insert into Colecao(idcol,nome) values (2,'Dan Brown -Série Ouro')
GO

select * from autor

Insert into Autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (1, 'Osho', '', '','Índia')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (2, 'Coelho', '','Paulo', 'Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (3, 'Amado', '','Jorge', 'Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (4, 'Brown', '','Dan', 'EUA')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (5, 'Christie', '','Agatha', 'Inglaterra')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (6, 'Saint-Exupey', '','Antoine', 'França')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (7, 'Metellon', '','Kate', 'EUA')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (8, 'Gibran', '','Khalil', 'Líbano')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (9, 'Dumas', '','Alexandre', 'França')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (10, 'Eco', '','Umberto', 'Itália')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (11, 'Haggard', '','Henry', 'Inglaterra')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (12, 'Azevedo', '','Ricardo', 'Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (13, 'Hill', '','Joe', 'EUA')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (14,'Anjos','','Augusto','Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (15,'Lisboa','','Henriqueta','Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (16,'Lima',	'','Jorge','Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (17,'Lobo',	'','Rita','Brasil')
Insert into autor (idautor,sobrenome,nomedomeio,nome,nacionalidade)
values (18,'Horta','','Nina','Brasil')
GO

insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (1, 'Huguinho','R. Patos, 36','Lagoa Azul','Curitiba' ,'PR','12457',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (2,	'Zezinho','	r. galinha, 67','Rio Verde','São Paulo','SP','25346',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (3	,'Luizinho','r patos, 400','Lagoa Azul','Curitiba','PR','56723',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (4	,'Ronaldo Fenômeno','R nove, 9','Real Madrid','	Rio de Janeiro','RJ','34562',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (5	,'Tiririca'	,'R Sabe Tudo, 221'	,'Clementina'	,'Rio de Janeiro',	'RJ',	'77621',0 )
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values ( 6	,'Zé Simão','Largo Engraçadinho, 2','Rio Verde','São Paulo','SP','87231',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (7	,'Dilma','Av Damas 8762','Piloto','	Brasília','DF','99989' ,1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (8	,'Angelina Jolie','R. bonita, 893','Ai que inveja','Belo Horizonte','MG','56543' ,0)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (9 ,'Bruce Lee',' R. do dragão, 987','Liberdade',' São Paulo','SP','23429' ,0)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo) 
values (10, 'Pelé','R do rei, 8753','Praia Grande','Santos','SP','87787',0 )
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (11,'Madonna','R Recorde, 9877','Barra Funda','São Paulo','SP','86589',0)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (12,'Sabrina Sato','R Panico, 965','Barra Funda','São Paulo','sp','33221',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (13,'Roberto Carlos','R do rei, 9914','Praia Grande','Santos','sp','87787',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (14,'Elvis Presley','av do rei, 23','Praia Grande','Santos','SP','87787',1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (15,'Shakira','r barcelona74','Alpha','Belo Horizonte','MG','78653' ,1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (16,'Brad Pitt','av To podendo, 876','Hollywood','São Pedro','SP','98021',0)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (17,'Neymar Jr','R.Ostentação, 423','Barcelona','São Pedro','SP','98023' ,1)
insert into leitor (idleitor,nome,endereco,bairro,cidade,estado,cep,ativo)
values (18,'Paris Hilton','	Av Comunidade, 11','Taipas','Guaianazes','SP','45329' ,0)
go

insert into categoria (idcategoria,descrição)
values (21,'animais')
insert into categoria (idcategoria,descrição)
values (22,'espiritual')
insert into categoria (idcategoria,descrição)
values (23,'suspense')
insert into categoria (idcategoria,descrição)
values (24,'infantil')
insert into categoria (idcategoria,descrição)
values (25,'policial')
insert into categoria (idcategoria,descrição)
values (26,'romance')
insert into categoria (idcategoria,descrição)
values (27,'humor')
insert into categoria (idcategoria,descrição)
values (28,'poesia')
insert into categoria (idcategoria,descrição)
values (29,'gastronomia')
select * from categoria
GO

insert into tipo (idtipo, tipo) values (61,'residencial')
insert into tipo (idtipo, tipo) values (62,'celular')
insert into tipo (idtipo, tipo) values (63,'radio')
GO

insert into editora values (81,'icone','icone ltda','icone.com.br')
insert into editora values (82,'shanti','shanti ltda','shanti.com')
insert into editora values (83,'cultrix','cultrix editora ltda','cultrix.com.br')
insert into editora values (84,'atica','atica livros','atica.com.br')
insert into editora values (85,'raval','raval ltda','raval.com')
insert into editora values (86,'sextante','sextante livros as','sextante.com.br')
insert into editora values (87,'cia. das letras','cia ltda','cia.com.br')
GO

Insert into livro (idlivro,titulo,paginas, dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (1, 'A semente de mostarda' , '240', '22/02/2012',1, 81, 22,1980)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (2, 'Cai o pano', '250', '22/02/2009',0, 86, 26,2000)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (3, 'Meditação', '310','22/02/2010',0,82,22,2010)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (4, 'Eu sou a porta', '190','22/02/2011',0,83,22,1976)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (5, 'conversando com gatos', '158','22/02/2012',1,83,21,1950)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (6, 'o profeta', '90','22/02/2010',0,85,26,1966)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (7, 'o codigo da vinci', '480','22/02/2010',0,86,23,2001)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (8, 'o simbolo perdido','512','22/02/2011',0,86,23,2012)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (9, 'fortaleza digital', '320','22/02/2011' ,1,86,23,2013)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (10, 'o pequeno principe', '98','22/02/2012',0,84,24,1930)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (11, 'o nome da rosa', '460','22/02/2012',0,81,25,1920)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (12, 'o alquimista', '460','22/02/2010',0,82,26,1982)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (13, 'o conde de monte cristo','420','22/02/2011' ,1,84,23,1988)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (14, 'as minas do rei salomão', '300','22/02/2010' ,1,84,23,1990)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (15, 'mar morto', '270','22/02/2012',1,84,26,1932)
Insert into livro (idlivro,titulo, paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (16, 'pobre corinthiano careca', '190','22/02/2012',0,85,27,2013)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (17, 'a estrada da noite','170','22/02/2010',0,81,25,1820)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (18,'Eu'	,	256	,	'11/12/2013'	,	1	,	87	,	28	,2008)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (19	,	'Flor da Morte'	,	58	,	'11/12/2013'	,	1	,	87	,	28	,2013)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (20	,	'Invenção de Orfeu'	,	432	,	'21/12/2011'	,	1	,	83	,	28	,2007)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (21	,	'Panelinha'	,	400	,	'21/12/2012'	,	1	,	82	,	29	,2014)
Insert into livro (idlivro,titulo,paginas,dataaqui, diponivel, ideditora, idcategoria,anopublicacao)
values (22	,	'Não é sopa'	,	368	,	'21/12/2013'	,	1	,	87	,	29	,2014)
GO

Insert into livrocol(idcol,idlivro) values (1,1)
Insert into livrocol(idcol,idlivro) values (1,3)
Insert into livrocol(idcol,idlivro) values (1,4)
Insert into livrocol(idcol,idlivro) values (2,7)
Insert into livrocol(idcol,idlivro) values (2,8)
Insert into livrocol(idcol,idlivro) values (2,9)
GO

update livro set idcategoria = 22  where idlivro=1
GO

insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (11,'05/08/2012','05/08/2013','05/10/2012',16)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (12,'05/08/2012','05/08/2013','22/05/2013',7)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (13,'05/08/2012','05/08/2013','05/10/2012',8)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (14,'22/09/2012','22/09/2013',	'22/01/2013',	1)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (15,'03/10/2012','03/10/2013','03/05/2013',13)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (16,'06/10/2012','05/08/2013','05/11/2012',	16)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (17,'30/11/2012','03/10/2013','03/01/2013',5)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (18,'11/12/2012','11/12/2013','11/02/2013',4)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (19,'30/12/2012','30/12/2013','30/03/2013',	11)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (20,'22/01/2013','22/09/2014','30/06/2013',9)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (21,'27/02/2013','30/12/2014','30/04/2013',4)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (22,'03/07/2013','03/10/2014','30/09/2013',5)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (27,'03/10/2013','03/10/2014','22/03/2014',	7)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (31,'03/11/2013','03/11/2014','20/04/2014',	4)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (32,'11/12/2013','11/12/2014','22/03/2014',16)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (23,'05/08/2013','05/08/2014','',9)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (24,'22/09/2013','22/09/2014','',18)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (25,'22/09/2013','22/09/2014','',15)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (26,'03/10/2013','03/10/2014','',	6)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (28,'03/11/2013','03/11/2014','',13)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (29,'03/11/2013','03/11/2014','',5)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (30,'03/11/2013','03/11/2014','',1)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (36,'11/12/2013','11/12/2014','',16)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (33,	'11/12/2013','11/12/2014','',	5)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (34,	'30/12/2013','30/12/2014','',	11)
insert into emprestimo (idemprest,dataemprest,dataprevista,datadevol,idleitor)
values (35,	'30/12/2013','30/12/2014','',2)
GO

insert into livroautor(idlivro,idautor)
values (1	,1)
insert into livroautor(idlivro,idautor)
values (2	,	5)
insert into livroautor(idlivro,idautor)
values (3	,	1)
insert into livroautor(idlivro,idautor)
values (4	,	1)
insert into livroautor(idlivro,idautor)
values (5	,	7)
insert into livroautor(idlivro,idautor)
values (6	,	8)
insert into livroautor(idlivro,idautor)
values (7	,	4)
insert into livroautor(idlivro,idautor)
values (8	,	4)
insert into livroautor(idlivro,idautor)
values (9	,	4)
insert into livroautor(idlivro,idautor)
values (10	,	6)
insert into livroautor(idlivro,idautor)
values (11	,	10)
insert into livroautor(idlivro,idautor)
values (12	,	2)
insert into livroautor(idlivro,idautor)
values (13	,	9)
insert into livroautor(idlivro,idautor)
values (14	,	11)
insert into livroautor(idlivro,idautor)
values (15	,	3)
insert into livroautor(idlivro,idautor)
values (16	,	12)
insert into livroautor(idlivro,idautor)
values (17	,	13)
GO

insert into espera(idespera,idlivro,idleitor)
values (91	,	10	,	12)
insert into espera(idespera,idlivro,idleitor)
values (92	,	10	,	17)
insert into espera(idespera,idlivro,idleitor)
values (93	,	10	,	7)
insert into espera(idespera,idlivro,idleitor)
values (94	,	3	,	11)
insert into espera(idespera,idlivro,idleitor)
values (95	,	4	,	15)
insert into espera(idespera,idlivro,idleitor)
values (96	,	12	,	4)
GO


insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (1	,	13	,	11	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (2	,	5	,	12	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (3	,	10	,	13	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (4	,	4	,	14	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (5	,	9	,	15	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (6	,	10	,	16	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (7	,	13	,	17	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (8	,	7	,	18	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (9	,	16	,	19	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (10	,	10	,	20	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (11	,	13	,	21	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (12	,	8	,	22	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (13	,	6	,	23	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (14	,	11	,	24	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (15	,	10	,	25	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (16	,	4	,	26	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (17	,	9	,	27	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (18	,	2	,	28	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (19	,	12	,	29	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (20	,	7	,	30	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (21	,	14	,	31	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (22	,	17	,	32	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (23	,	3	,	33	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (24	,	8	,	34	)
insert into ITEMEMPRESTADO(iditem,idlivro,idemprest)
values (25	,	16	,	35	)
go

insert into telefone(idtel,idleitor,telefone,idtipo)
values (1	,	1	,'8765-9076',	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (2	,	2	,	'3451-2289'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (3	,	2	,	'6652-3478'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (4	,	3	,	'7654-3909'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (5	,	9	,	'7766-5678'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (6	,	9	,	'3344-6658'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (7	,	5	,	'2341-1250'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (8	,	6	,	'3232-4560'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (1	,	1	,	'8765-9076'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (9	,	7	,	'5546-7892'	,	63	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (10	,	8	,	'3455-6671'	,	63	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (11	,	4	,	'3235-6780'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (12	,	10	,	'2233-4569'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (13	,	11	,	'3214-5655'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (14	,	11	,	'2378-8819'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (15	,	12	,	'2126-6789'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (16	,	12	,	'6657-8904'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (17	,	12	,	'3445-5530'	,	63	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (18	,	13	,	'2234-4556'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (19	,	14	,	'6221-4453'	,	61	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (20	,	14	,	'5644-3278'	,	63	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (21	,	15	,	'8787-6543'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (22	,	15	,	'2324-5676'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (23	,	16	,	'7656-5789'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (24	,	16	,	'4343-5678'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (25	,	16	,	'5722-1980'	,	63	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (26	,	17	,	'7665-4897'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (27	,	17	,	'5437-8903'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (28	,	18	,	'4536-7892'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (29	,	18	,	'4543-7890'	,	62	)
insert into telefone(idtel,idleitor,telefone,idtipo)
values (30	,	18	,	'3245-6789'	,	62	)
GO

-- 1 - Selecione a coleção, o título do livro, o nome e sobrenome do autor, a editora, a categoria, as páginas dos livros ordenados pela coleção e título.
SELECT Colecao.nome[Coleção], livro.titulo[Livro], CONCAT (Autor.nome ,' ',Autor.sobrenome)[Autor],editora.nome[Editora],categoria.descrição[Categoria],livro.paginas
FROM Colecao
INNER JOIN livrocol ON Colecao.idcol = livrocol.idcol
INNER JOIN livro ON livrocol.idlivro = livro.idlivro
INNER JOIN livroautor ON livro.idlivro = livroautor.idlivro
INNER JOIN Autor ON livroautor.idautor = Autor.idautor
INNER JOIN editora ON livro.ideditora = editora.ideditora
INNER JOIN categoria ON livro.idcategoria = categoria.idcategoria
ORDER BY Colecao.nome,livro.titulo

-- 2 - Selecione o nome do leitor e some quantas páginas cada um já leu ordenados pela quantidade de páginas decrescente
SELECT Leitor.nome, SUM(livro.paginas)[Qtdd de páginas lidas]
FROM Leitor
INNER JOIN emprestimo ON Leitor.idleitor = emprestimo.idleitor
INNER JOIN ItemEmprestado ON ItemEmprestado.idemprest = emprestimo.idemprest
INNER JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
GROUP BY Leitor.nome
ORDER BY 2 DESC

-- 3 - Selecione o nome e o sobrenome do autor e some a quantidade de paginas de cada autor, ordenados pela quantidade de páginas ascendente
SELECT CONCAT(Autor.nome,' ', Autor.sobrenome)[Autor], SUM(livro.paginas)[Qttd de páginas escritas]
FROM Autor
INNER JOIN livroautor ON Autor.idautor = livroautor.idautor
INNER JOIN livro ON livroautor.idlivro = livro.idlivro
GROUP BY Autor.nome, Autor.sobrenome
ORDER BY [Qttd de páginas escritas] ASC

-- 4 - Selecione o nome o os telefones dos leitores que nunca realizaram empréstimos ordenados pelo nome
SELECT Leitor.nome, telefone.telefone
FROM emprestimo
RIGHT JOIN Leitor ON emprestimo.idleitor = Leitor.idleitor
RIGHT JOIN telefone ON Leitor.idleitor = telefone.idleitor
WHERE emprestimo.idleitor IS NULL 
ORDER BY Leitor.nome 

-- 5 - Selecione o título do livro, a categoria, o nome e sobrenome dos autores dos livros que nunca foram emprestados.
SELECT livro.titulo, categoria.descrição, CONCAT(Autor.nome,' ', Autor.sobrenome)[Autor]
FROM emprestimo
RIGHT JOIN ItemEmprestado ON emprestimo.idemprest = ItemEmprestado.idemprest
RIGHT JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
RIGHT JOIN livroautor ON livro.idlivro = livroautor.idlivro
RIGHT JOIN Autor ON livroautor.idautor = Autor.idautor
RIGHT JOIN categoria ON livro.idcategoria = categoria.idcategoria
WHERE ItemEmprestado.idlivro IS NULL

-- 6 - Selecione o título do livro, o nome e sobrenome dos autores e conte quantas vezes o livro já foi emprestado, ordenados pela quantidade de vezes que o livro foi emprestado decrescente.
SELECT livro.titulo, CONCAT(Autor.nome,' ', Autor.sobrenome)[Autor], COUNT(ItemEmprestado.idlivro)[Vezes em que o livro foi emprestado]
FROM emprestimo
INNER JOIN ItemEmprestado ON emprestimo.idemprest = ItemEmprestado.idemprest
INNER JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
INNER JOIN livroautor ON livro.idlivro = livroautor.idlivro
INNER JOIN Autor ON livroautor.idautor = Autor.idautor
GROUP BY livro.titulo, Autor.nome,Autor.sobrenome,ItemEmprestado.idlivro
ORDER BY [Vezes em que o livro foi emprestado] DESC

-- 7 - Selecione o nome do leitor e conte quantos empréstimos foram feitos por cada leitor ordenados pela quantidade de empréstimos decrescente
SELECT Leitor.nome,COUNT(ItemEmprestado.idlivro)[Qtdd de livros emprestados]
FROM Leitor
INNER JOIN emprestimo ON Leitor.idleitor = emprestimo.idleitor
INNER JOIN ItemEmprestado ON emprestimo.idemprest = ItemEmprestado.idemprest
INNER JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
GROUP BY Leitor.nome
ORDER BY [Qtdd de livros emprestados] DESC

-- 8 - Selecione o título do livro, a categoria, a editora e conte quantos empréstimos foram feitos de cada livro ordenados pela quantidade
SELECT livro.titulo, categoria.descrição, editora.nome, COUNT(ItemEmprestado.idlivro)[Qtdd de empréstimos]
FROM emprestimo
INNER JOIN ItemEmprestado ON emprestimo.idemprest = ItemEmprestado.idemprest
INNER JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
INNER JOIN categoria ON livro.idcategoria = categoria.idcategoria
INNER JOIN editora ON livro.ideditora = editora.ideditora
GROUP BY livro.titulo, categoria.descrição, editora.nome
ORDER BY [Qtdd de empréstimos]

-- 9 - Selecione o título do livro, a categoria e o nome do leitor que estão na lista de espera
SELECT livro.titulo, categoria.descrição, Leitor.nome [Leitor]
FROM categoria
INNER JOIN livro ON categoria.idcategoria = livro.idcategoria
INNER JOIN espera ON livro.idlivro = espera.idlivro
INNER JOIN Leitor ON espera.idleitor = Leitor.idleitor

--10 - Selecione o idemprestimo, a data de retirada, o nome do leitor, os telefones e seus tipos, o titulo dos livros, a categoria, a editora, o nome e sobrenome dos autores e o nome da coleção dos livros emprestados que pertencem à uma coleção.
SELECT emprestimo.idemprest, emprestimo.dataemprest, Leitor.nome,telefone.telefone,tipo.tipo,livro.titulo,categoria.idcategoria,editora.nome,Autor.nome,Autor.sobrenome, Colecao.nome
FROM tipo
INNER JOIN telefone ON tipo.idtipo = TELEFONE.idtipo
INNER JOIN Leitor ON telefone.idleitor = Leitor.idleitor
INNER JOIN emprestimo ON Leitor.idleitor = emprestimo.idleitor
INNER JOIN ItemEmprestado ON emprestimo.idemprest = ItemEmprestado.idemprest
INNER JOIN livro ON ItemEmprestado.idlivro = livro.idlivro
INNER JOIN livroautor ON livro.idlivro = livroautor.idautor
INNER JOIN Autor ON livroautor.idautor = Autor.idautor
INNER JOIN livrocol ON livrocol.idlivro = livro.idlivro
INNER JOIN Colecao ON livrocol.idcol = Colecao.idcol
INNER JOIN categoria ON livro.idcategoria = categoria.idcategoria
INNER JOIN editora ON livro.ideditora = editora.ideditora
