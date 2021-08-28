
--Comando SELECT FROM(Selecionar De)
--Estrutura básica: Select <campos> from <tabela> 

--Selecionar todos os campos das tabelas:
SELECT * FROM Clientes
SELECT * FROM Vendedor
SELECT * FROM Produtos
SELECT * FROM NF
SELECT * FROM ItensNF
SELECT * FROM Estado

--Cláusula WHERE (Onde)
--Selecionar todos os campos da tabela Clientes onde o estado 
--for igual a DF
--Quando for especificar campos do tipo texto, 
--utilizar aspas simples
SELECT * 
FROM Clientes 
WHERE Estado = 'DF'

--Operador Like (como), utilizado em substituição ao "=" 
--quando quiser citar parte do campo
--Utilizar o símbolo de % para completar a palavra. 
--Pode ser utilizado no início ou fim da condição
--Selecionar todos os campos da tabela Clientes onde a cidade 
--começar com Rio ou São
SELECT * FROM Clientes WHERE Cidade like 'Rio %' or Cidade like 'São %'

--Operador != (Diferente)
--Selecionar todos os campos da Tabela Vendedores 
--onde o estado for diferente de DF
SELECT * FROM Vendedor WHERE Estado != 'DF'

--Escolhendo os campos:
--Selecionar os campos nome, cidade, estado e cep da 
--tabela Vendedor onde estado = 'DF'
SELECT nome, cidade, estado, cep 
FROM Vendedor 
--WHERE Estado = 'DF'



--Cláusula ORDER BY (Ordenado por)
--Selecionar todos os campos da tabela Clientes 
--ordenados pelo campo nome
SELECT * FROM Clientes ORDER BY nome 

--Operador >= (Maior igual a)
--Selecionar todos os campos da tabela Clientes onde o nome 
--for maior ou igual a m
SELECT * 
FROM alunos 
WHERE nome >= 'Leticia' and curso = 'DS' and turma='2 modulo'

--Selecionar todos os campos da tabela Clientes onde o nome 
--for maior ou igual a mo, ordenados pelo campo nome descendente
SELECT * 
FROM Clientes 
WHERE nome >= 'mo' 
ORDER BY nome DESC
--pode ter mais de um campo de ordenação
SELECT * 
FROM Clientes 
WHERE nome >= 'm' and cidade>='M'
ORDER BY estado , cidade , BAIRRO 
-- DESC ordena descendente
SELECT * 
FROM Clientes 
ORDER BY estado desc, cidade desc, BAIRRO desc


--Alias AS = COMO
SELECT NOME AS 'NOME DO CLIENTE', Telefone as 'Telefone do cliente'
  FROM CLIENTES 
ORDER BY 'NOME DO CLIENTE'


--Função de Agregação Count (Contar)
--Cláusula Group By (Agrupado por)
--Exiba a quantidade de vendedores da tabela vendedores agrupados por estado
select estado, count(*) as qtde_vendedores from vendedor group by estado

--CONTAR
SELECT COUNT(*) AS QTDE_VENDEDORES FROM VENDEDOR
SELECT COUNT(*) AS QTDE_CLIENTES FROM CLIENTES

SELECT ESTADO, CIDADE, COUNT(*)AS QTDE_DE_VENDEDORES
FROM VENDEDOR
GROUP BY ESTADO, CIDADE
ORDER BY estado, CIDADE DESC

SELECT ESTADO, COUNT (*) 
AS QTDE_DE_VENDEDORES
FROM Vendedor	
GROUP BY Estado

--SELECIONA A QUANTIDADE DE CLIENTES POR ESTADO
SELECT ESTADO, CIDADE, BAIRRO, COUNT (*) AS QTDE_DE_CLIENTES
FROM Clientes	
GROUP BY Estado, cidade, BAIRRO
ORDER BY estado, cidade, BAIRRO

--SELECIONA O PREÇO MÁXIMO
SELECT MAX(PRECO_UNIT) AS PRECO_MAXIMO FROM PRODUTOS

--SELECIONA O PREÇO MÍNIMO
SELECT MIN(PRECO_UNIT) AS PRECO_MINIMO FROM PRODUTOS

--SELECIONA O PREÇO MÉDIO
SELECT AVG(PRECO_UNIT) AS PRECO_MEDIO FROM PRODUTOS

--SOMA OS PREÇOS
SELECT SUM(PRECO_UNIT) AS SOMA FROM PRODUTOS

--SELECIONAR O PREÇO MÁXIMO, MÍNIMO E MÉDIO 
--E CONTAR AGRUPADOS POR CATEGORIA DE PRODUTO
SELECT CATEGORIA, 
MAX(PRECO_UNIT) AS PRECO_MAXIMO,
MIN(PRECO_UNIT) AS PRECO_MINIMO,
AVG(PRECO_UNIT) AS PRECO_MEDIO,
COUNT(CATEGORIA) AS QTDE
FROM Produtos
GROUP BY CATEGORIA


--Exiba a quantidade de vendedores e o estado da tabela vendedores
-- agrupado por estado
SELECT COUNT (codigo) as qtde, estado 
FROM Vendedor 
GROUP BY Estado

-- Selecionar os 5 produtos mais caros
Select top 100 preco_unit, descrição 
  from produtos as p 
 order by preco_unit desc

--Contando cds 
 SELECT COUNT(codigo)as Qtde_de_cds FROM Produtos
 
--Contando cds por categoria
SELECT Qtde_por_categoria=COUNT(codigo), Categoria 
  FROM Produtos
group by Categoria
ORDER BY Categoria

--Selecionar os produtos que possuem 
--preço unitário maior que R$ 10,00
SELECT * 
  FROM produtos
 WHERE preco_unit >= 10

--Utilização de Case
--Criar uma faixa de preços baseada no preço do produto
SELECT   Codigo, Descrição, Categoria, 
  CASE 
   WHEN Preco_Unit <= 20 THEN ' 0,00 a 20,00'
   WHEN Preco_Unit <= 30 THEN '20,00 a 30,00'
   Else 'Acima de 30,00'
  END  AS  'Faixa de Preço'  
FROM Produtos
ORDER BY 'Faixa de Preço' 

--Criar uma classificação baseada na categoria do produto
Select descrição, classificacao=
case 
	when categoria = 'rock' or categoria = 'rock/pop' then 'legal'
	when categoria = 'pop' then 'médio'
	else 'chato'
end 
from produtos




