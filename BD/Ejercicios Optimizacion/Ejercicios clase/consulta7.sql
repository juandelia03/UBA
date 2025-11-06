select count(EndDate) from Production.WorkOrder

select count(OrderQty) from Production.WorkOrder

-- La primera consulta hace el scan sobre el clustered index porque es nullable y no hay un indice para EndDate

-- La segunda consulta cuenta OrderQty que no es nullable así que puede recorrer un índice contar todas las filas.
-- Elige el de ScrapReasonID (smallint) porque es más chico que el de ProductID (int)