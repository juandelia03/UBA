## Ejercicio 8 Ordenar los siguientes pasos del desarrollo y evaluación de un modelo de manera apropiada (indentar si hay loops y especificar sobre qué datos se haría)

1. Mirar / escuchar / leer instancias del dataset para pensar buenos atributos.

2. Graficar la distribución de las etiquetas.

3. Partir los datos en desarrollo - evaluación

4.  Correr un proceso que lista los atributos según qué tanto se correlacionan con las etiquetas y conservar sólo el top-10 para entrenar el modelo.

5. Definir la métrica a utilizar (ej: accuracy pesada por clase)

6. Partir en 10 folds.

7. Armar una grilla de configuraciones a probar

8. Para cada configuracion de la grilla: Entrenar un modelo usando una configuración, testear su performance en datos que no fueron utilizados para entrenar. Guardar el resultado. 

9. De ser necesario: Después de correr lo anterior me di cuenta que podría haber probado tal modelo / tal hiperparámetro. Agregar a las configuraciones y repetir. 

10. No me dio tan bien como esperaba. Empiezo de nuevo repensando algunas cosas 

11. Mandar reporte final a toda la empresa y submitear paper.


El paso 8 donde dice datos que no fueron utilizados para entrenar asumo que no se refiere a los held out sino a entrenar para cada
fold un modelos distinto, sino no encuentro el paso de entrenamiento.


No veo el paso de usar el held out con el modelo entrenado, asumo que lo hacemos en el paso 11.