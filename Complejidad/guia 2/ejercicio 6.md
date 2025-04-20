# Ejercicio 6
## a
Dada una instancia ⟨X⟩ de 2-PARTITION, 
se define la instancia ⟨R, r1, . . . , r|X|⟩ de RECTANGLE PACKING donde R tiene base P
x∈X x/2 y altura 2, y ri es un rectángulo de
base xi y altura 1, para cada 1 ≤ i ≤ |X|. 
Demostrar que ⟨X⟩ ∈ 2-PARTITION ⇐⇒⟨R, r1, . . . , r|X|⟩ ∈ RECTANGLE PACKING.

Veo la ida $\rightarrow$:

Quiero ver que los subrectangulos $r_i$ cubren al rectangulo R.

Para que la instancia $\in$ RECTANGLE PACKING, los $r_i$ deben poder cubrir R. como cada $r_i$ tiene area
$x_i$ el conjunto de las areas es $X$.
Por hipotesis se que lo puedo dividir como: 

$
\sum_{x \in X_1}{x} = 
\sum_{x \in X_2}{x} = 
\sum_{x \in X}{x/2}
$

Asi que puedo dividir a todos los $r_i$ en dos rectangulos de altura 1 (los pongo todos uno al lado de otro). Y la suma de ambas es el area de R. Si pongo esos de rectangulos uno arriba de otro obtengo al R de altura 2 que cumple con area. 
(Notar que la base de cada area es $\sum_{x \in X}{x/2}$)

Veo la vuelta $\leftarrow$:
Ahora por hipotesis se que tengo un rectangulo R y que los $r_i$ con altura 1 y base $x_i$ cubren completamente a R.

$\sum_{x \in X} x =$ Area del Rectangulo

Como la hipotesis es que los $r_i$ pueden cubrir al rectangulo (que tiene altura 2)
y se que todos los rectangulos tienen altura 1, pensando geometricamente, puedo
partir al rectangulo R en dos rectangulos de altura 1.
Llamo al conjunto de las areas de cada particion $X_1$ y $X_2$. Como lo parti a la mitad:

$\sum_{x \in X_1} x = \sum_{x \in X_2} = \sum_{x \in X} x/2$ 

Como parti a la mitad el triangulo cada subconjunto tiene elementos distintos $X_1\cap X_2 = \emptyset$

Por lo mismo $X_1 \cup X_2 = X$


## b
te la debo

# c
Mostrar que las reducciones implicadas por los puntos anteriores son polinomiales en función
de los tamaños de las entradas.

La reduccion seria algo como:

$<x> \in 2-partition \iff  f(<x>) \in RECTANGLE PACKING$

Tengo que encontrar una f. Notar que los rectangulos tienen la pinta de (base,altura)

f(X):
    res = new tupla
    R = (sum(x)/2,2)
    res.agregar(R)
    for e in x:
        res.agregar(e,1)
    return res