select pais from competencia where pais 
not in  
(select medalla.pais from competencia join medalla where cantidad >= 1 group by pais)