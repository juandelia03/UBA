## Ejercicio 15 Probar que NC $\subsetneq$ PSPACE. Ayuda: probar que $NC^k \subseteq SPACE(log^k n)$

Algunas aclaraciones antes de empezar:

- $NC = \bigcup_k NC^k$
- $\bigcup_k SPACE(log^k n) \subsetneq PSPACE$ (por teorema de jerarquia espacial es estricta)

Si logramos probar que $NC^k \subseteq SPACE(log^k n)$ vale que:

$\bigcup_k NC^k \subseteq \bigcup_k SPACE(log^k n)$

$NC \subseteq \bigcup_k SPACE(log^k n) \subsetneq PSPACE \Rightarrow NC \subsetneq PSPACE$

Que es  lo que queremos demostrar.

Veamos que vale $NC^k \subseteq SPACE(log^k n)$

Tomo un $\Pi \in NC^k$ cualquiera. Esto significa que hay una familia de circuitos $C_n$ polinomiales y 
de altura $O(log^k n)$

Definamos la maquina de Turing deterministica M que hace simula a C_n de la siguiente manera:

Recorre recursivamente el circuito usando DFS. Sabemos que en DFS solo necesitamos guardarnos en la memoria los nodos
correspondientes a un camino. Como la altura del DAG es $O(log^k n)$ necesitamos esa cantidad de memoria.

En conclusion pordemos reconocer a $\Pi$ con una Maquina deterministica con espacio $O(log^k n)$ como queriamos ver.
Por lo tanto $NC^k \subseteq SPACE(log^k n)$

Queda demostrado que $NC \subsetneq PSPACE$

\newpage
