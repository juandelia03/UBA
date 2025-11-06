-- Compare los planes de ejecución de las siguientes consultas. Explique que hace cada uno
-- y en que se basa la elecci´on del optimizador

SELECT P.Name, PSC.Name SubCatrom
FROM Production.Product P
JOIN Production.ProductSubcategory PSC
ON p.ProductSubcategoryID = psc.ProductSubcategoryID


SELECT P.Name, PSC.Name SubCatrom
FROM Production.Product P
JOIN Production.ProductSubcategory PSC
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
ORDER BY psc.ProductSubcategoryID


-- Ambas consultas hacen el join sobre ProductSubcategoryID.


-- La primera solamenet joinea por ProductSubcategoryID. 
-- Product no tiene ningún índice que lo ordene por ProductSubcategoryID así que tiene que hacer un clustered index scan.
--ProductSubcategory tiene como PK ProductSubcategoryID así que puede hacer un scan sobre cualquier índice para ver ProductSubcategoryID de cada fila

-- No se puede hacer un Merge join porque es condición necesaria que ambas tablas estén indexadas por ProductSubcategoryID.
-- Hace un hash join porque es más rápido que hacer un merge join por el tamaño de las tablas.

-- La segunda hace el mismo join pero los pide ordenados.
-- Como Product Subcategory tiene como PK ProductSubcategoryID, ahora hace scan sobre ese indice (clustered) ya que de
-- esta manera ya obtiene las filas ordenadas
-- Product en cambio no tiene ningún índice que ordene por ProductSubcategoryID, así que primero hace un scan con 
-- su índice cluster y lo ordena por ProductSubcategoryID para que así ambas tablas queden ordenadas por la columna que se hace el join.

-- Como ahora ambas están ordenadas por ProductSubcategoryID se puede hacer un Merge Join que es lo más optimo

