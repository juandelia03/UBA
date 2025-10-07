## Ejercicio 1 Dar una explicación general del algoritmo Bagging.

Bagging (Bootstrap Aggregating) entrena B modelos utilizando un mismo dataset, como?:

Construye B datasets del mismo tamaño que el original tomando instancias al azar del dataset original (con reposición) y los usa para entrenar a los B modelo (bootraps).

Luego para hacer una predicción cada modelo "vota" y se decide cual va a ser la predicción.

(Problema: los modelos van a estar muy correlacionados ahí aparece RF)
