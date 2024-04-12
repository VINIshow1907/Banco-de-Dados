/*1.Selecione os campos nome do cliente, endereço e estado de todos os clientes.*/
SELECT NOME_CLIENTE, ENDERECO, UF
FROM CLIENTE

/*2.Liste todos os vendedores.*/
SELECT *
FROM VENDEDOR

/*3.Liste os campos código do produto equantidade da tabela Item do Pedido.*/
SELECT CODIGO_PRODUTO, QUANTIDADE 
FROM ITEM_DO_PEDIDO

/*4.Liste o campo “código do cliente” da tabela pedidos e elimine as linhas duplicadas.*/
SELECT DISTINCT CODIGO_CLIENTE 
FROM PEDIDO

/*5.Selecione os campos código do produto, descrição do produto e valor unitário e altere a 
linha de cabeçalho dos campos selecionados.*/
SELECT CODIGO_PRODUTO AS "CÓDIGO DO PRODUTO", 
       DESCRICAO_PRODUTO AS "DESCRIÇÃO DO PRODUTO",
       VAL_UNIT AS "VALOR UNITÁRIO"
FROM PRODUTO

/*6.Faça uma consulta que mostre o nome do cliente e estado e altere a linha de cabeçalho dos 
campos selecionados.*/
SELECT NOME_CLIENTE AS "NOME CLIENTE",
       UF AS "ESTADO"
FROM CLIENTE 

/*7.Quais são as cidades que a empresa possui clientes?*/
SELECT CIDADE
FROM CLIENTE 

/*8.Liste da tabela produto o campo Descrição e faça o produto(multiplicação)do campo valor 
unitário por 1,3.*/
SELECT DESCRICAO_PRODUTO, VAL_UNIT * 1.3 AS "PRODUTO VALOR UNITÁRIO"
FROM PRODUTO

/*9.Elabore uma consulta que mostre o código do cliente e mostre o prazo de entrega prorrogado por 
mais 3 dias da tabela pedido.*/
SELECT CODIGO_CLIENTE, PRAZO_ENTREGA + 3
FROM PEDIDO

/*10.Liste o nome do vendedor e faixa de comissão dos vendedores que possuem o salário fixo maior do 
que R$ 4.000,00.*/
SELECT NOME_VENDEDOR, FAIXA_COMISSAO
FROM VENDEDOR 
WHERE SALARIO_FIXO > 4000

/*11.Selecione os produtos cuja unidade do produto seja igual a kg.*/
SELECT *
FROM PRODUTO 
WHERE UNIDADE = 'Kg'

/*12.Faça uma consulta que mostre o nome do cliente e a cidade quando o estado for igual a SP ou 
cidade igual a Londrina da tabela cliente.*/
SELECT NOME_CLIENTE, CIDADE 
FROM CLIENTE 
WHERE UF = 'SP' OR
      CIDADE = 'Londrina'

/*13.Elabore uma consulta que mostre o número do pedido e o prazo de entrega dos pedidos que tiverem o 
código do cliente igual a 720 e o código do vendedor igual a 101.*/
SELECT NUM_PEDIDO, PRAZO_ENTREGA
FROM PEDIDO
WHERE CODIGO_CLIENTE = 720 AND
      CODIGO_VENDEDOR = 101
					  
/*14.Selecione da tabela item do pedido o campo número do pedido quando a quantidade pedida for maior 
igual a 30 e elimine as linhas duplicadas.*/
SELECT NUM_PEDIDO 
FROM ITEM_DO_PEDIDO 
WHERE QUANTIDADE = 30 

/*15.Liste todos os vendedores, exceto os que possuem a faixa de comissão igual a ‘C’.*/			  
SELECT *
FROM VENDEDOR 
WHERE FAIXA_COMISSAO != 'C'		

/*16.Liste as descrições de todos os produtos, exceto os que possuem a unidade o produto igual a ‘M’.*/
SELECT DESCRICAO_PRODUTO
FROM PRODUTO 
WHERE UNIDADE != 'M'	

/*17.Crie uma consulta que mostre os nomes dos vendedores que possuem o Salário Fixo na faixa de R$ 1.000,00 
até R$ 3.000,00.*/
SELECT NOME_VENDEDOR 
FROM VENDEDOR 
WHERE SALARIO_FIXO BETWEEN 1000 AND 3000

/*18.Selecione os campos número do pedido e prazo de entrega de todos os pedidos que possuem o prazo de entrega 
entre 15 a 25 dias.*/
SELECT NUM_PEDIDO, PRAZO_ENTREGA
FROM PEDIDO 
WHERE PRAZO_ENTREGA BETWEEN 15 AND 25

/*19.Localizem os registros de vendedores que NÃO comecem com a letra ‘J’.*/
SELECT *
FROM VENDEDOR 
WHERE NOME_VENDEDOR NOT LIKE 'J%'

/*20.Localizem os registros de clientes cujos nomes contenham as letras ‘io’.*/
SELECT *
FROM CLIENTE 
WHERE NOME_CLIENTE LIKE '%io%'

/*21.Selecionem os nomes dos clientes que comecem com letra ‘A’ até a letra ‘F’.*/
SELECT NOME_CLIENTE 
FROM CLIENTE 
WHERE NOME_CLIENTE BETWEEN 'A%' AND 'F%'

/*22.Mostre a descrição dos produtos quando a unidade do produto não seja igual a ‘M’ e ‘Kg’.*/
SELECT DESCRICAO_PRODUTO
FROM PRODUTO 
WHERE UNIDADE != 'M' AND UNIDADE != 'Kg'

/*23.Selecionem os vendedores que não possuem a faixa de comissão.*/
SELECT *
FROM VENDEDOR 
WHERE FAIXA_COMISSAO IS NULL

/*24.Listem os clientes que possuem a Inscrição Estadual (ie), ou seja, Inscrição Estadual não nula.*/
SELECT * 
FROM CLIENTE 
WHERE IE IS NOT NULL

/*25.Crie uma consulta que exiba os clientes ordenados pelo nome do cliente.*/
SELECT *
FROM CLIENTE
ORDER BY NOME_CLIENTE

/*26.Faça uma consulta que mostre nome do vendedor e o salário fixo dos vendedores ordenados pelo nome do 
vendedor.*/
SELECT NOME_VENDEDOR, SALARIO_FIXO 
FROM VENDEDOR 
ORDER BY NOME_VENDEDOR

/*27. Mostre o nome e o endereço dos clientes do estado de SP ordenados pelo código do cliente. */
SELECT NOME_CLIENTE, ENDERECO, CODIGO_CLIENTE
FROM CLIENTE 
WHERE UF = 'SP'
ORDER BY CODIGO_CLIENTE

/*28. Selecione o número do pedido dos pedidos que possuem o prazo de entrega igual a 20 dias
classificado em ordem decrescente pelo número do pedido.*/
SELECT NUM_PEDIDO 
FROM PEDIDO 
WHERE PRAZO_ENTREGA = 20
ORDER BY NUM_PEDIDO DESC

/*29. Listem as faixas de comissões, os nomes e os códigos dos vendedores ordenados pela faixa de
comissão e pelo nome do vendedor.*/
SELECT FAIXA_COMISSAO, NOME_VENDEDOR, CODIGO_VENDEDOR
FROM VENDEDOR 
ORDER BY FAIXA_COMISSAO, NOME_VENDEDOR

/*30. Realize uma consulta que exiba os estados e os nomes dos clientes que comecem com a letra ‘P’
até a letra ‘Z’, classificados por estado e nome.*/
SELECT UF, NOME_CLIENTE
FROM CLIENTE 
WHERE NOME_CLIENTE  BETWEEN 'P%' AND 'Z%'
ORDER BY UF, NOME_CLIENTE

/*31. Mostre o produto que possui o menor e o maior preço.*/
SELECT MAX (VAL_UNIT) AS "MAIOR",
       MIN (VAL_UNIT) AS "MENOR" 
FROM PRODUTO

/*32. Façam a média e a soma do salário fixo dos vendedores*/
SELECT AVG (SALARIO_FIXO) AS "MEDIA", 
       SUM (SALARIO_FIXO) AS "SOMA"
FROM VENDEDOR

/*33. Encontre a quantidade de clientes que não possuem a Inscrição Estadual nula.*/
SELECT COUNT (*) AS "QUANTIDADE TOTAL"
FROM CLIENTE  
WHERE IE IS NULL

/*34. Exiba o maior valor e a soma do salário fixo dos vendedores que possuem a faixa de comissão
‘A’.*/
SELECT MAX (SALARIO_FIXO) AS "MAIOR VALOR", 
       SUM (SALARIO_FIXO) AS "SOMA_SALARIO"
FROM VENDEDOR 
WHERE FAIXA_COMISSAO = 'A'

/*35. Mostre a quantidade total pedida, para o produto ‘papel’ de código ‘77’ na tabela item do
pedido.*/
SELECT SUM (QUANTIDADE) AS "SOMA"
FROM ITEM_DO_PEDIDO 
WHERE CODIGO_PRODUTO = 77

/*36. Quantos produtos possuem um valor unitário menor do que R$ 2,00?*/
SELECT COUNT (*) AS "VALOR MENOR"
FROM PRODUTO 
WHERE VAL_UNIT < 2

/*37. Liste a quantidade clientes que cada estado contém.*/
SELECT COUNT (*) AS "QUANTIDADE CLIENTES POR ESTADO", 
       UF
FROM CLIENTE
GROUP BY UF

/*38. Exiba a quantidade de vendedores e a soma do salário fixo agrupados pela faixa de comissão.*/
SELECT FAIXA_COMISSAO,
       COUNT(*) AS "QUANTIDADE DE VENDEDORES", 
       SUM(SALARIO_FIXO) AS "SOMA SALARIO"
FROM VENDEDOR 
GROUP BY FAIXA_COMISSAO

/*39. Mostre a soma do valor unitário da tabela produto, por unidade (agrupados por unidade).*/
SELECT UNIDADE,
       SUM(VAL_UNIT) AS "SOMA VALOR UNITÁRIO"
FROM PRODUTO
GROUP BY UNIDADE

/*40. Liste a quantidade de pedidos que tem o prazo de entrega maior que 7, agrupados pelo código
do vendedor.*/
SELECT CODIGO_VENDEDOR,
       COUNT(*) AS "QUANTIDADES DE PEDIDOS"
FROM PEDIDO 
WHERE PRAZO_ENTREGA > 7
GROUP BY CODIGO_VENDEDOR

/*41. Exiba a quantidade de clientes que cada estado contém, exceto os clientes do estado de SP.*/
SELECT UF,
       COUNT(*) AS "QUANTIDADE DE CLIENTES"
FROM CLIENTE 
WHERE UF != 'SP'
GROUP BY UF

/*42. Selecione os números dos pedidos que têm mais do que 3 produtos comprados (pedidos) na
tabela item do pedido.*/
SELECT P.NUM_PEDIDO
FROM PEDIDO P INNER JOIN ITEM_DO_PEDIDO I ON P.NUM_PEDIDO = I.NUM_PEDIDO 
WHERE I.QUANTIDADE > 3

/*43. Liste da tabela item do pedido os códigos dos produtos que tiveram mais do que 50 quantidade
pedidas, ou seja, a soma das quantidades maior do que 50.*/
SELECT CODIGO_PRODUTO, SUM(QUANTIDADE) AS "SOMA DAS QUANTIDADES"
FROM ITEM_DO_PEDIDO
GROUP BY CODIGO_PRODUTO 
HAVING SUM(QUANTIDADE) > 50

/*44. Mostre as unidades dos produtos cuja média do valor unitário agrupados pela unidade seja
menor que R$ 1,50.*/
SELECT UNIDADE, AVG(VAL_UNIT) AS "MEDIA VALOR"
FROM PRODUTO 
GROUP BY UNIDADE 
HAVING AVG(VAL_UNIT)<1.5

/*45. Selecione o nome e a cidade dos clientes que possui o pedido com o prazo de entrega superiores
a 25 dias.*/
SELECT C.NOME_CLIENTE, C.CIDADE
FROM CLIENTE C INNER JOIN PEDIDO P ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE 
WHERE P.prazo_entrega > 25

/*46. Apresente a descrição, a unidade e a quantidade dos produtos pedidos que possuem a
quantidade maior do que 40.*/
SELECT P.DESCRICAO_PRODUTO, P.UNIDADE, I.quantidade
FROM PRODUTO P INNER JOIN ITEM_DO_PEDIDO I ON P.CODIGO_PRODUTO = I.CODIGO_PRODUTO 
WHERE I.quantidade > 40

/*47. Encontre os nomes dos clientes atendidos pelo vendedor João que recebe R$ 2.650,00.*/
SELECT C.NOME_CLIENTE 
FROM CLIENTE C 
INNER JOIN PEDIDO P ON C.CODIGO_CLIENTE = P.CODIGO_CLIENTE 
INNER JOIN VENDEDOR V ON P.CODIGO_VENDEDOR = V.CODIGO_VENDEDOR 
WHERE V.nome_vendedor = 'João' AND V.salario_fixo = 2650

/*48. Exiba os nomes dos vendedores que atenderam a Cliente Ana.*/
SELECT V.NOME_VENDEDOR  
FROM VENDEDOR V 
INNER JOIN PEDIDO P ON V.CODIGO_VENDEDOR = P.CODIGO_VENDEDOR
INNER JOIN CLIENTE C ON P.CODIGO_CLIENTE = C.codigo_cliente 
WHERE C.codigo_cliente = 720

/*49. Mostre os vendedores (ordenados) que emitiram pedidos com prazos de entrega superiores a 15
dias e tenham salários fixos iguais ou superiores a R$ 1.000,00.*/
SELECT V.NOME_VENDEDOR 
FROM VENDEDOR V 
INNER JOIN PEDIDO P ON V.CODIGO_VENDEDOR = P.CODIGO_VENDEDOR 
WHERE P.PRAZO_ENTREGA > 20 AND V.SALARIO_FIXO >= 1000 
ORDER BY V.NOME_VENDEDOR

/*50. Quais clientes tem prazo de entrega superior a 15 dias e pertencem aos estados de São Paulo
(‘SP’) ou Rio de Janeiro (‘RJ’)?*/
SELECT C.*
FROM CLIENTE C 
INNER JOIN PEDIDO P ON C.codigo_cliente = P.codigo_cliente 
WHERE P.prazo_entrega > 15 AND (C.uf = 'SP' OR C.uf = 'RJ')
