## Ejercicio 2

Ver que sea satisfacible se puede hacer en NP, el problema es ver que sea la mas chica.
Seria algo como:

$$\exists v \forall v'. \phi(v') = 1 \Rightarrow \phi(v) = 1 \land |v| < |v'|$$

y ademas chquear lo del bit i en 1, pero se ve que para ver que es la mas chica habria
que ver que todas las demas valuaciones son mas grades. Asi que mientras la jerarquia polinomial no colapse
creeriamos que no esta en NP.

Para resolverlo podemos hacer busqueda binaria en todas las asignaciones (son tiras de bits) y chequear que sea verdadera
y con un oraculo ver que dada esa valuacion verdadera que no haya otra mas chica.

Defino la maquina $M_\Pi$ y doy un algoritmo deterministico que resuelva LEX-SAT-BIT

Primero: 

$$\Pi = \{\langle \phi,v \rangle \exists v'. v >  v' \land \phi(v') = 1\}$$

(> chequeando lexicograficamente)
Basicamente dada una v  dice si existe una menor que la satisface. Se ve que es NP es solo un existe con cosas polinomiales $\Sigma_1^{P} = NP$ o tambien es facil dar un certificado (una valuacion mas chica que hace la verdadera a la formula)

Algoritmo:

```
M(x,i):
    res = 0
    busqueda bianaria de todas las valuaciones v de x:
        arrancamos "en el medio" y chequeamos si hay una mas chica
        que haga satisfacible a la formula y vamos haciendo busqueda binaria
        hasta encontrar la mas chica que satisface.
    //chequear que el bit i es 1
    if res[i] == 1:
        return 1
    else:
        return 0
```

Justificacion polinomial, en la busqueda binaria. Hay $2^{|x|}$ valuaciones posibles, como hacemos Binary search son $log(2^{x})$ 
iteraciones, es decir es $O(|x|)$

\newpage