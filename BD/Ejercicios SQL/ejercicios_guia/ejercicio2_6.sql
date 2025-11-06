-- PARTIDO (equipo1, equipo2, torneo, goles1, goles2, puntos1, puntos2)
-- JUGADOR (nombre, edad, equipo)
-- ! Cada partido se registra una sola vez. Por ejemplo si Boca le gan´o a River en el
-- torneo “Apertura 2002” por 2 a 1, se registra ´unicamente la tupla (“Boca”, “River”,
-- “Apertura 2002”, 2, 1, 3, 0)
-- ! Los candidatos a campeones de un torneo se determinan sumando los puntos obtenidos
-- por cada equipo, seleccionando los que suman el m´aximo valor. Al haber m´as de un
-- candidato, se resuelve el campeonato tomando en cuenta la diferencia de goles.
-- ! Para simplificar se asume que ning´un jugador cambi´o de equipo y los nombres no se
-- repiten.

-- i. Listar los equipos que hayan finalizado invictos en al menos dos torneos.


SELECT 
    p.equipo1
FROM (
        --todas las tuplas equipo torneo
        SELECT equipo1,torneo FROM partido 

        EXCEPT
        -- me trae todas las tuplas equipo torneo que hayan perdido al menos un partido en ese torneo
        SELECT equipo1,torneo FROM partido  where puntos1 = 0
        
    ) as p
GROUP BY p.equipo1
HAVING COUNT(*) > 1

-- ii. Listar los torneos que finalizaron con m´as de un candidato a campe´on.

WITH puntosPorEquipoPorTorneo as(
    SELECT equipo1, torneo, SUM(puntos1) as puntos
    FROM PARTIDO
    GROUP BY equipo1,torneo
),

candidatosPorTorneo as(
    SELECT t.equipo1, t.torneo
    FROM puntosPorEquipoPorTorneo  t
    where t.puntos = (
        SELECT 
            MAX(puntos)
        FROM 
            puntosPorEquipoPorTorneo t2
        WHERE 
            t2.torneo = t.torneo
    )
)


SELECT 
    t.torneo 
FROM 
    candidatosPorTorneo t
GROUP BY t.torneo 
HAVING COUNT (*) > 1

