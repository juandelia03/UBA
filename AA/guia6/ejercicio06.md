## Ejercicio 6 Verdadero o Falso (justificar)

### AUC-ROC es invariante de umbral de clasificación. Mide la calidad de las predicciones del modelo independientemente del umbral de clasificación elegido.

Verdadero. Cuando hacemos AUC-ROC tomamos el puntaje que le asigno el modelo a cada instancia y usamos cada uno
como umbral. La idea es que la curva depende de todos los umbrales. (los umbrales ni siquiera se grafican)

### (b) El AUC-ROC es invariante de escala (invariante a transformaciones lineales en las predicciones). Mide qué tan bien se clasifican las predicciones, en lugar de sus valores absolutos.

Verdadero. No importa la escala lo único que importa es el ordenamiento,
podría aplicar cualquier transformación lineal como pasar de kilometros a metros y obtendría las mismas
martrices de confusión, porque por cada instancia se crea un umbral. Si la transformación no modifica el orden
los TP/FP/TN/FN van a quedar igual, al igual que la AUC-ROC.

### (c) En caso que el ordenamiento de las instancias sea el mismo y suponiendo que no hay scores repetidos, AUC-ROC va poder distinguir un clasificador muy confiado (instancias clasificadas como positiva tienen scores muy altos, instancias clasificadas como negativas scores muy bajos) de uno poco confiado (scores menos extremos).

No no va poder por lo mismo que explique en (b). No importa que tan confiado o no sea el clasificador, los umbrales pueden cambiar pero el ordenamiento va a ser el mismo. En consecuencia las matrices de confusion van
a ser iguales y la AUC-ROC va a ser la misma sin importar cuan confiado seaa el clasificador

Clasificador con un nivel de confianza "normal" (ponele):

|-----x---x-x----x-----o----o----o----o|

Clasificador confiado:

|-x-x-x-x-----------------o-o-o-o|

Se ve que haciendo un umbral por instancia y para cada umbral una matriz de confusión
el resultado es igual para ambos.
