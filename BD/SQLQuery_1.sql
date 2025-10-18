--aux

SELECT 
    object_name(cols.object_id) tabla
    ,cols.name columna
    ,ind.name indice
    ,ind.type_desc tipo
    ,ind.is_unique 
    FROM 
    sys.columns cols, sys.indexes ind , sys.index_columns ind_cols
    where 
    cols.object_id = ind.object_id
    and cols.object_id = ind_cols.object_id
    and cols.column_id = ind_cols.column_id
    and ind.index_id = ind_cols.index_id
    and object_name(cols.object_id) LIKE 'CreditCard'
    order by object_name(cols.object_id), ind.name;

--Consulta 3

-- busca por el indice porque es más rapido que la tabla. Contar los UnitPrice
-- es lo mismo que la cantidad de entradas porque no es nulleable.
-- No hace falta ir fila por fila viendo cual no es null
select count(UnitPrice) from sales.SalesOrderDetail; 


-- Carrier tracking es nullable.  Entonces tiene que usar Clustered Index Scan
-- para ver uno por uno cual es null.
select count(CarrierTrackingNumber) from sales.SalesOrderDetail;

--consulta 4

-- El primer join no lo  hacer porque no lo necesita para conseguir ProductNumber. Es inncecesario joinear con SpecialOffer
-- No agrega elementos ese join
select p.ProductNumber from Sales.SpecialOffer so
join Sales.SpecialOfferProduct sop on so.SpecialOfferID = sop.SpecialOfferID
join Production.Product p on sop.ProductID = p.ProductID


-- Aca en cambio joinea todas porque le pedimos todos lo campos
select * from Sales.SpecialOffer so
join Sales.SpecialOfferProduct sop on so.SpecialOfferID = sop.SpecialOfferID
join Production.Product p on sop.ProductID = p.ProductID

-- consulta 5 ????

select AddressID, City, StateProvinceID, ModifiedDate
from  Person.Address
where StateProvinceID = 32

select AddressID, City, StateProvinceID, ModifiedDate
from Person.Address
where StateProvinceID = 20

-- consulta 6

--en esta hay directamente un indice que nos da todo (index seek)
Select AddressLine1, AddressLine2, City from Person.Address 
where AddressLine1 like '1%';

--en esta hay directamente un indice que nos da todo pero pareceria que hay que recorrer mas la tabla,
-- seguramente para ver hasta donde hay unos (index scan)
Select AddressLine1, AddressLine2, City from Person.Address 
where AddressLine1 NOT like '1%';

-- aca busca directo con la PK 
Select AddressLine1, AddressLine2, City, ModifiedDate from Person.Address 
where AddressLine1 like '1%';

-- 10

-- CardType va recorriendo los inidices para ver cada entrada, como sabe que son pocos
-- hashea cada uno y asi encuentra la entrada asociada 
select distinct(CardType) from Sales.CreditCard;


--mira cuantas entradas hay en el indice Cardnumber directamente
select distinct(CardNumber) from Sales.CreditCard;

