DECLARE @productId INT = 897;
SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = @productId
OPTION (OPTIMIZE FOR (@productId = 897));

SELECT * FROM Sales.SalesOrderDetail WHERE ProductID = @productId
OPTION (OPTIMIZE FOR (@productId = 870));

-- D