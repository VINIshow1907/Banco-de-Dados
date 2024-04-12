(BANCO TIPOS DE JUNÇÃO)-----------------------------------------------------------

/* Base da Dados para visualizar os tipos de JOIN
*/

/* Criando a Tabela Departamento*/
create table departamento
( codigodepartamento 	integer not null,
  descricao		varchar(30),
  constraint pk_codigo_vendedor primary key(codigodepartamento)
);

/* Criando a Tabela Empregado*/
create table empregado
( codigoempregado 	integer not null,
  nome			varchar(40),
  cidade		varchar(30),
  codigodepartamento	integer,
  constraint pk_codigoempregado primary key (codigoempregado),
  constraint fk_codigodepartamento foreign key (codigodepartamento) references departamento
);


/*-- INSERINDO DADOS NAS TABELAS --*/	


/* Inserindo Dados na Tabela Departamento */

insert into departamento values (1,'COMPRAS');

insert into departamento values (2,'VENDAS');

insert into departamento values (3,'INFORMÁTICA');

insert into departamento values (4,'PESSOAL');

insert into departamento values (5,'FINANCEIRO');



/* Inserindo Dados na Tabela Empregado */

insert into empregado values (1,'JOÃO','JALES',3);

insert into empregado values (2,'MARIA','URÂNIA',5);

insert into empregado values(3,'BRUNO','JALES',3);

insert into empregado (codigoempregado,nome,cidade)
values (4,'JOAQUINA','PARANAÍBA');
 
insert into empregado values (5,'CARLA','PARANAÍBA',1);

insert into empregado (codigoempregado,nome,cidade)
values (6,'PEDRO','JALES');


/*todos que estão a direita*/
select * 
from empregado e left join departamento d on e.codigodepartamento=d.codigodepartamento

/*seleciona os dados de todas as tabelas*/
select * 
from empregado e full join departamento d on e.codigodepartamento=d.codigodepartamento

(select codigodepartamento
form departamento)
where codigodepartamento not in (select distinct codigodepartamento from empregado)

/* Salvando */



/* commit; */


/* Fim */

(BANCO TIPOS DE JUNÇÃO)-----------------------------------------------------------



 (BANCO BD VENDA)-----------------------------------------------------------------


/*subconsulta*/
select * from vendedor
where salario_fixo >= (select avg (salario_fixo)
from vendedor)

select * 
from cliente
where codigo_cliente not in (select codigo_cliente
from pedido)

-- quais foram os produtos que não foram adquiridos
select * 
from produto
where codigo_produto not in (select codigo_produto
from item_do_pedido)

 (BANCO BD VENDA)-----------------------------------------------------------------