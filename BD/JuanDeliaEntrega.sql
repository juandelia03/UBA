-- Consulta 1
-- Cantidad de traks por artista precio mayor a 1
SELECT 
    a.ArtistId as artistid, a.Name as name ,COUNT(t.TrackId) as cantidad
FROM 
    Artist a
INNER JOIN 
    Album al on al.ArtistId = a.ArtistId
INNER JOIN
    Track t on t.AlbumId = al.AlbumId
WHERE t.UnitPrice > 1
GROUP BY a.ArtistId,a.Name
GO

-- Consulta 2 
--Empleados con cantidad de clientes asignados
SELECT 
    e.EmployeeId as employeeid, e.FirstName as firstname, e.LastName as lastname, e.Phone as phone ,e.City as city,e.Email as email,
    b.FirstName as Bossfirst_name, b.LastName as Bosslast_name, b.Title as boss_title,
    COUNT(c.CustomerId) as CustomerAassignedQuantity
FROM
    Employee e
LEFT JOIN 
    Employee b on e.ReportsTo = b.EmployeeId
LEFT JOIN 
    Customer c on c.SupportRepId = e.EmployeeId
GROUP BY e.EmployeeId,e.FirstName,e.LastName,e.Phone,e.City,e.Email,b.FirstName,b.LastName,b.Title
GO

-- Consulta 3
--Empleados mas jovenes y viejos
WITH masViejos(FirstName,LastName,Country,BirthDate) as(
    SELECT
        FirstName,LastName,Country,BirthDate
    FROM 
        Employee
    WHERE BirthDate = (
        SELECT MIN(BirthDate) FROM Employee
    )
),

masJovenes(FirstName,LastName,Country,BirthDate) as(
    SELECT
        FirstName,LastName,Country,BirthDate
    FROM 
        Employee
    WHERE BirthDate = (
        SELECT MAX(BirthDate) FROM Employee
    )
)

SELECT * FROM masViejos 
UNION 
SELECT * FROM masJovenes


GO
-- Consulta 4 
-- Generos con menos de 100 de ventas
SELECT 
    g.Name as Genero ,SUM(il.UnitPrice * il.Quantity) as Total
FROM 
    Genre g
LEFT JOIN
    Track t  on t.GenreId = g.GenreId
INNER JOIN 
    InvoiceLine il on il.TrackId = t.TrackId
GROUP BY g.GenreId,G.Name
HAVING SUM(il.UnitPrice * il.Quantity) < 100
ORDER BY SUM(il.UnitPrice * il.Quantity) DESC



GO
-- Consulta 5 
-- Media Type con tracks no vendidos
SELECT 
    m.Name as name, COUNT(t.TrackId) as cantidad
FROM 
    MediaType  m
LEFT JOIN
    Track t on m.MediaTypeId = t.MediaTypeId
LEFT JOIN 
    InvoiceLine il on il.TrackId = t.TrackId
WHERE il.InvoiceLineId IS NULL
GROUP BY m.Name

GO
