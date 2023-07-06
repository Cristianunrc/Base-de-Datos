select cod_producto, descripcion from producto where cod_producto 
not in
(select cod_producto from itemfactura where cantidad >= 1)