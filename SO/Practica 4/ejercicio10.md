## Ejercicio 10
Se tiene la siguiente matriz:

int A[][] = new int[100][100];

donde A[0][0] está cargado en la posición 200, en un sistema de memoria paginada con páginas de
tamaño 200. Un proceso de manipulación de matrices se encuentra cargado en la primer página, de la
posición 0 a 199, por lo que todo fetch de instrucciones es a la misma página.
Si se tienen sólo 3 frames de páginas, ¿Cuántos fallos de página serán generados por los siguientes
ciclos, utilizando el algoritmo de reemplazo LRU? Suponer que el programa se encuentra en el primer
frame, y los otros dos están vacíos.

### a)
```c
for (int j = 0; j < 100; j++)
    for (int i = 0; i < 100; i++)
        A[i][j] = 0;
```

Primero unas observaciones:

1. El proceso ocupa solo una pagina.

2. A[0][0] ocuapa 1 en la memoria, es decir que toda la matriz ocupa 10000 $\Rightarrow$ $\frac{10000}{200} =$ 50 paginas.

3. como es LRU  no vamos a desalojar nunca a la pagina que contiene al programa, va a estar todo el tiempo accediendo al codigo.

El programa recorre toda la matriz en orden y pone 0. Si este ya esta cargado fetchear sus instrucciones no produce page faults.
Cuando escribimosi el primer A[i][j] (j=0,i=0) tenemos un page fault 
y cargamos su pagina que tiene a ese y las siguientes 199 posiciones:

A[0][0],A[0][1],...,A[0][99], A[1][0],...A[1][99]. Es decir dos filas. 

En la siguiente iteracion nos topamos con A[1][0], que lo tenemos cargado.

Despues llega A[2][0], de vuelta tenemos un page fault pero vamos a cargar al A[3][0].

Se ve que el comportamiento es que despues de un page fault se trae el siguiente elemento que necesita y se salva del siguiente.
Hace un page fault cada dos elementos.

Page fault totales: $\frac{10000}{2} = 5000$

### b) 
```c
for (int i = 0; i < 100; i++)
    for (int j = 0; j < 100; j++)
        A[i][j] = 0;
```

Ahora itera al reves.

1. A[0][0] $\rightarrow$ page-fault, carga A[0][0],A[0][1],...,A[0][99], A[1][0],...A[1][99].

2. A[0][1] $\rightarrow$ hit.

...

100. A[0][99] $\rightarrow$ hit

101. A[1][0] $\rightarrow$ hit 

...

200. A[1][99] $\rightarrow$ hit

201. A[2][0] $\rightarrow$ page-fault, carga las dos siguientes filas.

Este ciclo se repite. Se ve que por cada 2 filas o 200 entradas hace  un unico page fault.

Page fault totales: $\frac{10000}{200} = 50$

\newpage