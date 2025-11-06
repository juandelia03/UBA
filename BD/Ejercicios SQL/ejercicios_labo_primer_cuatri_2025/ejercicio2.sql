-- Clientes con compras de distintos g´eneros

SELECT 
    c.FirstName,c.LastName, COUNT(DISTINCT t.GenreId) as CantidadGeneros
FROM
    Customer c
INNER JOIN 
    Invoice i on i.CustomerId = c.CustomerId
INNER JOIN
    InvoiceLine il on i.InvoiceId = il.InvoiceId
INNER JOIN 
    Track t on t.TrackId = il.TrackId
GROUP BY c.CustomerId,c.FirstName,c.LastName
HAVING COUNT(DISTINCT t.GenreId) > 1
ORDER BY CantidadGeneros DESC