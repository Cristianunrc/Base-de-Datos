select nro_alumno, alumno.nombre, apellido, sexo from alumno inner join realiza using (nro_alumno) inner join  taller
using (codigo_taller) where sexo = 'Masculino' and taller.nombre = 'Cocina'
union
select nro_alumno, alumno.nombre, apellido, sexo from alumno inner join realiza using (nro_alumno) inner join taller
using (codigo_taller) where sexo = 'Femenino' and taller.nombre = 'Bordado'