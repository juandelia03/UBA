## Ejercicio 12 Probar que k-CLIQUE está en P para cualquier k $\in$ N. Concluir que dejar parámetros fijos puede cambiar la complejidad de los problemas.

Recordatorio = $\binom{n}{k} = O(n^{k})$

Propongo el siguiente algoritmo:

1. Armar todos los subconjuntos de vertices de tamaño k. $O(n^{k})$

2. Para cada subconjunto, recorrer la matriz para chequear si estan todos conectados. $O(n^{k}.n^2)$

__complejidad total__: $O(n^{k}.n^2)$ que es polinomial con k fijo.

\newpage