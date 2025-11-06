-- Listar el nombre y la cantidad de tracks de los artistas con más de
-- 50 tracks, ordenado por cantidad de tracks de forma ascendente

WITH ArtistaCantidadDeTracks(nombre,cantidad) as(
    SELECT a.Name, COUNT(t.TrackId)
    FROM 
        Artist a
    INNER JOIN
        Album al on al.ArtistId = a.ArtistId
    INNER JOIN 
        Track t on t.AlbumId = al.AlbumId
    GROUP BY a.ArtistId, a.Name
)

SELECT
    nombre, cantidad
FROM 
    ArtistaCantidadDeTracks
WHERE
    cantidad > 50
ORDER BY cantidad
