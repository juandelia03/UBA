## Ejercicio 5 Probar que P = NP si solo si  NP $\subseteq$ P/log(n)

La ida es trivial si NP esta en P tambien va a estar en P/f(x) para cualquier f(x) los
consejos "son gratis".

$\Leftarrow$)

Hipotesis: NP $\subseteq$ P/log(n)

Quiero ver que NP = P, esto pasa si solo si SAT $\in$ P

Por hipotesis se que SAT $\in$ P/log(p). Esto significa que existe un adv. |adv(n)| = O(log(n))  y existe una maquina M polinomial tal que

$$M(x,adv(|x|)) = 1 \iff x \in SAT$$

Ademas como los consejos son de tamaño $O(log(n))$ podria tenerlos todos en una lista
, llamemosla a, de tamaño $O(2^{log(n))} = O(n^c)$

Es decir que tiene tamaño polinomial. 

La idea va a ser entonces probar todos los consejos, podria definir la maquina $M_{sat}(x)$
que:
1. genera todos los consejos, esto es polinomial por lo que explique antes.
2. Corre la maquina M ($M(x,adv(|x|)) = 1 \iff x \in SAT$) con cada consejo. Esta maquina
corre en tiempo polinomial |a| veces (que a su vez es polinomial).
3. Si alguna simulacion dio 1 significa que existe formula que satisface asi que devuelve 1, caso contrario devuelve 0

\newpage
