use cd_rom
go

--Inserindo dados nas tabelas:
--ESTADO
INSERT INTO ESTADO VALUES ('DF', 'DISTRITO FEDERAL', 'BRASILIA')
INSERT INTO ESTADO VALUES ('SP', 'SÃO PAULO', 'SÃO PAULO')
INSERT INTO ESTADO VALUES ('RJ', 'RIO DE JANEIRO', 'RIO DE JANEIRO')
INSERT INTO ESTADO VALUES ('BA', 'BAHIA', 'SALVADOR')
INSERT INTO ESTADO VALUES ('MG', 'MINAS GERAIS', 'BELO HORIZONTE')
INSERT INTO ESTADO VALUES ('ES', 'ESPIRITO SANTO', 'VITÓRIA')
GO
--Clientes
INSERT INTO Clientes VALUES( 1, 'Nancy Davolio', '1.834.517', '895.454.191-72', '(61)2387-8803', 'Qd 11 Conjunto B Casa 10', 'Sobradinho I', 'Brasília', 1, '73000-000','nancy.d@zipmail.com.br', 'F')
INSERT INTO Clientes VALUES( 2, 'André Fonseca', '1.987.542', '984.545.919-27', '(61)2359-1221', 'Quadra 10 Conjunto A Casa 21', 'Sobradinho I','Brasília', 1, '73000-000', 'andre.fonseca@yahoo.com.br', 'M')
INSERT INTO Clientes VALUES( 3, 'Manoel Batista', '1.648.978', '325.689.785-56','(61)2485-0544','Quadra 08 Conjunto E Casa 54','Sobradinho II','Brasília',1,'73200-000','manoel@.ig.com.br', 'M')
INSERT INTO Clientes VALUES( 4, 'João da Silva', '1.887.542', '934.677.966-27', '(61)2359-1221', 'Quadra 09 Conjunto G Casa 56', 'Sobradinho II','Brasília', 1, '73200-000', 'joao.silva@gmail.com','M')
INSERT INTO Clientes VALUES( 5, 'Paulo Pereira', '11.988.254-2', '567.987.456-97', '(11)3359-1298', 'Rua XV de Novembro, 221 Apto 66', 'República','São Paulo', 2, '01100-000', 'paulopereira2306@yahoo.com.br','M')
INSERT INTO Clientes VALUES( 6, 'Luana Santana', '22.856.457', '784.632.909-98', '(11)4359-1243', 'Av. Principal, 2145', 'Centro','Guarulhos', 2, '07000-000', 'luanadocinho2207@hotmail.com','F')
INSERT INTO Clientes VALUES( 7, 'Marta Fagundes', '31.569.845-3', '344.775.779-07', '(11)3359-6521', 'Av Baruel, 110 Fundos', 'Casa Verde','São Paulo', 2, '02525-010', 'fag_marthinha@yahoo.com.br','F')
INSERT INTO Clientes VALUES( 8, 'Larissa Fontoura', '41.687.231', '654.655.659-65', '(11)2277-6363', 'Av. dos Latinos, 1054', 'Jd. Santa Therezinha','São Paulo', 2, '03930-000', 'larilari.fontoura@yahoo.com.br','F')
INSERT INTO Clientes VALUES( 9, 'Roberta Martins', '6.659.488', '874.985.943-63', '(21)2275-8357', 'Av. Vieira Souto, 2348 Apto 21B', 'Copacabana','Rio de Janeiro', 3, '21730-000', 'martins.beca.10@gmail.com.br','F')
INSERT INTO Clientes VALUES( 10,'Sandro Trevisan', '8.665.332', '234.555.765-66', '(21)3254-6012', 'Av. Brasil, 2121', 'Flamengo','Rio de Janeiro', 3, '21217-000', 'sandrotrevisan@sgicomp.com.br','M')
GO
--Vendedor
INSERT INTO Vendedor Values(1, 'Luiz Carlos Andrade Júnior', '(61)2321-5465', 'Qd 24 Conj. V Casa 24', 'Lago Sul',		'Brasília', 'DF', '78440-000', 'junior.gafanhoto@zipmail.com.br','M','06-10-1971')
INSERT INTO Vendedor Values(2, 'Eliézio Brito',				 '(62)2387-8809', 'Qd 11 Conj. B Casa 11', 'Sobradinho I',  'Brasília', 'DF', '73800-000', 'eliezio@yahoo.com.br',			 'M','27-04-1983')
INSERT INTO Vendedor Values(3, 'André Paiva', '(21)3224-2424', 'Rua CV  Conj. B Casa 11', 'Morro do Jacarezinho', 'Rio de Janeiro', 'RJ', '45811-000', 'andre@yahoo.com.br','M','25-02-1990')
INSERT INTO Vendedor Values(4, 'Flávio Oliveira'  , '(61)2322-9598', 'Qd 06 Conj. A Casa 10', 'Lago Sul', 'Brasília', 'DF', '78430-000', 'flavio.abacaxi@zipmail.com.br','M','07-12-1985')
INSERT INTO Vendedor Values(5, 'Rafael de Sousa', '(62)23775304', 'Qnm 22 Conj. I Casa 21', 'Ceilândia', 'Brasília', 'DF', '72560-000', 'rafa-gord@yahoo.com.br','M','12-10-1948')
INSERT INTO Vendedor Values(6, 'Ricas Bileu', '(21)2311-0203', 'QE 11 Área Especial L Ed Guará', 'Guará', 'Brasília', 'DF', '72000-000', 'ricas.bileu@ig.com.br','M','08-03-1950')
GO
--Produtos
INSERT INTO Produtos Values(1, 'Zezé di Camargo e Luciano'	, 20.90, 'Sertanejo')
INSERT INTO Produtos Values(2, 'S.P.C'						, 12.00, 'Pagode')
INSERT INTO Produtos Values(3, 'Alan Jackson'				, 35.90, 'Country')
INSERT INTO Produtos Values(4, 'U2'							, 35.90, 'Rock/Pop')
INSERT INTO Produtos Values(5, 'Raimundos'					, 20.90, 'Rock')
INSERT INTO Produtos Values(6, 'Amigos do Pai'				, 25.40, 'Gospel')
INSERT INTO Produtos Values(7, 'Engenheiros do Havaí'		, 35.90, 'Rock/Pop')
INSERT INTO Produtos Values(8, 'Guns n Roses'				, 25.40, 'Rock')
INSERT INTO Produtos Values(9, 'Scorpions SkarLaite'		, 10.00, 'Rock')
INSERT INTO Produtos Values(10,'Legião Urbana'				, 28.00, 'Rock/Pop')
INSERT INTO Produtos Values(11,'Rod Stewart'				, 20.90, 'Rock')
INSERT INTO Produtos Values(12,'Luan Santana'				, 25.40, 'Sertanejo')
INSERT INTO Produtos Values(13,'Parangolé'					, 15.00, 'Axé')
INSERT INTO Produtos Values(14,'Jorge Aragão'				, 20.90, 'Samba')
INSERT INTO Produtos Values(15,'Pepe e Nenem'				, 15.00, 'Pop')
INSERT INTO Produtos Values(16,'Lady Gaga'					, 20.90, 'Pop')
INSERT INTO Produtos Values(17,'Justin Bieber'				, 20.90, 'Idiota')
GO
--NF
insert into nf values ( 1,'01-08-2013 00:00:00.000',2, 2)
insert into nf values ( 2,'01-08-2013 00:00:00.000',1, 1)
insert into nf values ( 3,'02-08-2013 00:00:00.000',3,10)
insert into nf values ( 4,'02-08-2013 00:00:00.000',1, 4)
insert into nf values ( 5,'03-08-2013 00:00:00.000',5, 1)
insert into nf values ( 6,'03-08-2013 00:00:00.000',6, 3)
insert into nf values ( 7,'04-08-2013 00:00:00.000',4, 5)
insert into nf values ( 8,'04-08-2013 00:00:00.000',2, 6)
insert into nf values ( 9,'05-08-2013 00:00:00.000',2, 7)
insert into nf values (10,'05-08-2013 00:00:00.000',4, 8)
insert into nf values (11,'05-08-2013 00:00:00.000',1, 9)
insert into nf values (12,'05-08-2013 00:00:00.000',2, 1)
insert into nf values (13,'05-08-2013 00:00:00.000',3,10)
insert into nf values (14,'05-08-2013 00:00:00.000',6, 2)
insert into nf values (15,'06-08-2013 00:00:00.000',4, 1)
insert into nf values (16,'06-08-2013 00:00:00.000',4, 8)
insert into nf values (17,'06-08-2013 00:00:00.000',5, 4)
insert into nf values (18,'07-08-2013 00:00:00.000',5, 6)
insert into nf values (19,'07-08-2013 00:00:00.000',1, 5)
insert into nf values (20,'08-08-2013 00:00:00.000',1, 3)
GO


--itensNF
insert into itensnf values (6, 1,11)
insert into itensnf values (8, 2, 6)
insert into itensnf values (2, 3, 3)
insert into itensnf values (6, 4, 2)
insert into itensnf values (2, 5, 4)
insert into itensnf values (1, 6, 1)
insert into itensnf values (1, 6, 2)
insert into itensnf values (1, 6, 3)
insert into itensnf values (1, 7,11)
insert into itensnf values (2, 8, 5)
insert into itensnf values (1, 9, 5)
insert into itensnf values (1, 9, 6)
insert into itensnf values (7,10, 5)
insert into itensnf values (1,11, 1)
insert into itensnf values (1,12, 1)
insert into itensnf values (1,13, 1)
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
GO




