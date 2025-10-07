## Ejercicio 8Sesgo inductivo

### (a) ¿Cuál el sesgo inductivo del algoritmo que construye el árbol de decisión?

El más importante creo que es que separa el espacio en hiperrectángulos.

Sumo: Los atribs más importantes quedan arriba (greedy), criterio de parada (h max), como se elige el mejor atributo.

### (b) ¿Qué sucede cuando dos atributos empatan en ganancia de información? ¿Esta decisión es parte del sesgo inductivo?

Se elige uno al azar. Como se uso ese para cortar cuando calculemos la importancia de los atributos
ese va a aparecer como mas importante que el que no se eligio.

Entiendo que esto no es parte del sesgo inductivo.
