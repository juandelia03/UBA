## Ejercicio 3 Se tienen instancias con sólo dos atributos: altura de una persona (medido en metros) y edad de la persona (medida en años). Se quiere saber si la persona es o no es basquetbolista profesional tomando en cuenta la experiencia de muchas personas.

### ¿Es buena idea utilizar el algoritmo de K-vecinos más cercanos con estos datos?

Depende. (Primero esto no anda por las magnitudes de los datos pero obviando eso) Funcionaría si creemos
que en general las edades y alturas de una persona bastan para discriminar si es basquetbolista o no.

Si asumimos algo como que una mayoría o algun número de las personas altas y jovenes son basquetbolistas profesionales knn podría funcionar bien. Personalmente imagino que la gran mayoría de personas altas y jovenes
no son jugadores **profesionale** de basquet así que no me parece buena idea.

Igualmente la escala de los datos hace que sea una muy mala idea usar knn así nomás. Las alturas en metros
van a ir entre un rango del tipo [1.4;2.5] (ponele) y las edades algo como [0;100]. Así que el knn básicamente va a estar decidiendo por edad, porque en altura van a estar todos cerca en el espacio.

### ¿Suponiendo que se utiliza dicho modelo, será útil realizar alguna transformación a los datos previo a ejecutar el algoritmo? ¿Cuál? ¿Por qué?

Si por lo que explique antes. Hay que hacer que sean igual o similarmente pesados ambos atributos para calcular
la distancia entre las instancias.
