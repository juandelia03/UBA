-- Consulta A
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = 897;
-- Consulta B
DECLARE @prodId INT = 897;
SELECT * FROM Sales.SalesOrderDetail
WHERE ProductID = @prodId;

-- Parecería ser la C