-- Obtener los artistas que no tienen albumes. Dar al menos dos soluciones distintas.

-- Primera solución TODOS LOS ARTISTAS EXCEPT ARTISTAS CON ALBUMES
SELECT 
    ArtistId, Name
FROM
    Artist

EXCEPT

SELECT
    ar.ArtistId,ar.Name
FROM
    Artist ar
INNER JOIN
    Album al on al.ArtistId = ar.ArtistId


-- Segunda solución no existe album para un artista

SELECT
    a1.ArtistId, a1.Name
FROM
    Artist a1
WHERE 
    NOT EXISTS(
        SELECT * FROM Artist a2 INNER JOIN Album al on al.ArtistId = a2.ArtistId where a2.ArtistId = a1.ArtistId
    )
