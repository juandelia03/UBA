## Ejercicio 13 El problema HALF-CLIQUE consiste en determinar si un grafo G de tamaño n tiene un completo de tamaño n/2. Sabiendo que CLIQUE es NP-completo, demostrar que HALF-CLIQUE es NPcompleto. ¿Por qué este resultado no contradice el hecho de que k-CLIQUE es polinomial para todo k?

$HALF-CLIQUE \in NP$?:

Certificado: Conjunto de nodos que forman la half clique

Verificador: Ver que esten todos conectaadosy que el |certificado| $\geq$ n/2

Es NP-Hard? Veo la reduccion:

$<G,k> \in CLIQUE \iff f(<G,k>) \in HALF-CLIQUE$

Idea para la funcion:

Si g es mas chico que n/2 puedo armar g' agregando nuevos nodos que formen una clique y que cada nodo
se conecte a los originales de g. De esta manera si en G tenia una clique de tamaño k, g' va a tener clique de tamaño k+x, siendo x el tamaño de la clique nueva.

Cuantos nodos tiene que tener esa clique de x nodos? Veamos que se tiene que cumplir lo siguiente:

$$
n' = n + x
$$
$$
\frac{n'}{2} = k+x
$$
Siendo n' la cantidad de nodos de G'.
Quiero que $\frac{n'}{2}$ sea la cantidad de nodos de la clique original mas los que tenga que agregar

Es un despeje sencillo y obtenemos:

$$
x = n - 2k
$$

$$
n' = n + n - 2k = 2n - 2k
$$

Por lo que el tamaño de la CLIQUE en G' va a ser:

$$
\frac{n'}{2} = n-k
$$

Propongo la siguiente funcion:

```py
f(G,k):
    if k < len(G.v):
        return el grafo "G'" igual a G y con una clique nueva de tamaño (n-k)/2, donde cada nodo
        esta conectado a cada nodo de G
    else:
        return G 
```

Veamos que es verdadero:

$$<G,k> \in CLIQUE \iff G' \in HALF-CLIQUE$$

$\Rightarrow$)

$$
<G,k> \in CLIQUE \Rightarrow^{nota_1}
<G',k+n-2k> \in CLIQUE \Rightarrow \\
<G',n-k> \in CLIQUE \Rightarrow
$$

$$
<G', \frac{n'}{2}> \in CLIQUE \Rightarrow  \\
<G'> \in HALF-CLIQUE
$$

$nota_1:$ G' tiene clique con x (x=n-2k) mas nodos que G por como la defini.

$\Leftarrow$)

$$G' \in HALF-CLIQUE \Rightarrow 
<G',n-k> \in CLIQUE \Rightarrow^{nota_2}$$

$$
<G,(n-k)-(n-2k)> \in CLIQUE \Rightarrow 
<G,k> \in CLIQUE
$$

$nota_2$: G tiene clique con x menos nodos que en G' (x=n-2k).

\newpage