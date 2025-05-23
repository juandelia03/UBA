## Probar que los siguientes lenguajes estan en PSPACE

### Clique

Se puede resolver usando backtracking generando cada subconjunto de vertices posible
y viendo si forman un subconjunto completo de k nodos.

La altura del arbol de backtracking es k <= n.  (Porque a lo sumo forma conjuntos con k nodos).

En cada nodo del arbol de backtracking esta el grafo, el subconjunto de nodos y ponele que el contador que dice cuantos nodos tiene.

Al subconjunto lo puedo acotar por el tamaño del grafo. Y al contador por un numero k menor o igual a n.
Entonces cada nodo tiene tamaño O(2.|G| + n). 

Cuando hacemos backtracking hay en memoria una rama de ejecucion nada mas asi que como la altura del arbol es k, 
hay a lo sumo k nodos (k < n ):

Complejidad total: O(n (2|G| + n)) = O(n^3) que es PSPACE

### Formula mas chica

Puedo armar con backtracking todas las posibles formulas de tamaño 0  a $\phi$ Y para cada una verificar si es o no equivalente a $\phi$ Para hacer eso tengo que probar todas las asignaciones posibles, pero eso es PSPACE.

Cada nodos del arbol de backtracking tendria una formula que esta acotada por el tamaño de $\phi$. 
La altura del arbol es a lo sumo k entonces:

Complejidad espacial: $O(|\phi|^{2})$

### TATETI

Se puede hacer backtracking explorando todas las jugadas. Para que haya estrategia ganadora el algoritmo chequea que existe jugada
para el jugador uno (ganadora) tal que para toda jugada del jugador 2 exista otra jugada para el jugador 1 ganadora, y asi
hasta que el jugador 2 pierda.

Cada nodo del arbol de backtracking tiene la matriz. Tiene a lo sumo altura k^2, se pueden  jugar todas las celdar.

Complejidad espacial: $O(k^4)$

\newpage