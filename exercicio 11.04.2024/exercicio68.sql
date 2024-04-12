/*68.  De acordo com a visualização anterior crie outra visualização que mostre o total vendido por cada vendedor.*/
create view EX_68
as
select nome_vendedor, sum(num_pedido)
from EX_67
group by nome_vendedor
 
select * from ex_68