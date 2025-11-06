--Mostrar los t´ıtulos de los ´albumes donde todas las canciones tienen una duraci´on mayor al promedio de duraci´on de todas las canciones de la base.
-- Se debe mostrar: Title. Ordenado por Title en forma ascendente.

(
SELECT Title FROM ALBUM

EXCEPT

--Albumes que algun track dura menos que el promedio
SELECT 
    al.Title
FROM
    Album al
WHERE EXISTS(
    SELECT 
        al2.AlbumId
    FROM 
        Album al2
    INNER JOIN  
        Track t on t.AlbumId = al2.AlbumId
    WHERE al.AlbumId = al2.AlbumId AND
    t.Milliseconds < (
        SELECT AVG(Milliseconds) FROM Track
    )
)
)
ORDER BY Title ASC