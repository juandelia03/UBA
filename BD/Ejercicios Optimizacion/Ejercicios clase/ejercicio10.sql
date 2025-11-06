select distinct(CardType) from Sales.CreditCard;

select distinct(CardNumber) from Sales.CreditCard;

-- En la primera tiene que asegurarse de no traer repetidos. Entonces scannea el indice cluster y va armando 
-- la tabla de los tipos de tarjeta pasando la columna CardType de cada fila a la tabla de hash.
-- Esta es la manera menos costosa que encontró de evitarse los repetidos.

-- Para la segunda consulta hay un indice que ordena por CardNumber y además tiene IsUnique. Entonces 
-- no tiene que hacer nada para asegurarse que son únicas. Scannea el índice y trae todo