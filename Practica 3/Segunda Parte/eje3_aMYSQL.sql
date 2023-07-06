DROP DATABASE IF EXISTS ejercicio3_a;
CREATE DATABASE IF NOT EXISTS ejercicio3_a;
USE ejercicio3_a;

DROP TABLE IF EXISTS `municipios`; 
CREATE TABLE `municipios` (
`MUNICIPIO` varchar (30) NOT NULL,
`PROVINCIA` varchar (30) NOT NULL,
PRIMARY KEY (`MUNICIPIO`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `vacunas`;
CREATE TABLE `vacunas`(
`COD_VACUNA` int NOT NULL,
`NOMBRE` varchar(25) NOT NULL,
PRIMARY KEY (`COD_VACUNA`),
CONSTRAINT `DOMINIO_VACUNA` CHECK (`COD_VACUNA` >= 0),
CONSTRAINT `NOMBRE_VACUNA` CHECK (`NOMBRE` IN ('BCG', 'DOBLE VIRAL', 'TRIPLE VIRAL', 'TETANOS')) -- agrego un CONSTRAINT "renombre" para que el compilador no agregue uno por defecto
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas`(
`DNI` int NOT NULL,
`COD_NINIO` int NOT NULL,
`NOMBRE` varchar (45) NOT NULL,
`EDAD` int NOT NULL,
`MUNICIPIO` varchar (30) NOT NULL,
PRIMARY KEY (`DNI`),
CONSTRAINT `COD_NENE` CHECK (`COD_NINIO` > 0), -- codigo de niño es entero +
CONSTRAINT `EDAD_0 `CHECK (`EDAD` < 18 AND `EDAD` > 0), -- edad es un entero + menor a 18
CONSTRAINT `FK_MUNICIPIO` FOREIGN KEY (`MUNICIPIO`) REFERENCES `municipios` (`MUNICIPIO`)
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `contagios`;
CREATE TABLE `contagios` (
`DNI` int NOT NULL,
`CEPA` varchar (20) NOT NULL,
PRIMARY KEY (`DNI`, `CEPA`),
CONSTRAINT `FK_DNI_0` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vacunados`;
CREATE TABLE `vacunados` (
`DNI` int NOT NULL,
`COD_VACUNA` int NOT NULL,
PRIMARY KEY (`DNI`, `COD_VACUNA`),
CONSTRAINT `FK_COD_VACUNA` FOREIGN KEY (`COD_VACUNA`) REFERENCES `vacunas` (`COD_VACUNA`),
CONSTRAINT `FK_DNI_1` FOREIGN KEY (`DNI`) REFERENCES `personas` (`DNI`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `municipios` (`MUNICIPIO`, `PROVINCIA`) VALUES
('Ucacha', 'Cordoba'),
('Etruria', 'Cordoba'),
('Patquia', 'La Rioja'),
('Las Higueras', 'Cordoba'),
('Rio Cuarto', 'Cordoba');

INSERT INTO `vacunas` (`COD_VACUNA`, `NOMBRE`) VALUES
(1, 'BCG'),
(2, 'DOBLE VIRAL'),
(3, 'TRIPLE VIRAL'),
(4, 'TETANOS');

INSERT INTO `personas` (`DNI`, `COD_NINIO`, `NOMBRE`, `EDAD`, `MUNICIPIO`) VALUES
(38106484, 1, 'Cristian', 17, 'Rio Cuarto'),
(16530675, 2, 'Pablo', 10, 'Ucacha'),
(16570882, 3, 'Cristina', 14, 'Etruria'),
(40630172, 4, 'Joaquin', 15, 'Ucacha'),
(30630115, 5, 'Diego', 17, 'Las Higueras'),
(43227820, 6, 'Maria Sol', 15, 'Etruria');

INSERT INTO `contagios` (`DNI`, `CEPA`) VALUES
(40630172, 'Manaos'), -- Joaquin
(16570882, 'Delta'), -- Cristina
(43227820, 'Delta'); -- Maria Sol

INSERT INTO `vacunados` (`DNI`, `COD_VACUNA`) VALUES
(38106484, 1),
(43227820, 1),
(43227820, 2),
(40630172, 2),
(40630172, 3),
(30630115, 4),
(16570882, 4);

