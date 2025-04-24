## Ejercicio 1 
A continuación se muestran dos códigos de procesos que son ejecutados concurrentemente. La variable X es compartida y se inicializa en 0.

### a) X global inicia en 0
```c
void A()
    X = X + 1;
    printf("%d", X);
```

```c
void B()
    X = X + 1;
```

La salida no es unica. Si A termina sin que corra B, imprime 1. Si B hace el incremento antes del print de A, imprime 2.

### b) Las variables X e Y son compartidas y se inicializan en 0.

```c
void A()
    for (; X < 4; X++) {
    Y = 0;
    printf("%d", X);
    Y = 1;
    }
```

```c
void B()
    while (X < 4) {
        if (Y == 1)
        printf("a");
    }
```

La salida no es unica, lo que si siempre empieza imprimiendo 0 porque sino Y=0 asi que B no imprime nada.
Despues como se puede ejecutar en cualquier orden, siempre que y=1 B puede imprimir a.
El output general seria:

0 a ...a 1 a ... a 2 a ... a 3 a... a

donde a ... a puede ser 0 a'es hasta infinitas.

\newpage