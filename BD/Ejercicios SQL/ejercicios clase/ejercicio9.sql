-- Obtener las playlists mas caras. (Ayuda: primero obtener el precio de cada playlist.)

WITH playListPorPrecio(playlistId, price) as(
    SELECT
        p.PlaylistId, SUM(t.UnitPrice)
    FROM 
        Playlist p
    INNER JOIN 
        PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
    INNER JOIN 
        Track t on t.TrackId = pt.TrackId
    GROUP BY p.PlaylistId
)

SELECT *
FROM
    playListPorPrecio pp
WHERE 
    pp.price = ( SELECT MAX(price) FROM playListPorPrecio )
