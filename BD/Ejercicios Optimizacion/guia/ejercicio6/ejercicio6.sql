-- Compare las siguientes dos consultas y explique la diferencia de planes
SELECT count(NameStyle) FROM Person.Person

SELECT count(Title) FROM Person.Person

-- La primera consulta tiene que contar la cantidad de NameStyle que hay en la tabla
-- como Namestyle no es nullable puede simplemente contar la cantidad de filas sin mirar nada más, es por eso
-- que usa el índice rowguid

-- La segunda en cambio cuenta Title que es Nullable. Acá no puede hacer lo mismo porque count cuenta la cantidad de no nulls.
-- Entonces necesariamente va a tener que recorrer toda la tabla y sumar uno cada vez que verifica que esa fila no tiene NULL
-- en title. Como además no hay un índice para Title tiene que hacer el scan en el Clustered index.