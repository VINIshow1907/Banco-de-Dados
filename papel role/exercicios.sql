/*1. Crie um papel chamado “Vendedor” com senha criptografada. */
create role vendedor with encrypted password '123' login;

/*2. Altere o papel do vendedor e de permissão de superusuário e permita que realize
login.*/
alter role vendedor superuser login;
/*3. Remova a permissão de superusuário para o vendedor, que não herde o
privilégios dos papéis dos quais é membro.*/

alter role Vendedor nosuperuser noinherit;

/*4. Remova o papel vendedor.*/
drop role vendedor;

/*5. Crie um papel com o nome de “Limitado” com senha criptografada, que não seja
superusuário, que não tenha permissão para criar banco de dados e nem papéis,
que não "herde" os privilégios dos papéis dos quais é membro, que possa realizar
login, que possua apenas quatro conexões simultâneas, e que sua permissão
seja concedida até 04/04/2025.*/

create role limitado with encrypted password '123' login valid until '04/04/2025' connection limit 4;

/*6. Crie os papéis chamados: “Vendedor”, “Secretária” e “Atendente”. Para todos os
papéis crie uma senha criptografada, que não herde os privilégios dos papéis dos
quais é membro e que possa realizar login.*/

create role vendedor  with encrypted  password '123' login;
create role secretaria with encrypted password '123' login;
create role atendente with encrypted password '123' login;

/*7. Escreva os comandos para selecionar todos os papéis.*/
select *
from pg_user
/*8. Crie um grupo chamado “funcionario”.*/

create group funcionario

/*9. Adicione no grupo todos os papéis (Vendedor, Secretária, Atendente e Limitado).*/

alter group funcionario add user vendedor, secretaria, atendente, limitado;

/*10.Exclua do grupo “funcionário” o papel limitado.*/

alter group funcionario drop user limitado;

/*11.Liste todos os grupos.*/

select *
from pg_group

/*12.No banco de dados vendas, remova todas as permissões das tabelas cliente,
pedido, vendedor, item do pedido e produto.*/

revoke all on cliente, pedido, vendedor, item_do_pedido, produto
from public;

/*13.Conceda os privilégios de seleção, inserção e alteração da tabela cliente e
vendedor para o papel secretária.*/ 

grant select, insert, update on cliente, vendedor to Secretaria;

/*14.Faça o login com o papel secretária e realize a seleção da tabela cliente,
vendedor e produto. Faça uma inserção de um registro na tabela cliente e depois
remova este registro. Para cada operação escreva se a permissão foi concedida
ou negada.*/


/*15.Volte a entrar como usuário postgres e remova a permissão de selecionar, inserir
e alterar a tabela vendedor para o papel secretária.*/


/*16.Faça o login novamente com o papel secretária e realize a seleção da tabela
cliente e vendedor. Para cada operação escreva se a permissão foi concedida ou
negada.*/