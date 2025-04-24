## Ejercicio 3
La operación wait() sobre semáforos suele utilizar una cola para almacenar los pedidos que se
encuentran en espera. Si en lugar de una cola utilizara una pila (LIFO), determinar si habría inanición
o funcionaría correctamente.

Propongo un programa para analizar starvation:

```c
mutex(1) //variable compartida de todos los procesos 

void programm(){
    while(1){
        mutex.wait();
        //procesamiento
        mutex.signal();
    }
}
```

Supongamos que tenemos 3 procesos P1, P2, P3 que corren programm y entran en orden al wait inciialmente.
P1 va a empezar a ejecutar y despues el resto va a correr sus wait metiendose en la LIFO,
donde va a estar primero P3.
Si P1 llega a hacer su wait antes que lo desalojen (es muy probable es hacer el jmp del final del loop al wait) se va a meter primero en la cola y despues P3 va a empezar a ejecutar.
Lo mismo pasa con P3 y asi se pueden estar pasando el mutex entre P1 y P3.
Asi que si, es una posibilidad (bastante alta) que haya starvation, 
la unica posibilidad  de que se ejecute P2 es que el scheduler desaloje a alguno antes de que llegue a 
hacer su wait. 
Este problema no lo tenemos si usamos una cola FIFO

\newpage