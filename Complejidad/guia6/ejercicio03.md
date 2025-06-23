## Ejercicio 3 Probar que si  SAT $\leq_P$ $\overline{SAT}$ entonces PH = NP

Por hipotesis puedo decir que $NP \subseteq coNP$, pues cualquier problema de NP seria
menor o igual de dificil que uno de coNP.

Veamos que $coNP \subseteq NP$:

Sea $L \in coNP \Rightarrow \overline{L} \in NP$

Como por hipotesis $NP \subseteq coNP$:

$\overline{L} \in NP \Rightarrow \overline{L} \in coNP \Rightarrow L \in NP$

queda demostrado que $coNP \subseteq NP$

Por lo tanto coNP = NP

Con esto en mente recordemos del ejercicio anterior que:

Si para algun k $\Sigma_{k}^{p} = \Pi_{k}^{p}$ entonces PH = $\Sigma_{k}^{p}$

Tomando k=1:

$$\Sigma_{1}^{p} = NP = coNP = \Pi_{1}^{p} \Rightarrow PH = NP$$

\newpage
