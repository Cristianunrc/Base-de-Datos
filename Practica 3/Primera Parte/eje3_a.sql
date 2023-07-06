select alumno.nro_alumno, nombre, apellido from alumno join realiza on (alumno.nro_alumno = realiza.nro_alumno)
where sexo = 'Masculino' and codigo_taller = 5