## Ejercicio 4

Demostrar que, en caso de que las operaciones de semáforos wait() y signal() no se ejecuten
atómicamente, entonces se viola la propiedad de exclusión mutua, es decir que un recurso no puede
estar asignado a más de un proceso.
__Pista__: Revise el funcionamiento interno del wait() y del signal() mostrados en clase, el cual no
se haría de forma atómica, y luego piense en una traza que muestre lo propuesto.

```c
wait(s){
    while(s<=0) dormir;
    s--;
}
```
```c
signal(s){
    s++;
    if(alguien espera por s) despertar a alguno;
}
```

Imaginemos para un semaforo,S inicialmente en 0 la siguiente secuencia:

1. Un P1 envia un signal, llega a terminar el s++ y lo interrumpe el scheduler.

2. Un P2 retoma su ejecucion y llega a un wait(), en el wait no entra al while porque s=1.
P2 decrementa s y se pone a ejecutar el recurso del semaforo.

3. En ese instante P1 se despierta y ejecuta el if que le quedo pendiente, despertando a un P3 
que esperaba por el semaforo.

Asi el recurso del semaforo esta asignado a P2 y P3