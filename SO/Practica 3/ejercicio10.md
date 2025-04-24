## Ejercicio 10
Se tienen los siguientes dos procesos, foo y bar, que son ejecutados concurrentemente. Además
comparten los semáforos S y R, ambos inicializados en 1, y una variable global x, inicializada en 0.

```c
void foo(){
    do{
        semWait(S);
        semWait(R);
        x++;
        semSignal(S);
        semSignal(R);
    } while (1);
}

void bar(){
    do {
        semWait(R);
        semWait(S);
        x--;
        semSignal(S);
        semSignal(R);
    } while (1);
}
```

### a) ¿Puede alguna ejecución de estos procesos terminar en deadlock? En caso afirmativo, describir una traza de ejecución.

Si puede.

1. Empieza foo y ejecuta wait(S), el semaforo s pasa a 0.
2. Se desaloja a foo y se empieza a ejecutar bar.
3. Se ejecuta wait(r), el semaforo r pasa a 0.

Ahora foo se va a quedar esperando a r y bar a s, como ambos son 0 tenemos deadlock.

### b) ¿Puede alguna ejecución de estos procesos generar inanición para alguno de los procesos? En caso afirmativo, describir una traza.

Si.

Por ejemplo con un scheduler sin deselojo el proceso foo nunca necesitaria dormirse,  asi que nunca devolveria el scheduler (ya que el mismo se prende los semaforos que necesita para seguir). Foo
tomaria control de la CPU lo que llevaria a la starvation de bar.

\newpage