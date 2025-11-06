select AddressID, City, StateProvinceID, ModifiedDate
from  Person.Address
where StateProvinceID = 32

select AddressID, City, StateProvinceID, ModifiedDate
from Person.Address
where StateProvinceID = 20

-- El motor tiene estadisticas. Debe saber que hay muy pocos con StateProvinceID = 32 entonces lo más barato es agarrar el índice
-- de StateProvinceID, buscar los que matchean y hacer el key lookup de los que correspondan
-- Notar que encuentra solo 1!

-- En la segunda debe tener el dato de que hay muchísimso con StateProvinceID = 20, entonces hacer el index seek  en el índice
-- para después tener que hacer el key lookup de cada uno es muy caro. Termina siendo más barato directamente hacer el scan
-- en elclustered index y quedarse con los que cumplen la condición