DROP SCHEMA IF EXISTS ejercicio1_b CASCADE;
CREATE SCHEMA ejercicio1_b;

DROP TABLE IF EXISTS ejercicio1_b.municipios;
CREATE TABLE ejercicio1_b.municipios (
municipio varchar(40) NOT NULL,
provincia varchar(50) NOT NULL,
PRIMARY KEY (municipio));

INSERT INTO ejercicio1_b.municipios (municipio, provincia) VALUES
('Ucacha', 'Cordoba'),
('Etruria', 'Cordoba'),
('Patquia', 'La Rioja'),
('Las Higueras', 'Cordoba'),
('Rio Cuarto', 'Cordoba');

DROP DOMAIN IF EXISTS dominioNombre; -- elimino el dominio para luego crearlo
CREATE DOMAIN dominioNombre AS varchar (20)
	CONSTRAINT renombroDominio CHECK (VALUE IN ('BCG', 'DOBLE VIRAL', 'TRIPLE VIRAL', 'TETANOS' ));

DROP TABLE IF EXISTS ejercicio1_b.vacunas;
CREATE TABLE ejercicio1_b.vacunas (
cod_vacuna int NOT NULL,
nombre dominioNombre NOT NULL, -- nombre es de tipo dominioNombre
PRIMARY KEY (cod_vacuna));

INSERT INTO ejercicio1_b.vacunas (cod_vacuna, nombre) VALUES
(1, 'BCG'),
(2, 'DOBLE VIRAL'),
(3, 'TRIPLE VIRAL'),
(4, 'TETANOS');

DROP TABLE IF EXISTS  ejercicio1_b.personas;
CREATE TABLE ejercicio1_b.personas (
dni int NOT NULL,
cod_ninio int NOT NULL,	
nombre varchar (45) NOT NULL,
edad int NOT NULL,
municipio varchar(40) NOT NULL,
PRIMARY KEY (dni),
CONSTRAINT codigo_ninio CHECK (cod_ninio > 0), -- codigo de niño es entero +
CONSTRAINT edad_ninio CHECK (edad > 0 AND edad < 18),
CONSTRAINT fk_municipio FOREIGN KEY (municipio) REFERENCES ejercicio1_b.municipios (municipio));

INSERT INTO ejercicio1_b.personas (dni, cod_ninio, nombre, edad, municipio) VALUES
(38106484, 1, 'Cristian', 17, 'Rio Cuarto'),
(16530675, 2, 'Pablo', 15, 'Ucacha'),
(16570882, 3, 'Cristina', 14, 'Etruria'),
(40630172, 4, 'Joaquin', 16, 'Ucacha'),
(30630115, 5, 'Diego', 17, 'Las Higueras'),
(43227820, 6, 'Maria Sol', 15, 'Etruria');

DROP TABLE IF EXISTS ejercicio1_b.contagios;
CREATE TABLE ejercicio1_b.contagios (
dni int NOT NULL,
cepa varchar(25) NOT NULL,
PRIMARY KEY (dni, cepa),
CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES ejercicio1_b.personas (dni));

INSERT INTO ejercicio1_b.contagios (dni, cepa) VALUES
(40630172, 'Manaos'), -- Joaquin
(16570882, 'Delta'), -- Cristina
(43227820, 'Delta'); -- Maria Sol


DROP TABLE IF EXISTS ejercicio1_b.vacunados;
CREATE TABLE ejercicio1_b.vacunados (
dni int NOT NULL,
cod_vacuna int NOT NULL,
CONSTRAINT fk_dni FOREIGN KEY (dni) REFERENCES ejercicio1_b.personas (dni),
CONSTRAINT fk_cod_vacuna FOREIGN KEY (cod_vacuna) REFERENCES ejercicio1_b.vacunas (cod_vacuna));


INSERT INTO ejercicio1_b.vacunados (dni, cod_vacuna) VALUES
(38106484, 1),
(43227820, 1),
(40630172, 2),
(40630172, 3),
(16570882, 4);

--select vacunas.cod_vacuna, nombre, avg(vacunados.cod_vacuna) as prom_vacunas_colocadas from ejercicio1_b.vacunas inner join ejercicio1_b.vacunados using (cod_vacuna)
--group by (cod_vacuna);
