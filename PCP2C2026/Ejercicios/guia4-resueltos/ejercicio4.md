# Ejercicio 4

## inciso a


Dada esta lista $T_1$ quiere eliminar C

```
MIN -> A -> B (pred) -> C (curr) -> D
```

1. Justo antes de que $T_1$ tome los locks sobre B y C alguien elimina B.
2. Falla validate y T1 empieza de nuevo.
3. Antes de volver a recorrer la lista otro thread vuelve a insertar B exitosamente.
4. $T_1$ retoma la ejecucion, justo antes de tomar los locks de B y C, otro hilo elimina B.
5. etc..


## inciso b

Consideremos:

```
MIN -> B -> C
```

Asumamos que al agregar A obtendriamos:

```
MIN -> A -> B -> C
```

Sean $T_1$ y $T_2$ dos procesos:

$T_1$: add(A) llega a ejecutar curr.lock() $\Rightarrow$ B queda bloqueado,  no llega a bloquear MIN

$T_2$; remove(B) llega a ejecutra pred.lock() $\Rightarrow$ MIN queda bloqueado, no llega a bloquear B

$\bold{deadlock}$
