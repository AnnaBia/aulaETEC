-- criando banco de dados
create database db_AnaBeatriz
-- criando tabelas
use db_AnaBeatriz;

-- tabela contato
create table tbl_contato(
	CODIGO smallint not null,
	NOME varchar(50) not null,
	E_MAIL varchar(100) null,
	ATIVO bit not null,
);

-- tabela telefone
create table tbl_telefone(
	ID_CODIGO smallint primary key identity not null,
	CodCONTATO smallint not null,
	TipoTELEFONE varchar(15) not null,
	TELEFONE varchar(15) not null,
	RAMAL varchar(4) not null,
);

-- tabela endereço
create table tbl_endereco(
	ID_CODIGO smallint primary key identity not null,
	CodCONTATO smallint not null,
	ENDERECO varchar(80) not null,
	NUMERO smallint not null,
	COMPLEMENTO varchar(30) null,
	BAIRRO varchar(30) null,
	CIDADE varchar(30) null,
	ESTADO varchar(2) null,
	CEP varchar(9) null,
);

-- apresenta tabela
select * from tbl_contato;
select * from tbl_telefone;
select * from tbl_endereco;

-- incluindo campo GENERO na tbl_contato
alter table tbl_contato add GENERO varchar (1) null;
select * from tbl_contato;

-- incluindo na tbl_contato chave primaria no campo CODIGO
alter table tbl_contato add primary key (CODIGO);
exec sp_rename 'tbl_contato.CODIGO','ID_CODIGO';
sp_help tbl_contato;

-- exluindo campo RAMAL da tbl_telefone
alter table tbl_telefone drop column RAMAL;
select * from tbl_telefone;

-- incluindo na tbl_telefone chave estrangeira no campo CodCONTATO c/referência a tbl_contato
alter table tbl_telefone add foreign key(CodCONTATO) references tbl_contato(ID_CODIGO);
sp_help tbl_telefone;

-- incluindo na tbl_endereco chave estrangeira no campo CodCONTATO c/referência a tbl_contato
alter table tbl_endereco add foreign key(CodCONTATO) references tbl_contato(ID_CODIGO);
sp_help tbl_endereco;

-- excluindo tabelas
drop table tbl_telefone;
drop table tbl_endereco;
drop table tbl_contato;

-- excluindo banco de dados
use master;
drop database db_AnaBeatriz;


