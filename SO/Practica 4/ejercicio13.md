## Ejercicio 13

Suponer que se tiene un sistema con 2 MB de RAM y se desea ejecutar un programa de 4 MB
ubicado en un disco de 200 GB.

### a)

Explicar cómo funciona el mecanismo de paginación que permite ejecutar un programa más
grande que la memoria física disponible.

Si bien todo el programa no entra en memoria lo podemos correr. Como?

Se carga en la memoria lo que se pueda del programa (2MB). A medida que avanza la ejecucion, cada vez que hay que ejecutar algo que no este en memoria ocurre un PF.

Se desaloja alguna página y se reemplaza por la que contiene lo que se necesite para ejecutar.
(las pagina que se desalojan se bajan a disco. Se van swapeando a medida de lo que se necesita.)

### b)

Si el tamaño de frame es de 4 KB y suponiendo que el programa tarde o temprano ejecuta
todo su código. ¿Cuántos fallos de página se producirán como mínimo?

El caso con menos PF seria un codigo sin salto, se ejecuta de la linea 0 a la n secuencialmente
y se van trayendo las paginas necesarias.
En 2 MB tenemos 2048 KB, es decir 512 páginas. El código ocupa 1024 páginas.

Si inicialmente cargo las primeras 512 páginas de la memoria con las 512 páginas del programa, me ahorro 512 PF.

(notar que este caso es recontra artificial solo se usa la memoria para **leer** las lineas de codigo).

### c)

¿Bajo qué contexto tiene sentido que varios procesos compartan páginas? Indique por lo menos
2 situaciones y justifique.

- i:

Si por ejemplo dos procesos corren el mismo código podrían compartir esa página de **lectura** para no tener que duplicar la info.

- ii:

Un proceso padre y un hijo idéntico. Capaz el hijo usa variables del padre, mientras nadie escriba esas páginas
la data en ellas es válida. (Recién cuando uno la escriba es necesario realizar una copia)

\newpage
