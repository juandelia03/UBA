## Ejercicio 8 Sea A un clasificador que tiene un F1 de 0.80 (con un umbral de clasificación de 0.5), y sea B un clasificador que tiene un F1 0.70 (también con un umbral de clasificación de 0.5). Sin embargo al cambiar el umbral a 0.4 obtenemos F1 de 0.76 y 0.80 respectivamente

### Explicar por qué puede suceder este fenómeno dando un ejemplo aproximado.

Ejemplo (son puramente ilustrativos. logicamente no veo a ojo cuanto pesa recall y precision):

n instancias negativas p positivas.

- Clasificador A: como bajamos el umbral el recall sube necsariamente asi que hay que bajar precision:

|---------|0.4|-p-n-n--n-n-|0.5|--n--p--p--p---p---p--p-----|

Se ve como con el umbral 0.5 tenia un recall casi perfecto y muy buen precision así que tendría buen
F1. Al bajar el umbral a 0.4 clasifica muchas instancias negativas como positivas y ahí baja su precision
entonces baja el F1.

- Clasificador B:

|----n--n-----n----|0.4|--n-p--p--p--p--|0.5|--n--p---p--p-p--p----p---p|

Este clasificador tambien tiene muy buen precision pero un recall un poco peor que el A por eso da un F1 más bajo
con el umbral 0.5.

Con el umbral en 0.4 maximiza el recall y baja un poquito la precision y así el F1 da 0.8

### ¿Podemos concluir algo sobre el AUC Prec-Recall de estos dos modelos?

El AUC Prec-Recall depende de todos los umbrales, no se puede analizar por dos umbrales fijos
(así como vimos en AUC ROC)
