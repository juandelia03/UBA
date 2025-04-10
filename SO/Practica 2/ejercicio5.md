## Practica 2 Ejercicio 5

### a) 
```En round robin se ejecutan los procesos en el orden de la cola dandole un quantum a cada uno,
si ponemos mas de una vez a un proceso es como si tuviera el doble de quantum:
Si tengo P1 P1 P2 P3 , p1 se ejecuto con el doble de quantum.
Si ademas puedo poner intercalados los procesos es una herramienta para darle mayor prioridad.
Si quiero que p1 se ejecute mas veces que p2 o p3 porque tiene rafagas cortas de cpu puedo hacer:
P1 P2 P1 P3 P1...
```

### b)
- Ventajas:
    1. Puedo asignarle mas de un quantum a cada proceso (k quantums).
    2. Me da una manera de darle una forma de "prioridad" a un proceso, colandose del resto. 
- Desventajas:
    1. Si me intersara, el CPU ya no se reparte equitativamente entre todos
    2. puede genera mayor efecto convoy si le doy mucho quantum a un proceso de rafaga larga de CPU


### c)
i) Para el caso de el mismo proceso muchas veces seguidas (mas de un quantum):
```
En vez de encolar varias veces el mismo se le podria asignar un quantum distinto a cada proceso:
en vez de tener la cola: P1,P1,P2,P1,P3,P1,P4, tendria: P1 con q=3
```
ii) Para el caso de la "prioridad" o "colarse":
```
Ademas de asignarle un quantum podria decirle en cuantos "ciclos" del scheduler le tocaria ejecutarse de vuelta.
Con -1 mantiene el comportamiento default, insertarse al final de la cola. 
(raro, para este comportamiento seria mas comodo tener repetidos en la cola en mi opinion).
```