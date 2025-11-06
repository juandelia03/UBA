-- Listar para cada track el nombre del mismo, el genero y el media type.
SELECT 
    t.Name as  track, g.Name as genero, m.Name as mediatype
FROM 
    Track t 
INNER JOIN 
    Genre g ON t.GenreId = g.GenreId
INNER JOIN
    MediaType m ON t.MediaTypeId = m.MediaTypeId
