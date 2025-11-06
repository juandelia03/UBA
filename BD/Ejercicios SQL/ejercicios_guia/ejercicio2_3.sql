-- 2.3. Considerando el esquema de base de datos Chinook
-- (a) Mediante SQL obtener los ´albumes que tiene al menos un track en TODAS las
-- PlayLists.
WITH AlbumPorPlaylist (AlbumId,Title,PlaylistId) AS(
    SELECT DISTINCT
        a.AlbumId,a.Title, p.PlaylistId
    FROM
        Playlist p
    INNER JOIN
        PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
    INNER JOIN 
        Track t on t.TrackId = pt.TrackId
    INNER JOIN 
        Album a on a.AlbumId = t.AlbumId
)

SELECT
    Title
FROM
    AlbumPorPlaylist
GROUP BY AlbumId,Title
HAVING COUNT(AlbumId) = (
    SELECT 
        COUNT(*)
    FROM
        Playlist
)



-- (b) Mendiante SQL obtener los artistas que tienen menos ´albumes en PlayList


--ASUMI QUE TODOS TIENEN ALGUN TEMA EN UNA PLAYLIST, SINO HABRIA QUE FIJARSE EL CASO QUE TIENE 0
WITH CantidadAlbumesEnPlayListPorArtista (ArtistId,cantidad) AS(
    SELECT
        a.ArtistId, COUNT(DISTINCT a.AlbumId)
    FROM
        Playlist p
    INNER JOIN
        PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
    INNER JOIN 
        Track t on t.TrackId = pt.TrackId
    INNER JOIN 
        Album a on a.AlbumId = t.AlbumId
    GROUP BY a.ArtistId
)



SELECT 
    ArtistId
FROM
    CantidadAlbumesEnPlayListPorArtista
WHERE
    cantidad = (
        SELECT MIN(cantidad) FROM CantidadAlbumesEnPlayListPorArtista
    )


