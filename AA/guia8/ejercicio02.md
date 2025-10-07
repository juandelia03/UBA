## Ejercicio 2 Dar una explicación general del algoritmo Random Forest.

### ¿Cuál es su principal diferencia con Bagging?

Random forest es Bagging + Features al azar en cada nodo (al considerar el split).

Así que la única es la de mirar solo un conjunto al azar de features al momento de hacer cada split,
de esta manera se disminuye la correlación entre cada árbol.

### ¿Cómo funciona la estimación de error “out-of-bag”?

Es una técnica para obtener estimaciones de qué tan bien generalizan los modelos.
Para cada instancia, utilizar los árboles que no contienen a x en su conjunto de entrenamiento.

Permite probar al modelo a medida que se entrena y no requiere tanto cómputo.

### ¿Cómo propone Breiman medir la importancia de features? 2 ¿Qué diferencia hay con la manera en que la importancia se mide en el paquete sckit-learn de python?

- Breiman: Para cada árbol del bosque, se toman las instancias out-of-bag (las que no se usaron para entrenar ese árbol).
  Para cada atributo, se permuta de manera de romper la relación real.
  Se pasa el conjunto permutado por el árbol y se calcula cuánto aumenta el error respecto al error original OOB.
  Al terminar de evaluar todos los árboles, se obtiene un valor de aumento de error para el atributo.
  La importancia final de cada atributo se estima como el promedio del aumento de error sobre todos los árboles: a mayor aumento de error, más importante es.

- En _sckit-learn_ usa Mean decrease impurity, se calcula durante el entrenamiento.
  Cada vez que un árbol se divide usando un atributo, se calcula la disminución de impureza que genera el corte y se pondera según la cantidad de instancias en el nodo.
  Al terminar de entrenar cada árbol, se obtiene la importancia de cada atributo para ese árbol.
  La importancia final de cada atributo es el promedio de su importancia en todos los árboles.
