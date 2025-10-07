## Ejercicio 10 ¿Binaria o 2 clases? Sean A y B clasificadores que distinguen entre imágenes de perros e imágenes de gatos. Al medir la performance del clasificador (utilizando F1 para evitar los problemas de utilizar accuracy) y “gato” como clase positiva, obtenemos F1(A) = 0.9, F1(B) = 0.8. ¿Podemos concluir que el clasificador A es mejor que el clasificador B para este problema? Resolver los siguientes ítems para poder responder a la pregunta:

(no lo hice mirando el notebook capaz me equivoco)

### Al calcular F1 utilizando “gato” como clase positiva, ¿importa qué ocurre con los perros que fueron clasificados correctamente? Revisar la Tercera Parte del notebook notebook_metricas.ipynb y decidir cuál clasificador funciona mejor, basándose en las métricas obtenidas. Observar el cambio que ocurre al intercambiar cuál es la clase positiva.

No importa que pasa con los perros clasificados correctamente, solo mira Precision y recall del gato. Como
esas métricas nunca miran TN nunca miran si clasificamos bien a los perros.

### (b) ¿Para qué sirve el parámetro average en la función f1_score de la librería sklearn?

Calcula el promedio del f1 de cada una, los suma y divide por dos.

### (c) ¿Qué sucede si la cantidad de instancias sobre las que fueron testeados es distinta? ¿Cómo se ve afectada la métrica F1 al cambiar los True Negatives? Correr la Cuarta Parte del notebook notebook_metricas.ipynb. El gráficomuestra cómo varía la métrica F1 al aumentar la cantidad de True Negatives (observar que estamos cambiando la cantidad de instancias sobre las que testeamos). ¿Qué se puede concluir de este experimento?

La F1 de gato va a quedar igual, pero la de perro va a cambiar porque TN de gatos es el TP de perro.
La average lógicamente es el promedio.
