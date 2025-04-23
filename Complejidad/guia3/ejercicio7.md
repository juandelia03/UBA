## Ejercicio 7 Sabiendo que CLIQUE es NP-completo, demostrar que SUBGRAPH ISOMORPHISM es NPcompleto

Quiero ver:

$$ \langle g,k \rangle \in CLIQUE \iff f(\langle g,k\rangle) \in SUBGRAPHISOMORPHISM$$

F va a tomar $G,k$ y deolver $G,H_k$

Con $H_k$ un grafo completo de tamaño k.

Veamos que vale: $$\langle g,k\rangle \in CLIQUE \iff \langle G,H_k\rangle \in SUBGRAPHISOMORPHISM$$

$\Rightarrow$)

$\langle g,k \rangle \in CLIQUE \Rightarrow$ G tiene subgrafo completo de tamaño k, lo llamo $G_k$

Notar que $G_k$ es isomorfo a **cualquier** grafo completo de tamaño k.

$\Rightarrow$ $G$ es un grafo y $H_k$ es isomorfo al grafo inducido de $G$ $G_k$ $\Rightarrow$
$\langle G,H_k\rangle \in  SUBGRAPHISOMORPHISM$

$\Leftarrow$)

$\langle G,H_k\rangle \in SUBGRAPHISOMORPHISM \Rightarrow$ $G$ grafo y $H_k$ es isomorfo a un grafo inducido de G

$\Rightarrow$ G tiene un subgrafo de tamaño k completo $\Rightarrow$ $\langle G,k\rangle \in CLIQUE$

\newpage