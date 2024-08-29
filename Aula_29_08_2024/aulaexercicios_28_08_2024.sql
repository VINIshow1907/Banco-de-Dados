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
