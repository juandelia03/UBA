## Ejercicio 6 Determinar cuáles de las siguientes son afirmaciones verdaderas:

### (a) El objetivo de construir un árbol de decisión es crear el árbol de menor tamaño posible en el cual las hojas contengan valores de una sóla clase.

Falso. Es greedy

### (b) Los algoritmos de construcción vistos (CART, ID3, etc) exploran todos los posibles árboles y se quedan con el que mejor separa a las instancias.

Falso, exploran uno y se lo quedan.

### (c) Un atributo puede aparecer sólo una vez en cada rama del árbol (llamamos rama a un camino directo desde una hoja hasta la raíz).

En clasificacion si, no tiene sentido que aparezca mas de una vez. En regresion en cambio puede aparecer
mas de una vez. (Podira hacer algo como edad < 18 y despues edad < 4 no se).

### (d) Un par (atributo, corte) puede aparecer sólo una vez en cada rama del árbol (llamamos rama a un camino directo desde una hoja hasta la raíz).

Verdadero.

### (e) Un árbol de decisión, con criterios de corte suficientemente laxos, puede siempre conseguir 100 % de aciertos en los datos de entrenamiento.

Falso, puede haber contradicciones

### (f) Un árbol de decisión, con criterios de corte suficientemente laxos, puede siempre conseguir 100 % de aciertos en los datos de entrenamiento siempre y cuando no haya contradicciones entre las etiquetas de instancias observacionalmente iguales.

Verdadero.
