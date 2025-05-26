## Ejercicio 2 
Se tiene un disco con capacidad de 128 GB, y bloques de 8 KB. Supongamos un sistema de archivos
similar a FAT, donde la tabla se ubica desde la posición 0, y cada entrada de la tabla es de 24 B.

a) ¿Qué tamaño ocupa la tabla?

b) ¿Cuántos archivos de 10 MB es posible almacenar?

c) Se sabe que un archivo comienza en el bloque 20. Dada la siguiente FAT, indicar el tamaño de
dicho archivo. **(hay una tabla en la guia, no la voy a copiar)**

### a)

Para ver cuanto ocupa la tabla primero calculo cuantos bloques hay:

#bloques = $\frac{128 Gib}{8Kib} = \frac{128.2^{30}B}{8.2^{10}B} = \frac{128.2^{20}}{8} = 16.2^{20} = 2^{24} $ bloques 

la tabla ocupa: $16.2^{20}.24B =$ 384 Mb

### b)

Cuantos bloque ocupa un archivo de 10 Mib:

$\frac{10Mib}{8Kib} = \frac{10.2^{20}B}{8.2^{10}B} =$ 1280 Bloques por archivo.

archivos que puedo guardar es: $\frac{\text{bloques disponibles}}{\text{bloques por archivo}}$

Los bloques que tengo disponibles son todos los bloques menos los que ocupa la tabla:

bloques disponibles = $2^{24} - \frac{384Mib}{8Kib} = 2^{24} - \frac{384.2^{20}}{8.2^{10}} = 2^{24} - 48.2^{10}$

#archivos_de_10_Mib = $\frac{2^{24}-48.2^{10}}{1280} = 13068.8$ 

es decir que se pueden guardar 13068 archivos.

### c)

Usa los bloques: 20,21,22,3,4,5,0.

Entonces el archivo ocupa: 8Kib.7 = 56 Kib.
