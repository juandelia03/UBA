-- Compare los planes de ejecución de las siguientes tres consultas. Explique que hace cada
-- uno y por qu´e se eligen mecanismos de junta diferentes.

SELECT 
    ProductID, PV.BusinessEntityID, Name
FROM 
    Purchasing.ProductVendor PPV 
JOIN 
    Purchasing.Vendor PV ON (PPV.BusinessEntityID = PV.BusinessEntityID)


--ProductID, PV.BusinessEntityID forman la PK de ProductVendor.
-- BussinessEntity tambien es pk de Vendor
-- Este plan hace un equijoin sobre dos tablas sobre un campo que está ordenado (una tabla con clustered y otra no clustered index)
-- por eso puede hacer merge join. 

-- En ProductVendor hace scan de un indice no cluster porque tiene que buscar BusinessEntityID y tiene un indice que lo ordena

--Vendor hace un clustered index scan porque ya está ordenado por BusinessEntityID

--  OBS:
-- para armar el merge va moviendo como punteros. Como ambas tablas están ordenadas por lo mismo puede ir avanazando a la vez 
-- en ambas joineando lo que corresponde


SELECT 
    ProductID, PV.BusinessEntityID, Name
FROM 
    Purchasing.ProductVendor PPV 
JOIN 
    Purchasing.Vendor PV ON (PPV.BusinessEntityID = PV.BusinessEntityID)
WHERE 
    StandardPrice > $10

-- Acá en Vendor usa el clustered index por lo mismo que antes 

-- ProductVendor ahora también usa su clustered index por lo mismo, niguno le da el StandarPrice

-- No se puede hacer merge join porque Product_Vendor esta indexando por (productId,BusinessEntityID) 
-- así que no se cumple la condición para hacer merge
-- Se usa Hash match porque seguramente sea más rapido que Neseted loop, ya que las tablas  no estan preordenadas



SELECT 
    ProductID, PV.BusinessEntityID, Name
FROM 
    Purchasing.ProductVendor PPV 
JOIN 
    Purchasing.Vendor PV ON (PPV.BusinessEntityID = PV.BusinessEntityID)
WHERE 
    StandardPrice > $10 AND Name LIKE N'F%'

-- Aca Primero se busca con clustered index  scan en Vendor por lo mismo que antes y para ademas traer los nombre que tengan ese formato
-- Con ProductVendor se usa el indice de BusinessEntityID (puede hacer seek) así busca los que tiene que joinear.

-- Por lo mismo que en la consulta anterior acá no se puede hacer Merge. Deben ser tablas chicas porque el motor elige hacer nested loop.
-- (por la condicion de formateo del nombre)

-- Despues busca hace un key lookup en ProductVendor (del indice que usamos antes) para buscar el standard price, eso no estaba en el indice
-- y hace un nested loop porque devuelta la tablas es chica


--OBS:
-- En Nested el primer index scan de vendor se trae todos los que cumplen LIKE N'F%'. Eso deberia ser una tabla chiquita
-- con esos resultados busca en la tabla ProductVendor los que tiene que joinear a esos (con index seek)