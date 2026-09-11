# Ejercicio 3

``` java

Lock locks = {new ReentrantLock(),...} // len = n

assign(pos, o){
    if(pos < capacidad){
        locks[pos].lock();
        recursos[pos] = o;
        locks[pos].unlock();
    }
}

swap(i,j){
    if (i < capacidad && j < capacidad){
        locks[min(i,j)].lock();
        locks[max(i,j)].lock();
        ///... logica del swap
        locks[min(i,j)].unlock();
        locks[max(i,j)].unlock();
    }
}

```

No hay deadlock porque nos aseguramos de lockear en el orden dado por la lista. La hipotetica situacion de deadlock solo puede 
darse por el doble deadlock que hay que tomar en sawp ,asign toma un unico recurso asi que en principio no generaria problemas.

Hay starvation:
Supongamos que hay N procesos. TOdos quieren swapear 1 por otra cosa en loop.

Puede pasar que un thread cada vez que le den la CPU se encuentra que el 1 esta lockeado.

Basta con que los locks sean fair para que no haya starvation.