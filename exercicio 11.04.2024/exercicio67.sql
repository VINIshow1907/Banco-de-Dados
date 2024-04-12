/*67.  Em relação ao exercício anterior desenvolva uma visualização que contenha o Número do Pedido, Código,
o Nome e o salário fixo do Vendedor e o Total.*/
CREATE VIEW EX_67
AS
select distinct p.num_pedido, pr.codigo_produto, pr.descricao_produto, pr.val_unit, i.quantidade *
pr.val_unit as total, v.nome_vendedor, v.salario_fixo
	from pedido p inner join item_do_pedido i
	on p.num_pedido=i.num_pedido
	inner join produto pr
	on i.codigo_produto=pr.codigo_produto
	inner join vendedor v
	on p.codigo_vendedor= v.codigo_vendedor