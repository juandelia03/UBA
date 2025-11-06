select NationalIDNumber, HireDate from HumanResources.Employee 
where NationalIDNumber='121491555';

select NationalIDNumber, BusinessEntityID from HumanResources.Employee 
where NationalIDNumber= '121491555';

-- Hay un índice NationalIDNumber. La primera consulta primero usa el índice para encontrar a los que cumplen el where (puede hacer  un seek) 
-- pero el índice no tiene la información de HireDate. Entonces tiene que hacer un key lookup de esos para encontrar su HireDate

-- La segunda consulta usa el índice NationalIDNumber para encontrar los que cumplen el where. El índice también tiene la PK que es el otro
-- campo del selet así que no necesita hacer nada más que hacer seek en ese índice