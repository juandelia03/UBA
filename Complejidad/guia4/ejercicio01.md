## Ejercicio 1.Probar que las siguientes funciones son time-constructible:

def del apunte:

Una función $T : N \rightarrow N$ es construible en tiempo si $T(n) \geq n$ y la función
$1^n \rightarrow [T(n)]$ es computable en tiempo O(T(n)).

### a) $f(n) = n$ 

En la cinta de entrada tengo n en unario. Recorro la cinta de entrada y por cada simbolo que leo lo escribo en la salida.
De esta manera escribo n en la salida en 2n pasos. 

### b) $f(n) = {2^n}$

En la cinta de salida escribo inicialmente un 1.
En la cinta de entrada voy a tener n en unario:

Voy a recorrer la cinta de entrada en orden. Cada vez que lea un 1 voy a duplicar la cinta de salida.
por ejemplo si tengo en la de salida 1111 y leo un uno, me va a quedar 11111111. 

Esto toma n pasos e leer la entrada  y $2^n$ pasos de escribir en la salida (en unario).

### c) $f(n) = n log n$

Al igual que en el punto _a_ puedo escribir $nlogn$ en tiempo 2n. Si la funcion es computable en tiempo n por una maquina
standard, se que es computable en tiempo $n^2$ por una maquina oblivious. 

Como $n^2 > nlogn \Rightarrow$ es time contstructible

### d) $f(n) = n^{\frac{3}{2}}$

idem C