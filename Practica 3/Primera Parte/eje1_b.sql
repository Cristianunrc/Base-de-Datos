select producto.cod_producto, descripcion from producto join itemfactura on (producto.cod_producto = itemfactura.cod_producto)
where cantidad > 5 order by descripcion;