-- SET FOREIGN_KEY_CHECK = 0;
DROP SCHEMA IF EXISTS ejercicio1_c CASCADE;
CREATE SCHEMA ejercicio1_c;

DROP TABLE IF EXISTS ejercicio1_c.categoria;
CREATE TABLE ejercicio1_c.categoria(
nro_categoria int NOT NULL,
descripcion varchar (30) NOT NULL,
PRIMARY KEY (nro_categoria)
);

DROP TABLE IF EXISTS ejercicio1_c.proveedor;
CREATE TABLE ejercicio1_c.proveedor(
nro_proveedor int NOT NULL,
nombre varchar (30) NOT NULL,
apellido varchar (30) NOT NULL,
direccion varchar (35) NOT NULL,
PRIMARY KEY (nro_proveedor)
);


CREATE DOMAIN enume AS varchar (10)
	CONSTRAINT enumerado1 CHECK (VALUE in ('azul', 'rojo', 'amarillo'));

DROP TABLE IF EXISTS ejercicio1_c.producto;
CREATE TABLE ejercicio1_c.producto(
nro_producto int NOT NULL,
descripcion varchar (30) NOT NULL,
color enume NOT NULL, -- utilizo el nuevo tipo enume
nro_categoria int NOT NULL,
PRIMARY KEY (nro_producto),
CONSTRAINT nro_prod_no_negativo CHECK (nro_producto >= 0), -- restriccion nro_producto no puede ser negativo	
CONSTRAINT num_categoria FOREIGN KEY (nro_categoria) REFERENCES ejercicio1_c.categoria (nro_categoria)
);


DROP TABLE IF EXISTS ejercicio1_c.suministra;
CREATE TABLE ejercicio1_c.suministro(
nro_proveedor int NOT NULL,
nro_producto int NOT NULL,
PRIMARY KEY (nro_proveedor, nro_producto),
CONSTRAINT fk_nro_prov FOREIGN KEY (nro_proveedor) REFERENCES ejercicio1_c.proveedor (nro_proveedor),
CONSTRAINT fk_nro_product FOREIGN KEY (nro_producto) REFERENCES ejercicio1_c.producto (nro_producto)
);