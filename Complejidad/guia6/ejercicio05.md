## Ejercicio 5 La clase $DP = \{ L_1 \cap L_2 : L_1 \in NP, L_2 \in coNP \}$ consiste de la interseccion de problemas en NP y coNP (notar que $DP \neq NP \cap coNP$. Probar

### a) $DP \subseteq \Sigma_{2}^{p} \cap \Pi_{2}^{p}$

Aclaro (por que no es tan claro para mi) que $L \in DP \iff L = L_1 \cap L_2 \land L_1 \in NP \land L_2 \in coNP$

Tengo que ver que $\forall L \in DP \Rightarrow L \in \Sigma_{2}^{p} \cap \Pi_{2}^{p}$

Tiene que pertenecer a ambos asi que lo puedo ver por separado.

$\bold{L \in \Sigma_{2}^{p}}$:

Sabemos que $NP = \Sigma_{1}^{p}$ y que ${coNP = \Pi_{1}^{p}}$

Entonces L se puede escribir como (usando las definiciones de pi y sigma):

$$L = L_1 \cap L_2 = (\exists y_1 M_1(x,y_1) \land (\forall y_2 M_2(x,y_2))) = \exists y_1 \forall y_2 M'(x,y_1,y_2)$$

Que claramente $\in \Sigma_{2}^{2}$

Para ver $\bold{L \in \Pi_{2}^{p}}$ es analogo, si tomamos la interseccion al reves ($L_1 \cap L_2 = L_2 \cap L_1$) quedan
los cuantificadores invertidos.

$\forall y_1 \exists y_2 M'(x,y_1,y_2) \in \Pi_{2}^{p}$

q.e.d 


### b) El siguiente lenguaje esta en DP. EXACT INDSET = { <g,k>:G es un grafo cuyo conjunto independiente mas grande tiene tamaño k}

Tengo que escribir a EXACT-INDSET = $L_1 \cap L_2$ con $L_1 \in NP$ y $L_2 \in coNP$

Mi $L_1$ va a ser INDSET. Claramente es NP, el certificado es el conjunto de vertices tq |conjunto| es mayor o igual a k 
y  todas cosas que se pueden chequear en tiempo polinomial.

Defino el otro lenguaje como $L_2$ = {<g,k>: G no tiene un conjunto independiente de longitud > k}

El complemento de $L_2$ es {<g,k>: G tiene un conjunto independiente de longitud > k}.
Este lenguaje al igual que el primero es claramente NP. Certificarlo es tan simple como dar el conjunto de nodos independientes. 
$\Rightarrow L_2 \in coNP$

Es trivial ver que $L_1 \cap L_2 = EXACT-INDSET$
