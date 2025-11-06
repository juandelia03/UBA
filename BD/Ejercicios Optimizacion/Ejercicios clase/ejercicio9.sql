select soh.* from Sales.SalesOrderHeader soh	
join Sales.SalesOrderDetail sod
    on soh.SalesOrderID = sod.SalesOrderID
where soh.SalesOrderID = 71832 ;

select soh.* from Sales.SalesOrderHeader soh
join Sales.SalesOrderDetail sod
    on soh.SalesOrderID = sod.SalesOrderID

-- La primera consulta hace un join sobre SalesOrderID y además pide la condición where sobre SalesOrderID.
-- SalesOrderID es la PK de SalesOrderHeader así que puede hacer un clustered index seek para encontrarlo.
-- Como eso resulta en una tabla chica (tamaño 1) puede hacer un Nested loop con SalesOrderDetail, que también tiene como Clustering key
-- (SalesOrderID,...). Así que va a ir a buscar con un seek todos los que tengan ese ID para el nested loop.

-- En la segunda en cambio no tenemos la condición soh.SalesOrderID = 71832 así que no podemos hacer directamente eso.
-- Acá como ambas están ordenadas por SalesOrderID se puede hacer un Merge Join.