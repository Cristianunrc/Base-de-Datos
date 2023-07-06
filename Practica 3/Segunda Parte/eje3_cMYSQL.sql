-- SET FOREIGN_KEY_CHECK = 0;
DROP DATABASE IF EXISTS ejercicio3_c;
CREATE DATABASE ejercicio3_c;
USE ejercicio3_c;

DROP TABLE IF EXISTS categoria;
CREATE TABLE categoria(
nro_categoria int NOT NULL,
descripcion varchar (30) NOT NULL,
PRIMARY KEY (nro_categoria)
);

DROP TABLE IF EXISTS proveedor;
CREATE TABLE proveedor(
nro_proveedor int NOT NULL,
nombre varchar (30) NOT NULL,
apellido varchar (30) NOT NULL,
direccion varchar (35) NOT NULL,
PRIMARY KEY (nro_proveedor)
);


DROP TABLE IF EXISTS producto;
CREATE TABLE producto(
nro_producto int NOT NULL,
descripcion varchar (30) NOT NULL,
color varchar (10) NOT NULL,
nro_categoria int NOT NULL,
PRIMARY KEY (nro_producto),
CONSTRAINT nro_prod_no_negativo CHECK (nro_producto > 0), -- restriccion nro_prodcuto no puede ser negativo
CONSTRAINT color_0 CHECK (color IN ('azul', 'rojo', 'amarillo')), -- restriccion color es un tipo enumerado
CONSTRAINT fk_nro_categoria FOREIGN KEY (nro_categoria) REFERENCES categoria (nro_categoria)
);


DROP TABLE IF EXISTS suministra;
CREATE TABLE suministra(
nro_proveedor int NOT NULL,
nro_producto int NOT NULL,
PRIMARY KEY (nro_proveedor, nro_producto),
CONSTRAINT fk_nro_prov FOREIGN KEY (nro_proveedor) REFERENCES proveedor (nro_proveedor),
CONSTRAINT fk_nro_product FOREIGN KEY (nro_producto) REFERENCES producto (nro_producto)
);