## Ejercicio 1 Determinar cuáles de las siguientes afirmaciones son verdaderas y cuáles falsas. Demostrar aquellas que son verdaderas y dar contraejemplos para aquellas que son falsas.

### a) P $\subseteq$ NP y P $\subseteq$ coNP

P $\subseteq$ NP ?

Si, si los puedo resolver en tiempo polinomial puedo dar un certificado y verificarlo en tiempo polinomial 

P $\subseteq$ coNP ?
Si. Tengo que ver $\forall \Pi \in P \Rightarrow \Pi \in coNP$

puedo decir, por defiicion de coNP:

$\forall \Pi \in P \Rightarrow \Pi \in coNP \Rightarrow \Pi{c} \in NP$

Que es verdadero porque $\Pi$ pertenece a NP y esta cerrado por ele complemento.

### b) Si P=NP entonces coNP = NP

veo primero $NP \subseteq coNP$:

como P = NP:
$$NP \subseteq coNP \iff P \subseteq coNP$$

Que vimos que es verdadero en el inciso anterior.

ahora veo $coNP \subseteq NP$, quiero ver:

$$\forall \Pi \in coNp \Rightarrow \Pi \in NP$$

Desarrollo el lado izquierdo hasta llegar:

$$\forall \Pi \in coNp \Rightarrow \Pi^{c} \in NP \Rightarrow^{P=NP} \Pi^{c} \in P$$

Como la clase P es cerrada por el complemento (sigue la cadena de $\Rightarrow$):

$$\Rightarrow \Pi \in P \Rightarrow^{P=NP} \Pi \in NP$$

Como queria ver.


### c) Si P = NP, entonces todos los lenguajes pertenecen a P.

Falso, Halt (cualquier problema que no sea NP creo)

### d) Si coNP = NP , SAT $\in$ coNP

Verdadero, basta con ver SAT $\in$ NP que vimos en clase que es verdad (dar certificado y maquina...).

### e) Si coNP $\subseteq$ NP, entonces NP = coNP

Para que sean iguales basta con ver NP $\subseteq$ coNP (la vuelta ya esta en la hipotesis):

quiero ver que:

$\forall \Pi \in NP \Rightarrow \Pi \in coNP$

Como por hipotesis todo elemento de coNP esta en NP (desarrollo la expresion izquierda):

$\forall \Pi \in NP \Rightarrow \Pi \in coNP \Rightarrow \Pi \in NP$

Que es verdadero siempre.

