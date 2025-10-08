## G3 Árboles

Medidas de homogeneidad:

- Tasa de error de clasificación (Classification Error Rate)
- Ganancia Gini (Reducción de la impureza)
- S:región, H(S): entropia en S, <atrib,corte> y prop: proporción

  $InfoGain(S, <a,c>) = H(S) - (prop_{\leq} \cdot H(S_{\leq}) + prop_{>} \cdot H(S_{>}))$

  $H(S) = - \sum_{k \in clases(S)}{p(k) log_2 p(k)}$

sesgo árboles:

- El tipo de regiones de decisión que puede generar tiene forma de (hiper-)rectángulos.
- Las regiones que exploramos se determinan de manera Greedy.
- Atributos más discriminativos -> cerca de la raíz.
- Árboles más pequeños y menos complejos en términos de su estructura de acuerdo al criterio de parada
- De acuerdo a cómo se recorren los distintos cortes para un atributo dado, se pueden perder soluciones

Probas de pertencer a una clase: Por ejemplo si en una hoja quedaron 2 instancias de la clase A y 8 de la clase B tenemos A: 20% y B: 80%.

Si hacemos árbol para regresión el algo es el mismo. Distinta medida para homogeneidad (Varianza reg).
El valor de una hoja es el promedio de las etiquetas de la región.

Importancia: Cada vez que se use un atributo para realizar un corte sumarle a ese atributo la
ganancia (gini/info) de ese corte ponderado por cuantas instancias tenía el nodo .

## G5 clasificadores

anotarme el teorema de bayes + la expresion del clasificador optimo?

que proba estiman los discriminativos para predecir (diapo 5)
que proba estiman los generativos para predecir (diapo 21)

kernels: lineal, polinómico, gaussiano/radial, Sigmoideo
sesgo nb: 1.asumir que los eventos son independientes 2.asume que las clases se distribuyen de manera normal. Una media por clase, por atributo y un desvio por
atributo
sesgo LDA: las clases se distribuyen de manera normal. una media por clase, misma matriz de cov para todas.
sesgo QDA : igual a LDA pero una matriz de cov por clase

## G6 Metricas

- Accuracy: $\frac{\text{predicciones correctas}}{\text{predicciones totales}}$
- Presicion: De las instancias predichas como positivas ¿qué porcentaje lo eran?
- Recall: De las instancias positivas, ¿qué porcentaje fueron predichas como tal?

- MSE
- MAE
- $R^2$

anotar las fórmulas de c/u y la de $F_\beta$

pasos para hacer la AUC-ROC. Fórmula TPR y FPR
algo de precision-recall curve?

## G7 Sesgo varianza:

Fórmulas de sesgo y varianza y sus definiciones en palabras.
overfit -> varianza alta
underfit -> sesgo alto

## Ensambles

Bootrap: Dado un dataset, crear otros (B) del mismo tamaño con instancias (filas) elegidas al azar (con reposición)

Bagging:

- Tomar muchos training sets distintos (Bootrap)
- construir un modelo por cada set
- promediar las predicciones para hacer la predicción final

Problema: los árboles están muy correlacionados -> RF

Para reducir la varianza no basta solo con agregar modelos, hay que disminuir su correlación.

Out-of-bag: Obtener estimaciones de qué tan bien generalizan los modelos.
Para cada instancia, utilizar los árboles que no contienen a x en su conjunto de entrenamiento para predecir la clase de x (usa como ensamble todos los árboles que no usaron x al entrenarse). Permite probar al modelo a medida que se entrena y no requiere tanto cómputo (en comparación a CV).
