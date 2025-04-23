## Ejercicio 4 Decir si las siguientes afirmaciones son verdaderas o falsas:

### a) Si P = NP, entonces todo problema NP-completo es polinomial

Verdadero. Si un problema esta en NPC, por definicion esta en NP. Entonces
por hipotesis esta en P.

### b) Si P = NP, entonces todo problema NP-hard es polinomial.

Falso. Los problemas que no sean NP y sean NP-Hard no van a ser Polinomiales, por ejemplos
los de la clase exp o Halt.

### c) Si las clases NP-completo y coNP-completo son disjuntas entonces P $\neq$ NP.

Es verdadero, supongamos por el absurdo que P=NP:
P=NP $\rightarrow$ coNP = NP (ver ejercicio 1)

Absurdo! Por hipotesis NP-completo y coNP-completo son disjuntas. 
Por lo tanto P debe ser distinto a NP

### d) HALTING es NP-hard y coNP-hard.
Verdadero. 

Halting segurisimo es mas dificil que cualquier NP, 
y creo que el complemento de halting tampoco es computable asi que tambien.

\newpage