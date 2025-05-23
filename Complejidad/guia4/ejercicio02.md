## Ejercicio 2. Argumentar por cardinalidad que hay funciones que no son time-constructible. Dar un ejemplo de una función f con $f(n) \geq n$ que no sea time-constructible.

Para que una funcion sea T.C debe ser **computable** en un tiempo, es decir debe haber una maquina de turing que la
compute en ese tiempo.

Las maquinas de Turing se pueden codificar con cadenas de 1's, es decir, son numerables. $\Rightarrow$ Hay a lo sumo 
numerables funciones T.C

Pero el conjunto de funciones $f:N \rightarrow N$ es no numerable $\Rightarrow$ Hay funciones que no son time-constructible.

Para ele ejemplo voy a aprovechar que se que halt no es computable:

- $f(n) = n^2$ Si la n-esima maquina con entrada n termina
- $f(n) = 2n$ Caso contrario

\newpage