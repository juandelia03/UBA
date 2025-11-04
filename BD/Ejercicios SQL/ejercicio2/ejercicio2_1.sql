-- (a) listar Nombres (FirstName y LastName) de los clientes (Customer ) de Brasil.

SELECT 
    c.FirstName, 
    c.LastName 
FROM 
    Customer c 
WHERE 
    c.Country = 'Brazil'

-- (b) Mediante SQL, AR y CRT listar para cada cliente (Customer ) las facturas (Invoice)
--que tiene. Se deber´a mostrar el nombre del cliente, la fecha y n´umero de factura
--(InvoiceDate e InvoiceID).

SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceDate,
    i.InvoiceId
FROM 
    Customer c 
INNER JOIN 
    Invoice i  ON c.CustomerId = i.CustomerId 

-- (c) Mediante SQL, AR y CRT listar, para cada track, el nombre del artista (Artist) que
-- hizo el Album al que pertenece dicho track.

SELECT
    t.Name,
    a.Name
FROM 
    Track t
INNER JOIN 
    Album al on al.AlbumId = t.AlbumId
INNER JOIN
    Artist a on a.ArtistId = al.ArtistId

-- (e) Mediante SQL obtener los nombres de las PlayList que tienen m´as de 10 tracks de
-- ´albumes de ”Iron Maiden” ¿Es posible resolver esta consulta usando AR y CRT?
-- Justifique la respuesta.

SELECT p.Name
FROM 
    Playlist p
INNER JOIN 
    PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
INNER JOIN 
    Track t on pt.TrackId = t.TrackId
INNER JOIN
    Album al on t.AlbumId = al.AlbumId
INNER JOIN
    Artist ar on ar.ArtistId = al.ArtistId
WHERE
    ar.Name = 'Iron Maiden'
GROUP BY p.Name
HAVING COUNT(*) > 10

-- (f) Mediante SQL indicar cuantos ´albumes tiene cada PlayList. Debe devolver nombre
-- de la PlayList y cantidad de ´albumes. 335

SELECT p.Name,COUNT(distinct al.AlbumId)
FROM 
    Playlist p
INNER JOIN  
    PlaylistTrack pt on pt.PlaylistId = p.PlaylistId
INNER JOIN
    Track t on t.TrackId = pt.TrackId
INNER JOIN 
    Album al on al.AlbumId = t.AlbumId
GROUP BY p.Name

-- (g) Mediante SQL listar los nombres de los empleados (Employee) mayores de 25 a˜nos
-- que tienen al menos una factura (Invoice) con m´as de 10 ´ıtems.


--invoice  no tiene employee id, y customer no tiene edad xd. Voy a traer los clientes
-- con factaras de long > 10

--opcion 1
SELECT 
    c.FirstName,c.LastName
FROM 
    Customer c 
WHERE c.CustomerId IN (
    SELECT 
        i.CustomerId
    FROM 
        Invoice i 
    INNER JOIN 
        InvoiceLine il on i.InvoiceId = il.InvoiceId
    GROUP BY i.InvoiceId,i.CustomerId
    HAVING COUNT(*) > 10
)
-- opcion 2 
SELECT c.FirstName,c.LastName
FROM 
    Customer c
INNER JOIN 
    Invoice i on i.CustomerId = c.CustomerId
INNER JOIN
    InvoiceLine il on il.InvoiceId = i.InvoiceId
GROUP BY c.FirstName,c.LastName,i.InvoiceId
HAVING COUNT(*) > 10

-- (h) Mediante SQL resolver el punto b) incluyendo en el listado los clientes que no tienen
-- ninguna factura.

SELECT 
    c.FirstName,
    c.LastName,
    i.InvoiceDate,
    i.InvoiceId
FROM 
    Customer c 
LEFT OUTER JOIN 
    Invoice i  ON c.CustomerId = i.CustomerId 

-- (i) Mediante SQL listar los nombres de los empleados que soportan clientes con m´as de
-- 10 facturas.

SELECT distinct e.FirstName, e.LastName
FROM
    Employee e
INNER JOIN 
    Customer c on c.SupportRepId = e.EmployeeId
WHERE c.CustomerId in(
    SELECT c2.CustomerId
    FROM 
        Customer c2
    INNER JOIN 
        Invoice i on i.CustomerId = c2.CustomerId
    GROUP BY 
        c2.CustomerId
    HAVING COUNT(*) > 10
)

-- (j) Mediante SQL listar los empleados junto a su jefe. Las tuplas resultantes tendr´an la
-- siguiente forma: (nombre empleado (FirstName), apellido de empleado (LastName),
-- nombre jefe, apellido de jefe)

SELECT e.FirstName as 'nombre empleado' ,e.LastName as 'apellido empleado',b.FirstName as 'nombre jefe',b.LastName as 'apellido jefe'
FROM 
    Employee e
INNER JOIN 
    Employee b on e.ReportsTo = b.EmployeeId

-- (k) Resolver el ´ıtem anterior pero que no falte ning´un empleado en el listado

SELECT e.FirstName as 'nombre empleado' ,e.LastName as 'apellido empleado',b.FirstName as 'nombre jefe',b.LastName as 'apellido jefe'
FROM 
    Employee e
LEFT OUTER JOIN 
    Employee b on e.ReportsTo = b.EmployeeId

-- (l) Obtener mediante SQL el promedio de tracks comprados en las facturas de cada
-- clientes. Es decir si en una factura compro 8 tracks y en otra 4 el promedio es 6.

SELECT c.FirstName, c.LastName, AVG(total)
FROM
    Customer c
INNER JOIN
    (
        -- agrupo por factura y guardo la cuenta de cuantas lineas tiene
        SELECT c2.CustomerId,COUNT(il.InvoiceLineId) AS total
        From 
            Customer c2
        INNER JOIN
            Invoice i on i.CustomerId = c2.CustomerId
        INNER JOIN 
            InvoiceLine il on il.InvoiceId = i.InvoiceId
        GROUP BY 
            c2.CustomerId, i.InvoiceId
    ) AS tabla  on tabla.CustomerId = c.CustomerId
GROUP BY c.FirstName,c.LastName

-- (m) Obtener para cada empleado el total de tracks del genero ”Rock” comprados por los
-- clientes que soporta


SELECT e.FirstName,e.LastName, COUNT(il.InvoiceLineId)
FROM
    Employee e
INNER JOIN 
    Customer c on c.SupportRepId = e.EmployeeId
INNER JOIN
    Invoice i on i.CustomerId = c.CustomerId
INNER JOIN
    InvoiceLine il on il.InvoiceId = i.InvoiceId
INNER JOIN 
    Track t on t.TrackId = il.TrackId
INNER JOIN
    Genre g on g.GenreId = t.GenreId
where 
    g.Name = 'Rock'
GROUP BY
    e.FirstName,e.LastName,e.EmployeeId

