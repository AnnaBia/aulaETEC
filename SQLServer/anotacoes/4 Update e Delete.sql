--Comandos para alterar registros dentro de uma tabela

--update <tabela> set <campo>=<novo valor> where <campo> = <valor>
UPDATE CLIENTES SET GENERO = 'F' WHERE CODIGO =7 
--Caso deixe de informar a condição (where) todos os registros da tabela são alterados.

--Se houver mais de um campo para atualizar:
UPDATE VENDEDOR SET 
TELEFONE = '(11)3966-0708',
ENDEERECO = 'Rua Nova Granada, 35',
BAIRRO = 'Casa Verde',
CIDADE = 'São Paulo',
CEP = '02510-010',
ESTADO = 'SP'
WHERE nome = 'Rafael de Sousa'

--Comandos para apagar registros em uma tabela
--Delete from <tabela> where <campo>=<valor>

DELETE FROM CLIENTES WHERE CODIGO = 10 
--Caso deixe de informar a condição (where) todos os registros da tabela são apagados.