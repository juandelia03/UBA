## Ejercicio 3 Probar que $P_{advice} = P/poly$

El consejo tiene tamaño polinomial

Veamos que $P/poly \subseteq P_{advice}$

Dado un L $\in$ P/Poly quiero ver que L $\in P_{advice}$

Como L esta en P/poly hay $C_n$ para todo n tq: $x \in L \iff x \in C_n$ con $|x| = n$

Para que este en $P_{advice}$ tiene que existir un adv(n) de tamaño polinomial tq: 
$M(x,adv(|x|)) = 1 \iff   x \in L$ (el consejo solo depende del tamaño de x).

Elijo adv(n) = $C_n$ (que existe por hipotesis).

Esto funciona porque el consejo solo depende del tamaño de la entrada. Entonces la maquina
es $M(x,adv(|x|)) = M(x,C_|x|)$ y simplemente va a simular $C_{|x|}(x)$

Veamos que $P_{advice} \subseteq P/poly$

Dado L en $P_{advice}$ qvq esta en P/poly.

Como esta en $P_{advice}$ existe M(x,adv(|x|)) = 1 (llamemos y a adv(|x|))

por cook-levin (como sat es np-completo puedo reducir cualquier maquina poli a una formula):

$$\phi_m(x,y) = 1 \iff M(x,y) = 1$$

Esta claro que puedo escribir una formula armando un circuito. Ademas solo depende de x (porque y depende de la longitud de x).

\newpage

