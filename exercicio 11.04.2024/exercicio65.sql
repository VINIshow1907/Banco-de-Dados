/*65.  Faça uma View que contenha o número do pedido, código e descrição do produto, 
quantidade, val_unit e o total (quantidade * val_unit).*/
CREATE VIEW  EX_65
as
select distinct p.num_pedido, pr.codigo_produto, pr.descricao_produto, pr.val_unit, i.quantidade *
pr.val_unit as total
	from pedido p inner join item_do_pedido i
	on p.num_pedido=i.num_pedido
	inner join produto pr
	on i.codigo_produto=pr.codigo_produto
	
	select *
	from EX_65