## Ejercicio 5 Escribir el pseudocódigo de la siguiente función: CURVA-ROC(LABELS:LIST<BOOL>, PROBAS:LIST<FLOAT>):LIST<TUPLE (UMBRAL,VALORREC,VALORTPR)> que devuelve los valores de Recall y TPR junto a cada umbral explorado.

**OBS:** Entiendo que true positive rate y recall es lo mismo, me imagino que hay que calcular TPR y FPR para
así poder hacer la curva ROC

La diapo de la teorica dice: Ordenar las instancias según su predicción por el modelo. Considerar como umbral cada
una de estos scores. Voy a asumir que las probas ya me vienen ordenadas. De no ser así habría que ordenar las
probas de mayor a menor reflejando ese mismo orden en las labels.

```py
def curva_roc(labels:list[bool], probas:list[float]):list[tuple[umbral:float,valorfpr: float, valortpr: float]]:
    res = []
    # cada instancia se usa como umbral y se le calcula una matriz de confusion
    for umbral in probas
        # calcular TP,FP,TN,FN
        TP = 0
        FP = 0
        TN = 0
        FN = 0
        for i in range(len(probas)):
            label = labels[i]
            # Vemos dado el umbral si se clasifica como positiva o negativa
            if probas[i] >= umbral:
                prediccion = True
            else:
                prediccion = False

            # comparamos con el valor de la etiquta y actualizamos la "matriz de confusión"
            if(prediccion == True):
                if(label):
                    TP += 1
                else:
                    FP += 1
            else:
                if(not label):
                    TN += 1
                else:
                    FN += 1
        # una vez que terminamos de armar la matriz calculamos tpr y fpr
        punto = (umbral, FP/(FP+TN), TP/(TP+FN))
        res.append(punto)

    return res
```
