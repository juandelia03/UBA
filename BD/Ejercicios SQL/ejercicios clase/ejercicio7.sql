SELECT 
    COUNT(t.TrackId) as cantidad, SUM(t.Milliseconds / 60000) as sumatoriaTiempo
FROM
    Track t
INNER JOIN 
    MediaType m on t.MediaTypeId = m.MediaTypeId
WHERE  
    m.Name LIKE '%audio%' AND
    t.Milliseconds > ( 
        SELECT AVG(Milliseconds) FROM Track t2 
        INNER JOIN  MediaType m2 on t2.MediaTypeId = m2.MediaTypeId
        WHERE m2.Name LIKE '%audio%'
        )
