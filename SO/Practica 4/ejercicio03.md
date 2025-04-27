## Ejercicio 3
Considerar un sistema con paginación por demanda donde los procesos están haciendo acceso
secuencial a los datos de acuerdo a los siguientes patrones de uso:

- Uso de CPU: 20 %.

- El sistema hace thrashing.

- Uso del resto de los dispositivos de E/S: 10 %.

Como se ve, la CPU está siendo ampliamente desaprovechada.
Para cada uno de los siguientes cambios en el sistema indicar si es probable o no que mejore la
utilización de la CPU.

- Instalar una CPU más rápida.

- Instalar un disco de paginado más grande.

- Incrementar el grado de multiprogramación.

- Disminuir el grado de multiprogramación.

- Instalar más memoria principal.

- Instalar un disco más rápido.

- Incrementar el tamaño de página.

- Incrementar la velocidad del bus de E/S.

__Instalar una CPU mas rapida__:

No implicaria una mejora (al menos significativa). El gran problema es que se se esta utilizando
tanto como deseamos la CPU, una mas rapida sera igual de desutilizada.

__Instalar un disco de paginado más grande__:

Agrandar el disco no deberia resolver nada, si esta haciend thrashing se esta quedando
sin espacio en la memoria.

__Incrementar el grado de multiprogramación.__:

Si el sistema esta haciendo thrashing aumentar el switcheo entre tareas no es la mejor idea.
Si lo hacemos vamos a profundizar aun mas la penalizacion del thrashing de estar swapeando paginas
entre el disco y la memoria principal

__Disminuir el grado de multiprogramación__:

Al disminuir el switcheo entre programas, vamos a reducir la cantidad de veces 
que swapeamos paginas entre el disco y la memoria. De esta manera aumenta el uso de la CPU.

__Instalar más memoria principal__:

Con mas memoria va a haber espacio para tener mas programas. De esta manera se reduce el thrashing 
y se van a tener que swappear menos paginas entre memoria y disco. Lo que conlleva en un mayor uso de CPU

__Instalar un disco más rápido__:

Cuando hay thrashing el sistema esta constantemente swappeando paginas entre memoria y disco.
Con un disco mas rapido, si bien el thrashing sigue estando, se mitiga el tiempo que tarda el swapping.
Por esta razon aumenta el CPU 

(Si el disco fuera infinitamente rapido, el swapeo seria instanteneo, 
asi que el thrashing no implicaria un problema).

__Incrementar el tamaño de página.__:

No se, consultar.

__Incrementar la velocidad del bus de E/S.__:

Creo que no, el bus de E/S no esta saturado. El cuello de botella en este caso particular
es que el disco no escribe suficientemente rapido las paginas, sino saturaria el bus.

\newpage