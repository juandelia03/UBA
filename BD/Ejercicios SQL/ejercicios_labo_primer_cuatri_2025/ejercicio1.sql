-- Listar los clientes que han gastado m´as que el promedio de todos los clientes en sus
-- compras. Se debe mostrar: FirstName, LastName y TotalGastado (total gastado por
-- cada cliente) . Ordenado por Total Gastado en forma descendente.

WITH ClientesPorGastado(FirstName,LastName,TotalGastado) as(
    SELECT 
        c.FirstName,c.LastName,SUM(i.Total)
    FROM
        Customer c
    INNER JOIN 
        Invoice i on i.CustomerId = c.CustomerId
    GROUP BY c.CustomerId, c.FirstName,c.LastName
)

SELECT 
    * 
FROM 
    ClientesPorGastado
WHERE 
    TotalGastado > (SELECT AVG(TotalGastado) FROM ClientesPorGastado)
ORDER BY TotalGastado DESC



