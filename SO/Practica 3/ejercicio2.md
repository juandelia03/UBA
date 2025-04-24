## Ejercicio 2
Se tiene un sistema con cuatro procesos accediendo a una variable compartida x y un mutex, el
siguiente código lo ejecutan los cuatro procesos. Del valor de la variable dependen ciertas decisiones
que toma cada proceso. Se debe asegurar que cada vez que un proceso lee de la variable compartida,
previamente solicita el mutex y luego lo libera. ¿Estos procesos cumplan con lo planteado? ¿Pueden
ser víctimas de race condition?

```c
x = 0; // Variable compartida
mutex(1); // Mutex compartido
while (1) {
    mutex.wait();
    y = x; // Lectura de x
    mutex.signal();
    if (y <= 5) {
        x++;
    } else {
        x--;
    }
}
```

No cumple lo planteado, cuando hacemos x++ tambien estamos leyendo la varible. 
Primero la lee, despues la aumenta y por ultimo la guarda en memoria.

Puede haber race condition: Si un proceso hace x++ y antes de guardar en memoria lo desalojan,
si vuelve a ejecturse despues de varias escrituras en x va a guardar un valor viejo de x a la memoria.

La solucion seria meter todo enla zona critica del mutex.