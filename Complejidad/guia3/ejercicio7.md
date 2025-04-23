## Ejercicio 7 Sabiendo que CLIQUE es NP-completo, demostrar que SUBGRAPH ISOMORPHISM es NPcompleto

Quiero ver:

$$<g,k> \in CLIQUE \iff f(<g,k>) \in SUBGRAPHISOMORPHISM$$

F va a tomar $<G,k>$ y deolver $<G,H_k>$

Con $H_k$ un grafo completo de tamaño k.

Veamos que vale: $$<g,k> \in CLIQUE \iff <G,H_k> \in SUBGRAPHISOMORPHISM$$

$\Rightarrow$)

$<g,k> \in CLIQUE \Rightarrow $ G tiene subgrafo completo de tamaño k, lo llamo $G_k$

Notar que $G_k$ es isomorfo a **cualquier** grafo completo de tamaño k.

$\Rightarrow$ $G$ es un grafo y $H_k$ es isomorfo al grafo inducido de $G$ $G_k$ $\Rightarrow$
$<G,H_k> \in  SUBGRAPHISOMORPHISM$

$\Leftarrow$)

$<G,H_k> \in SUBGRAPHISOMORPHISM \Rightarrow$ $G$ grafo y $H_k$ es isomorfo a un grafo inducido de G

$\Rightarrow$ G tiene un subgrafo de tamaño k completo $\Rightarrow$ $<G,k> \in CLIQUE$
