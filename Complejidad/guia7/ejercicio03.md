## Ejercicio 3 Probar que $NP \cup  coNP \subseteq P^{NP}$

Analicemos cada caso por separado

$NP \subseteq P^{NP}$:

Sea $\Pi \in NP$ Veamos que $\Pi \in P^NP$

Hay que reconocer al lenguaje $\Pi$ usando una maquina polinomial con acceso al oraculo NP, llamemosla $M_{NP}$. 
Este oraculo nos da "gratis" cualquier consulta sobre cualquier lenguaje de NP. 

La maquina oracular puede reconocer $\Pi$, con entrada x, simplemente le pregunta al oraculo si x pertenece a $\Pi$.

Corre en O(1) Asi que es polinomial.

Ahora veamos $coNP \subseteq P^{NP}$:

Sea $\Pi \in coNP$ Veamos que $\Pi \in P^{NP}$

Si $\Pi \in coNP \Rightarrow \overline{\Pi} \in NP$. Y ademas $x \in \Pi \iff x \not\in \overline{\Pi}$.

La maquina oracular con entrada x puede reconocer a $\Pi$ de la siguiente manera:
1. Le pregunta al oraculo $x \in \overline{\Pi}$ esto lo hace en O(1) porque $\overline{\Pi} \in NP$
2. devuelve la respuesta del oraculo negada, pues $x \in \Pi \iff x \not\in \overline{\Pi}$

\newpage