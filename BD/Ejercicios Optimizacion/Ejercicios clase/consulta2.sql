select NationalIDNumber, BusinessEntityID from HumanResources.Employee 
where NationalIDNumber = '121491555';

select NationalIDNumber, BusinessEntityID from HumanResources.Employee 
where NationalIDNumber = 121491555;

-- Como NationalIDNumber es un varchar en la BD la primera consulta va a poder hacer un seek directamente
-- La segunda on puede porque hace el match contra un numero