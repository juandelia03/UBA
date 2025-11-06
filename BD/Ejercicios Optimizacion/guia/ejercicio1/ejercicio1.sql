-- Explique el funcionamiento de las siguientes consultas y por qu´e los planes de ejecuci´on
-- son diferentes.

SELECT P.Name , P.ProductNumber
FROM Production.Product P
WHERE ProductNumber ='EC-R098'



SELECT P.ProductID , P.ProductNumber
FROM Production.Product P
WHERE ProductNumber ='EC-R098'

-- Si bien las consultas son casi iguales los planes difieren. El primero hace un index Seek por ProductNumer y después 
-- tiene que hacer un key_lookup para buscar el Name ya que esa información no esta en el índice.
-- La seguna consulta simplemente hace el index Seek del product number porque ahí esta todo lo que necesita. Tiene el product number 
-- para le query y el select y el índice también tiene la PK que es Product ID
-- (La primera tiene el nested loop para juntar el name y product number)