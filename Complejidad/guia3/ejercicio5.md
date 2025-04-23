# Ejercicio 5 Suponiendo que P = NP, diseñar un algoritmo polinomial que dada una fórmula booleana ϕ encuentre una asignación que la satizfaga, si es que ϕ es satisfacible.

Por hipotesis SAT $\in$ P:

Existe un programa SAT($\phi$) que devuele V si se puede satisfacer $\phi$, F caso contrario.

Puedo definir tambien SAT-R($\phi$,r,k) que toma k restricciones y restricciones es una lista de boleanos tq:
$r_i$ es el valor que debe tener la $x_i$ variable de $\phi$.

Por ejemplo SAT-R($\phi$,[True,False],2) verifica si $\phi$ es satisfactible con la primera variable siendo T y la segunda F.

Sigue perteneciendo a NP (y por hipótesis a P) ya que la unica diferencia es que cuando se verifica el certificado
(valuacion tq la formula sea satisfactible) hay que chequear que las primeras k variables del certificado
sean las mismas que las restricciones.

Tambien se podria escribir reduccion para ver $\text{ SAT}(\phi) \leq_p \text{SAT-R}(\phi ,r,k)$:

$$ \phi \in \text{SAT} \iff f(\phi) \in \text{SAT-R} $$

```
f(phi):
    return < phi, [],0>
```

Con esto en mente defino un algoritmo:

```
def asignacion(phi):
    if SAT(phi):
        asignacion = []
        for i in range(|phi.variables|):
            if SAT-R(phi,asignacion + [True],i+1):
                asignacion.push(True)
            else:
                asignacion.push(False)
        return asignacion
    else:
        print("no hay asignacion valida")
```

Basicamente va dejando fijas las variables y chequea si fijando Verdadero se puede satisfacer, sino la fija falso.
Hace eso con todas hasta obtener una asignacion valida.

El programa corre en tiempo polinomial, pues hace cantidad de variables iteraciones, que es polinomial
respecto de $\phi$. En cada iteracion corre SAT-R que por hipótesis es polinomial.
