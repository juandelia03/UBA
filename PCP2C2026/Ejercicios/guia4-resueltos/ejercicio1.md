# Ejercicio 1

## Granularidad gruesa

No hay problemas por la sincronizacion, justamente por la granularidad gruesa. Hay que resolver el tema de las colisiones nada mas.

- Add(o): Recorro la lista igual que antes. Si encuentro el hash de o hay dos casos:
    1.  Si el valor de ese nodo es el mismo "o" retorno falso. Ya estaba en la lista. 
    2. Si es distinto de "o" y apunta a un nodo con un hash distinto, agrego a o. Si apunta a otro nodo que tambien tiene el mismo hash sigo recorriendo

- Remove(o): Cuando quiero eliminar un elemento no basta con encontrar su hash, tengo que chequear que ademas sus valores matcheen.

- Contains: misma idea que el remove

## Granularidad fina

Creo que no hace falta cambiar nada mas que lo que dije antes. Hay que mantener el esquema de hand over hand locking pero 
manejando las colisiones como ya explique.

## Optimista

No veo que haya que cambiar nada mas que lo que dijimos

## Lazy

Mismo: hay que chequear el valor del nodo puntual al momento de hacer el soft delete y mirar si estan soft delete para chequear los valores antes de hacer los add. 
Despues es todo igual.



---- 

No se si entendi el ejercicio pero no veo problemas de concurrencia. Todas las implementaciones cambian pero la estrategia de concurrencia
es igual , nada mas que para las operaciones no basta con mirar el hash si no tambien el valor del objeto. Teniendo en cuenta la estructura
que defini en granularidad gruesa.