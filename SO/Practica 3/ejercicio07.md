## Ejercicio 7
Se tienen N procesos, P0,P1, ..., PN-1 (donde N es un parámetro). Se requiere sincronizarlos de
manera que la secuencia de ejecución sea Pi
,Pi+1, ..., PN-1,P0, ..., Pi-1 (donde i es otro parámetro).
Escriba el código que deben ejecutar cada uno de los procesos para cumplir con la sincronización
requerida utilizando semáforos (no olvidar los valores iniciales).

```c
//codigo compartido i viene dado n tambien 
semaforos[n]
for(j=0;j<n; j++){
    semaforos[j] = sem(0);
    //poner a correr el proceso j asumo que le puedo pasar su i
    correr(proceso,j);
}

semaforos[i].signal() //para que arranque el iesimo
```

```c
proceso(int i){
    semaforos[i].wait();
    //hace lo que tenga que hacer...
    if(i==n){ //si es el ultimo que le mande al primero
        semaforos[0].signal(); 
    } 
    else{
        semaforos[i+1].signal();
    }
}
```

\newpage