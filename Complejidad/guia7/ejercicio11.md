## Ejercicio 11 Dada una clase C, se define $low(C) = \{\Pi \subseteq \Sigma: C^{Pi} = C\}$ Probar que $low(NP) = NP \cap coNP$

Primero notemos que low(NP) = $\{\Pi \subseteq \Sigma: NP^{\Pi} = NP\}$

Veamos ambas contenciones.

Primero $NP \cap coNP \subseteq low(NP)$:

Esta es casi automatica.

Sea $\Pi \in NP \cap coNP$ para que este en low tendriamos que ver que $NP^{NP \cap coNP} = NP$.

Esto ya lo demostramos en el ejercicio anterior.

Veamos $low(NP) \subseteq NP \cap coNP$

Ahora tomamos un $\Pi \in low(NP) \iff NP^{\Pi} = NP$ (Hipotesis).

Veamos que pertenecza a NP y coNP por separado.

**NP**:

Es trivial que $\Pi \in NP^{\Pi}$ pues sea cual sea $\Pi$ lo puedo decidir "gratis" con el oraculo.

Ademas por hipotesis $NP = NP^{Pi}$:

$\Pi \in NP^{\Pi} \Rightarrow \Pi \in NP$

**coNP**:

Tambien podemos decir que $\overline{\Pi} \in NP^{\Pi}$. Se puede decidir al complemento de $\Pi$ negando la salida del oraculo
dada cualquier entrada.

$\overline{\Pi} \in NP^{\Pi} \Rightarrow \overline{\Pi} \in NP \Rightarrow \Pi \in coNP$