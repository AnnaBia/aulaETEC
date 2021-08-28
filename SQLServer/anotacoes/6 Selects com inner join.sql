--Juntando dados em diferentes tabelas: 
--sintaxe: 
--SELECT <CAMPOS> FROM <TABELA>
--INNER JOIN <TABELA> 
--ON <CHAVE PRIMÁRIA> = <CHAVE ESTRANGEIRA>
--Selecione todas as notas da tabela 
--nf junto com os itens da tabela itensnf 
--ordenadas pelo código da nf
SELECT * FROM  nf 
inner join itensnf --JUNTO COM
on nf.codigo = itensnf.codigo_nf --ONDE 

SELECT NF.*, ITENSNF.*, 
VENDEDOR.NOME AS NOME_VENDEDOR,
CLIENTES.NOME AS NOME_CLIENTE, 
PRODUTOS.descrição
FROM NF 
INNER JOIN ITENSNF 
ON NF.codigo = ITENSNF.codigo_nf
INNER JOIN Vendedor 
ON NF.codigo_vendedor = VENDEDOR.CODIGO
INNER JOIN Clientes
ON NF.codigo_cliente = Clientes.codigo
INNER JOIN Produtos
ON ITENSNF.codigo_produto = Produtos.CODIGO

--SELECIONE O CODIGO DA NOTA, DATA DA VENDA
--DA TABELA NF, JUNTO COM NOME DO VENDEDOR DA 
--DA TABELA VENDEDOR, JUNTO COM NOME DO CLIENTE
--DA TABELA CLIENTES, JUNTO COM DESCRIÇÃO
--DO PRODUTO DA TABELA PRODUTOS
SELECT NF.CODIGO, NF.data_venda, 
VENDEDOR.NOME AS NOME_VENDEDOR,
CLIENTES.NOME AS NOME_CLIENTE, 
PRODUTOS.descrição
FROM NF 
INNER JOIN ITENSNF  ON NF.codigo = ITENSNF.codigo_nf
INNER JOIN Vendedor ON NF.codigo_vendedor = VENDEDOR.CODIGO
INNER JOIN Clientes ON NF.codigo_cliente = Clientes.codigo
INNER JOIN Produtos ON ITENSNF.codigo_produto = Produtos.CODIGO

--Calcular o subtotal das notas de clientes do RJ e SP
SELECT NF.CODIGO, NF.data_venda, 
V.NOME AS NOME_VENDEDOR,
C.NOME AS NOME_CLIENTE, C.estado,
P.descrição, I.quantidade, P.preco_unit,
(I.quantidade * P.preco_unit) AS SUBTOTAL
FROM NF 
INNER JOIN ITENSNF AS I ON NF.codigo = I.codigo_nf
INNER JOIN Vendedor AS V ON NF.codigo_vendedor = V.CODIGO
INNER JOIN Clientes AS C ON NF.codigo_cliente = C.codigo
INNER JOIN Produtos AS P ON I.codigo_produto = P.CODIGO
WHERE C.estado IN ('SP','RJ')
--C.ESTADO = 'RJ' OR C.ESTADO = 'SP' (outra forma)

--Calcular o subtotal das notas de clientes de SP
SELECT NF.codigo, NF.data_venda, 
V.NOME AS VENDEDOR,
C.NOME AS CLIENTE, C.ESTADO, P.DESCRIÇÃO, 
P.preco_unit, ITENSNF.quantidade,
(P.preco_unit * ITENSNF.quantidade) AS SUBTOTAL 
FROM NF
INNER JOIN ITENSNF 
ON NF.codigo = ITENSNF.codigo_nf
INNER JOIN Vendedor AS V 
ON NF.codigo_vendedor = V.CODIGO
INNER JOIN Clientes AS C
ON NF.codigo_cliente = C.codigo
INNER JOIN Produtos AS P
ON ITENSNF.codigo_produto = P.CODIGO
WHERE C.estado = 'SP'

--Calculando o total de cada nota fiscal
SELECT NF.codigo, 
DATA=CONVERT(VARCHAR(10),NF.data_venda,103), --dd/mm/aaaa
V.NOME AS VENDEDOR,
C.NOME AS CLIENTE,  
Total = SUM(P.preco_unit * I.quantidade) 
FROM NF 
INNER JOIN ITENSNF AS I ON NF.codigo = I.codigo_nf
INNER JOIN Vendedor AS V ON NF.codigo_vendedor = V.CODIGO
INNER JOIN Clientes AS C ON NF.codigo_cliente = C.codigo
INNER JOIN Produtos AS P ON I.codigo_produto = P.CODIGO
group by NF.codigo, NF.data_venda, V.NOME, C.NOME 
order by TOTAL desc


--AS (Apelido)
--Selecione o código da nota, o nome do cliente, o nome do vendedor 
--e a data da venda das tabelas: nf, clientes e vendedor
SELECT NF.codigo, C.nome as cliente, V.nome as vendedor, 
convert(varchar(10), nf.data_venda, 103) as data_venda 
FROM NF INNER JOIN Clientes AS C ON C.codigo = NF.codigo_cliente
		INNER JOIN Vendedor AS V ON V.codigo = NF.codigo_vendedor

--Calcular os valores dos itens das notas fiscais
Select nf.codigo, --tabela.campo 
convert(varchar(10), nf.data_venda, 103) as data_venda, 
c.nome as cliente, 
v.nome as vendedor, 
p.descrição, 
i.quantidade, 
p.preco_unit, 
(quantidade * preco_unit) as subtotal
from nf inner join clientes as c on nf.codigo_cliente = c.codigo
		inner join itensnf  as i on nf.codigo = i.codigo_nf
		inner join produtos as p on i.codigo_produto = p.codigo
		inner join vendedor as v on nf.codigo_vendedor = v.codigo

--Calcular os valores dos itens da nota fiscal 15
Select nf.codigo, --tabela.campo 
convert(varchar(10), nf.data_venda, 103) as data_venda, 
c.nome as cliente, 
v.nome as vendedor, 
p.descrição, 
i.quantidade, 
p.preco_unit, 
(quantidade * preco_unit) as subtotal
from nf inner join clientes as c on nf.codigo_cliente = c.codigo
		inner join itensnf  as i on nf.codigo = i.codigo_nf
		inner join produtos as p on i.codigo_produto = p.codigo
		inner join vendedor as v on nf.codigo_vendedor = v.codigo
where nf.codigo = 15


--Totalizar as NF
SELECT nf.codigo, 
convert(varchar(10), nf.data_venda, 103) as data_venda, 
c.nome as cliente, v.nome as vendedor,
sum(i.quantidade * p.preco_unit) as Total_NF
FROM nf inner join itensnf  as i on nf.codigo = i.codigo_nf 
		inner join clientes as c on nf.codigo_cliente = c.codigo
		inner join vendedor as v on nf.codigo_vendedor = v.codigo
		inner join produtos as p on i.codigo_produto = p.codigo
group by nf.codigo, data_venda, c.nome, v.nome 
order by total_nf desc


--Totalizar as vendas por dia
Select  convert(varchar(10),data_venda,103) as 'Data da Venda',
	    sum(i.quantidade * p.preco_unit) as Total_NF
  from  nf 
inner join itensnf as i on nf.codigo = i.codigo_nf
inner join produtos as p on p.codigo = i.codigo_produto
group by data_venda

-- Selecionar os 5 CDs mais vendido
Select top 5 
	p.descrição, sum (i.quantidade) as quantidade
  from produtos as p 
inner join itensnf as i on p.codigo = i.codigo_produto
 group by p.descrição, quantidade
 order by quantidade desc

select sum(quantidade) as quantidade, codigo_produto 
from itensnf group by codigo_produto order by quantidade desc

--Melhores 3 vendedores
select top 3 sum(itensnf.quantidade * produtos.preco_unit) as vendas,
vendedor.nome
from itensnf 
inner join produtos on itensnf.codigo_produto = produtos.codigo
inner join nf on nf.codigo = itensnf.codigo_nf
inner join vendedor  on vendedor.codigo = nf.codigo_vendedor
group by vendedor.nome 
order by vendas desc

SELECT top 3 
v.nome as vendedor,
sum(i.quantidade * p.preco_unit) as Total_NF
FROM nf inner join itensnf as i on nf.codigo = i.codigo_nf 
		inner join vendedor as v on nf.codigo_vendedor = v.codigo
		inner join produtos as p on i.codigo_produto = p.codigo
group by v.nome 
order by total_nf desc

--Melhores 5 cliente
SELECT --top 5 
c.nome as cliente,
sum(i.quantidade * p.preco_unit) as Total_por_Cliente
FROM nf inner join itensnf as i on nf.codigo = i.codigo_nf 
		inner join clientes as c on nf.codigo_cliente = c.codigo
		inner join produtos as p on i.codigo_produto = p.codigo
group by c.nome--, c.estado 
order by total_por_Cliente desc

--Vendas por estado
SELECT c.estado,
sum(i.quantidade * p.preco_unit) as Total_por_Estado
FROM nf inner join itensnf  as i on nf.codigo = i.codigo_nf 
		inner join clientes as c on nf.codigo_cliente = c.codigo
		inner join produtos as p on i.codigo_produto = p.codigo
group by c.estado 
order by total_por_Estado desc

--Contando cds com preços iguais
SELECT COUNT(Preco_Unit)as Qtde, Preco_Unit 
  FROM Produtos
group by Preco_Unit
ORDER BY Preco_Unit

--Inner join implícito (juntar tabelas 
--sem a cláusula inner join)
--Os dois comandos a seguir produzem
-- o mesmo resultado:
SELECT  NF.codigo, C.nome, V.nome
  FROM  NF 
  INNER JOIN Clientes AS C ON C.codigo = NF.codigo_cliente
  INNER JOIN Vendedor AS V ON V.codigo = NF.codigo_vendedor
  WHERE C.ESTADO = 'SP'
		
SELECT NF.CODIGO, CLIENTE.NOME, VENDEDOR.NOME
FROM NF, CLIENTES, VENDEDOR
WHERE NF.CODIGO_CLIENTE = CLIENTE.CODIGO
AND NF.CODIGO_VENDEDOR = VENDEDOR.CODIGO
AND CLIENTES.ESTADO = 'SP'
		

-- Inner Join implícito
SELECT  NF.codigo, C.nome as cliente, 
		V.nome as vendedor, 
		convert(varchar(10), nf.data_venda, 103)
		as data_venda,
		SUM(i.quantidade * p.preco_unit) as Total 
  FROM  NF, Clientes AS C, Vendedor as V,
		ItensNF as I, Produtos as p 
 WHERE  C.codigo = NF.codigo_cliente 
   AND  V.codigo = NF.codigo_vendedor
   AND  I.codigo_nf = nF.codigo
   AND  P.codigo = I.codigo_produto
GROUP BY NF.codigo, C.nome, V.nome, data_venda
having SUM(i.quantidade * p.preco_unit) >= 100
order by data_venda

 
--SubSelect 
--Selecionar os produtos que não possuem vendas
SELECT * 
  FROM produtos 
 WHERE CODIGO NOT IN 
(SELECT DISTINCT codigo_PRODUTO FROM ITENSNF)

SELECT PRODUTOS.*, SUM(QUANTIDADE) AS VENDIDO 
FROM Produtos 
LEFT JOIN ItensNF AS I ON PRODUTO.codigo = I.codigo_produto
GROUP BY P.codigo, descrição, categoria, PRECO_UNIT
HAVING SUM(QUANTIDADE) IS NULL

--Selecionar os produtos que possuem 
--preço unitário maior ou igual a média
SELECT * 
  FROM produtos
 WHERE preco_unit >= 
(SELECT AVG(Preco_Unit) FROM Produtos)

--Selecionar os produtos que possuem o 
--preço unitário igual ao menor preço
SELECT * 
  FROM produtos
 WHERE preco_unit = 
(SELECT MIN(Preco_Unit) FROM Produtos)

--Selecionar os produtos que possuem o preço unitário 
--igual ao maior preço
SELECT * 
  FROM produtos
 WHERE preco_unit = 
(SELECT MAX(Preco_Unit)as 'Preço Médio'  FROM Produtos)


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
Select descrição, 'Classificação'=
case
	when categoria = 'rock' or categoria = 'rock/pop' then 'legal'
	when categoria = 'pop' then 'médio'
	else 'chato'
end
from produtos




