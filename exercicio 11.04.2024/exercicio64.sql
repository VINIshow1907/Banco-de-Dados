/*64.  Crie uma View que selecione todos os números dos pedidos, 
códigos dos clientes e os prazos de entrega dos vendedores que tenham o nome ‘Carlos’.*/
CREATE VIEW EX_64
AS 
SELECT DISTINCT P.NUM_PEDIDO, C.CODIGO_CLIENTE, P.PRAZO_ENTREGA
FROM CLIENTE C INNER JOIN PEDIDO P
	ON C.CODIGO_CLIENTE=P.CODIGO_CLIENTE
	INNER JOIN VENDEDOR V
	ON P.CODIGO_VENDEDOR = V.CODIGO_VENDEDOR
WHERE NOME_VENDEDOR = 'Carlos'

SELECT *
FROM EX_64