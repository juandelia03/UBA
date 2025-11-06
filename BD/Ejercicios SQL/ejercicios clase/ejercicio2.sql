-- Listar la cantidad de tracks que tiene cada genero.
SELECT
    g.name, COUNT(t.TrackId)
FROM
    Genre g
LEFT JOIN  --tiene que ser left porque sino me pierdo generos
    Track t on t.GenreId = g.GenreId
GROUP BY
    g.GenreId,g.Name
