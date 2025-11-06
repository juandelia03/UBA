-- Consulta A
SELECT *
FROM Sales.SalesOrderDetail d
JOIN Production.Product p
ON d.ProductID = p.ProductID
WHERE p.ProductID = 870;
-- Consulta B
SELECT *
FROM Sales.SalesOrderDetail d
JOIN Production.Product p
ON d.ProductID = p.ProductID
WHERE p.Color = 'Black';


-- D