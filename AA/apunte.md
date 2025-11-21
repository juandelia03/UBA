## Regresion y GD

KNN: Devolver el promedio de los valores de los vecinos más cercanos
árboles: El valor de una hoja será el promedio de las instancias de la región
regrasión lineal:

Sesgo inductivo, la función a estimar es una combinación lineal de sus atributos.
$Y = w_0 + w_1 X_1 +... + w_p X_p + \epsilon$ los w son aprendibles.

Entrenar al modelo seria encontrar los w que minimizan la funcion de perdida (como MSE) para el dataset dado.

Para encontrar los pesos usamos gd. La funcion g(z), z vector, a minimizar debe ser diferenciable. El gradiente
indica la direccion de mayor crecimiento de la funcion y la magnitud.
Pasos: 1. Inicializar z con un valor al azar 2.Repetir: a) calcular el gradiente de g respecto de z
b) actualizar z = z - α \* ∇g(z), α learning rate.

Lo usamos para minimizar la funcion de perdida.

Encontrar el gradiente de algunas funciones puede ser fácil analíticamente (como con MSE)

Para hacer gd necesitamos todo el dataset en memoria, capaz no entra. Usamos mini batch.
Se hace el update de los parámetros usando un subcjto de los datos (iteracion). Se muestrea sin reposición,
una vez que usamos todos los datos se dice que paso una epoch.
En cada iteracion se minimiza una funcion de perdida distinta,
porque cada una tiene otros datos (distinto minibatch)

## Regresión logística y Redes 

Regrasion logística: Sirve para hacer clasifición binaria.
Es una red igual a la red de la regresión lineal, pero tiene una funcion de activación sigmoidea que deja los valores entre 0 y 1. Como función de pérdida ya no tiene sentido MSE. Funcion de perdida BCE. En multiclase
usamos como funcion de activación softmax (salida suma 1 y es diferenciable) y perdida CE

En multilabel no usamos softmax, sino una sigmoide por cada label a predecir. Por ejemplo predecir si un objeto
está en una img o no (con muchos objetos distintos). La f de perdida seria algo como una BCE por salida.

Regresión lineal/logística son una "instancia" de perceptrón simple: $Input \rightarrow \sum \rightarrow Activación \rightarrow Out$ (input de tamaño arbitrario el resto es una sola neurona).

Se puede tener multicapa, en vez de la salida ser la salida, es la entrada a la siguiente capa (agregando bias).

En una red entra una instancia, es decir un vector. Pero los pesos son matrices. Si "agregamos" instancias al
input ahora podemos pensar que en lugar de un vector tenemos una matriz (un arreglo de instancias) y la dimensión
de las matrices no cambia.

En general para toda capa intermedia usamos la misma funcion de activación, pero la última depende del problema.

Una red es un modelo de pinta $h^l(...h^2(h^1(x)))$

Para entrenarlo con gd necesitamos el gradiente de la expresion que quede de aplicar la función de perdida. 
Para eso usamos backpropagation: 
1. Construir el grafo computacional 
2. Pasada forward, calcular f reemplazando por los pesos (evaluar en un punto)
3. Pasada backward
    - computar los gradientes "locales" (de cada operación) del final hasta el principio
    - calcular el gradiente usando la regla de la cadena

## Prediccion de secuencias

