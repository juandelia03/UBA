# Pseudocodigo ejercicio 11

## Inciso a 

### Globales 

``` Java
int n = 0;
mutex = Semaphore(1);
toiletes = Semaphore(8);
permisson = Semaphore(1);
```

### Thread de las personas

``` Java
Thread P { 
    mutex.acquire();
    if n == 0{
        persmisson.acquire();
    }
    n++; // incrementamos el n aunque no tome un toilete, indica cuanta gente hay en el bano
    mutex.release()
    toiletes.acquire();
    usar_toilete();
    mutex.acquire();
    toiletes.release();
    n--;
    if n == 0{ 
        permisson.release();
    }
    mutex.release();
}
``` 

### Thread del servicio de limpieza

``` Java
Thread L{
    permisson.acquire();
    limpiar();
    permisson.release();
}
``` 

## Inciso b

Podemos meter una barrera. Un semaforo nuevo "esperando_afuera" inicializado en 1 y fair. sem(1,true)

Cuadno pasa un thread persona lo tiene que tomar al inicio, e inmediatamente liberalo. Indicando que puede pasar el siguiente de "afuera". 
Cuando pasa el thread del servicio de limpieza lo toma y solo lo libera cuando termina de limpiar. Esto asegura que no sigan entrando personas a la cola y eventualmente le toque limpiar.


### Nueva variable global

``` Java
esperando_afuera = new Semaphore(1, true);
```

### Thread de las personas

``` Java
Thread P { 
    esperando_afuera.acquire();
    esperando_afuera.release();
    mutex.acquire();
    if n == 0{
        persmisson.acquire();
    }
    n++; // incrementamos el n aunque no tome un toilete, indica cuanta gente hay en el bano
    mutex.release()
    toiletes.acquire();
    usar_toilete();
    mutex.acquire();
    toiletes.release();
    n--;
    if n == 0{ 
        permisson.release();
    }
    mutex.release();
}
``` 

### Thread del servicio de limpieza

``` Java
Thread L{
    esperando_afuera.acquire();
    permisson.acquire();
    limpiar();
    permisson.release();
    esperando_afuera.release();
}
``` 

### Inciso c 

Basta con que antes de pasar por el semaforo que hace de molinete al principio, las personsas
tengan que tomar el recuro del toilette. De esa manera nos aseguramos que solo "entran" de a 8 y el resto 
queda en la fila con el servicio de limpieza.

### Thread de las personas

``` Java
Thread P { 
    toiletes.acquire(); // solo cambia esto
    esperando_afuera.acquire();
    esperando_afuera.release();
    mutex.acquire();
    if n == 0{
        persmisson.acquire();
    }
    n++; // incrementamos el n aunque no tome un toilete, indica cuanta gente hay en el bano
    mutex.release()
    usar_toilete();
    mutex.acquire();
    toiletes.release();
    n--;
    if n == 0{ 
        permisson.release();
    }
    mutex.release();
}
