drop schema if exists ejercicio1_3 cascade;
CREATE schema ejercicio1_3;

DROP TABLE IF EXISTS ejercicio1_3.articulos;
CREATE TABLE ejercicio1_3.articulos(
nro_articulo int NOT NULL,
descripcion varchar(100) default NULL,
precio float default NULL, -- no es float
cantidad int NOT NULL,
stock_min int NOT NULL,
stock_max int NOT NULL,
mes_ult_movim varchar(20) NOT NULL,
fecha_vto date default NULL,
PRIMARY KEY (nro_articulo),
CONSTRAINT stock_min_max check (stock_min <= stock_max),
CONSTRAINT precio_positivo check (precio>0));

INSERT INTO ejercicio1_3.articulos(nro_articulo, descripcion, precio, cantidad, stock_min, stock_max, mes_ult_movim, fecha_vto) VALUES
(1,'Yerba', 250.50, 45, 10, 40, 'Marzo', '2022-06-27'),
(2,'Azucar', 120.00, 60, 14, 30, 'Abril', '2023-05-20'),
(3,'Ravioles', 200.99, 40, 5, 35, 'Diciembre', '2022-12-20'),
(4,'Fideos', 70.50, 100, 20, 50, 'Enero', '2024-01-15'),
(5,'Salsa_tomate', 55.99, 85, 15, 80, 'Abril', '2022-12-30');

-- ejercicio 6_a)
-- Función que es invocada desde el TRIGGER
/* CREATE OR REPLACE FUNCTION descripcion_Mayuscula() RETURNS trigger AS $descripcion_Mayuscula$
    BEGIN        
        NEW.DESCRIPCION = UPPER(NEW.DESCRIPCION); -- que hacia el upper?
        RETURN NEW;
    END
$descripcion_Mayuscula$ 
	LANGUAGE plpgsql;

-- Trigger
CREATE TRIGGER desccripcion_Mayuscula BEFORE INSERT OR UPDATE ON ejercicio1_3.articulos
    FOR EACH ROW EXECUTE PROCEDURE descripcion_Mayuscula(descripcion);
END;
*/
INSERT INTO ejercicio1_3.articulos(nro_articulo, descripcion, precio, cantidad, stock_min, stock_max, mes_ult_movim, fecha_vto) VALUES 
(6, 'Carne', 1003.50, 50, 10, 40, 'Febrero', null),
(7, 'Papas', 100.00, 100, 20, 80, 'Dciciembre', null);

-- ej6B)
DROP TABLE IF EXISTS ejericio1_3.auditoriaArticulo CASCADE;
CREATE TABLE ejercicio1_3.auditoriaArticulo(
nro_articulo int NOT NULL,
movimiento int DEFAULT NULL,
fecha date DEFAULT NULL
);

--Funcion de auditoría que es invocada desde el trigger
CREATE OR REPLACE FUNCTION funcion_auditoria_Art() RETURNS trigger AS $auditoria$
    BEGIN        
		IF (TG_OP = 'UPDATE') THEN -- si TG_OP se modifica
			INSERT INTO ejercicio1_3.auditoriaArticulo VALUES
				(OLD.nro_articulo, OLD.cantidad - NEW.cantidad, NOW()); -- NOW() es una funcion que brinda la fecha actual en tiempo y forma
			RETURN NEW;
		END IF;
	RETURN NULL;
	END
	$auditoria$ 
	LANGUAGE plpgsql;
		
CREATE TRIGGER triggerAuditoria
AFTER UPDATE ON ejercicio1_3.articulos
FOR EACH ROW EXECUTE PROCEDURE funcion_auditoria_Art();


