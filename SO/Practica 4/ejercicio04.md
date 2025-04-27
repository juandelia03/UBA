## Ejercicio 4
¿Bajo qué circunstancias se produce un page fault? 
¿Cuáles son las acciones que realiza el sistema operativo para resolver la situación?

Se produce un page fault cuando tratamos de leer una pagina que no tenemos en la memoria.

El sistema operativo llama a la rutina de atencion del page fault.
Busca la pagina que tiene que traer a la memoria (y se fija que el proceso tenga permiso).
Esta pagina se copia en algun frame que este libre y en caso de que no haya ninguno lo libera
con el algoritmo que use.

Ademas si la pagina que desalojamos tiene el bit dirty prendido, antes hay que bajarla a disco 
porque fue modificada. Despues de hacer eso se retoma la ejecucion.

\newpage