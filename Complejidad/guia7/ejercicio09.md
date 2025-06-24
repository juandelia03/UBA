## Ejercicio 9 Encontrar una clase C tal que $C^C \neq C$

Lo hicimos en clase con C = E.

Veamos que $E \neq E^E$

Por jeraquia de tiempos sabemos que $E \subsetneq 2E$ (2E doble exponencial).

Probemos que $2E \subseteq E^E$ asi podemos ver que E esta estrictamente incluido en $E^E$:

$$E \subsetneq 2E  \subseteq E^E $$

Sea $\Pi \in 2E \Rightarrow \Pi \in  TIME(2^{2^{n^k}})$.

Definimos $\Pi_{pad} \{x01^{2^{|x|^k}} \}$

Entonces $\Pi \in 2E$ se puede resolver en $E^E$ con entrada x como:

1. Escribir $|x|01^{2^{x^{k}}}$ (esto toma tiempo exponencial)
2. pedirle al oraculo el resultado de $\Pi_pad$ con x.

De esta manera podemos simular cualquier lenguaje de 2E con una maquina $E^E \Rightarrow 2E \subseteq E^E$ 

Finalmente $E \subsetneq E^E \Rightarrow E \neq E^E$

\newpage