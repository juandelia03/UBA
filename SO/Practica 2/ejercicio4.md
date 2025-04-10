## Practica 2 Ejercicio 4

### Round Robin

```
No puede resultar en starvation, el scheduler se va pasando entre todos los procesos en orden durante un quantum.
Tarde o temprano todos terminan.
```

### Por prioridad
```
Puede resultar en starvation. Si hay un proceso con prioridad x habiendo siempre procesos ready con prioridad y>x, 
el scheduler nunca le va a dar el CPU al proces de prioridad x.
```

### SJF
```
Al igual que en "Por prioridad" puede haber starvation por la misma idea. 
Si hay un proceso que toma un tiempo N, si hay todo el tiempo procesos ready que toman M<N, 
el scheduler nunca le va a dar la CPU al primer proceso.
```

### SRTF
```
Por la misma razon que SJF puede resultar en starvation. 
Es la version con desalojo de SJF, si llega un nuevo proceso con menor tiempo de ejecucion que el actual, 
le saca la CPU al viejo y se lo da a este. 
```

### FIFO
```
No puede resultar en starvation. Los procesos se ejecutan en el orden en que llegaron sin importar nada mas, 
asi que tarde o temprano se van a ejecutar todos.
```

### Colas de multinivel

```
Puede resultar en starvation. Si por ejemplo hay n procesos en una cola de prioridad y un unico proceso en otra cola menor a esa: 
si los n procesos van pasandose entre ellos el scheduler (por que antes de que se vacie la cola uno de ellos vuelva a estar ready) el scheduler nunca va a darle el CPU al proceso de la cola de inferior prioridad.
```

### Colas de multinivel  con feedback (aging)

```
No puede resultar en starvation. 
Funciona igual que las colas de multinivel pero cuando un proceso no se ejecuta por mucho tiempo sube de cola. 
Esto evita que un proceso pueda quedarse sin ejectutar porque haya otros en una cola de mayor prioridad, 
pues tarde o temprano este proceso va a llegar a esa cola tambien.
```