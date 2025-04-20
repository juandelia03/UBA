# Ejercicio 5

$\Rightarrow$)

Por hipótesis hay camino de longitud par <= k de s a t en g, en general:

$s \rightarrow v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_n \rightarrow t$

Por la definicion de $G'$ existe en $G'$ un camino análogo

$(s,p) \rightarrow (v_1,i) \rightarrow (v_2,p) \rightarrow ...  \rightarrow (t,p)$

Notar que por la alternancia en la segunda componente siempre que un camino termina en un nodo de tipo (n,p) el camino tiene longitud par y si termina en uno (n,i) tiene longitud impar.

Asi que si el camino de G tiene longitud par, el camino en G' al ser análogo tambien y por consecuente su último nodo tiene que tener p en la segunda componente.
(Y ambos son de misma longitud asi que se cumple que es de longitud <= k por hipótesis)

$<G',(s,p),(t,p),k> \in PATH$

$\Leftarrow$)

Por hipótesis en $G'$ hay camino de longitud <= k de (s,p) a (t,p)

$(s,p) \rightarrow (v_1,i) \rightarrow (v_2,p) \rightarrow ...  \rightarrow (t,p)$

EL camino tiene longitud par porque termina en un nodo (n,p) por la misma observacion de antes.

Entonces existe un camino análogo tambien de longitud <= k en G de forma:

$s \rightarrow v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_n \rightarrow t$

Que al ser análogo tambien tiene longitud par.

$<G,s,t,k> \in EVEN-PATH$

Queda demostrado
