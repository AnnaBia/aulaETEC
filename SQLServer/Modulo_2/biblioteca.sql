create database biblioteca
go
create table Leitor(
	idLeitor INT primary key,
	Nome VARCHAR(100),
	Email VARCHAR(120),
	Endereco VARCHAR(120),
	Bairro VARCHAR(30),
	Cidade VARCHAR(30),
	Estado VARCHAR(2),
	CEP VARCHAR(9),
	ativo BIT)
go
create table Autor(
	idAutor INT primary key,
	Sobrenome VARCHAR(20),
	Nome VARCHAR(20),
	NomeMeio VARCHAR(50),
	Nacionalidade VARCHAR(20))
go
create table Editora(
	idEditora INT PRIMARY KEY ,
	nomeFantasia VARCHAR(20),
	razaoSocial VARCHAR (100),
	site VARCHAR(200))
go
create table Categoria(
	idCategoria INT primary key,
	Descrição VARCHAR(20))
go
create table Colecao(
	idColecao INT primary key,
	nomeColecao VARCHAR(20))
go
create table tipoTelefone(
	idTipo INT primary key,
	tipoTelefone VARCHAR(11))
go
create table Livro(
	idLivro INT primary key,
	Titulo VARCHAR(100),
	Subtitulo VARCHAR(150),
	idEditora INT foreign key references Editora,
	Edicao INT,
	anoPublicacao INT,
	idCategoria INT foreign key references Categoria,
	dataAquisicao DATETIME,
	Paginas INT,
	Localizacao VARCHAR(10),
	Disponivel BIT)
go
create table livroColecao(
	idLivro INT foreign key references Livro,
	idColecao INT foreign key references Colecao,
	Volume INT)
go
create table listaEspera(
	idLista INT primary key,
	idLeitor INT foreign key references Leitor,
	idLivro INT foreign key references Livro,
	dataAviso DATETIME,
	dataLimite DATETIME,
	Retirado BIT)
go
create table Emprestimo(
	idEmprestimo INT primary key,
	dataEmprestimo DATETIME,
	dataPrevista DATETIME,
	dataDevolucao DATETIME,
	idLeitor INT foreign key references Leitor,
	Prorrogacao INT)
go
create table itemEmprestado(
	idItem INT primary key,
	idLivro INT foreign key references Livro,
	idEmprest INT foreign key references Emprestimo)
go
create table livroAutor(
	idLivro INT foreign key references Livro,
	idAutor INT foreign key references Autor)
go
create table Telefone(
	idTelefone INT primary key,
	idLeitor INT foreign key references Leitor,
	idTipo int foreign key references tipoTelefone,
	Telefone VARCHAR(15))

insert into Colecao values (1, 'Osho Forever')
insert into Colecao values (2, 'Dan Brown-Série Ouro')
go
insert into Autor values (1, 'Osho', 'Guru', '', 'Índia')
insert into Autor values (2, 'Coelho', 'Paulo', '', 'Brasil')
insert into Autor values (3, 'Amado', 'Jorge', '', 'Brasil')
insert into Autor values (4, 'Brown', 'Dan', '', 'EUA')
insert into Autor values (5, 'Christie', 'Agatha', '', 'Inglaterra')
insert into Autor values (6, 'Saint-Exupey', 'Antoine', '', 'França')
insert into Autor values (7, 'Metellon', 'Kate', '', 'EUA')
insert into Autor values (8, 'Gibran', 'Khalil', '', 'Líbano')
insert into Autor values (9, 'Dumas', 'Alexandre', '', 'França')
insert into Autor values (10, 'Eco', 'Umberto', '', 'Itália')
insert into Autor values (11, 'Haggard', 'Henry', '', 'Inglaterra')
insert into Autor values (12, 'Azevedo', 'Ricardo', '', 'Brasil')
insert into Autor values (13, 'Hill', 'Joe', '', 'EUA')
insert into Autor values (14,'Anjos','Augusto', '', 'Brasil')
go
insert into Leitor values (1, 'Huguinho', '', 'R Patos, 36', 'Lagoa Azul', 'Curitiba', 'PR', '12457', 1)
insert into Leitor values (2, 'Zezinho', '', 'R Galinha, 67', 'Rio Verde', 'São Paulo', 'SP', '25346', 1)
insert into Leitor values (3, 'Luizinho', '', 'R Patos, 400', 'Lagoa Azul', 'Curitiba', 'PR', '56723', 1)
insert into Leitor values (4, 'Ronaldo Fenômeno', '', 'R Nove, 9', 'Real Madrid', ' Rio de Janeiro', 'RJ', '34562', 1)
insert into Leitor values (5, 'Tiririca', '', 'R Sabe Tudo, 221', 'Clementina', 'Rio de Janeiro', 'RJ', '77621', 0)
insert into Leitor values (6, 'Zé Simão', '', 'Largo Engraçadinho, 2', 'Rio Verde', 'São Paulo', 'SP', '87231', 1)
insert into Leitor values (7, 'Dilma', '', 'Av Damas 8762', 'Piloto', ' Brasília', 'DF', '99989', 1)
insert into Leitor values (8, 'Angelina Jolie', '', 'R Bonita, 893', 'Ai que inveja', 'Belo Horizonte', 'MG', '56543', 0)
insert into Leitor values (9, 'Bruce Lee', '', ' R do Dragão, 987', 'Liberdade', ' São Paulo', 'SP', '23429', 0)
insert into Leitor values (10, 'Pelé', '', 'R do Rei, 8753', 'Praia Grande', 'Santos', 'SP', '87787', 0)
insert into Leitor values (11, 'Madonna', '', 'R Recorde, 9877', 'Barra Funda', 'São Paulo', 'SP', '86589', 0)
insert into Leitor values (12, 'Sabrina Sato', '', 'R Panico, 965', 'Barra Funda', 'São Paulo', 'SP', '33221', 1)
insert into Leitor values (13, 'Roberto Carlos', '', 'R do Rei, 9914', 'Praia Grande', 'Santos', 'SP', '87787', 1)
insert into Leitor values (14, 'Elvis Presley', '', 'Av do Rei, 23', 'Praia Grande', 'Santos', 'SP', '87787', 1)
insert into Leitor values (15, 'Shakira', '', 'R Barcelona74', 'Alpha', 'Belo Horizonte', 'MG', '78653', 1)
insert into Leitor values (16, 'Brad Pitt', '', 'Av To podendo, 876', 'Hollywood', 'São Pedro', 'SP', '98021', 0)
insert into Leitor values (17, 'Neymar Jr', '', 'R Ostentação, 423', 'Barcelona', 'São Pedro', 'SP', '98023', 1)
insert into Leitor values (18, 'Paris Hilton', '', 'Av Comunidade, 11', 'Taipas', 'Guaianazes', 'SP', '45329', 0)
go
insert into Categoria values (21, 'Animais')
insert into Categoria values (22, 'Espiritual')
insert into Categoria values (23, 'Suspense')
insert into Categoria values (24, 'Infantil')
insert into Categoria values (25, 'Policial')
insert into Categoria values (26, 'Romance')
insert into Categoria values (27, 'Humor')
insert into Categoria values (28, 'Poesia')
insert into Categoria values (29, 'Gastronomia')
go
insert into tipoTelefone values (61, 'Residencial')
insert into tipoTelefone values (62, 'Celular')
insert into tipoTelefone values (63, 'Radio')
go
insert into Editora values (81, 'icone', 'icone ltda', 'icone.com.br')
insert into Editora values (82, 'shanti', 'shanti ltda', 'shanti.com')
insert into Editora values (83, 'cultrix', 'cultrix editora ltda', 'cultrix.com.br')
insert into Editora values (84, 'atica', 'atica livros', 'atica.com.br')
insert into Editora values (85, 'raval', 'raval ltda','raval.com')
insert into Editora values (86, 'sextante', 'sextante livros as', 'sextante.com.br')
insert into Editora values (87, 'cia. das letras', 'cia ltda', 'cia.com.br')
go
set dateformat DMY

insert into livro values (1, 'A semente de mostarda', '', 81, '', 1980, 22, '22/02/2012', 240, '',1)
insert into livro values (2, 'Cai o pano', '', 86, '',2000, 26, '22/02/2009', 250, '', 0)
insert into livro values (3, 'Meditação', '', 82, '', 2010, 22, '22/02/2010', 310, '', 0)
insert into livro values (4, 'Eu sou a porta', '', 83, '', 1976 , 22, '22/02/2011', 190, '', 0)
insert into livro values (5, 'conversando com gatos', '', 83, '', 1950, 21, '22/02/2012', 158, '', 1)
insert into livro values (6, 'o profeta', '', 85, '', 1966, 26, '22/02/2010', 90, '', 0)
insert into livro values (7, 'o codigo da vinci', '', 86, '', 2001, 23, '22/02/2010', 480, '', 0)
insert into livro values (8, 'o simbolo perdido', '', 86, '', 2012, 23, '22/02/2011', 512, '', 0)
insert into livro values (9, 'fortaleza digital', '', 86, '', 2013, 23, '22/02/2011', 320, '', 1)
insert into livro values (10, 'o pequeno principe', '', 84, '', 1930, 24, '22/02/2012', 98, '', 0)
insert into livro values (11, 'o nome da rosa', '', 81, '', 1920, 25, '22/02/2012', 460, '', 0)
insert into livro values (12, 'o alquimista', '', 82, '', 1982, 26, '22/02/2010', 460, '', 0)
insert into livro values (13, 'o conde de monte cristo', '', 84, '', 1988, 23, '22/02/2011', 420, '', 1)
insert into livro values (14, 'as minas do rei salomão', '', 84, '', 1990, 23, '22/02/2010', 300, '', 1)
insert into livro values (15, 'mar morto', '', 84, '', 1932, 26, '22/02/2012', 270, '', 1)
insert into livro values (16, 'pobre corinthiano careca', '', 85, '', 2013, 27, '22/02/2012', 190, '', 0)
insert into livro values (17, 'a estrada da noite', '', 81, '', 1820, 25, '22/02/2010', 170, '', 0)
insert into livro values (18,'Eu', '', 87, '', 2008, 28, '11/12/2013', 256, '', 1)
insert into livro values (19, 'Flor da Morte', '', 87, '', 2013, 28, '11/12/2013', 58, '', 1)
insert into livro values (20, 'Invenção de Orfeu', '', 83, '', 2007, 28, '21/12/2011', 432, '', 1)
insert into livro values (21, 'Panelinha', '', 82, '', 2014, 29, '21/12/2012', 400, '', 1)
insert into livro values (22, 'Não é sopa', '', 87, '', 2014, 29, '21/12/2013', 368, '', 1)
go
insert into livroColecao values (1, 1, '')
insert into livroColecao values (3, 1, '')
insert into livroColecao values (4, 1, '')
insert into livroColecao values (7, 2, '')
insert into livroColecao values (8, 2, '')
insert into livroColecao values (9, 2, '')
go
insert into Emprestimo values (11, '05/08/2012', '05/08/2013', '05/10/2012', 16, '')
insert into Emprestimo values (12, '05/08/2012', '05/08/2013', '22/05/2013', 7, '')
insert into Emprestimo values (13, '05/08/2012', '05/08/2013', '05/10/2012', 8, '')
insert into Emprestimo values (14, '22/09/2012', '22/09/2013', '22/01/2013', 1, '')
insert into Emprestimo values (15, '03/10/2012', '03/10/2013', '03/05/2013', 13, '')
insert into Emprestimo values (16, '06/10/2012', '05/08/2013', '05/11/2012', 16, '')
insert into Emprestimo values (17, '30/11/2012', '03/10/2013', '03/01/2013', 5, '')
insert into Emprestimo values (18, '11/12/2012', '11/12/2013', '11/02/2013', 4, '')
insert into Emprestimo values (19, '30/12/2012', '30/12/2013', '30/03/2013', 11, '')
insert into Emprestimo values (20, '22/01/2013', '22/09/2014', '30/06/2013', 9, '')
insert into Emprestimo values (21, '27/02/2013', '30/12/2014', '30/04/2013', 4, '')
insert into Emprestimo values (22, '03/07/2013', '03/10/2014', '30/09/2013', 5, '')
insert into Emprestimo values (23, '05/08/2013', '05/08/2014', '', 9, '')
insert into Emprestimo values (24, '22/09/2013', '22/09/2014', '', 18, '')
insert into Emprestimo values (25, '22/09/2013', '22/09/2014', '', 15, '')
insert into Emprestimo values (26, '03/10/2013', '03/10/2014', '', 6, '')
insert into Emprestimo values (27, '03/10/2013', '03/10/2014', '22/03/2014', 7, '')
insert into Emprestimo values (28, '03/11/2013', '03/11/2014', '20/04/2014', 4, '')
insert into Emprestimo values (29, '11/12/2013', '11/12/2014', '22/03/2014', 16, '')
insert into Emprestimo values (30, '03/11/2013', '03/11/2014', '', 1, '')
insert into Emprestimo values (31, '11/12/2013', '11/12/2014', '', 16, '')
insert into Emprestimo values (32, '11/12/2013', '11/12/2014', '', 5, '')
insert into Emprestimo values (33, '30/12/2013', '30/12/2014', '', 11, '')
insert into Emprestimo values (34, '30/12/2013', '30/12/2014', '', 2, '')
insert into Emprestimo values (35, '03/11/2013', '03/11/2014', '', 13, '')
insert into Emprestimo values (36, '03/11/2013', '03/11/2014', '', 5, '')
go
insert into livroAutor values (1,1)
insert into livroAutor values (2, 5)
insert into livroAutor values (3, 1)
insert into livroAutor values (4, 1)
insert into livroAutor values (5, 7)
insert into livroAutor values (6, 8)
insert into livroAutor values (7, 4)
insert into livroAutor values (8, 4)
insert into livroAutor values (9, 4)
insert into livroAutor values (10, 6)
insert into livroAutor values (11, 10)
insert into livroAutor values (12, 2)
insert into livroAutor values (13, 9)
insert into livroAutor values (14, 11)
insert into livroAutor values (15, 3)
insert into livroAutor values (16, 12)
insert into livroAutor values (17, 13)
go
insert into listaEspera values (91, 10, 12, '', '', '')
insert into listaEspera values (92, 10, 17, '', '', '')
insert into listaEspera values (93, 10, 7, '', '', '')
insert into listaEspera values (94, 3, 11, '', '', '')
insert into listaEspera values (95, 4, 15, '', '', '')
insert into listaEspera values (96, 12, 4, '', '', '')
go
insert into itemEmprestado values (1, 13, 11)
insert into itemEmprestado values (2, 5, 12)
insert into itemEmprestado values (3, 10, 13)
insert into itemEmprestado values (4, 4, 14)
insert into itemEmprestado values (5, 9, 15)
insert into itemEmprestado values (6, 10, 16)
insert into itemEmprestado values (7, 13, 17)
insert into itemEmprestado values (8, 7, 18)
insert into itemEmprestado values (9, 16, 19)
insert into itemEmprestado values (10, 10, 20)
insert into itemEmprestado values (11, 13, 21)
insert into itemEmprestado values (12, 8, 22)
insert into itemEmprestado values (13, 6, 23)
insert into itemEmprestado values (14, 11, 24)
insert into itemEmprestado values (15, 10, 25)
insert into itemEmprestado values (16, 4, 26)
insert into itemEmprestado values (17, 9, 27)
insert into itemEmprestado values (18, 2, 28)
insert into itemEmprestado values (19, 12, 29)
insert into itemEmprestado values (20, 7, 30)
insert into itemEmprestado values (21, 14, 31)
insert into itemEmprestado values (22, 17, 32)
insert into itemEmprestado values (23, 3, 33)
insert into itemEmprestado values (24, 8, 34)
insert into itemEmprestado values (25, 16, 35)
go
insert into Telefone values (1, 1, 61, '8765-9076')
insert into Telefone values (2, 2, 61, '3451-2289')
insert into Telefone values (3, 2, 62, '6652-3478')
insert into Telefone values (4, 3, 62, '7654-3909')
insert into Telefone values (5, 9, 61, '7766-5678')
insert into Telefone values (6, 9, 62, '3344-6658')
insert into Telefone values (7, 5, 62, '2341-1250')
insert into Telefone values (8, 6, 62, '3232-4560')
insert into Telefone values (9, 7, 63, '5546-7892')
insert into Telefone values (10, 8, 63, '3455-6671')
insert into Telefone values (11, 4, 62, '3235-6780')
insert into Telefone values (12, 10, 61, '2233-4569')
insert into Telefone values (13, 11, 61, '3214-5655')
insert into Telefone values (14, 11, 62, '2378-8819')
insert into Telefone values (15, 12, 61, '2126-6789')
insert into Telefone values (16, 12, 62, '6657-8904')
insert into Telefone values (17, 12, 63, '3445-5530')
insert into Telefone values (18, 13, 61, '2234-4556')
insert into Telefone values (19, 14, 61, '6221-4453')
insert into Telefone values (20, 14, 63, '5644-3278')
go


-- 1º)  Selecione todos os livros disponíveis
select * from Livro where Disponivel = '1'

-- 2º)  Selecione o titulo e a data de aquisição dos livros ordenados pelo titulo
select Titulo, convert(varchar, dataAquisicao, 103)[Data Aquisição] from Livro order by Titulo

-- 3º) Selecione os 10 últimos livros adquiridos classificados por data de aquisição em ordem decrescente
select top 10 * from Livro order by dataAquisicao desc

-- 4º) Selecione a quantidade de livros adquiridos no ano de 2013
select [livrosAdquiridos] = count(*) from Livro where dataAquisicao like '%2013%'
select count(dataAquisicao) [Livros Adquiridos em 2013] from Livro where year(dataAquisicao) = 2013
select count(dataAquisicao) [Livros Adquiridos em 2013] from Livro where dataAquisicao between '01/01/2013' and '31/12/2013'
select count(dataAquisicao) [Livros Adquiridos em 2013] from Livro where dataAquisicao >= '01/01/2013' and dataAquisicao <= '31/12/2013'

-- 5º) Selecione todos os livros da categoria de código 1
select Livro.Titulo, Categoria.Descrição 
from Livro inner join Categoria 
on Livro.idCategoria = Categoria.idCategoria 
where Livro.idCategoria = '21'

select * from Livro where idCategoria = 21

-- 6º) Selecione o nome e os telefones dos leitores do estado de sp
select Leitor.Nome, Telefone.Telefone 
from Leitor inner join Telefone 
on Leitor.idLeitor = Telefone.idLeitor 
where Leitor.Estado = 'SP'

-- 7º) Selecione o nomeFantasia, os títulos e subtítulos dos livros publicados pela editora Atica ordenados pelo título
select Editora.nomeFantasia, Livro.Titulo, Livro.Subtitulo 
from Editora inner join Livro 
on Editora.idEditora = Livro.idEditora 
where Editora.nomeFantasia like '%atica%'
order by Livro.Titulo

-- 8º) Selecione o nome e o sobrenome do autor e o titulo de todos os livros do autor Dan Brown
select Autor.Nome, Autor.Sobrenome, Livro.Titulo 
from Autor
inner join livroAutor on Autor.idAutor = livroAutor.idAutor
inner join Livro on livroAutor.idLivro = Livro.idLivro
where Autor.Nome = 'Dan' and Autor.Sobrenome = 'Brown'

-- 9º) Selecione a descrição da categoria e some o número de páginas de todos os livros agrupados por categoria ordenado pelo total de páginas decrescente
select Categoria.Descrição, sum(Livro.Paginas) as 'Qtdd de Paginas'
from Categoria inner join Livro on Categoria.idCategoria = Livro.idCategoria
group by Categoria. Descrição
order by 'Qtdd de Paginas' desc

select Categoria.Descrição, sum(Livro.Paginas) as 'Qtdd de Paginas'
from Categoria inner join Livro on Categoria.idCategoria = Livro.idCategoria
group by Categoria.Descrição
order by sum(Livro.Paginas) desc

select Categoria.Descrição, sum(Livro.Paginas) as 'Qtdd de Paginas'
from Categoria inner join Livro on Categoria.idCategoria = Livro.idCategoria
group by Categoria.Descrição
order by 2 desc

-- 10º) Selecione e conte quantos leitores estão aguardando o livro “O pequeno príncipe”
select count (listaEspera.idLivro)[Leitores aguardando O Pequeno Príncipe]
from listaEspera inner join Livro on listaEspera.idLivro = Livro.idLivro
where Livro.Titulo = 'o pequeno principe'

select count(idLivro) 'Leitores aguardando O Pequeno Príncipe'
from listaEspera where idLivro = (Select idLivro from Livro where Titulo = 'o pequeno principe')

-- 11º) Selecione e exiba média de páginas lidas pelos leitores
select avg(Paginas) as 'Media de paginas lidas'
from Livro inner join itemEmprestado
on Livro.idLivro = itemEmprestado.idLivro

-- 12º) Mostre a média de páginas dos livros da biblioteca
select avg(Paginas) as 'Media de paginas' from Livro

-- 13º) Mostre a quantidade de Leitores da biblioteca
select Qtdd_Leitores = count(idLeitor) from Leitor

-- 14º) Mostre o nome das coleções e os títulos dos livros das coleções]
select Colecao.nomeColecao, Livro.Titulo
from Colecao
inner join livroColecao on Colecao.idColecao = livroColecao.idColecao
inner join Livro on livroColecao.idLivro = Livro.idLivro

-- 15º) Mostre a quantidade de livros por coleção
select Colecao.nomeColecao, count(Livro.Titulo) as 'Qtdd de livros por coleção'
from Colecao
inner join livroColecao on Colecao.idColecao = livroColecao.idColecao
inner join Livro on livroColecao.idLivro = Livro.idLivro
group by Colecao.nomeColecao

-- 16º) Mostre o Título e conte a quantidade de empréstimos dos livros emprestados este mês
select Livro.Titulo, count(itemEmprestado.idLivro) as 'Livros emprestados'
from Livro 
inner join itemEmprestado on Livro.idLivro = itemEmprestado.idLivro
inner join Emprestimo on Emprestimo.idEmprestimo = itemEmprestado.idEmprest
where month(Emprestimo.dataEmprestimo) = 08 and year(Emprestimo.dataEmprestimo) = 2012
group by Livro.Titulo

-- 17º) Selecione o nome, os telefones e o tipo do telefone todos os leitores do estado de RJ e ES e tipo celular
select Leitor.Nome, Telefone.Telefone, tipoTelefone.tipoTelefone
from Leitor 
inner join Telefone on Leitor.idLeitor = Telefone.idLeitor
inner join tipoTelefone on Telefone.idLeitor = Telefone.idLeitor
where Leitor.Estado = 'RJ'

-- 18º) Selecione o título dos livros que nunca foram emprestados
select Livro.Titulo
from Livro
left join itemEmprestado on Livro.idLivro = itemEmprestado.idLivro
where itemEmprestado.idLivro is null

select Titulo from Livro where idLivro not in(select distinct idLivro from itemEmprestado)

-- 19º) Selecione o nome dos leitores que nunca realizaram empréstimos 
select Leitor.Nome
from Emprestimo
right join Leitor on Emprestimo.idLeitor = Leitor.idLeitor
where Emprestimo.idLeitor is null

select Nome from Leitor where idLeitor not in(select distinct idLeitor from Emprestimo) order by Nome

-- 20º) Selecione a descrição da categoria que nunca teve livros emprestados
select Descrição
from Categoria 
where idCategoria not in
(select distinct idCategoria from Livro inner join itemEmprestado
on Livro.idLivro = itemEmprestado.idLivro)
