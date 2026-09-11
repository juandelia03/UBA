## Ejercicio 2

``` java

class Figura {
    int x = 0;
    int y = 0;
    int alto = 0;
    int ancho = 0;

    Lock mutexPosicion = new ReentrantLock();
    Lock mutexTam = new ReentrantLock();


    public void ajustaPos() {
        mutexPosicion.lock()
        try{
            x = algunX();
            y = algunY();
        } finally{
            mutexPosicion.unlock()
        }
    }


    public void ajustarTamanio() {
        mutexTam.lock();
        try{
            alto = algunAlto();
            ancho = algunAncho();
        } finally {
            mutexTam.unlock();
        }
    }
}

```

Si quiesieramos agregar funciones que requieren ambos locks, necesitamos preservar siempre un orden para que no tengamos deadlocks.
Por ejemplo tomar primero la pos y despues el tamanio. Si no lo hicieramos un thread podria llamar una funcion que primero tome pos
otro thread una que primero tome tamanio y ambas quedarian lockeadas.