## Ejercicio 2
Se tiene un sistema con 16 MB de RAM que utiliza particiones fijas para ubicar a los programas
en memoria. Cuenta con particiones de 8 MB, 1 MB, 4 MB, 512 KB, 512 KB y 2 MB, en ese orden.
Se desea ejecutar 5 programas de los siguientes tamaños: 500 KB, 6 MB, 3 MB, 20 KB, 4 MB, en ese
orden

### a)
formato que voy a usar:


Programa memoria $\rightarrow$ particion (desperdicio)

__Best fit__:

P1 500KB $\rightarrow$ particion 4 (desperdicia 12kb)

P2 6MB $\rightarrow$ particion 1 (desperdicia 2MB)

P3 3MB $\rightarrow$ particion 3 (desperdicia 1MB)

P4 20KB $\rightarrow$ particion 5 (desperdicia 492 kb)

P5 4MB $\rightarrow$ no me entra!

Desperdicio:

2MB + 1MB + 1MB + 12KB + 492KB + 2MB = 6,5MB(aprox)

### b)
__worst fit__

P1 500KB $\rightarrow$ particion 1 (desperdicia 7,5 MB APROX)

P2 6MB $\rightarrow$ no me entra!

P3 3MB $\rightarrow$ particion 3 (desperdicia 1MB)

P4 20KB $\rightarrow$ particion 6 (desperdicia aprox 2 MB)

P5 4MB $\rightarrow$ no me entra!

desperdicio: aprox 12,5 MB
 
__first fit__

P1 500KB $\rightarrow$ particion 1 (desperdicia 7,5 MB APROX)

P2 6MB $\rightarrow$ no me entra!

P3 3MB $\rightarrow$ particion 3 (desperdicia 1MB)

P4 20KB $\rightarrow$ particion 2 (desperdicia aprox 1 MB)

P5 4MB $\rightarrow$ no me entra!

desperdicio: aprox 12,5 MB

### c)
El mejor fue best fit (aprox 6,5 MB de desperdicio)

\newpage