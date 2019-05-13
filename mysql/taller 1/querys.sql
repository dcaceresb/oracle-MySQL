////han comprado
select c.nombre
from Cliente c, Compra co 
where c.cod_beca in (
		select *
		from Compra);


/// hace 30 dias 
select c.nombre
from Cliente c
where 
(
	c.cod_beca not in 
	select c2.cod_beca
	from Cliente c2, Compra co, Factura f
	where
	(	
		c.cod_beca = co.cod_beca
		and co.cod_fac = f.cod_fac
		and f.fecha between '25-08-2017' and '25-09-2017'
	)
);





////entre 1 agosto a hoy
select c.nombre
from Cliente c, Compra co, Factura f
where(	c.cod_beca = co.cod_beca
	 	and co.cod_fac = f.cod_fac
	 	and f.fecha between '01-08-2017' and '25-09-2017'
	 );



///bicicletas
select c.nombre
from Cliente c, Compra co, Producto p
where(	c.cod_beca = co.cod_beca
		and co.cod_prod = p.cod_prod
		and p.tipo_producto = 'Bicicleta'
		
	 );


////las fallas

select pro.nombre, t.numero, p.cod_prod,p.nombre
from Producto p, Proveedor pro, Tiene t 
where(	p.rut = pro.rut
		and pro.rut = t.rut
		and p.cod  like '32%'
	 );