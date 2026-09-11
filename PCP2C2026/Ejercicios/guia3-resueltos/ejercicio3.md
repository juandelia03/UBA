# Ejercicio 3

## inciso a

``` Java
monitor Barrera {
    condition esperar;
    int esperando = 0

    void esperar(){
        esperando++;
        while (esperando < 3){
            esperar.wait();
        }
        esperar.signalAll();
    }
}
```


Si entra un 4to proceso pasa de una porque esperando ya es 3

## inciso b

``` Java
monitor Barrera {
    condition esperar;
    int esperando = 0;
    int saliendo = 0;

    esperar(){
        while (saliendo > 0){
            esperar.wait();
        }

        esperando++;
        while (esperando != 3){
            esperar.wait();
        }
        saliendo++;
        // cuando termino el ultimo de  la vuelta, resetea. 
        if saliendo == 3 {
            saliendo = 0
            esperando = 0
        }
        esperar.signalAll();
    }
}
```