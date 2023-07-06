DROP SCHEMA IF EXISTS ejercicio2 CASCADE;
CREATE SCHEMA ejercicio2;

DROP TABLE IF EXISTS ejercicio2.club;
CREATE TABLE ejercicio2.club (
    NRO_CLUB integer NOT NULL,
    NOMBRE_CLUB character varying(30) NOT NULL,
    PRESUPUESTO integer,
	PRIMARY KEY (NRO_CLUB));

DROP TABLE IF EXISTS ejercicio2.competencia;
CREATE TABLE ejercicio2.competencia (
    NRO_COMPETENCIA integer NOT NULL,
    DESCRIPCION character varying(30) NOT NULL,
    CATEGORIA integer NOT NULL,
	PRIMARY KEY (NRO_COMPETENCIA));

DROP TABLE IF EXISTS ejercicio2.participacion;
CREATE TABLE ejercicio2.participacion (
    NRO_CLUB integer NOT NULL,
    NRO_COMPETENCIA integer NOT NULL,
    PUESTO character varying(20),
	PRIMARY KEY (NRO_CLUB, NRO_COMPETENCIA),
	CONSTRAINT fk_nro_club FOREIGN KEY (NRO_CLUB) REFERENCES ejercicio2.club (NRO_CLUB),
	CONSTRAINT fk_nro_competencia FOREIGN KEY (NRO_COMPETENCIA) REFERENCES ejercicio2.competencia (NRO_COMPETENCIA));


INSERT INTO ejercicio2.club (NRO_CLUB, NOMBRE_CLUB, PRESUPUESTO) VALUES 
(1, 'Atletico Estudiantes', 35000),
(2, 'Banda Norte', 27501),
(3, 'Atenas', 19700),
(4, 'Sportivo Municipal', 21640),
(5, 'Atletico Adelia Maria', 22000),
(6, 'Atletico Sampacho', 18000),
(7, 'Alianza Moldes', 65200);


INSERT INTO ejercicio2.competencia (NRO_COMPETENCIA, DESCRIPCION, CATEGORIA) VALUES 
(1, 'torneo de futbol infantil', 5),
(2, 'torneo de futbol juvenil', 2),
(3, 'torneo de futbol veteranos', 5),
(4, 'torneo de tenis infantil', 5),
(5, 'torneo de tenis juvenil', 3),
(6, 'torneo de tenis veteranos', 6),
(7, 'torneo de basquet infantil', 3),
(8, 'torneo de basquet juvenil', 1),
(9, 'torneo de basquet veteranos', 2);


INSERT INTO ejercicio2.participacion (NRO_CLUB, NRO_COMPETENCIA, PUESTO) VALUES 
(1, 1, 'primer puesto'),
(2, 1, 'segundo puesto'),
(3, 3, 'tercer puesto'),
(4, 2, 'primer puesto'),
(5, 4, 'segundo puesto'),
(1, 2, 'primer puesto'),
(6, 7, 'segundo puesto'),
(3, 9, 'tercer puesto');

--2)
-- a)
--select * from ejercicio2.competencia where (categoria > 1);
--b) y c)
--select nro_club, nombre_club, nro_competencia, categoria from ejercicio2.club inner join ejercicio2.participacion using (nro_club)
--inner join ejercicio2.competencia using (nro_competencia) where (categoria = 1);