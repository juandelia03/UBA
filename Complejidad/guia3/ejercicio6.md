## Ejercicio 6 Suponiendo que P = NP, diseñar un algoritmo polinomial que dado un grafo G retorne una clique de tamaño máximo de G.

Por hipotesis tengo una maquina polinomial Clique(g,k) que me dice si G tiene una clique de tamaño k.

Busco primero el tamaño maximo de clique en G.
Para cada nodo n chequeo si G-n sigue teniendo clique de tamaño maximo. Si se mantiene significa que
n es dispensable asi que lo saco del grafo. Cuando termine de recorrer solo quedan nodos "indispensables"
que forman la clique asi que devuelvo los nodos restantes en el grafo.

```
def max_clique(g):
    tamaño = 0
    for i in range(|g.v|+1):
        if clique(g,i):
            tamaño++
        else:
            break

    for nodo in g.v:
        if(clique(g.sin_nodo(nodo),tamaño)): // si hay clique de tamaño maximo en el grafo sin n, saco a n
            g.sacar_nodo(n)
    return g.v // retorno los que quedaron, es decir los que forman la clique
```

Calcular el tamaño maximo es polinomial, por cada nodo del grafo que es polinomial respecto a su tamaño realizo una
operación polinomial (clique).

Despues Simplemente vuelvo a recorrer la lista y hago operaciones polinomiales.
