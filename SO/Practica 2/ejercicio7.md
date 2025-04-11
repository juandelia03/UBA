## Practica 2 Ejercicio 7

### Waiting time y Turnaround promedio
```
W-T: (0+7+0+9+0)/5 = 3,2
T-A: (3+13+4+14+2)/5 = 7,2
```

### Tipo de scheduler

``` 
Es un SJF con desalojo (SRTF):
P1 empieza y cuando entra P2 le falta solo un ciclo, asi que P2 no lo desaloja.
En el momento 3 empieza P2 pero en momento 4 entra P3 con menor trabajo que P2 y lo desaloja.
P3 Termina porque nadie lo desaloja.
Sigue P5 que es el mas corto y termina.
Retoma P2 que le queda menos que a P5.
Y por ultimo termina P5
```
