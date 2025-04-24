## Ejercicio 6
Cambie su solución del ejercicio anterior con una solución basada solamente en las herramientas atómicas vista en las clases, que se implementan a nivel de hardware, y responda las siguientes
preguntas:

a. ¿Cuál de sus dos soluciones genera un código más legible?

b. ¿Cuál de ellas es más eficiente? ¿Por qué?

c. ¿Qué soporte requiere cada una de ellas del SO y del HW?

```c
//varibale compartida
count = atomic<int> counter;
```

```c
preparado()
count = count.getAndInc();
while(count < n);
critica();
```

### a) 
Esta opcion es mucho mas legible, no me estoy ocupando explicitamente del manejo de semaforos.

### b) cual es mas eficiente
La anterior pareceria ser mas eficiente, en esta solucion a mayor sea el n y dependiendo de
la complejidad de la funcion preparado(), crece mucho el busy waiting. 
Vamos a gastar mucho procesador en ese while.
En cambio usando semaforos los procesos esperan a que los despierten.


### c)

El uso de variables atomicas requiere del hardware instrucciones atomicas para que no se puedan interrumpir.

Los semaforos requieren su implementacion del SO para poder llevar el registro y despertar a los que estan esperando 
y del hardware las instrucicones atomicas como wait y signal necesarias para implementarlos.