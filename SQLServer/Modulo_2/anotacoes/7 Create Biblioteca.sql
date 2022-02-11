CREATE TABLE Leitor(
 idleitor INT,
 nome VARCHAR (50) PRIMARY KEY ,
 endereco VARCHAR(100),
 bairro VARCHAR(50),
 cidade VARCHAR(40),
 estado VARCHAR(2),
 CEP VARCHAR(5), 
 ativo bit)
CREATE TABLE Autor(
 idautor INT PRIMARY KEY,
 sobrenome VARCHAR (50),
 nomedomeio varchar(50) null,
 nome VARCHAR (20),
 nacionalidade VARCHAR(18))
CREATE TABLE editora(
 ideditora INT  PRIMARY KEY ,
 nome VARCHAR (20),
 razao VARCHAR (30),
 site VARCHAR(30))
CREATE TABLE categoria(
 idcategoria INT PRIMARY KEY,
 descrição VARCHAR(20))
CREATE TABLE Colecao(
 idcol INT PRIMARY KEY,
 nome VARCHAR (28))
create table tipo(
 idtipo int primary key,
 tipo varchar(15))
 GO
CREATE TABLE livro (
 idlivro INT PRIMARY KEY,
 titulo VARCHAR (28),
 ideditora INT Foreign key references editora,
 idcategoria INT Foreign key references categoria,
 paginas int,
 dataaqui datetime,
 anopublicacao int,
 diponivel bit)
GO
CREATE TABLE livrocol(
 idcol INT Foreign key references livro,
 idlivro INT foreign key references colecao)
Go
CREATE TABLE espera(
 idespera INT PRIMARY KEY, 
 idlivro INT Foreign key references livro, 
 idleitor INT foreign key references leitor)
GO
CREATE TABLE emprestimo( 
 idemprest int PRIMARY KEY,
 dataemprest datetime,
 dataprevista datetime,
 datadevol datetime,
 idleitor INT Foreign key references leitor)
go
CREATE TABLE ItemEmprestado(
 iditem INT  PRIMARY KEY, 
 idlivro INT  Foreign key references livro, 
 idemprest INT  Foreign key references emprestimo)
go
CREATE TABLE livroautor(
 idlivro INT Foreign key references livro,
 idautor INT Foreign key references autor))
go
create table telefone(
 idtel int primary key,
 idleitor int foreign key references leitor,
 idtipo int foreign key references tipo),
 telefone varchar (15))
go
Insert into Colecao  values (1,'Osho Forever')
Insert into Colecao  values (2,'Dan Brown -Série Ouro')
Insert into Autor  values (1, 'Osho', '','Índia')
Insert into autor  values (2, 'Coelho', 'Paulo', 'Brasil')
Insert into autor  values (3, 'Amado', 'Jorge', 'Brasil')
Insert into autor  values (4, 'Brown', 'Dan', 'EUA')
Insert into autor  values (5, 'Christie', 'Agatha', 'Inglaterra')
Insert into autor  values (6, 'Saint-Exupey', 'Antoine', 'França')
Insert into autor  values (7, 'Metellon', 'Kate', 'EUA')
Insert into autor  values (8, 'Gibran', 'Khalil', 'Líbano')
Insert into autor  values (9, 'Dumas', 'Alexandre', 'França')
Insert into autor  values (10, 'Eco', 'Umberto', 'Itália')
Insert into autor  values (11, 'Haggard', 'Henry', 'Inglaterra')
Insert into autor  values (12, 'Azevedo', 'Ricardo', 'Brasil')
Insert into autor  values (13, 'Hill', 'Joe', 'EUA')
Insert into autor  values (14,'Anjos','Augusto','Brasil')
insert into leitor  values (1, 'Huguinho','R. Patos, 36','Lagoa Azul','Curitiba','PR','12457',1)
insert into leitor  values (2, 'Zezinho',' r. galinha, 67','Rio Verde','São Paulo','SP','25346',1)
insert into leitor  values (3,'Luizinho','r patos, 400','Lagoa Azul','Curitiba','PR','56723',1)
insert into leitor  values (4,'Ronaldo Fenômeno','R nove, 9','Real Madrid',' Rio de Janeiro','RJ','34562',1)
insert into leitor  values (5,'Tiririca','R Sabe Tudo, 221','Clementina','Rio de Janeiro', 'RJ', '77621',0)
insert into leitor  values ( 6,'Zé Simão','Largo Engraçadinho, 2','Rio Verde','São Paulo','SP','87231',1)
insert into leitor  values (7,'Dilma','Av Damas 8762','Piloto',' Brasília','DF','99989',1)
insert into leitor  values (8,'Angelina Jolie','R. bonita, 893','Ai que inveja','Belo Horizonte','MG','56543',0)
insert into leitor  values (9,'Bruce Lee',' R. do dragão, 987','Liberdade',' São Paulo','SP','23429',0)
insert into leitor  values (10, 'Pelé','R do rei, 8753','Praia Grande','Santos','SP','87787',0)
insert into leitor  values (11,'Madonna','R Recorde, 9877','Barra Funda','São Paulo','SP','86589',0)
insert into leitor  values (12,'Sabrina Sato','R Panico, 965','Barra Funda','São Paulo','sp','33221',1)
insert into leitor  values (13,'Roberto Carlos','R do rei, 9914','Praia Grande','Santos','sp','87787',1)
insert into leitor  values (14,'Elvis Presley','av do rei, 23','Praia Grande','Santos','SP','87787',1)
insert into leitor  values (15,'Shakira','r barcelona74','Alpha','Belo Horizonte','MG','78653',1)
insert into leitor  values (16,'Brad Pitt','av To podendo, 876','Hollywood','São Pedro','SP','98021',0)
insert into leitor  values (17,'Neymar Jr','R.Ostentação, 423','Barcelona','São Pedro','SP','98023',1)
insert into leitor  values (18,'Paris Hilton',' Av Comunidade, 11','Taipas','Guaianazes','SP','45329',0)
insert into categoria  values (21,'animais')
insert into categoria  values (22,'espiritual')
insert into categoria  values (23,'suspense')
insert into categoria  values (24,'infantil')
insert into categoria  values (25,'policial')
insert into categoria  values (26,'romance')
insert into categoria  values (27,'humor')
insert into categoria  values (28,'poesia')
insert into categoria  values (29,'gastronomia')
insert into tipo  values (61,'residencial')
insert into tipo  values (62,'celular')
insert into tipo  values (63,'radio')
insert into editora  values (81,'icone','icone ltda','icone.com.br')
insert into editora  values (82,'shanti','shanti ltda','shanti.com')
insert into editora  values (83,'cultrix','cultrix editora ltda','cultrix.com.br')
insert into editora  values (84,'atica','atica livros','atica.com.br')
insert into editora  values (85,'raval','raval ltda','raval.com')
insert into editora  values (86,'sextante','sextante livros as','sextante.com.br')
insert into editora  values (87,'cia. das letras','cia ltda','cia.com.br')
GO
Insert into livro  values (1, 'A semente de mostarda', '240', '22/02/2012',1, 81, 22,1980)
Insert into livro  values (2, 'Cai o pano', '250', '22/02/2009',0, 86, 26,2000)
Insert into livro  values (3, 'Meditação', '310','22/02/2010',0,82,22,2010)
Insert into livro  values (4, 'Eu sou a porta', '190','22/02/2011',0,83,22,1976)
Insert into livro  values (5, 'conversando com gatos', '158','22/02/2012',1,83,21,1950)
Insert into livro  values (6, 'o profeta', '90','22/02/2010',0,85,26,1966)
Insert into livro  values (7, 'o codigo da vinci', '480','22/02/2010',0,86,23,2001)
Insert into livro  values (8, 'o simbolo perdido','512','22/02/2011',0,86,23,2012)
Insert into livro  values (9, 'fortaleza digital', '320','22/02/2011',1,86,23,2013)
Insert into livro  values (10, 'o pequeno principe', '98','22/02/2012',0,84,24,1930)
Insert into livro  values (11, 'o nome da rosa', '460','22/02/2012',0,81,25,1920)
Insert into livro  values (12, 'o alquimista', '460','22/02/2010',0,82,26,1982)
Insert into livro  values (13, 'o conde de monte cristo','420','22/02/2011',1,84,23,1988)
Insert into livro  values (14, 'as minas do rei salomão', '300','22/02/2010',1,84,23,1990)
Insert into livro  values (15, 'mar morto', '270','22/02/2012',1,84,26,1932)
Insert into livro  values (16, 'pobre corinthiano careca', '190','22/02/2012',0,85,27,2013)
Insert into livro  values (17, 'a estrada da noite','170','22/02/2010',0,81,25,1820)
Insert into livro  values (18,'Eu', 256, '11/12/2013', 1, 87, 28,2008)
Insert into livro  values (19, 'Flor da Morte', 58, '11/12/2013', 1, 87, 28,2013)
Insert into livro  values (20, 'Invenção de Orfeu', 432, '21/12/2011', 1, 83, 28,2007)
Insert into livro  values (21, 'Panelinha', 400, '21/12/2012', 1, 82, 29,2014)
Insert into livro  values (22, 'Não é sopa', 368, '21/12/2013', 1, 87, 29,2014)
GO
Insert into livrocol  values (1,1)
Insert into livrocol  values (1,3)
Insert into livrocol  values (1,4)
Insert into livrocol  values (2,7)
Insert into livrocol  values (2,8)
Insert into livrocol  values (2,9)
GO
insert into emprestimo  values (11,'05/08/2012','05/08/2013','05/10/2012',16)
insert into emprestimo  values (12,'05/08/2012','05/08/2013','22/05/2013',7)
insert into emprestimo  values (13,'05/08/2012','05/08/2013','05/10/2012',8)
insert into emprestimo  values (14,'22/09/2012','22/09/2013', '22/01/2013', 1)
insert into emprestimo  values (15,'03/10/2012','03/10/2013','03/05/2013',13)
insert into emprestimo  values (16,'06/10/2012','05/08/2013','05/11/2012', 16)
insert into emprestimo  values (17,'30/11/2012','03/10/2013','03/01/2013',5)
insert into emprestimo  values (18,'11/12/2012','11/12/2013','11/02/2013',4)
insert into emprestimo  values (19,'30/12/2012','30/12/2013','30/03/2013', 11)
insert into emprestimo  values (20,'22/01/2013','22/09/2014','30/06/2013',9)
insert into emprestimo  values (21,'27/02/2013','30/12/2014','30/04/2013',4)
insert into emprestimo  values (22,'03/07/2013','03/10/2014','30/09/2013',5)
insert into emprestimo  values (27,'03/10/2013','03/10/2014','22/03/2014', 7)
insert into emprestimo  values (31,'03/11/2013','03/11/2014','20/04/2014', 4)
insert into emprestimo  values (32,'11/12/2013','11/12/2014','22/03/2014',16)
insert into emprestimo  values (23,'05/08/2013','05/08/2014','',9)
insert into emprestimo  values (24,'22/09/2013','22/09/2014','',18)
insert into emprestimo  values (25,'22/09/2013','22/09/2014','',15)
insert into emprestimo  values (26,'03/10/2013','03/10/2014','', 6)
insert into emprestimo  values (28,'03/11/2013','03/11/2014','',13)
insert into emprestimo  values (29,'03/11/2013','03/11/2014','',5)
insert into emprestimo  values (30,'03/11/2013','03/11/2014','',1)
insert into emprestimo  values (32,'11/12/2013','11/12/2014','',16)
insert into emprestimo  values (33, '11/12/2013','11/12/2014','', 5)
insert into emprestimo  values (34, '30/12/2013','30/12/2014','', 11)
insert into emprestimo  values (35, '30/12/2013','30/12/2014','',2)
GO
insert into livroautor values (1,1)
insert into livroautor values (2, 5)
insert into livroautor values (3, 1)
insert into livroautor values (4, 1)
insert into livroautor values (5, 7)
insert into livroautor values (6, 8)
insert into livroautor values (7, 4)
insert into livroautor values (8, 4)
insert into livroautor values (9, 4)
insert into livroautor values (10, 6)
insert into livroautor values (11, 10)
insert into livroautor values (12, 2)
insert into livroautor values (13, 9)
insert into livroautor values (14, 11)
insert into livroautor values (15, 3)
insert into livroautor values (16, 12)
insert into livroautor values (17, 13)
GO
insert into espera values (91, 10, 12)
insert into espera values (92, 10, 17)
insert into espera values (93, 10, 7)
insert into espera values (94, 3, 11)
insert into espera values (95, 4, 15)
insert into espera values (96, 12, 4)
GO
insert into ITEMEMPRESTADO values (1, 13, 11)
insert into ITEMEMPRESTADO values (2, 5, 12)
insert into ITEMEMPRESTADO values (3, 10, 13)
insert into ITEMEMPRESTADO values (4, 4, 14)
insert into ITEMEMPRESTADO values (5, 9, 15)
insert into ITEMEMPRESTADO values (6, 10, 16)
insert into ITEMEMPRESTADO values (7, 13, 17)
insert into ITEMEMPRESTADO values (8, 7, 18)
insert into ITEMEMPRESTADO values (9, 16, 19)
insert into ITEMEMPRESTADO values (10, 10, 20)
insert into ITEMEMPRESTADO values (11, 13, 21)
insert into ITEMEMPRESTADO values (12, 8, 22)
insert into ITEMEMPRESTADO values (13, 6, 23)
insert into ITEMEMPRESTADO values (14, 11, 24)
insert into ITEMEMPRESTADO values (15, 10, 25)
insert into ITEMEMPRESTADO values (16, 4, 26)
insert into ITEMEMPRESTADO values (17, 9, 27)
insert into ITEMEMPRESTADO values (18, 2, 28)
insert into ITEMEMPRESTADO values (19, 12, 29)
insert into ITEMEMPRESTADO values (20, 7, 30)
insert into ITEMEMPRESTADO values (21, 14, 31)
insert into ITEMEMPRESTADO values (22, 17, 32)
insert into ITEMEMPRESTADO values (23, 3, 33)
insert into ITEMEMPRESTADO values (24, 8, 34)
insert into ITEMEMPRESTADO values (25, 16, 35)
go
insert into telefone values (1, 1,'8765-9076', 61)
insert into telefone values (2, 2, '3451-2289', 61)
insert into telefone values (3, 2, '6652-3478', 62)
insert into telefone values (4, 3, '7654-3909', 62)
insert into telefone values (5, 9, '7766-5678', 61)
insert into telefone values (6, 9, '3344-6658', 62)
insert into telefone values (7, 5, '2341-1250', 62)
insert into telefone values (8, 6, '3232-4560', 62)
insert into telefone values (9, 7, '5546-7892', 63)
insert into telefone values (10, 8, '3455-6671', 63)
insert into telefone values (11, 4, '3235-6780', 62)
insert into telefone values (12, 10, '2233-4569', 61)
insert into telefone values (13, 11, '3214-5655', 61)
insert into telefone values (14, 11, '2378-8819', 62)
insert into telefone values (15, 12, '2126-6789', 61)
insert into telefone values (16, 12, '6657-8904', 62)
insert into telefone values (17, 12, '3445-5530', 63)
insert into telefone values (18, 13, '2234-4556', 61)
insert into telefone values (19, 14, '6221-4453', 61)
insert into telefone values (20, 14, '5644-3278', 63)
GO