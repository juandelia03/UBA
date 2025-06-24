## Ejercicio 1 Un lenguaje es esparso si existe un polinomio p tq |$L \cap  \{ 0,1\}^n| \leq p(n)$ para todo n. Probar que todo lenguaje esparso esta en P/Poly

Sea L esparso quiero ver que L pertenece a P/Poly

Si L es esparso para todo n la cantidad de palabras de longitud n de L esta acotada
por un polinimio P(n).

Para ver que L pertenece a P/Poly tenemos que ver que existe una familia de circuitos $C_n$ tal que para todo n:

- $C_n$ tiene tamaño polinomial
- $C_n$ tiene n bits de entrada
- $C_n(x) = 1 \iff x \in L$

Veamos que se puede construir la familia de circuitos.

cada $C_n$ se puede construir de la siguiente manera:

El circuito $C_n$ tiene que aceptar a las palabras del lenguaje de longitud n y rechazar al resto. Como
la cantidad de palabras de longitud n esta acotada por un polinomio P(n) las podemos hardcodear en el circuito.

Luego como $C_n$ tiene todas las palabras hardcodeadas podemos chequear que la entrada sea igual a alguna de ellas y aceptar o
rechazar si esta  o no, esto se puede hacer con compuertas and y or. Vemos que caracter a caracter sea igual a alguna palabra mediante and's y devolvemos un or que este conectado a cada and (si es iguala a alguna devuelve true). 

Se ve que $C_n(x) = 1 \iff x \in L$
Ademas este circuito tiene tamaño polinomial (p(n).n), porque tiene P(n) palabras de longitud n. 

\newpage
