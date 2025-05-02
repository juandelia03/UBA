## Ejercicio 3 Probar que los siguientes lenguajes están en NP.

### HAMPATH = {⟨G, s, t⟩ : G es un grafo con dos nodos s y t tales que hay un camino hamiltoniando de s a t}

Certificado: Lista de los nodos que forman el camino hamiltoneano (camino que pasa por todos los nodos si repetir)

Es polinomial tiene tamaño O(|V|) o O(nlogn).

```py
def verificador(g,s,t,c):
    for cada nodo en el certificado-1:
        if(g[c[i]][c[i+1]]) == 0:
            return false // si no son adyacentes los nodos que tienen que serlo
                         //  para armar el caminio da falso
    return length(c) == length(g.V) and sinRepetidos(c) and c[0] == s and c[-1] == t
```

Esto corre en O(|c|) que es polinomial

### falta agregar...

\newpage