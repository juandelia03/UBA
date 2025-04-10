## Practica 2 Ejercicio 1

### i) Es buena idea usar round-robin?
```
Seria una buena idea usar round-robin porque P0 y P1 se bloquean mucho, asi que van a decirle al scheduler que siga con el siguiente cada vez que se bloqueen,muchas veces sin siquiera terminar de usar su quantum. 
P2 por otra parte posiblemente se quede sin quantum al ejecutar largas rafagas de cpu pero va a terminar ejecutandose sin starvation despues de algunas vuetlas del RR.
```

### ii) Es buena idea implementar prioridad?
```
Cuando implementamos prioridades queremos en las colas mas prioritarias a los procesos que usan poco CPU/se bloquean rapido (por el criterio ideal de SJF). Entonces Armariamos posiblemente dos colas, una para P0 y P1 que sabemos que se bloquean mucho y la otra, menos prioritaria, para P2 que tiene rafagas prolongadas de CPU. 
Esta estrategia puede llevar a starvation de P2 si siempre se pasan el scheduler entre P0 Y P1.
Ademas en los momentos que P2 este ejecutandose por prioridad (asumiendo que no hay desalojo)
P0 y P1 van a estar mucho tiempo esperando para ejecutar sus tareas que son muy cortas, mientras que en RR esperarian a lo sumo el quantum de P2.
```

### Conclusion 
```
Pareceria que es mejor idea implementar Round-Robin para evitar la starvation de P2 y reducir el "Convoy effect" de P0 y P1.
```