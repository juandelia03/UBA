## Ejercicio 3 Probar que si  SAT $\leq_P$ $\lnot$ SAT entonces PH = NP

Por hipotesis puedo decir que $NP \subseteq coNP$, pues cualquier problema de NP seria
menor o igual de dificil que uno de coNP.

Ademas la reduccion lo que me dice es $\phi \in SAT \iff f(\phi) \in \lnot SAT$

Que es lo mismo (por como es SAT) que $\lnot \phi \in \lnot SAT \iff \lnot f(\phi) \in SAT$

Es decir: 

$$\lnot SAT \leq_p SAT$$

Que al igual que antes implica que (not SAT es coNP completo) $coNP \subseteq NP$

Por lo tanto coNP = NP

Con esto en mente recordemos del ejercicio anterior que:

Si para algun k $\Sigma_{k}^{p} = \Pi_{k}^{p}$ entonces PH = $\Sigma_{k}^{p}$

Tomando k=1:

$$\Sigma_{1}^{p} = NP = coNP = \Pi_{1}^{p} \Rightarrow PH = NP$$

\newpage
