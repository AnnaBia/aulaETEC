-- criando tabela CDs
create table CDs(
	Codigo INT primary key not null,
	Nome VARCHAR(50) not null,
	dataCompra Datetime	not null,
	valorPago DECIMAL(5,2) not null,
	localCompra VARCHAR(20) not null,
	Categoria VARCHAR(30) not null,
	Coletanea BIT not null
	)
go
-- criando tabela Musicas
create table Musicas(
	codCD INT not null,
	Faixa INT not null,
	Nome VARCHAR(50) not null,
	Artista VARCHAR(50) not null,
	Tempo DECIMAL(4,2) not null,
	primary key (codCD, Faixa), -- quando tem mais de uma chave prim�ria
	)
go
-- dados tabela CDs
insert into CDS values (1, 'CHINESE DEMOCRACY', '01/01/1990',19.9, 'SUBMARINO', 'ROCK', 0)
insert into CDS values (2, 'Z� NETO E CRISTIANO', '10/11/2019',9.9, 'AMERICANAS', 'SERTANEJO', 0) 
insert into CDS values (3, 'RIHANNA', '01/06/2010',5, 'AMAZON', 'POP/ROCK', 0) 
insert into CDS values (4, 'O MELHOR DO BRASIL', '01/10/2015',9.9, 'AMERICANAS', 'FORR�', 1) 
insert into CDS values (5, 'ZECA PAGODINHO', '01/01/1995',9.9, 'LOJA DE DISCOS', 'PAGODE', 0) 
go
-- dados tabela Musicas
insert into Musicas values (1, 1, 'WELCOME TO THE JUNGLE', 'GUNS AND ROSES', 3.1)
insert into Musicas values (1, 2, 'YESTERDAY', 'GUNS AND ROSES', 5.21)
insert into Musicas values (1, 3, 'NOVEMBER RAIN', 'GUNS AND ROSES', 4.16)
insert into Musicas values (2, 1, 'ALO AMBEV', 'ZE NETO E CRISTIANO', 2.3)
insert into Musicas values (3, 1, 'UMBRELLA', 'RIHANNA', 2.46)
insert into Musicas values (4, 1, 'MORANGO DO NORDESTE', 'INES BRASIL', 1.55)
insert into Musicas values (4, 2, 'ASA BRANCA', 'LUIZ GONZAGA', 3.47)
insert into Musicas values (5, 1, 'DEIXA A VIDA ME LEVAR', 'ZECA PAGODINHO', 4)
go

-- 1.	Selecione todos os campos e todos os registros da tabela CDs
select * from CDs

-- 2.	Selecione os campos nome e data da compra, convertida para o formato dd/mm/aaaa, dos cds da categoria �rock� ordenados por nome
select Nome, dataCompra from CDs where Categoria = 'ROCK' order by Nome

-- 3.	Selecione os campos nome e data da compra dos cds classificados por data de compra, no formato dd/mm/aaaa, da categoria como �serta%� em ordem decrescente
select Nome, [dataCompra] = convert(varchar, [dataCompra], 103) from CDs where Categoria like 'SERTA%' order by [dataCompra] desc

--4.	Selecione e Totalize o total gasto com a compra dos Cds
select [totalGasto] = sum(valorPago) from CDs

--5.	Selecione o nome e o artista de todas m�sicas cadastradas, ordenadas pelo artista.
select Nome, Artista from Musicas order by Artista

--6.	Selecione e totalize o tempo total de m�sicas cadastradas
select sum(Tempo) as tempoTotal from Musicas

--7.	Selecione a faixa, o nome da m�sica e o tempo das m�sicas do cd 5.
select Faixa, Nome, Tempo from Musicas where codCD = 5

--8.	Selecione e totalize o tempo total de m�sicas por cd
select codCD, sum(Tempo) as 'tempoTotalCD' from Musicas group by codCD

--9.	Selecione e conte a quantidade de m�sicas cadastradas
select count(*) as musicasCadastradas from Musicas

--10.	Selecione o tempo m�dio de dura��o das m�sicas cadastradas
select avg(Tempo) as tempoMedio from Musicas

--11.	Selecione e conte a quantidade de Cds cadastrados na categoria �pop/rock�
select [CDsPopRock] = count(*) from CDs where Categoria = 'POP/ROCK'

--12.	Selecione o nome das m�sicas da �Rihanna� ordenados pelo nome, sem repeti��o (distinct). 
select distinct Nome, Artista from Musicas where Artista = 'RIHANNA'

--13.	Selecione o nome do cd e o local de compra dos cds comprados no Submarino e na Americanas
select Nome, localCompra from CDs where localCompra = 'SUBMARINO' or localCompra = 'AMERICANAS'
select Nome, localCompra from CDs where localCompra in ('SUBMARINO', 'AMERICANAS') -- outra forma

--14.	Selecione o nome da m�sica e os artistas que gravaram a m�sica �Morango do Nordeste�. 
select Nome, Artista from Musicas where Nome = 'MORANGO DO NORDESTE'

--15.	Selecione todos campos dos cds que s�o colet�neas
select * from CDS where Coletanea = '1'

--16.	Selecione o nome, o valorPago e o local do cd que custou mais caro
select Nome, valorPago, localCompra from CDs where valorPago = (select max(valorPago) from CDs)

--17.	Selecione o nome, o valorPago e o local dos 10 CDs mais baratos
select top 10 Nome, valorPago, localCompra from CDs order by valorPago

--18.	Selecione todas as m�sicas ordenadas pelo nome decrescente
select Nome from Musicas order by Nome desc

--19.	Selecione a m�sica com o maior tempo
select top 1 Nome, Tempo from Musicas order by tempo desc
select Nome, Tempo from Musicas where Tempo = (select max(Tempo) from Musicas) -- outra forma

--20.	Selecione as 10 m�sicas com menor tempo
select top 10 Nome, Tempo from Musicas order by Tempo