-- Estas dos consultas son similares sin embargo los planes son diferentes. Explique lo que
-- est´a ocurriendo

SELECT SalesOrderID, SalesOrderDetailID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 58950


SELECT SalesOrderID, SalesOrderDetailID
FROM Sales.SalesOrderDetail
WHERE SalesOrderDetailID = 68531

-- La primera consulta puede hacer un seek porque la condicion de busqueda es por la 
-- primera parte de la PK que es la clustered, asi que encuentra todos los resultados rápido
-- La segunda tiene que hacer scan del índice porque no hay nada que ordene SalesOrderDetailID  