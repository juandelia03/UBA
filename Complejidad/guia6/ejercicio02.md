## Ejercicio 2 Probar que si $\Sigma^{p}_k = \Pi^{p}_{k}$ para algun $k \in \mathbb{N}$, entonces PH = $\Sigma^{p}_{k}$

Recordar que PH es la union de todo $\Sigma_{k}^{p}$
  
Probar esto es probar que toda la jerarquia colapsa en ese k. 
Esta claro que $\Sigma_{i \leq k} \subseteq \Sigma_k$. 

Lo dificil es ver que $\Sigma_{i \geq k} \subseteq \Sigma_k$

Veamos por induccion usando la hipotesis, que $\Sigma_{k}^{p} = \Sigma_{k+n}^{p}$, 
Para poder concluir PH = $\Sigma^{p}_{k}$ 

**CB, n=0**

$\Sigma_{k}^{p} = \Sigma_{k}^{p}$ 

Trivial, vale.

**Paso inductivo**

*HI:* $\Sigma_{k}^{p} = \Sigma_{k+n}^{p}$ 

Quiero ver que: $\Sigma_{k}^{p} = \Sigma_{k+n+1}^{p}$

Reemplazando la izquierda del igual por la *HI*  es lo mismo que ver:

$\Sigma_{k+n}^{p} = \Sigma_{k+n+1}^{p}$

Ya sabemos que vale $\Sigma_{k+n}^{p} \subseteq \Sigma_{k+n+1}^{p}$ (es la inclusion trivial)

Veamos la otra contencion, tomo L $\in \Sigma_{k+n+1}^{p}$:

$$ x \in L \iff \exists y_1 \forall y_2 ... Q_{k+n+1} y_{k+n+1} P(y_1,y_2,...,y_{k+n+1})$$

El ultimo cuantificador dependiendo de la paridad de los literales puede ser un $\exists$ o un $\forall$.
Vimos en la teorica que cuando tenemos bloques de cuantificadores repetidos se pueden juntar en un unico cuantificador
manteniendo asi la alternancia.

Si el cuantificador anterior al ultimo Q es el mismo que este Q los puedo juntar en uno mismo, asi manteniendo la alternancia
y teniendo una variable cuantificada menos. 

El otro caso seria que el cuantificador anterior sea distinto al ultimo, a priori no podriamos juntarlos. Pero por la hipotesis 
del enunciado $\Sigma = \Pi$ para algun k (ademas aca por HI tenemos que $\Sigma_{k+n} = \Sigma_{k}$). Entonces podemos invertir 
el orden de los cuantificadores y usar la misma idea, junto los del final.

Por lo tanto en cualquier caso puedo reescribir:

$$x \in L \iff Q_1 y_1 Q_2 y_2 ... Q_{k+n} y'_{k+n} P(y_1,...,y'_{k+n})$$
 

Con esto puedo concluir que para cierto k, $\Sigma_{k}^{p} = \Sigma_{k+n}^{p}$

Y por lo que explique al principio PH = $\Sigma_{k}^{p}$

