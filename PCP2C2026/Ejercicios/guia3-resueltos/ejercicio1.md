# Ejercicio 1

Llamo Thread 1 al que ejecuta importante y Thread 2 al que ejecuta antesydespues

## inciso a

Si primero corre el Thread 2 y despues Thread 1:

1. Toma el lock del monitor thread 2
2. // antes
3. permiso.signal() -> no hay nadie esperando , sigue
4. // despues
4. Toma el lock del monitor thread 1
5. permiso.wait()  -> se queda colgado y no respetamos el orden

## inciso b

Seguimos teniendo el problema del inciso anterior y se suma la ejecucion al reves:

1. Toma el lock del monitor thread 1
2. permiso.wait() // libera el mutex y se agrega a la cola
3. Toma el lock del monitor thread 2
4. // antes
5. permiso.signal() -> Aunque haya alguie esperando como hizo signal sigue.
6. // despues -> termino , libera el mutex
7. // Importante (antes toma el mutex que quedo libre)

No se preserva el orden. Esta ejecucion con la politica del inciso a si funciona.
