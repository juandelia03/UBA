## Ejercicio 3 Sea un clasificador binario de tipo Bagging en donde los submodelos predicen decisiones duras (Positivo o Negativo), entrenado sobre un conjunto de datos de entrenamiento . Al evaluar 5 instancias el clasificador devuelve las siguientes probabilidades de pertenencia a la clase positiva: [0.75, 0.50, 0.25, 0.75, 1.0]. Determinar la cantidad de sub-modelos utilizados en el ensamble. Justificar.

Pueden ser 4 sub-modelos por la pinta de las probas:
Para cada predicción:

1. Uno voto negativo y 3 votaron positivo $\Rightarrow \frac{3}{4}$
2. Dos votaron negativo y 2 votaron positivo $\Rightarrow \frac{2}{4}$
3. Uno voto positivo y 3 votaron negativo $\Rightarrow \frac{1}{4}$
4. Uno voto negativo y 3 votaron positivo $\Rightarrow \frac{3}{4}$
5. Todos votaron positivo $\Rightarrow \frac{4}{4}$
