create trigger exemplo2
on cliente
for update
as 
declare @codigoa int, @enda varchar(50),
		@codigon int, @endn varchar(50);

/*seleciona o código e o endereço antigo*/
select @codigoa = codigo_cliente, @enda= endereco from deleted;

/*seleciona o código e o endereço novo(alterado)*/
select @codigon = codigo_cliente, @endn = endereco from inserted;

/*se o endereço antigo for diferente do novo então insere o 
endereço antigo na tabela histórico de endereços dos clientes*/
if (@enda!=@endn)
	begin 
		insert into histendercliente (codigo_cliente, end_cliente)
				values (@codigoa, @enda);
	end;

	select * from histendercliente

	select * from cliente

	update cliente
		set endereco='Rua 1, nº333'
		where codigo_cliente = 130;

		
		/* 74. Desenvolva um Trigger que ao ser excluído um registro da tabela produto 
		apareça uma mensagem que os dados do produto foram excluídos com sucesso.*/

		create trigger atividade74
		on Produto
		for insert, delete
		as print ('Produto deletado com sucesso!')

		select * from produto
		insert into produto values (75, 'kg', 'Arroz', 30, 500);

		delete from produto where codigo_produto = 75;

/*75. Desenvolver um Trigger que ao ser alterado o salário do Vendedor insira o salário antigo na tabela histórico do salário.*/
create trigger exercicio75
on vendedor
for update
as 
	Declare @coda int, @sala numeric, @saln numeric;

	select @coda = codigo_vendedor, @sala = salario_fixo
	from deleted; 

	select @saln = salario_fixo 
	from inserted;

	if (@sala!=@saln)
	begin
		insert into histsalario (codigo_vendedor, salario_fixo)
			values (@coda, @sala);
		end;

	select * from vendedor

	select * from histsalario

	update vendedor
	set salario_fixo = 2000
		where codigo_vendedor = 310;
/*76. Crie um trigger que ao inserir um registro da tabela item do pedido, calcule e armazene o seu subtotal.*/
create trigger  ex76
on item_do_pedido
for insert
as 
	declare @numped int, @quant numeric,
	        @codpro int, @valor numeric;
 
	select @numped=num_pedido, @quant=quantidade,
	       @codpro=codigo_produto

	from inserted;
	
	select @valor=val_unit
	from produto
	where codigo_produto=@codpro;
 
	update item_do_pedido
	set subtotal=@quant*@valor
	where codigo_produto=@codpro and
	 num_pedido=@numped;
 
select*
from item_do_pedido
 
insert into item_do_pedido (num_pedido, codigo_produto, quantidade)
  values (91, 78,10);
 
/*78. Crie um trigger que ao alterar um registro da tabela item do pedido, calcule e atualize o seu subtotal. */
create trigger ex78
on item_do_pedido
for update
as 
	declare @numped int, @quant numeric,
			@codpro int, @valor numeric;

	select @numped = num_pedido, @quant = quantidade,
			@codpro = codigo_produto

	from inserted;

	select @valor=val_unit
	from produto
	where codigo_produto= @codpro;

	update item_do_pedido
		set subtotal=@quant*@valor
		where codigo_produto=@codpro and
		num_pedido=@numped;

	select * from produto

	insert into item_do_pedido (num_pedido, codigo_produto, quantidade)
		vaLues (91, 13, 10);
	
	update item_do_pedido
	set quantidade = 5
	where num_pedido = 91 and codigo_produto = 13;

/*79. Crie um Trigger que ao ser inserido um novo item do pedido atualize o campo quantidade em estoque da tabela produto.*/
create trigger ex79
on item_do_pedido
for insert
as 
	declare @numped int, @quant numeric, 
	@codpro int, @quantest numeric

	select @numped = num_pedido, @quant = quantidade,
		   @codpro = codigo_produto
		  
	from inserted;

	select @quantest=quant_est
	from produto
	where codigo_produto= @codpro;

	update produto
		set quant_est=@quantest - @quant
		where codigo_produto=@codpro 

	select * from item_do_pedido
	select * from produto

	insert into item_do_pedido (num_pedido, codigo_produto, quantidade)
		vaLues (97, 31, 250);
	
/*80. Crie um Trigger que ao ser alterado um item do pedido atualize
o campo quantidade em estoque da tabela produto*/
create trigger ex80
on item_do_pedido
for update
as 
declare @codproduton int, @codprodutoa int,
		@quantidaden numeric(15,2), @quantidadea numeric(15,2);

/*seleciono o código do produto e a quantidade atualizada*/
select @codproduton = codigo_produto, @quantidadea = quantidade
from inserted;

/*Seleciono o código do produto e a quantidade antiga*/
select @codprodutoa= codigo_produto, @quantidadea=quantidade
from deleted;

/*atualizo o estoque*/
--retorno a quantidade pedida antiga para o produto anterior
	update produto
		set quant_est= quant_est-@quantidaden
		where codigo_produto= @codproduton;

/*===========================================
	3º Testando o Trigger
======================================
*/
--num_pedido --> 121
--cod prod --> 25

select * from item_do_pedido where num_pedido = 121
select * from produto where codigo_produto =25

update item_do_pedido
	set quantidade=250
	where num_pedido=97 and codigo_produto=31

	select * from item_do_pedido

