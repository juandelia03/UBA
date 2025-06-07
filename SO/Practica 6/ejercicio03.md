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

### b)

El 50% que tiene archivos de 2 Kib, por cada archivo usa solo medio bloque asi que desperdicia la mitad del espacio. Es decir desperdicia la mitad de 50% $\Rightarrow$ 25%

Los archivos que ocupan 4 Kib y 8 Kib utilizan exactamente uno o dos bloques respectivamente, es decir que no desperdician espacio.

**Espacio desperdiciado total: 25%**

### c) 

Primero calculo cuantos bloques de datos requiere el archivo:

$\frac{5Mib}{4Kib} = 1280$ Bloques

Veamos a cuantos bloques tengo que acceder (tener en cuenta las cuentas de a) )

Con los directos me consigo 5 bloques en 5 accesos al disco.

Si me traigo del disco el primer bloque indirecto tengo acceso a 512 LBA's de bloques de datos. Como tengo 2 indirectos me traigo dos bloques.
En total me quedan 2 accesos de traerme los bloques de LBA's + 1024 accesos de efectivamente traerme los bloques de datos.

Todavia no me alcanza, me faltan 251 bloques de datos mas (me faltaria un bloque indirecto mas)

Me traigo el bloque doblemente indirecto, de ahi me traigo el primer bloque indirecto y con ese me puedo traer los 251 bloques de datos.
En total me quedan 1 (bloque d.i) + 1 (bloque indirecto) + 251 (traerme los bloques de datos).

**Bloques accedidos: 5 + 2 + 1024 + 1 + 1 + 251 = 1284 Bloques**
