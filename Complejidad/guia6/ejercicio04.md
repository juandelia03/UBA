## Ejercicio 4 Probar que el problema FORMULA_MAS_CHICA de la guia anterior esta en $\Pi_{2}^{p}$

$$\langle \phi, k \rangle \in \text{FORMULA MAS CHICA} \iff \forall \phi' \exists v 
((\phi (v) \neq \phi'(v)) \lor |\phi'| > k)$$

Formula mas chica pide que dada una formula no exista otra tq sea equivalente y su longitud sea mayor
a k. Esto es lo mismo que pedir que para toda phi', bien exista alguna valuacion en la que difiera con phi, o que la longitud de esa phi' sea mayor a k. 

$M(\langle \phi, k, v, \phi' \rangle)$ Corre en timepo polinomial, solo tiene que evaluar ambas formulas en v y ver que sean distintas y chequear que la
longitud de $\phi' > k$

\newpage
