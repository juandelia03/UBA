## Ejercicio 4 Definimos P/f(n) como la clase de problemas que se resuelve con un consejo de tamaño f(n). Probar que $P \neq P/1 \cap R$

Basta con dar un lenguaje de $P/1 \cap R$ que no este en P.

Propongo:

L = {x:$\{0,1\}^{n}$: Existe codificacion(x) una cadena que depende de x y |codificacion(x)| = $2^x$. x pertenece sii
$codificacion(x)_i$ = 1}

Este lenguaje no pertenece a P porque ir a leer el bit puede ser exponencial. Pertenece a P/1 si usamos como consejo el valor 
de ese bit.

