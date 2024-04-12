/*70.  Mostre os códigos e descrições dos produtos e a soma da quantidade pedida agrupado pelo código e descrição do produto.*/
create view ex_70
as
select p.codigo_produto, p.descricao_produto, sum(i.quantidade) as soma_quantidade
from produto p inner join item_do_pedido i
on p.codigo_produto = i.codigo_produto
group by p.codigo_produto, p.descricao_produto
order by p.descricao_produto
 
select  * from ex_70