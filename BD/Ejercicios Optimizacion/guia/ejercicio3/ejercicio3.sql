--Mire detalladamente estas consultas y explique los planes de ejecución
SELECT SalesOrderID, SalesOrderDetailID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43683 AND SalesOrderDetailID = 240

SELECT SalesOrderID, SalesOrderDetailID
FROM Sales.SalesOrderDetail
WHERE SalesOrderID = 43683 OR SalesOrderDetailID = 240

-- Para la primera consulta tenemos el indice cluster que ordena como SalesOrderID,SalesOrderDetailID 
-- entonces se puede buscar muy rápido si para los SalesOrderID=43683 hay algun SalesOrderDetailID=240.
--
-- En cambio para la segunda no puedo hacer eso, si miro la cluster key capaz ninguno tiene SalesOrderID=43683 pero 
-- hay algún SalesOrderDetailID = 240. Entonces Conviene recorrer el indice (posiblemente el más chico que haya)  ProductID
-- que tiene la PK -> (SalesOrderID,SalesOrderDetailID). Se hace un scan entero de esto y chequea si alguno cumple la condición.
--
-- Es por eso que la segunda consulta (scan) es más lenta que la primera (seek)