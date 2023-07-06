select * from cliente where nro_cliente
not in
(select distinct nro_cliente from factura) order by apellido desc, nombre desc
