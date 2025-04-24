## Ejercicio 9
Suponer que se tienen N procesos Pi, cada uno de los cuales ejecuta un conjunto de sentencias ai y bi. 
¿Cómo se pueden sincronizar estos procesos de manera tal que los bi se ejecuten después de que
se hayan ejecutado todos los ai?

Uso la idea de "barrera" que vimos en clase y en el ejercicio 5 de la guia.

```c
//variables compartidas (todos conocen n tambien)
int contador = 0;
mutex = sem(1);
barrera = sem(0);
```

```c
void proceso(){
    ai(); //ejecutar conjunto de sentencias...

    mutex.wait(); //mutex para evitar race condition (el contador lo usa todo P)
    
    contador++;
    if(contador == n){
        barrera.signal();//ya terminaron los n, abre barrera
    }
    
    mutex.signal();
    
    barrera.wait();
    barrera.signal(); //efecto cascada

    bi(); // ahora ejecuta el  resto
}
```

\newpage