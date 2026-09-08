# Pseudocodigo ejercicio 12

## Inciso a 

Puedo tener un semaforo por cada sentido y un contador de cuantos vienen por cada uno. Si no viene nadie del lado "opuesto", se puede cruzar. Si hay alguien del lado opuesto se queda esperando en su semaforo.
Cuando pasa el ultimo (termina y no queda nadie cruzando) hay que liberar el semaforo opuesto y actualizar el contador.

### globales

``` Java
autos_por_sentido = {0,0};
esperar_sentido  = {sem(0), sem(0)};
esperando = 0;
mutex = sem(1)
```

### Thread del auto

``` Java
Thread A(sentido){
    opuesto = 1 - sentido;
    
    mutex.acquire();
    if(autos_por_sentido[opuesto] > 0){
        esperando ++;
        mutex.release();
        esperar_sentido[sentido].acquire();
    } else{
        autos_por_sentido[sentido]++;
        mutex.release();
    }
    cruzar() // puede tardar T tiempo
    mutex.acquire();
    autos_por_sentido[sentido] --;
    if(autos_por_sentido[sentido] == 0){ 
        //dejamos pasar a los del sentido opuesto
        autos_por_sentido[opuesto] = esperando;
        esperar_sentido[opuesto].release(esperando);
        esperando = 0;
    }
    mutex.release();
}

```

## Inciso b y c

Podemos usar una barrera de capacidad 3 y un semaforo justo para evitar starvation . 
La barrera de capacidad 3 evita que haya mas de 3 cruzando a la vez. 
Para evitar starvation podemos meter otro semaforo que habilita a pasar a otro cada vez que el que entra puede pasar.
Entonces cuando llega un auto que quiere cambiar el sentido, bloquea a los nuevos que vengan.

### globales

``` Java
autos_por_sentido = {0,0};
esperar_sentido  = {sem(0), sem(0)};
esperando = 0;
mutex = sem(1);
barrera = sem(3);
primera_barrera = sem(1,true);
```

### Thread del auto

``` Java
Thread A(sentido){
    opuesto = 1 - sentido;
    primera_barrera.acquire()
    barrera.acquire();
    mutex.acquire();
    if(autos_por_sentido[opuesto] > 0){
        esperando ++;
        mutex.release();
        esperar_sentido[sentido].acquire();
    } else{
        autos_por_sentido[sentido]++;
        mutex.release();
    }
    primera_barrera.release();
    cruzar() // puede tardar T tiempo
    mutex.acquire();
    autos_por_sentido[sentido] --;
    if(autos_por_sentido[sentido] == 0){ 
        //dejamos pasar a los del sentido opuesto
        autos_por_sentido[opuesto] = esperando;
        esperar_sentido[opuesto].release(esperando);
        esperando = 0;
    }
    mutex.release();
    barrera.release();
}

```

