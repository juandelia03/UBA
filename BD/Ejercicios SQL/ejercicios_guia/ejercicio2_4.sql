-- 2.4. Considerando el esquema de base de datos Chinook
-- (a) Mediante SQL, AR y CRT obtener los playlist que no contengan ning´un track de los
-- albumes de los artistas “Black Sabbath” o “Chico Buarque”

--todas las playlist
SELECT Name FROM Playlist

EXCEPT
--las playlist que contengan tracks de esos artistas
SELECT DISTINCT
    p.Name
FROM
    Playlist p
INNER JOIN
    PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
INNER JOIN 
    Track t on t.TrackId = pt.TrackId
INNER JOIN
    Album al on al.AlbumId = t.AlbumId
INNER JOIN
    Artist a on a.ArtistId = al.ArtistId
WHERE a.Name = 'Black Sabbath' OR a.Name = 'Chico Buarque'


-- (b) Mediante SQL, AR y CRT obtener los clientes que compraron tracks de un ´unico
-- genero.

WITH ClientesPorGenero(id,nombre,apellido,genero) as(
    SELECT DISTINCT c.CustomerId,c.FirstName, c.LastName,t.GenreId
    FROM
        Customer c
    INNER JOIN
        Invoice i on i.CustomerId = c.CustomerId
    INNER JOIN 
        InvoiceLine il on il.InvoiceId = i.InvoiceId
    INNER JOIN
        Track t on t.TrackId = il.TrackId
    INNER JOIN 
        Genre g on g.GenreId = t.GenreId
)

SELECT 
    c.nombre,c.apellido
FROM 
    ClientesPorGenero c
GROUP BY 
    c.id,c.nombre,c.apellido
HAVING 
    COUNT(c.id) = 1



