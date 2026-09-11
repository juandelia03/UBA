## Ejercicio 6

## inciso a

Va a haber un thread orador

``` java
Thread orador{
    boolean vacia;
    while(true){
        empezo = sala.presentar(); // devuelve si esta vacia o no 
        while(!empezo){ // si esta vacia esperamos 5 min y tratamos de presentar de nuevo
            sleep(5 min);
            empezo = sala.presentar();
        }
        // hace la presentacion
        sala.terminarPresentacion();
        sleep(5 min)
    }
}
```

El monitor va a ser:

``` java
monitor Sala{
    int publico = 0;
    bool empezo = false;
    
    int ronda = 0

    condition quireEntrar;
    condition quiereSalir;

    boolean presentar(){
        if (publico <= 0){
            empezo = false
        } else {
            empezo = true
        }
        return empezo
    }

    int entrar(){ // me devuelve mi numero de ronda
        while (empezo || publico >= 50){
            quiereEntrar.wait();
        }
        publico++;
        return ronda
    }

    void salir(miRonda){
        while (empezo || miRonda >= ronda){
            quiereSalir.wait();
        }
        quiereEntrar.signal() // que alguno de los que quiere entrar se despierte. Se podria despertar a todos tmb
        publico--;
    }

    void terminarPresentacion(){
        empezo = false;
        ronda++;
        quiereEntrar.signalAll();
        quiereSalir.signalAll();
    }
}
```


## inciso b

agrego una condicion quierePresentar y solo cambio las funcs de presentar y terminar


``` java
    boolean presentar(){
        while (empezo) {
            quierePresentar.wait()
        }

        if (publico < 40){
            empezo = false
        } else {
            empezo = true
        }
        return empezo
    }


    void terminarPresentacion(){
        empezo = false;
        ronda++;
        quiereEntrar.signalAll();
        quiereSalir.signalAll();
        quierePresentar.signal()
    }

```

    