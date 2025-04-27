## Ejercicio 11 El problema DOUBLE-SAT consiste en deteminar si una formula proposicional $\phi$ tiene al menos dos valuaciones que la satisfacen. Demostrar que DOUBLE-SAT es NP-completo

DOUBLE-SAT $\in$ NP?

Certificado: las dos valuaciones.
Verificador: Reemplazar variable a variable una vez para cada valuacion y ver que dan verdadero.

(es lo mismo que verificar SAT pero dos veces)
 
DOUBLE-SAT es NP hard?

Veamos la siguiente reduccion:

$$\phi \in SAT \iff f(\phi) \in DOUBLE-SAT$$

Idea:

Si $\phi (v) \rightarrow V \Rightarrow \phi(v) \land V \rightarrow V \rightarrow \phi(v) \land (z_1 \lor \lnot z_1) \rightarrow V$

Entonces mi funcion (trivialmente polinomial) va a ser:

f($\phi$) $\rightarrow$ $\phi \land (z_1 \lor \lnot z_1)$ ($z_1$ variable fresca) y quiero ver que:

$$\phi \in SAT \iff \phi \land (z_1 \lor \lnot z_1) \in DOUBLE-SAT$$

$\Rightarrow$) a $\phi \land (z_1 \lor \lnot z_1)$ lo voy a notar $\phi '$

$$
\phi \in SAT \Rightarrow 
\exists v. \phi(v) \rightarrow V \Rightarrow
(\phi '(v+ \{z_1 = V\}) \rightarrow V \land \phi '(v+ \{z_1 = F\}) \rightarrow V) \Rightarrow
\phi ' \in DOUBLE-SAT
$$

$\Leftarrow$)

$$
\phi ' \in DOUBLE-SAT \Rightarrow
\exists v_1 v_2. \phi'(v_1) \rightarrow V \land \phi'(v_2) \rightarrow V \Rightarrow^{nota_1}
\phi(v_1) \rightarrow T \Rightarrow
\phi \in SAT
$$

$nota_1:$

El implica vale porque $\phi'$ esta en CNF $C_1 \land C_2 \land ... \land C_n$. Si una valuacion
es verdadera para $C_1 \land C_2 \land ... \land C_n$, sigue siendo verdadera para cualquier formula
producto de sacarle alguna $C_i$ porque es una cadena de conjunciones.

\newpage