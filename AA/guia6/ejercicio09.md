## Ejercicio 9 Verdadero o Falso (justificar)

### (a) Tanto recall como precision no toman en cuenta qué tan bien el modelo maneja los casos negativos.

Falso. Precision penaliza los false positive y recall penaliza los falsos negativos.

### (b) Un modelo que no produce falsos positivos tiene precision = 1.0.

Verdadero (siempre que haya producido al menos un TP, sino se indefine 0/0)

### (c) Un modelo que no produce falsos negativos tiene recall = 1.0.

Verdadero (siempre que haya producido al menos un TP, sino se indefine 0/0)

### (d) Si un clasificador devuelve probabilidades, la matriz de confusión se construye de manera ponderada según la probabilidad de cada clase.

Falso. La matriz de confusión se hace para un umbral dado $\mu$. Si la probabilidad de una instancia
de perteneces a la clase positiva es mayor a $\mu$ se marca como tal, caso contrario se marca como negativa.

### (e) Si un clasificador devuelve probabilidades, hay muchas matrices de confusión asociadas dependiendo del umbral de clasificación.

Verdadero. Armarmos una matriz por cada probabilidad tomando esa probabilidad como umbral.

### (f) Si un clasificador devuelve probabilidades, hay infinitas matrices de confusión asociadas dependiendo del umbral de clasificación.

F. Cuando hacemos AUC-ROC caluclamos una matriz por cada probabilidad. Si bien podríamos tirar infinitos umbrales
después de hacer uno por instancia se van a repetir las matrices de confusión.

### (g) Aumentar el umbral de clasificación produce que la precision siempre suba.

F. Aumentar el umbral hace que se clasifiquen menos como positivas. Disminuye tanto los TP y FP.
Supongamos que tenemos dos umbrales u_1 u_2 y u_2 > u_1 y sean p instancias de la clase positiva
y n de la negativa:

|---u_1--p-p--p--p--p--p--u_2--n---n--|

Acá con u_1 tenemos $Precision_1 = \frac{6}{8}$ y con u_2 $Precision_2 = \frac{0}{2}$

Aumentamos el umbral y bajo la precision.

### (h) Aumentar el umbral de clasificación produce que el recall baje o se mantenga igual.

V. $Recall = \frac{TP}{TP+FN}$ Notar que TP+FN es fijo, es el total de insatncias que realmente pertenecen a la
clase positiva. Al aumentar el umbral menos instancias se clasifican como positivas así que TP baja o se mantiene igual $\Rightarrow$ recall baja o se mantenga igual.

### (i) La métrica precision es parte fundamental del cálculo de la curva ROC.

F. La curva ROC no usa precision. Usa TPR=Recall y FPR.
