-- Consulta A
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = 870 OR ProductID = 897;
-- Consulta B
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = 870
UNION ALL
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = 897;

-- En mis libros es la B