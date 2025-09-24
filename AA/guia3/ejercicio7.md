## Ejercicio 7 En árboles de decisión, describa cómo computaría, para una instancia dada, el vector de probabilidades por clase (un vector que tenga en sus componentes, la probabilidad de que la instancia pertenezca a cada una de las distintas clases posibles).

Podria calcular para cada hoja del arbol la proporcion de instancias que tiene. Por ejemplo si en una 
hoja quedaron 2 instancias de la clase A y 8 de la clase B tenemos A: 20% y B: 80%.

Despues dada una instancia, si termina en esa hoja del arbol el vector seria = [0.2,0.8]