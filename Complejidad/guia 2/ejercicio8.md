# Ejercicio 8
Considerar el siguiente lenguaje:
CONNECTED = {⟨G, s, t⟩ : G es un digrafo y s y t dos nodos de G tales que hay un
recorrido de s a t}
Para un digrafo G, sea H el digrafo que tiene un vértice (S, v) para cada S ⊆ V (G) y cada
v ∈ V (G), donde (S, v) → (R, w) es una arista de H si y solo si w $\notin$ S, R = S ∪ {w} y v → w es
una arista de G.

## a) 

Demostrar que ⟨G, s, t⟩ ∈ HAMPATH ⇐⇒ ⟨H,({s}, s),(V (G), t)⟩ ∈ CONNECTED.

$\Rightarrow$)
Si hay Hamiltoneano en G de s a t hay un camino de forma:

$$s \rightarrow v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_n \rightarrow t$$

tal que:

$V(g) = \{s,v_1,...v_n,t\}$

Por la definicion de H, Hay camino analogo en H tq:

$$(\{s\}, s) \rightarrow (\{s,v_1\}, v_1) \rightarrow 
(\{s,v_1,v_2\}, v_2) \rightarrow (\{s,v_1,v_2,...,v_n\}, v_n)\rightarrow 
(\{s,v_1,v_2,...,v_n,t\}, t) = (V(g), v_n)$$

$$\Rightarrow <H,({s},s),(V(g),t)> \in CONNECTED$$

$\Leftarrow$)

Por como esta definido $H$ cada vez que se "camina" de un nodo a otro, el destino se agrega 
a la primera componente del vertice de H donde se forma un conjunto de los nodos ya visitados en el "camino actual" (quedan de la pinta (camino, nodo_actual)). 
Notar que en su definicion no permite tener nodos repetidos en el conjunto.

Entonces como por hipotesis hay camino de $(\{s\},s)$ a $(V(g),t)$ necesariamente tuvo que haber
recorrido todos los nodos del grafo de forma:

$$(\{s\}, s) \rightarrow (\{s,v_1\}, v_1) \rightarrow 
(\{s,v_1,v_2\}, v_2) \rightarrow (\{s,v_1,v_2,...,v_n\}, v_n)\rightarrow 
(\{s,v_1,v_2,...,v_n,t\}, t) $$

Por definicion de H a partir de G, el camino analogo existe en G:

$$s \rightarrow v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_n \rightarrow t$$

$$\Rightarrow <G,s,t> \in HAMPATH$$

__queda demostrado__

## b)
Mostrar que la reducción de HAMPATH a CONNECTED implicada por el punto anterior
__no__ es polinomial.

Se ve que no es polinomial porque las aristas del grafo H se forman a partir de todos los caminos 
posibles en cada arista.
Mas precisamente por la definicion de $H$:

$|V(H)| = |\{(S,v): S \subseteq V(G) \}| = n . 2^n $

Es exponencial respecto al tamaño de la entrada.
