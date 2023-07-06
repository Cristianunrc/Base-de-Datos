-- Ejercicio 5
-- a) No terminado

 /*select vacunas.cod_vacuna , avg(total_vacunas), nombre from 
(select vacunas.cod_vacuna, count(vacunados.cod_vacuna) as total_vacunas, nombre from vacunados join vacunas on 
(vacunas.cod_vacuna = vacunados.cod_vacuna) group by (cod_vacuna)) as resultado;*/

-- c) Esta bien!
-- select personas.nombre, dni, count(cod_vacuna) as cant_vacunas_colocadas from vacunados inner join vacunas using (cod_vacuna)
-- inner join personas using (dni) group by (nombre)