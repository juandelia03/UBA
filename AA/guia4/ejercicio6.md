## Ejercicio 4 Luego de correr un grid search (búsqueda de hiperparámetros) en donde evaluamos miles de configuraciones utilizando cross validation, encontramos un modelo que funciona mejor que el resto con un 93 % de accuracy enlos folds para validación. Este resultado, comparado contra datos nuevos de la realidad, será generalmente:

### (a) demasiado optimista (porque el modelo puede haber sobreajustado a los datos de entrenamiento de cada fold).

Falso. El tema creo que no es sobreajustar. Quizas no sobreajusto y simplemente tuvo "suerte" y justo
le tocaron instancias que clasifica bien


### (b) demasiado pesimista (al probar tantas combinaciones de modelos, el modelo tiene que esforzarse más que lo que haría en eval para conseguir un buen resultado).

Falso, dio 93% de accuracy y fue la mejor accuracy de todas no es pesimista. 


### (c) acertado ya que si hicimos bien los splits de cross validation, podemos garantizar que no hay información que se esté filtrando entre el entrenamiento y la validación de los modelos.

Falso, aunque no se filtren datos entre entrenamiento y validacion justamente no confiamos en
cada fold para estimar su performance.


### (d) demasiado optimista (porque habremos usado los datos de validación para tomar decisiones respecto al sistema).

Verdadero.
Posiblemente sea muy optimista si es el mejor de todos. Puede pasar que en algun fold haya quedado para
validar un subconjunto de datos que justo el modelo (resultante de los otros folds) sea muy bueno 
clasificando. No confiamos en las predicciones individuales de cada modelo por eso es que no usamos los
datos de desarrollo para tomar decisiones respecto del sistema.