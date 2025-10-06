## Ejercicio 2 Métricas de umbral fijo

### (a) Explicar con tus palabras la definición de accuracy, precision y recall.

- Accuracy: $\frac{\text{predicciones correctas}}{\text{predicciones totales}}$
- Presicion: De las instancias predichas como positivas ¿qué porcentaje lo eran?
- Recall: De las instancias positivas, ¿qué porcentaje fueron predichas como tal?

### (c) ¿Por qué es un problema medir accuracy de un clasificador para compararlo con otro? Dar un ejemplo en donde sería engañoso utilizar esta comparación.

Porque depende de que queremos optimizar. Quizá queremos un clasificador como el que describí el ejercicio pasado
y necesitamos que falle lo menos posible a la hora de decidir quien tiene cardiopatias graves. Al ser ese caso
una gran minoría un clasificador que siempre predice la clase mayoritaria quizá tenga mejor accuracy que uno
que tiene un accuracy un poco peor pero que falla muy poco prediciendo a quienes efectivamente tienen cardipatias
como pacientes de riesgo. En ese caso un clasificador con peor accuracy es más deseable que uno con más.

### (e) Demuestre que la métrica recall vista como función del umbral de decisión, es una función monótona decreciente

Intuitivamente, si subo el umbral ($\mu_1 \geq \mu_2 $) se van a clasificar menos instancias como positivas
y más como negativas y por lo tanto también van a haber más (o igual) FN y menos (o igual) TP:

$TP_{\mu_1} \leq TP_{\mu_2}$

$FN_{\mu_1} \geq FN_{\mu_2}$

$recall(\mu_1) = 
\frac{TP_{\mu_1}}{TP_{\mu_1}+FN_{\mu_1}} \leq recall(\mu_2) = \frac{TP_{\mu_2}}{TP_{\mu_2}+  FN_{\mu_2}}$

Notar que el denominador es fijo, TP + FN = total de positivos que hay en la muestra

### (f) Muestre cómo la métrica precision vista como función del umbral de decisión, no necesariamente es una función monótona creciente

Intuitivamente si $\mu_1 \leq \mu_2$ más instancias se marcan como positivas (las que el más restrictivo marque como verdaderas las va a marcar también el más laxo) por lo tanto:

$TP_{\mu_1} \geq TP_{\mu_2}$

$FP_{\mu_1} \geq FP_{\mu_2}$

$\frac{TP_{\mu_1}}{TP_{\mu_1}+FP_{\mu_1}} \leq^{?} \frac{TP_{\mu_2}}{TP_{\mu_2}+FP_{\mu_2}}$

Esto es falso, tomemos el caso que las dos instancias que cumplen con el umbral más restrictivo en realidad
son falsos positivos. Con ambos umbrales FP va a ser 2. Y supongamos ahora que con el umbral más restrictivo
ninguna otra instancia se determina positiva pero con el más laxo 8 instancias más se clasifican como positivas
y efectivamente lo eran, así sumando 8 verdaderos positivos.

Reemplazando en la desigualdad obtenemos:

$\frac{8}{8 + 2} \leq^{?} \frac{0}{0+2}$

Que es falso.
