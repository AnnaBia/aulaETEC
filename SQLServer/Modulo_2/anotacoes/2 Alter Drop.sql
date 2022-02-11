use cd_rom
go
--Comandos de alteração de tabela
--Adicionar campo:
ALTER TABLE CLIENTES ADD GENERO VARCHAR(1)  
GO

--Excluir campo:
ALTER TABLE ITENSNF DROP COLUMN DESCONTO   
GO

--Alterar campo:
ALTER TABLE CLIENTES ALTER COLUMN ESTADO INT 
GO

--Adicionar restrição
ALTER TABLE CLIENTES ADD CHECK (GENERO='F' OR GENERO ='M') 

--Adicionar Chave Primária
ALTER TABLE ESTADO ADD PRIMARY KEY (CODIGO) 
GO

--Adicionar Chave Estrangeira
ALTER TABLE CLIENTES ADD FOREIGN KEY (ESTADO) REFERENCES ESTADO 
GO

--Adicionar valor default
ALTER TABLE VENDEDOR ADD DEFAULT 'SP' FOR ESTADO

--Excluir tabela
--Drop TABLE <nome da tabela> 
Drop table itensNF 

use master
go

--Excluir Banco de dados
--Drop DATABASE <nome do banco de dados>
Drop database cd_rom


