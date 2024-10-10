select *
from pg_user

select *
from pg_group

create role estagiario

alter role estagiario with encrypted password '123' login;

create role chefe with encrypted password '123' login createdb
createrole valid until '12/12/2024' connection limit 3

create group empresa

alter group empresa add user chefe, estagiario;

alter group empresa drop user estagiario;

revoke all on cliente, vendedor, item_do_pedido, pedido, produto
from public;

grant select on cliente, vendedor to estagiario;

select * from cliente