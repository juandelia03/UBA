-- Para cada cliente obtener la cantidad de empleados que viven en la misma 
-- ciudad ordenados descendentemente por cantidad de empleados.

SELECT
    c.CustomerId,c.FirstName,c.LastName, COUNT(e.EmployeeId) as cantidad
FROM
    Customer c
LEFT JOIN
    Employee e ON e.City = c.City AND e.State = c.State AND e.Country = c.Country
GROUP BY
    CustomerId,c.FirstName,c.LastName
ORDER BY cantidad DESC


