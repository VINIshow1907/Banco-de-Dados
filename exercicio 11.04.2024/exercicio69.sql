/*69.  Com base na visualização anterior crie uma consulta que mostre o nome do vendedor, o Salário Fixo, Salário Total 
que é a soma Salário fixo + 5% do total de produto vendidos {Salário Fixo+(Total*0.05)} . Obs: elimine as linhas duplicadas.*/
create view ex_69
as
select distinct nome_vendedor, salario_fixo, salario_fixo + sum (total*0.05) as soma_salario
from ex_67
group by nome_vendedor,salario_fixo 

select * from ex_69