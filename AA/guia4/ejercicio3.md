## Ejercicio 3 Preguntas para desarrollar.

### (a) En la clase teórica vimos que al hacer cross validation los datos no siempre deben separarse al azar, ¿por qué?. Pensar ejemplos de al menos dos situaciones en las cuales no sea conveniente.

No es buena idea libralo al azar porque a lo mejor tenemos mala suerte en como 
quedan distribuidos los datos. 

Por ejemplo digamos que queremos clasificar fotos de perros, gatos y conejos. 
Si en el conjunto de validacion quedan solo fotos de perros y gatos, no nos vamos
a enterar si clasificamos bien o no a los conejos. 

Tambien nos puede pasar que sea fundamental para el problema respetar las distribuciones de las clases,
si lo hacemos al azar no tenemos control sobre eso.

Otro: Si tenemos audios de personas y queremos un modelo que prediga sus emociones.
Si tenemos mas de un audio por persona capaz nos interesaria no validar un audio de una persona con un 
modelo que fue entrenado con otro audio de esa misma persona. 
 
### (b) ¿Por qué se deberían usar una sola vez los datos de control (held-out)? 

Los datos de control queremos que cumplan el rol de "datos nuevos". Sirven para simular 
que tan bien va a comportarse nuestro modelo con los datos de la realidad que nunca vio. Por 
eso no hay que usarlo para ir ajustando nuestro modelo ni mucho menos para entrenarlo. Si los usamos
varias veces vamos a ir sobreajustando sobre esos datos y perderian su funcion original.

### (c) ¿Qué sería conveniente hacer si luego de un muy buen resultado en desarrollo, encuentro un pésimo resultado en evaluación?

Reportar el resultado (escribite un paper hermano) y descartar el modelo.