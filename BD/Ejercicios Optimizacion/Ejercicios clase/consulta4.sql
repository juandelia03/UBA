select p.ProductNumber from Sales.SpecialOffer so
join Sales.SpecialOfferProduct sop on so.SpecialOfferID = sop.SpecialOfferID
join Production.Product p on sop.ProductID = p.ProductID

-- Este plan hace solamente el join entre Product y SpecialOfferProduct y se trae el número de esos. Puede hacer esto
-- porque todos SpecialOfferProduct está en SpectialOffer y hacer ese join no agrega niguna información
-- Como SpecialOfferProduct tiene un indice para ProductID y product lo tiene como PK se puede hacer merge join


select * from Sales.SpecialOffer so
join Sales.SpecialOfferProduct sop on so.SpecialOfferID = sop.SpecialOfferID
join Production.Product p on sop.ProductID = p.ProductID

-- Acá en cambio es necesario hacer todos los join porque hace SELECT *, así que también necesitamos la información de las SpecialOffer.
-- Primero hace un Join Nested de SpecialOffer con SpecialOfferProduct. Como SpecialOffer es una tabla muy chica y SpecialOfferProduct 
-- esta indexada por SpecialOfferID es muy barato hacer el Nested loop de la tabla chica haciendo index seek en la otra.

-- Con esa tabla resultante hace un Hash Join con Product, ya que Product es una tabla bastante grande y además la otra tabla no
-- está ordenada por ProductID