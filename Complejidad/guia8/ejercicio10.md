## Ejercicio 10 Probar que $$NC^1 \subseteq L$$

(Esta demostrado en la clase teorica mucho mejor que lo que voy a escribir)

Quiero ver que cualquier lenguaje $\in NC^1$ tambien pertenece a L.

Sea $\Pi \in NC^1$:

Existe $C_n$ una familia de circuitos polinomiales y de profundidad O(log n) que reconoce $\Pi$.

Quiero ver que una maquina M implicitamente computable en L puede simular a los circuitos.

La maquina solo puede traerse espacio logaritmico a la memoria.

Podemos pensar al circuito como un camino de las varibles al sumidero (DAG). Hay que ir viendo cada camino 
para eso hacemos DFS sobre el circuito. Como tiene altura logaritmica y DFS solo guarda de a una rama en memoria, 
se puede hacer con espacio logaritmico. 
De esta manera recorre todas las posibilidades recursivamente y decide $\Pi$

\newpage
