## Ejercicio 7 En los casos en los que existen grandes disparidades en el costo de los falsos negativos frente a los falsos positivos, puede ser fundamental minimizar un tipo de error de clasificación. Por ejemplo, al detectar spam, es probable que desee priorizar la minimización de los falsos positivos (incluso si eso resulta en un aumento significativo de los falsos negativos). ¿Cuál de las siguientes métricas sería la más adecuada y por qué?

Entiendo que la pregunta es cual es la mejor para asegurarnos que estamos teniendo pocos falsos positivos.

### Precision

Precision indica de los predichos como positivos, cuantos efectivamente lo eran. $\frac{TP}{TP+FP}$

Si lo que más nos interesa es minimizar los falsos positivos aunque aumenten los falsos negativos
esta parecería ser una muy buena métrica a optimizar. La métrica empeora directamente a mayor sean los FP

### F_b con algún valor de b que favorezca precision

Esta también parece una buena idea, va a medir precision y recall (de todos los positivos cuantos predijo como tal)
pero priorizando precision que es lo que más nos interesa.

En esta métrica los falsos negativos tienen peso a diferencia de Precision así que si solo queremos priorizar
minimizar falsos positivos no es mejor que Precision.

### AUC-ROC

No pareceria ser una buena idea. AUC-ROC sirve para saber si nuestro modelo es mejor que el dummy, pero
no nos dice nada sobre los falsos positivos.

Comentario: Precision a lo mejor clasifica muy muy pocas instancias como positivas (1 capaz) y de esta manera
consigue una precision altísima ya que no mira absolutamente nada más. Si no queremos ese tipo de comportamiento
(uno creeria que no es ideal) es mejor idea la segunda opción. Como el enunciado hace especial incapié en
_(incluso si eso resulta en un aumento significativo de los falsos negativos)_ opté por precision.
