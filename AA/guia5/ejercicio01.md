## Ejercicio 1

### Explica con tus palabras qué es el clasificador óptimo de Bayes.

El clasificador óptimo de Bayes devuelve la predicción más probable para un nuevo ejemplo.

$Pred(x^{(i)}) = argmax_{c \in Clases} (P(Y = c | X=x^{(i)}))$

Es decir: La predicción de una instancia es la clase que maximiza la probabilidad de que Y
tome ese valor dado que X es igual a la instancia considerada.

### ¿Cuál es la razón para no construir siempre este clasificador en la práctica?

No lo construimos en la práctica porque para datos reales no conocemos la distribución condicional de Y dada X.

Usamos este clasificador como un estándar inalcanzable.

### Imaginemos que simulamos datos para clases Azul y Verde. Para la clase verde muestreamos de una distribución...

Hay que calcular Pred(2), por clf óptimo de bayes:

$argmax_{c \in Clases} (P(Y = c | X=x^{(i)}))$

La expresion que queremos maximizar por teorema de bayes es:

$\frac{P(X=2|Y=c) P(Y=c)}{P(X = 2)}$

Como estamos maximizando para c y P(X = 2) es igual para todo C, lo vuelo.

$P(X=2|Y=c) P(Y=c)$

Acá habría que reemplazar por cada clase y ver cual maximiza esa expresión:

$P(X=2|Y=Verde) P(Y=Verde) = P(X=2|Y=Verde) \times 0.2 = P_v$

$P(X=2|Y=Azul) P(Y=Azul) = P(X=2|Y=Azul) \times 0.8 = P_a$

Tenemos las distribuciones así que podríamos hacer esa cuenta y ver que numero es mayor (no la voy a hacer), la respuesta es

$max(P_v,P_a)$

### Explique cuál sería el proceso para dibujar las fronteras de decisión en una grilla ...

NI IDEA AYUDA.
