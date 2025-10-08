## Ejercicio 2 Validación cruzada. Verdadero o Falso. Justificar

Obs aca se le dice cross validation a separar en entrnamiento/validacion.
A separar en folds se le dice explicitamente k-fold cross validation.

### (a) Hacer validación cruzada evita el sobreajuste (overfitting) de los modelos sobre los datos.

Falso. No evita el sobreajuste, un arbol podria por ejemplo aprender de memoria todas las instancias con la que se lo entrene
CV no dice nada de la altura maxima. Cross validation sirve para saber si estamos sobreestimando la performance, es decir puede
que puede serivr para darnos cuenta si estamos sobreajustando.

### (b) Hacer validación cruzada ayuda a obtener estimaciones más realistas de la performance de un modelo sobre nuevos datos que al hacerlo sobre los mismos datos de entrenamiento.

Verdadero, si entrenamos a un modelo puede aprenderse de memoria los datos. Si estimamos su performance sonbre esos mismos datos
seguramente sobre estimemos su performance

### (c) En K-fold cross validation, conviene que K se acerque a N. De esta manera el resultado será lo más realista posible ya que se tiende a generar N modelos independientes. El problema es que hay que entrenar demasiados modelos.

Verdadero (creo!) Si k=n seria como validar sobre una unica instancia en cada iteracion, pareceria una buena idea.
a priori es como ver como se comportaria el modelo final al ver esa instancia que nunca vio.
El problema es que hay que hay que entrenar muchos modelos

### (d) Evaluar un modelo sobre el conjunto de evaluación (control) resultará en un valor siempre peor o igual al conseguido en desarrollo.

Falso. A lo mejor mi modelo acierta el 100% de las instancias de la clase A. Si en mi particion de evaluacion me quedaron
solo instancias de la clase A voy a tener accuracy de 100%.

### (e) Una vez elegida la mejor configuración durante desarrollo, es conveniente hacer k-fold cross validation nuevamente, pero ahora incluyendo también el conjunto de evaluación.

Falso. No entrnamos nunca al modelo usando el conjunto de evaluacion, justamente la idea es no usarlos para poder hacer una
estimacion realista.

### (f) Luego de seleccionar la mejor configuración, es ideal volver a correr el algoritmo pero esta vez utilizando todos los datos de desarrollo para luego evaluarlo en los datos de evaluación.

No se si es _ideal_ pero entendi que en general hacemos eso asi que diria que es verdadero.

Cito de la clase: ¿Re-entrenar utilizando todos los datos? La más común, no siempre posible o deseable. ¿Cómo sé que no empeoró?

### (g) Se espera que al evaluar un modelo sobre el held-out set (conjunto de evaluación) el resultado sea peor al conseguido en desarrollo.

No estoy tan seguro, no diria que necesariamente va a dar peor pero creeria que la mayoria de las veces si.

### (h) En K-fold cross validation entrenamos K modelos en donde cada modelo sólo se entrena en un subconjunto disjunto al resto de los modelos.

Falso tenemos interseccion en los datos que usamos para entrenar entre los distintos folds.

### (i) En K-fold cross validation validamos K modelos en donde cada modelo sólo evalúa a un subconjunto disjunto al resto de los modelos

Verdadero hacemos un modelo para evaluar sobre cada fold (como conjunto de validacion) una unica vez.
