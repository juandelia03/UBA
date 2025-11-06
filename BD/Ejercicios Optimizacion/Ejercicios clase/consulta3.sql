select count(UnitPrice) from sales.SalesOrderDetail;

select count(CarrierTrackingNumber) from sales.SalesOrderDetail;

-- La primera consulta hace count(UnitPrice) y UnitPrice no es nullable. Entonces Puede directamente contar filas.
-- Para esto puede scannear el índice más chico e ir contando.

-- La segunda en cambio hace count(CarrierTrackingNumber) y CarrierTrackingNumber es nullable. Entonces no basta con contar
-- todas las filas sino que hay que contar las que no tenga null en esa columna. Como no tiene índice tiene que hacer un scan del clustered