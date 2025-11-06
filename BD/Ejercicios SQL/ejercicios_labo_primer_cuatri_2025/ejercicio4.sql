-- Listar los artistas que tengan m´as de 10 ´albumes registrados.
-- Se debe mostrar: Name, CantidadAlbumes. Ordenado por cantidad de albunes en forma
-- descendente

SELECT 
    a.Name,COUNT(al.AlbumId)
FROM
    Artist a
INNER JOIN 
    Album al on al.ArtistId = a.ArtistId
GROUP BY a.ArtistId,a.Name
HAVING COUNT(al.AlbumId) > 10
ORDER BY COUNT(al.AlbumId) DESC