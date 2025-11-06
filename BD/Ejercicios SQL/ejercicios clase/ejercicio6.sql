--Obtener el dinero recaudado por cada empleado durante cada a˜no.
--¿Como extraer un campo de una fecha?
SELECT
    e.EmployeeId, Datepart(year,i.InvoiceDate) as year , SUM(i.Total) as monto
FROM 
    Employee e
LEFT JOIN
    Customer c on c.SupportRepId = e.EmployeeId
INNER JOIN 
    Invoice i on i.CustomerId = c.CustomerId
GROUP BY e.EmployeeId, Datepart(year,i.InvoiceDate)
order by monto