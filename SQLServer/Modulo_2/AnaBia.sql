-- 1. Crie o Banco de Dados seunome
-- criando banco de dados
create database AnaBia
go

-- 2. Crie as tabelas conforme os modelos
-- Criando tabela Cliente
create table Cliente(
	Codigo INT primary key not null,
	Nome VARCHAR(50) not null,
 	Endereco VARCHAR(150) not null,
	Complem VARCHAR(15),
 	Bairro VARCHAR(20),
 	Cidade VARCHAR(30) not null,
	Estado VARCHAR(2) not null,
 	CEP VARCHAR(9)not null
)
go
-- Criando tabela Cidade
create table Cidade(
	Codigo INT primary key not null,
	Cidade VARCHAR(30) not null,
)
go
-- Criando tabela Estado
create table Estado(
	Codigo INT primary key not null,
	Estado VARCHAR(30) not null,
	Sigla VARCHAR(2) not null
)
go

-- 3. Altere as tabelas abaixo
-- Na tabela Cliente, altere os campos Cidade e Estado para INT
alter table Cliente alter column Cidade INT
alter table Cliente alter column Estado INT

-- Na tabela Cliente, adicione foreign key nos campos Cidade e Estado 
alter table Cliente add foreign key (Cidade) references Cidade
alter table Cliente add foreign key (Estado) references Estado

-- Na tabela Cidade, adicione o campo Estado INT 
alter table Cidade add Estado INT not null

-- Na tabela Cidade, adicione Chave Estrangeira no campo Estado
alter table Cidade add foreign key (Estado) references Estado

-- 4. Insira os dados abaixo
-- Estado
insert into Estado values(1, 'Distrito Federal','DF')
insert into Estado values(2, 'São Paulo', 'SP')
insert into Estado values(3, 'Rio de Janeiro', 'RJ')
insert into Estado values(4, 'Bahia', 'BA')
insert into Estado values(5, 'Espirito Santo', 'ES')
go
-- Cidade
insert into Cidade values(1, 'Brasília', 1)
insert into Cidade values(2, 'São Paulo', 2)
insert into Cidade values(3, 'Osasco', 3)
insert into Cidade values(4, 'Rio de Janeiro', 4)
insert into Cidade values(5, 'Salvador', 5)
go
-- Cliente
insert into Cliente values(1, 'Luiz Carlos Andrade Jr', 'Ql 24', 'Conj. V Casa 24', 'Lago Sul', 1, 1, '78440-000')
insert into Cliente values(2, 'Flávio Oliveira', 'Ql 06', 'Conj. A Casa 10', 'Lago Sul', 1, 1, '78430-000')
insert into Cliente values(3, 'Eliézio Brito', 'QD 11', 'Conj. B Casa 11', 'Sobradinho I', 1, 1, '73800-000')
insert into Cliente values(4, 'Rafael de Sousa', 'QNM 22', 'Conj. I Casa 21', 'Ceilândia', 1, 1, '72560-000')

-- 5. Altere os dados abaixo
update Cliente set 
	Endereco = 'Rua Nova Granada, 35',
	Complem = null,
	Bairro ='Casa Verde',
	Cidade = 2,
	Estado = 2,
	CEP = '02516-000'
	where Nome like '%Carlos%'
go
update Cliente set Bairro = 'Asa Norte', CEP = '78450-050' where Bairro = 'Lago Sul'
go
update Cliente set Nome = 'Eliézio BRito Jr.' where Codigo = 3
go
update Cliente set Complem = 'Conjunto JK' where CEP like '%7%'

-- 6. Exclua os registros abaixo
-- a. Cliente onde o estado != ‘SP’
delete from Cliente where Estado != 2
go
-- b. Cidade onde o estado = 4
delete from Cidade where Estado = 4
go
-- c. Estado onde a sigla = ‘BA’
delete from Estado where Sigla = 'BA'
go
-- d. Cidade onde a cidade como ‘% Janeiro’
delete from Cidade where Cidade like '%Janeiro%'

-- 7. Exclua as tabelas
-- a. Cliente, Cidade e Estado
drop table Cliente, Cidade, Estado

use master
-- 8. Exclua o banco seunome
drop database AnaBia
