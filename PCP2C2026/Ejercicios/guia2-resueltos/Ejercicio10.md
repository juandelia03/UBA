# Ejercicio 10 Pseudocodigo

## Variables globales

``` Java
CANTIDAD_MAQUINAS

Semaphore[CANTIDAD_MAQUINAS] cargar_maquina = {new Semaphore(1), ...}
Semaphore[CANTIDAD_MAQUINAS] descargar_maquina = {new Semaphore(0), ...} 
Semaphore[CANTIDAD_MAQUINAS] producir = {new Semaphore(0), ...}


```



## Thread vehiculos

Las rutas tienen pinta [(C, Plataforma), (D,M1_idx), ...]

``` Java
Thread V(ruta){
    for entrega in ruta{
        if esCarga(entrega){
            cargar_vehiculo(entrega)
        } else {
            descargar_vehiculo(entrega)
        }
    }
}

// el vehiculo descarga lo que tiene y lo mete en la maquina
descargar_vehiculo(entrega){
    if entrega[1] == 'Plataforma' {
        // descargar asi nomas no hay ninguna constraint de sincronizacion en el enunciado. 
        // Si tocara un contador o algo asi habria que meter un mutex.
        //salir de la func
    }
    idx = entrega[1]
    cargar_maquina[idx].acquire();
    descargar();
    producir[idx].release();
}

// el vehiculo carga lo que producio la maquina
cargar_vehiculo(entrega){
    if entrega[1] == 'Plataforma' {
        // cargar asi nomas no hay ninguna constraint de sincronizacion en el enunciado. 
        // Si tocara un contador o algo asi habria que meter un mutex
        //salir de la func
    }
    idx = entrega[1]
    descargar_maquina[idx].acquire();
    cargar();
    cargar_maquina[idx].release();
}

```

## Thread maquinas

``` Java
Thread M(idx){
    while (true){
        producir[idx].acquire();
        producir();
        descargar_maquina[idx].release();
    }
}
```