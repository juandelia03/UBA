## Ejercicio 8
Considere cada uno de los siguientes enunciados, para cada caso, escriba el código que permita
la ejecución de los procesos según la forma de sincronización planteada utilizando semáforos (no se
olvide de los valores iniciales). Debe argumentar porqué cada solución evita la inanición:

### 1 
Se tienen tres procesos (A, B y C). Se desea que el orden en que se ejecutan sea el orden
alfabético, es decir que las secuencias normales deben ser: ABC, ABC, ABC, ...

```c
//variables compartidas
semA = sem(1);
semB = sem(0);
semC = sem(0);
```

```c
A(){
    while(1){
        semA.wait();
        tarea_A();
        semB.signal();
    }
}
B(){
    while(1){
        semB.wait();
        tarea_B();
        semC.signal();
    }
    
}
C(){
    while(1){
        semC.wait();
        tarea_C();
        semA.signal();
    }

}
```

Se ve que no hay inanicion, arranca desde el 1 porque el resto esta en 0. Despues se van abriendo los
semaforos en orden.

### 2

Idem anterior, pero se desea que la secuencia normal sea: BBCA, BBCA, BBCA, ...

```c
//variables compartidas
semA = sem(0);
semB = sem(2);
semC = sem(0);
```

```c
A(){
    while(1){
        semA.wait();
        tarea_A();
        semB.signal();
        semB.signal();
    }
}
B(){
    int contador = 0;
    while(1){
        semB.wait();
        tarea_B();
        contador++;
        if(contador == 2){
            contador = 0;
            semC.signal();
        }
    }
    
}
C(){
    while(1){
        semC.wait();
        tarea_C();
        semA.signal();
    }

}
```

Por lo mismo que antes no tengo inanicion.

### 3 
Se tienen un productor (A) y dos consumidores (B y C) que actúan no determinísticamente.
La información provista por el productor debe ser retirada siempre 2 veces, es decir que las
secuencias normales son: ABB, ABC, ACB o ACC. Nota: ¡Ojo con la exclusión mutua!

```c
// compartidas 
int contador = 0;
sp = sem(1);
sc = sem(0);
mutex = sem(1);
```

```c
A(){
    while(1){
        sp.wait();
        producir();
        sc.signal();
        sc.signal();
    }
}

B(){
    while(1){
        sc.wait();
        consumir(); // si lo unico que hace es leer no hace falta que este en el mutex
        mutex.wait();
        contador++;
        if(contador==2){
            contador = 0;
            sp.signal();
        }
        mutex.signal();
    }
}

C(){
    while(1){
        sc.wait();
        consumir(); // si lo unico que hace es leer no hace falta que este en el mutex
        mutex.wait();
        contador++;
        if(contador==2){
            contador = 0;
            sp.signal();
        }
        mutex.signal();
    }
}

```

### 4

Se tienen un productor (A) y dos consumidores (B y C). Cuando C retira la información, la
retira dos veces. Los receptores actúan en forma alternada. Secuencia normal: ABB, AC, ABB,
AC, ABB, AC...

```c
//compartidas
SP = sem(1);
SB = sem(0);
SC = sem(0);
i = 0;
```

```c
A(){
    while(1){
        SP.wait();
        
        producir();
    
        if(i==0){ //le toca a B
            SB.signal();
            SB.signal();
        } else{ //va C
            SC.signal();
        }
    }
}

B(){
    int contador = 0;
    while(1){
        SB.wait();
        consumir();

        contador++;

        if(contador == 2){
            contador = 0;
            i = 1;
            SP.signal();
        }
    }
}

C(){
    SC.wait()
    consumir();
    i = 0;
    SP.signal();
}
```