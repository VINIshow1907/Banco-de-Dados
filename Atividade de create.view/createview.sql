--1 Crie uma view para selecionar todos os dados do Nível, Cargo, Cliente e Região.
Create view ex_1
As
Select C.*, N.*, CE.regiao, CA.area, CA.cod_area, CA.quadro, CA.bonus, CA.contratacao
from nivel N full join cargo CA on N.cod_nivel = CA.cod_nivel full join cliente C  
	 on CA.cod_cargo = C.cod_cargo_responsavel inner join cep CE on C.cep = CE.cep

--2 Elabora uma view que mostre a quantidade de clientes em cada Região
create view ex_2
as 
select COUNT(C.cod_cliente) as 'Quantidade cliente por região', CE.regiao 
from cliente C inner join cep CE on C.cep = CE.cep
group by CE.regiao

select * from ex_2

--3 Elabora uma view que mostre a soma do salário base, benefícios, vt, vre de impostos por nível.
create view ex_3
as 
select SUM(F.salario_base + F.beneficios + F.vt + F.vr + F.impostos) as 'SOMA', N.descricao_nivel
from nivel N inner join cargo C on N.cod_nivel = C.cod_nivel inner join funcionario F on C.cod_cargo = F.cod_cargo
group by N.descricao_nivel

select * from ex_3
--4 Elabora uma view que mostre a quantidade de Funcionáriospara cada: a.Estado
-- a.Estado 
create view ex_4A
as 
select COUNT(F.cod_rh) as 'Quantidade de funcionais de estado ', C.estado
from funcionario F inner join cep C on F.cep = C.cep 
group by C.estado

select * from ex_4A

 
--b.Contratação
create view ex_4B
as 
select COUNT(F.cod_rh) as 'Quantidade funcionais por contratação', CA.contratacao
from funcionario F inner join cargo CA on F.cod_cargo = CA.cod_cargo 
group by CA.contratacao

select * from ex_4B
 

 --5 Elaborar uma view que mostre a quantidade de Clientes para cada: 
 -- REGIÃO 
create view ex_5A
as 
select COUNT(C.cod_cliente) as 'Quantidade cliente por região', CE.regiao 
from cliente C inner join cep CE on C.cep = CE.cep
group by CE.regiao

select * from ex_5A

 -- AREA 
create view ex_5B
as 
select COUNT(C.cod_cliente) as 'Quantidade cliente por area', A.area 
from cliente C inner join cargo A on C.cod_cargo_responsavel = A.cod_cargo
group by A.area

select * from ex_5B

 --DESCRIÇÃO NIVEL
create view ex_5C
as 
select COUNT(C.cod_cliente) as 'Quantidade cliente por descrição nivel', N.descricao_nivel
from cliente C inner join cargo A on C.cod_cargo_responsavel = A.cod_cargo inner join nivel N on A.cod_nivel = N.cod_nivel  
group by N.descricao_nivel

select * from ex_5C


--6 Elabora uma view que mostre o total do valor de contrato anual do cliente por descrição nível.

create view ex_6
as 
select SUM(C.valor_contrato_anual) as 'Soma contrato atual', N.descricao_nivel
from cliente C inner join cargo A on C.cod_cargo_responsavel = A.cod_cargo inner join nivel N on A.cod_nivel = N.cod_nivel
group by N.descricao_nivel

select * from ex_6


-- 
-- 7 Faça uma view mostre todos os dados dos níveis,
--cargos e funcionários e calculeSalário Total = SalárioBase+Impostos+Benefícios+VT+VR) 
create view ex_7
as
select F.*, C.area, C.quadro, C.bonus, C.contratacao, N.*, (F.salario_base +
F.beneficios + F.vt + F.vr + impostos) as 'Total'
from funcionario F inner join cargo C on F.cod_cargo = C.cod_cargo inner join nivel N on 
C.cod_nivel = N.cod_nivel

select * from ex_7

--8 
--Faça uma view mostre: -Somado Salário Base
Create view ex_8a
As
Select SUM(salario_base) as 'Soma salário base', SUM(Total) as 'Soma salário total', 
		SUM(dias_uteis_trabalhados_ano_orcamentario) as 'Soma do total de dias trabalhados', cod_cargo
From ex_7
Group by cod_cargo

select * from ex_8a

---Soma do Salário Total = SalárioBase+Impostos+Benefícios+VT+VR
Create view ex_8b
As
Select SUM(E.salario_base) as 'Soma salário base', SUM(E.Total) as 'Soma salário total', 
		SUM(E.dias_uteis_trabalhados_ano_orcamentario) as 'Soma do total de dias trabalhados', C.regiao
From ex_7 E inner join cep C on E.cep = C.cep
Group by C.regiao

select * from ex_8b

--Soma do Total de Dias Trabalhados = soma (Dias ÚteisTrabalhados Ano Orçamentário)
Create view ex_8c
As
Select SUM(salario_base) as 'Soma salário base', SUM(Total) as 'Soma salário total', 
		SUM(dias_uteis_trabalhados_ano_orcamentario) as 'Soma do total de dias trabalhados', descricao_nivel
From ex_7
Group by descricao_nivel

