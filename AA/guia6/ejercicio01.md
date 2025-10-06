## Ejercicio 1 Matriz de Confusión

### (a) En un problema de clasificación binaria, ¿a qué se denomina clase positiva y a qué clase negativa? Si nuestro problema consiste en clasificar spam vs. no-spam, ¿cuál es la clase positiva? Si nuestro problema es clasificar imágenes de perros vs. gatos, ¿cuál es la clase positiva?

La clase positiva la definimos nosotros, es arbitraria. Después usamos esa clase para hacer cuentas como
TP. Así que dependiendo de que definamos como clase positiva algunas métricas varían.

### (b) Explicar con tus palabras la definición de verdadero positivo, verdadero negativo, falso positivo y falso negativo.

- TP: Cuando predecimos positivo en una instancia que efectivamente era de la clase positiva
- TN: Cuando predecimos negativo en una instancia que efectivamente era de la clase negativa
- FP: Cuando predecimos positivo en una instancia que era de la clase negativa
- FN: Cuando predecimos negativo en una instancia que era de la clase positiva

### (d) ¿Por qué podría un falso positivo ser considerado más (o menos) importante que un falso negativo? Dar un ejemplo en donde es más grave tener falsos negativos que falsos positivos.

Ejemplo: En un hospital queremos predecir quienes pueden llegar a tener cadrdiopatías graves. Definimos como clase positiva a los malos diagnostico es decir los que creemos que tienen riesgo de cardiopatías graves. Si alguien
no cae en la clase positiva no se le hacen más estudios.

Acá tener falsos positivos puede implicar un costo monetario extra como pagar algunos estudios de más. Tener falsos
negativos significa que alguien que tiene riesgo de tener una cardiopatia grave no se va a hacer más estudios,
lo que resulta mucho más grave.
