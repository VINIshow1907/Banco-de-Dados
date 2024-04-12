/*66.  Tendo referencia ao exercício anterior, crie uma visualização que mostre a soma total de cada pedido.*/
select sum(total)
from EX_65
group by num_pedido

select *
from pedido