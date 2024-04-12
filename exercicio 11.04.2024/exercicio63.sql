*63.crie uma View contendo os códigos e os nomes dos clientes que moram nos estados de SP ou RJ ou MS.*/
CREATE VIEW EX_63
AS
SELECT DISTINCT CODIGO_CLIENTE,NOME_CLIENTE,UF
FROM CLIENTE
WHERE UF = 'SP' OR UF= 'RJ' OR UF= 'MS'

SELECT *
FROM EX_63
