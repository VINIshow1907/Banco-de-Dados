/* Crie um procedimento que mostre a soma da quantidade total de produtos pedidos*/
CREATE PROCEDURE EXEMPLO1
AS
select SUM(QUANTIDADE) AS "TOTAL DE PEDIDOS"
from item_do_pedido

EXECUTE EXEMPLO1;

/* Dsenvolva um procedimento que retorne os pedidos que um determinado vendedor participou*/
CREATE PROCEDURE EXEMPLO02
@CODIGO INT
AS
select num_pedido
from pedido
where codigo_vendedor = @CODIGO

EXECUTE EXEMPLO02 


/*Desenvolva um procedimento que retorne os pedidos que um determinado vendedor participou e que o prazo entrega
seja igual ao valor passado por parâmetro.*/
create procedure exemplo3
@CODIGO1 int, @CODIGO2 int
as
SELECT num_pedido, prazo_entrega
FROM pedido
where codigo_vendedor = @CODIGO1 AND prazo_entrega = @CODIGO2

execute exemplo3 101, 20

/*Crie um procedimento que retorne todos os códigos, nomes e unidades dos produtos cadastrados
em que o valor unitário seja menor ao valor passado por parâmetro*/
CREATE PROCEDURE EXEMPLO4
@VALOR NUMERIC (10, 2)
AS
SELECT CODIGO_PRODUTO,DESCRICAO_PRODUTO, UNIDADE, VAL_UNIT 
FROM PRODUTO
WHERE VAL_UNIT < @VALOR

EXECUTE EXEMPLO4 0.30

/*Desenvolva um procedimento que retorne a soma de uma venda 
de um determinado pedido*/
CREATE PROCEDURE EXEMPLO5
@SOMAVENDA INT
AS
select PE.NUM_PEDIDO, SUM(I.QUANTIDADE * P.VAL_UNIT) AS "SOMA DA VENDA"  
from PRODUTO P INNER JOIN ITEM_DO_PEDIDO I ON P.CODIGO_PRODUTO = I.CODIGO_PRODUTO 
INNER  JOIN PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.NUM_PEDIDO = @SOMAVENDA
GROUP BY PE.NUM_PEDIDO

EXECUTE EXEMPLO5 91

/* Desenvolva um procedimento que mostre descrição do produto, a 
quantidade de produtos vendidos, o Preço Unitário e o total (quantidade*Preço Unitário) de um determinado Pedido.*/
CREATE PROCEDURE EXEMPLO6
@SOMA INT
AS
SELECT P.DESCRICAO_PRODUTO, I.QUANTIDADE, P.VAL_UNIT, SUM (I.QUANTIDADE * P.VAL_UNIT) AS "TOTAL"
FROM PRODUTO P INNER JOIN ITEM_DO_PEDIDO I ON P.CODIGO_PRODUTO = I.CODIGO_PRODUTO 
INNER  JOIN PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.NUM_PEDIDO = @SOMA
GROUP BY P.DESCRICAO_PRODUTO, I.QUANTIDADE, P.VAL_UNIT

EXECUTE EXEMPLO6 91

/* Faça um procedimento que retorne a soma total dos pedidos de cada vendedor.*/
create procedure exemplo7
@codigo_vendedor int
as
select v.nome_vendedor, v.codigo_vendedor, sum(ie.quantidade * pr.val_unit) as "Soma dos pedidos" 
from  vendedor v inner join pedido pe  on v.codigo_vendedor = pe.codigo_vendedor
inner join item_do_pedido ie on pe.num_pedido = ie.num_pedido inner join produto pr
on ie.codigo_produto = pr.codigo_produto
where v.codigo_vendedor = @codigo_vendedor
group by v.codigo_vendedor, v.nome_vendedor

execute exemplo7 111


/* Faça um procedimento que retorne o código e o nome dos clientes, cujo código do vendedor, o estado que reside
o cliente e o prazo de entrega do pedido seja passado por parâmetro.
        Sugestão de Parâmetros: código do vendedor - 101,
		estado - RJ e prazo entrega - 20*/

create procedure exemplo8
@codigo_vendedor int,
@estado char(2),
@prazo_entrega smallint
as
select c.nome_cliente, c.codigo_cliente, p.codigo_vendedor,c.uf, p.prazo_entrega 
from cliente c inner join pedido p on c.codigo_cliente = p.codigo_cliente
where p.codigo_vendedor = @codigo_vendedor and c.uf = @estado and p.prazo_entrega = @prazo_entrega


execute exemplo8 101, rj, 20