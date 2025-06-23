## Ejercicio 2 Probar que existen lenguajes fuera de P/poly

$$\text{ \# circuitos polinomiales} = 2^{O(p(n)log(p(n)))} = 2^{k p(n) log(p(n))}$$ 

$$\text{ \# funciones} = 2^{2^{n}}$$

Para que todos las funciones sean P/Poly tendria que valer que:

$$\text{ \# circuitos polinomiales} \geq \text{ \# funciones}$$

$$2^{k p(n) log(p(n))} \geq 2^{2^{n}}$$

Tomando logaritmo de ambos lados:

$$k.p(n).log(p(n)) \geq 2^{n}$$

Que es falso pues es una exponencial contra un polinomio. de hecho:

$$k.p(n).log(p(n)) << 2^{n}$$

Por lo tanto existen lenguajes fuera de P/poly

\newpage