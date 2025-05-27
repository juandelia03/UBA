## Ejercicio 4 Probar que el problema FORMULA_MAS_CHICA de la guia anterior esta en $\Sigma_{2}^{p}$

$$\langle \phi, k \rangle \in \text{FORMULA MAS CHICA} \iff \exists v \forall \phi'(|\phi'| \leq k \Rightarrow \phi (v) \neq \phi'(v))$$

Es decir, que una formula sea mas chica que k implica que para alguna valuacion $\phi$ y $\phi'$ son distintas. 

$M(\langle \phi, k, v, \phi' \rangle)$ Corre en timepo polinomial, solo tiene que evaluar ambas formulas en v y ver que sean distintas y chequear que la
longitud de $\phi' \leq k$


