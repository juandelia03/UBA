## Ejercicio 9 Probar que $L = \emptyset$ y $L^{c}$ no son NPC

Para que sean NPC tienen que ser NP (lo son ambos son polinomiales) y ser NP-hard
osea que para todo $L' \in NP$ vale que $L' \leq_p L$  

### a) veamos que no vale la reduccion para $\emptyset$

$$x \in L' \iff f(x) \in \emptyset$$

Esto es absurdo, la parte derecha del si solo si siempre va a ser falsa. Ningun elemento pertenece al vacio

### b) veamos que no vale la reduccion para el complemento, llamemoslo $U$


$$x \in L' \iff f(x) \in U$$

Tambien es absurdo. Para que sea verdad tendria que valer que todo x pertenece a $L'$ arbitrario.

\newpage