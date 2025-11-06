Select AddressLine1, AddressLine2, City from Person.Address 
where AddressLine1 like '1%';

Select AddressLine1, AddressLine2, City from Person.Address 
where AddressLine1 NOT like '1%';

Select AddressLine1, AddressLine2, City, ModifiedDate from Person.Address 
where AddressLine1 like '1%';

-- La primer consulta puede simplemente hacer un index seek porque va a buscar los que empiecen con 1
--  y el índice tiene todo lo que necesita.

-- La segunda hace un Scan porque no sabe por que buscar,solo sabe por que no bysca, va scannear entonces el índice que 
-- tiene todo lo que necesita

-- La tercera consulta hace Select de una consulta que no está en ningún indice. Entonces necesariamente
-- tiene que hacer el scan del clustered index