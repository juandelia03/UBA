## G1

## G2

...

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
