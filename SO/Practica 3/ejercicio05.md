## Ejercicio 5
Se tienen n procesos: P1, P2, ... , Pn que ejecutan el siguiente código. Se espera que todos los
procesos terminen de ejecutar la función preparado() antes de que alguno de ellos llame a la función
critica(). ¿Por qué la siguiente solución permite inanición? Modificar el código para arreglarlo.

```c
preparado()

mutex.wait()
count = count + 1
mutex.signal()

if (count == n)
    barrera.signal()

barrera.wait()

critica()
```

Hay dos problemas, el primero es que no sabemos cuantas veces se va a ejecutar el cuerpo del if.
Es posible que el n-esimo proceso haga que count = n  y otros procesos hayan sido desalojados arriba del if. Cuando esos retomen su ejecucion van a entrar al cuerpo del if. Este no es el comportamineto esperado, queremos un unico signal que "abra" la barrera. 
(se veia que iba a ser un problema porque se accede a un recurso compartido afuera del mutex).

El segundo problema es que una vez que un proceso pase la barrera esta va a quedar cerrada y ningun otro
la va a poder pasar. Para solucionarlo hay que agregar un signal despues del wait, asi se genera el efecto cascada.

La barrera empieza en 0 y el mutex en 1.

```c
preparado()

mutex.wait()
count = count + 1
if (count == n)
    barrera.signal()
mutex.signal()

barrera.wait()
barrera.signal()

critica()
```

\newpage