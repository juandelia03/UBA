## Ejercicio 9

Linux permite pasar un descriptor de archivo de un proceso a otro (es decir, el valor de retorno de
la syscall open()). Suponga que un proceso abre el directorio /home que está sobre una partición de
ext2 y le envía el descriptor del archivo home a otro proceso con los permisos necesarios para poder
leerlo.
Suponiendo que tiene la función auxiliar Ext2FSInode load_inode(int inode_number) que dado
un número de inodo devuelve la estructura del inodo, escriba el pseudocódigo que le permita obtener
el nombre del directorio (home) a partir del descriptor de archivo recibido.


Entiendo que lo que hay en fd es el numero de inodo de "/home".

Cada inodo tiene bloques da datos con todas sus dir_entry's. Siempre las primeras son "." y ".." (numero de inodo del padre)

La estructura del direntry (entrada en mi pseudocodigo) tiene esta pinta:

|   nombre.extension    |   Tamaño (bytes)  |    ...    |   numero de inodo | 

Voy a querer buscar en el inodo de /home al primer bloque de datos que tiene a "..", de ahi me puedo traer el inodo
del padre. De ahi leo sus bloques de datos para encontrar el dir_entry que tenga el numero de inodo que me pasron por paraemtro.

```py
obtener_nombre(fd):
    # me traigo el inodo del parametro 
    numero_de_inodo_inicial = fd.inodo
    inodo_inicial = load_inode(numero_de_inodo_inicial)
    #busco al directorio e inodo del padre (asumo que .. siempre esta en el primero)
    bloque_1 = inodo_inicial.bloques[0]
    
    numero_de_inodo_padre = -1
    for entrada in bloque_1:
        if entrada.name == "..":
            numero_de_inodo_padre = entrada.inodo
            break
    if numero_de_inodo_padre == -1:
        return error
    
    inodo_padre = load_inode(numero_de_inodo_padre) 
    # busco en las entradas edel padre
    for bloque_de_datos in padre: #no se en que bloque de datos estara home
        for entrada in bloque_de_datos:
                if entrada.inode = numero_de_inodo_inicial:
                    return entrada.name
    
    return error
        
```
