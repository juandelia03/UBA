## Ejercicio 1 
Suponer una computadora cuyo disco se accede sin memoria cache y un sistema de archivos FAT.
Además, en este sistema, la FAT no queda almacenada en la memoria (recordar que lo normal es que
la FAT se cargue en memoria). ¿Cuántos accesos al disco son necesarios para llegar hasta el último
bloque de un archivo de N bloques?

Por la consigna entiendo que en **cada acceso** de la FAT me la tengo que traer del disco.

Si solo quiero traerme el ultimo bloque (y no los intermedios), voy a necesitar hacer n-1 lecturas a la FAT $\Rightarrow$ n-1 lecturas a disco.

Por ultimo si quiero traerme ese bloque necesito una lecutra mas (no entiendo si la consigna pide traerlo o no, digamos que si)

En total quedan N lecturas.
