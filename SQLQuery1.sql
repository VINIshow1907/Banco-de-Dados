create trigger Mensagem_Produto
on Produto
for insert, update
as print('Produto alterado com sucesso!');


select * from produto

insert into produto(codigo_produto,descricao_produto)
values(5,'Carne');

update produto
set unidade='KG'
where codigo_produto=5;

