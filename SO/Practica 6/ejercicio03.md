## Ejercicio 3

Un sistema de archivos de UNIX, similar a ext2, tiene bloques de tamaño 4 KB y el direccionamiento a bloques de disco (LBA) 
es de 8 B. A su vez, cada inodo cuenta con 5 entradas directas, dos
indirectas y una doblemente indirecta.

a) ¿Cuál es el tamaño máximo de archivo que soporta?

b) Si el 50 % del espacio en disco está ocupado por archivos de 2 KB, el 25 % por archivos de 4
KB y el 25 % restante por archivos de 8 KB, ¿qué porcentaje del espacio en disco está siendo
desperdiciado? (Considerar sólo el espacio utilizado en los bloques de datos).

c) ¿Cuántos bloques es necesario acceder para procesar completo un archivo de 5 MB?

### a)

Calculemos cada cosa:

**Directos:**

5 bloques de 4 kb cada uno $\Rightarrow$ 20kb

**Indirectos simples**:

Cada indirecto apunta a un bloque, pero ese bloque no es de datos sino que esta lleno de LBA's que apuntan a los datos. Cuanta LBA's entran en un bloque?

$\frac{4Kb}{8B} = 512 = 2^{9}$ Entonces el bloque al que apunta el indirecto apunta a $2^{9}$ bloques, como hay 2 indirectos suman $2^{10} bloques \Rightarrow$ 4096 Kib

**Indirecto doble**:

Este apunta tambien a un bloque lleno de LBA pero esas LBA no apuntan a los datos del archivo directamente, si no que a un bloque como los indirectos simples. Es decir que por cada 
entrada del bloque apunta a un bloque descripto en la seccion anterior: 

$2^{9}.2^{9} = 2^{18}$ (cantidad de LBA's multiplicado por cuantos bloques apunta la tabla a la que apunta) 

$\Rightarrow$ 1048576 Kib

**suma total: 20 Kib + 4096 Kib + 1048576 Kib = 1052692 Kib**
