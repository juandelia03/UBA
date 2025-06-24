## Ejercicio 1 Probar que para todo oráculo A se tiene $P^A \subseteq NP^A \subseteq E^A$

**$P^A \subseteq NP^A$:**

Sea $\Pi \in P^A$ Existe M una maquina deterministica que corre en tiempo polinomial y tiene
acceso al oráculo A. 

$$x \in \Pi \iff M_A(x) = 1$$

Quiero ver que ese $\Pi \in NP^A$:

Es trivial que puedo simular a $M_A$ con una maquina no deterministica con acceso al mismo oraculo A, $N_A$.

Entonces $P^A \subseteq NP^A$.

**$NP^A \subseteq E^A$:**

Tenemos $\Pi \in NP^A$, es decir Existe N una maquina no deterministica que corre en tiempo polinomial y tiene
acceso al oráculo A. 

$$x \in \Pi \iff N_A(x) = 1$$

Quiero ver que todo $\Pi \in E^A$.

Sabemos que podemos simular cualquier maquina no deterministica simulandola deterministicamente en tiempo exponencial.
(y como ambos tienen acceso al mismo oraculo lo llaman y listo)

\newpage