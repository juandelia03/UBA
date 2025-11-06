WITH PlaylistConRock(PlaylistId) as (
    SELECT DISTINCT
        PlaylistId 
    FROM 
        Playlist
    WHERE PlaylistId IN(
        SELECT 
            p.PlaylistId
        FROM
            Playlist p
        INNER JOIN
            PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
        INNER JOIN
            Track t on t.TrackId = pt.TrackId
        INNER JOIN
            Genre g on g.GenreId = t.GenreId
        WHERE g.Name = 'Rock'
    )
)

SELECT COUNT(*) FROM Playlist p WHERE p.PlaylistId NOT IN (SELECT * FROM PlaylistConRock)

--otra opcion
-- SELECT 
--     COUNT(p.PlaylistId)
-- FROM 
--     Playlist p
-- LEFT JOIN 
--     PlaylistConRock r ON p.PlaylistId =r.PlaylistId
-- WHERE 
--     r.PlaylistId IS NULL