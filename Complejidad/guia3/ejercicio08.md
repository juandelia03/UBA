## Ejercicio 8 Considerar los siguientes dos lenguajes (consultar): 

**SHORTEST PATH (SP)**  

$\text{SP} = \{ \langle G, s, t, k \rangle : G \text{ es un grafo pesado con dos nodos } 
s \text{ y } t \text{ tales que hay un recorrido de } s \text{ a } t \\
\text{ de peso menor o igual a } k \}$

**ELEMENTARY SP**  

$\text{ELEMENTARY SP} = \{ \langle G, s, t, k \rangle : G \text{ es un grafo pesado con dos nodos } \\
s \text{ y } t \text{ tales que hay un camino simple de } s \text{ a } t 
\text{ de peso menor o igual a } k \}$

---

Demostrar que **ELEMENTARY SHORTEST PATH** es **NP-completo** y que **SHORTEST PATH** está en **P**.

---

**¿Cuál de los dos problemas resuelven los algoritmos de camino mínimo vistos en TDA?**

### a)
Para ver que Shortest Path pertenece a P propongo:
``` python 
def shortest_path(g,s,t,k):
    vector_distancia = dijkstraa(g,s)
    dist_s_t = vector_distancia[t]
    return dist_s_t <= k
```

Que es polinomial porque el algoritmo de dijkstraa es polinomial

### b)
Pertenece a NPC?

__Certificado__: Camino sin repetir nodos de s a t con peso menor a k

__Verificador__: Chequear que efectivamente ese camino esta en el grafo,
que no tiene nodos repetidos y que la longitud del certificado es menor o igal a K.

Es NP-Hard?

Dijkstraa no se puede forzar a no repetir nodos

No se que reduccion puedo hacer con los lenguajes que sabemos que son NPC, ninguno tiene 
que ver con caminos...
Consultar

\newpage