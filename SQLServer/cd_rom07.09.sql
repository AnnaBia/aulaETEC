--Criação do Banco de Dados cd_rom
create database cd_rom 
on(
	name = cdrom_db,
	filename = "C:\SQL\cd_rom.mdf",
	size = 5mb,
	maxsize = 10mb,
	filegrowth = 1mb
	)
log on( -- criação do log, continuação do create database
	name = cdrom_log,
	filename = "C:\SQL\cd_rom.ldf",
	size = 1mb,
	maxsize = 5mb,
	filegrowth = 1mb
	)

--COMANDO PARA CRIAÇÃO DE TABELAS: CREATE TABLE
--Criação da TABELA CLIENTES
use cd_rom
create table Clientes
(
	codigo 		int 			not null unique,
	nome 		varchar(50) 	not null,
 	RG 			varchar(20)		not null,
 	CPF 		varchar(20)		not null unique,
 	telefone	varchar(15) 	not null,
 	endereco	varchar(100) 	not null,
 	bairro 		varchar(50) 	not null,
 	cidade 		varchar(40) 	not null,
	estado 		varchar(2) 		not null,
 	CEP 		varchar(9) 		not null, 
	email 		varchar(50) 	not null,
	primary key (codigo asc)
)

-- Criação da Tabela Vendedor
create table Vendedor
(
	codigo 		int 			not null unique,
	nome 		varchar(50) 	not null,
 	telefone	varchar(15) 	not null,
 	endereco	varchar(100) 	not null,
 	bairro 		varchar(50) 	not null,
 	cidade 		varchar(40) 	not null default 'SÃO PAULO',
	estado 		varchar(2) 		not null,
 	CEP 		varchar(9) 		not null, 
	email 		varchar(50) 	not null,
	genero		varchar(1)		not null check (GENERO='F' OR GENERO='M') default ('M'),
	nascimento  smalldatetime   not null
	primary key (codigo asc)
)

--Criação da Tabela Produtos
create table Produtos
(
	codigo 		int 			not null unique,
	descrição	varchar(80) 	not null,
 	preco_unit	money			not null check (PRECO_UNIT >=0),
 	categoria 	varchar(40) 	not null,
	primary key (codigo asc)
)

--Criação da Tabela NF - Nota Fiscal
drop table NF
(
	codigo			int			not null unique,
	data_venda		datetime 	not null default getdate(),
	codigo_vendedor int 		not null,
	codigo_cliente	int 		not null,
	primary key (codigo asc),
	foreign key (codigo_vendedor) 	references cd_rom.dbo.Vendedor,
	foreign key (codigo_cliente) 	references cd_rom.dbo.Clientes
)

--Criação da Tabela ItensNF
create table ItensNF
(
	quantidade	int	not null,
	desconto int not null,
	codigo_nf int not null,
	codigo_produto int not null,
	primary key (codigo_NF, codigo_produto),
	foreign key	(codigo_nf) 	 references cd_rom.dbo.NF,
	foreign key (codigo_produto) references cd_rom.dbo.Produtos
)

--Criação da Tabela Estado
create table Estado
(
	codigo  int			not null identity(1,1),
	sigla   varchar(2)  not null,
	estado  varchar(50) not null,
	capital varchar(40) not null	
)

insert into Estado values ('AC','ACRE','RIO BRANCO')
insert into Estado values ('AL', 'ALAGOAS','MACEIÓ')
insert into Estado values ('AP', 'AMAPÁ','MACAPÁ')
insert into Estado values ('AM', 'AMAZONAS','MANAUS')
insert into Estado values ('BA', 'BAHIA','SALVADOR')
insert into Estado values ('CE', 'CEARÁ','FORTALEZA')
insert into Estado values ('DF', 'DISTRITO FEDERAL','BRASILIA')
insert into Estado values ('ES', 'ESPÍRITO SANTO','VITÓRIA')
insert into Estado values ('GO', 'GOIÁS','GOIÂNIA')
insert into Estado values ('MA', 'MARANHÃO','SÃO LUÍS')
insert into Estado values ('MT', 'MATO GROSSO','CUIABÁ')
insert into Estado values ('MS', 'MATO GROSSO DO SUL','CAMPO GRANDE')
insert into Estado values ('MG', 'MINAS GERAIS','BELÉM')
insert into Estado values ('PB', 'PARAÍBA','JOÃO PESSOA')
insert into Estado values ('PR', 'PARANÁ','CURITIBA')
insert into Estado values ('PE', 'PERNAMBUCO','RECIFE')
insert into Estado values ('PI', 'PIAUÍ', 'TERESINA')
insert into Estado values ('RJ', 'RIO DE JANEIRO','RIO DE JANEIRO')
insert into Estado values ('RN', 'RIO GRANDE DO NORTE','NATAL')
insert into Estado values ('RS', 'RIO GRANDE DO SUL','PORTO ALEGRE')
insert into Estado values ('RO', 'RONDÔNIA','PORTO VELHO')
insert into Estado values ('RR', 'RORAIMA','BOA VISTA')
insert into Estado values ('SC', 'SANTA CATARINA','FLORIANÓPOLIS')
insert into Estado values ('SP', 'SÃO PAULO','SÃO PAULO')
insert into Estado values ('SE', 'SERGIPE','ARACAJU')
insert into Estado values ('TO', 'TOCANTINS','PALMAS')
select*from Estado

--Clientes
insert into Clientes values(1,'Nancy Davolio','1.834.517','895.454.191-72','(61)2387-8803','Qd 11 Conjunto B Casa 10','Sobradinho I','Brasilia','DF','73000-000','nancy.d@zipmail.com.br')
insert into Clientes values(2,'André Fonseca','1.987.542','984.545.919-27','(61)2359-1221','Quadra 10 Conjunto A Casa 21','Sobradinho I','Brasilia','DF','73000-000','andre.fonseca@yahoo.com.br')
insert into Clientes values(3,'Manoel Batista','1.648.978','325.689.785-56','(61)2485-0544','Quadra 08 Conjunto E Casa 54','Sobradinho II','Brasilia','DF','73200-000','manoel@.ig.com.br')
insert into Clientes values(4,'João da Silva','1.887.542','934.677.966-27','(61)2359-1221','Quadra 09 Conjunto G Casa 56','Sobradinho II','Brasilia','DF','73200-000','joao.silva@gmail.com')
insert into Clientes values(5,'Paulo Pereira','11.988.254-2','567.987.456-97','(11)3359-1298','Rua XV de Novembro, 221 Apto 66','República','São Paulo','SP','01100-000','paulopereira2306@yahoo.com.br')
insert into Clientes values(6,'Luana Santana','22.856.457','784.632.909-98','(11)4359-1243','Av. Principal, 2145','Centro','Guarulhos','SP','07000-000','luanadocinho2207@hotmail.com')
insert into Clientes values(7,'Marta Fagundes','31.569.845-3','344.775.779-07','(11)3359-6521','Av Baruel, 110 Fundos','Casa Verde','São Paulo','SP','02525-010','fag_marthinha@yahoo.com.br')
insert into Clientes values(8,'Larissa Fontoura','41.687.231','654.655.659-65','(11)2277-6363','Av. dos Latinos, 1054','Jd. Santa Therezinha','São Paulo','SP','03930-000','larilari.fontoura@yahoo.com.br')
insert into Clientes values(9,'Roberta Martins','6.659.488','874.985.943-63','(21)2275-8357','Av. Vieira Souto, 2348 Apto 21B','Copacabana','Rio de Janeiro','RJ','21730-000','martins.beca.10@gmail.com.br')
insert into Clientes values(10,'Sandro Trevisan','8.665.332','234.555.765-66','(21)3254-6012','Av. Brasil, 2121', 'Flamengo','Rio de Janeiro','RJ','21217-000','sandrotrevisan@sgicomp.com.br')
insert into Clientes values(11,'João Pedro','36.111.345-4','987.456.321-01','(11)4002-3456','Rua dos Sábios, 150','São Miguel','São Paulo','SP','00135-000','jon.p@hotmail.com')
insert into Clientes values(12,'Pamela Lopes','30.945.123-6','845.156.798-00','(11)3227-3614','Rua Acarajé, 200','Vila Louis','São Paulo','SP','15500-000','pam.lopes@hotmail.com')
select*from Clientes

--Vendedor
insert into Vendedor values(1,'Luiz Carlos Andrade Júnior','(61)2321-5465', 'Qd 24 Conj. V Casa 24','Lago Sul','Brasília', 'DF','78440-000','junior.gafanhoto@zipmail.com.br','M','06-10-1971')
insert into Vendedor values(2,'Eliézio Brito','(62)2387-8809','Qd 11 Conj. B Casa 11','Sobradinho I','Brasília','DF','73800-000','eliezio@yahoo.com.br','M','27-04-1983')
insert into Vendedor values(3,'André Paiva','(21)3224-2424','Rua CV  Conj. B Casa 11','Morro do Jacarezinho','Rio de Janeiro','RJ','45811-000', 'andre@yahoo.com.br','M','25-02-1990')
insert into Vendedor values(4,'Flávio Oliveira','(61)2322-9598','Qd 06 Conj. A Casa 10','Lago Sul','Brasília','DF','78430-000','flavio.abacaxi@zipmail.com.br','M','07-12-1985')
insert into Vendedor values(5,'Rafael de Sousa','(62)23775304','Qnm 22 Conj. I Casa 21','Ceilândia','Brasília', 'DF','72560-000','rafa-gord@yahoo.com.br','M','12-10-1948')
insert into Vendedor values(6,'Ricas Bileu','(21)2311-0203','QE 11 Área Especial L Ed Guará','Guará','Brasília', 'DF','72000-000','ricas.bileu@ig.com.br','M','08-03-1950')
insert into Vendedor values(7,'Ana Bia','(11)2900-3000','Rua Cachos Dourados, 132','Céus','São Paulo','SP','00564-00','bia_espejo@hotmail.com','F','09-08-1997')
select*from Vendedor

--Produtos
insert into Produtos values(1, 'Zezé di Camargo e Luciano'	, 20.90, 'Sertanejo')
insert into Produtos values(2, 'S.P.C'						, 12.00, 'Pagode')
insert into Produtos values(3, 'Alan Jackson'				, 35.90, 'Country')
insert into Produtos values(4, 'U2'							, 35.90, 'Rock/Pop')
insert into Produtos values(5, 'Raimundos'					, 20.90, 'Rock')
insert into Produtos values(6, 'Amigos do Pai'				, 25.40, 'Gospel')
insert into Produtos values(7, 'Engenheiros do Havaí'		, 35.90, 'Rock/Pop')
insert into Produtos values(8, 'Guns n Roses'				, 25.40, 'Rock')
insert into Produtos values(9, 'Scorpions SkarLaite'		, 10.00, 'Rock')
insert into Produtos values(10,'Legião Urbana'				, 28.00, 'Rock/Pop')
insert into Produtos values(11,'Rod Stewart'				, 20.90, 'Rock')
insert into Produtos values(12,'Luan Santana'				, 25.40, 'Sertanejo')
insert into Produtos values(13,'Parangolé'					, 15.00, 'Axé')
insert into Produtos values(14,'Jorge Aragão'				, 20.90, 'Samba')
insert into Produtos values(15,'Pepe e Nenem'				, 15.00, 'Pop')
insert into Produtos values(16,'Lady Gaga'					, 20.90, 'Pop')
insert into Produtos values(17,'Justin Bieber'				, 20.90, 'Pop')
insert into Produtos values(18,'Felipe Araujo'				, 33.00, 'Sertanejo')
insert into Produtos values(19,'Simone e Simaria'			, 23.90, 'Sertanejo')
insert into Produtos values(20,'Chitãozinho e Xororó'		, 24.90, 'Sertanejo')
select*from Produtos
/*
--NF
insert into NF values ( 1,'01-08-2013 00:00:00.000',2, 2)
insert into NF values ( 2,'01-08-2013 00:00:00.000',1, 1)
insert into NF values ( 3,'02-08-2013 00:00:00.000',3,10)
insert into NF values ( 4,'02-08-2013 00:00:00.000',1, 4)
insert into NF values ( 5,'03-08-2013 00:00:00.000',5, 1)
insert into NF values ( 6,'03-08-2013 00:00:00.000',6, 3)
insert into NF values ( 7,'04-08-2013 00:00:00.000',4, 5)
insert into NF values ( 8,'04-08-2013 00:00:00.000',2, 6)
insert into NF values ( 9,'05-08-2013 00:00:00.000',2, 7)
insert into NF values (10,'05-08-2013 00:00:00.000',4, 8)
insert into NF values (11,'05-08-2013 00:00:00.000',1, 9)
insert into NF values (12,'05-08-2013 00:00:00.000',2, 1)
insert into NF values (13,'05-08-2013 00:00:00.000',3,10)
insert into NF values (14,'05-08-2013 00:00:00.000',6, 2)
insert into NF values (15,'06-08-2013 00:00:00.000',4, 1)
insert into NF values (16,'06-08-2013 00:00:00.000',4, 8)
insert into NF values (17,'06-08-2013 00:00:00.000',5, 4)
insert into NF values (18,'07-08-2013 00:00:00.000',5, 6)
insert into NF values (19,'07-08-2013 00:00:00.000',1, 5)
insert into NF values (20,'08-08-2013 00:00:00.000',1, 3)
select*from NF

--itensNF
insert into itensnf values (6, 1,11)
insert into itensnf values (8, 2, 6)
insert into itensnf values (2, 3, 20)
insert into itensnf values (6, 4, 2)
insert into itensnf values (2, 5, 4)
insert into itensnf values (1, 6, 1)
insert into itensnf values (1, 6, 2)
insert into itensnf values (1, 6, 3)
insert into itensnf values (1, 7,11)
insert into itensnf values (2, 8, 5)
insert into itensnf values (1, 9, 5)
insert into itensnf values (1, 9, 6)
insert into itensnf values (7,10, 19)
insert into itensnf values (1,11, 1)
insert into itensnf values (1,12, 18)
insert into itensnf values (1,13, 17)
insert into itensnf values (1,14, 2)
insert into itensnf values (1,14, 3)
insert into itensnf values (2,15, 4)
insert into itensnf values (2,15,16)
insert into itensnf values (1,16,13)
insert into itensnf values (1,16,14)
insert into itensnf values (1,16,15)
insert into itensnf values (1,17,13)
insert into itensnf values (1,18,12)
insert into itensnf values (1,19,10)
insert into itensnf values (1,19,11)
insert into itensnf values (1,20, 1)
insert into itensnf values (1,20, 6)
*/