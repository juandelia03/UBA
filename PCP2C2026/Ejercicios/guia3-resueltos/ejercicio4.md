# Ejercicio 4

## inciso a

``` java
Monitor Atrapador{
    int contador_esperando = 0;
    int contador_paso = 0;
    condicion esperando;

    esperar(){
        miNumero = contador_esperando;
        contador_esperando++;
        while (contador_paso <= miNumero){
            esperando.wait();
        }
    }

    liberar(N){
        cant = contador_esperando - contador_paso;
        if (cant >= N){
            contador_paso += N;
            esperando.signalAll();
        }

    }
}
```



## inciso b



``` java
Monitor Atrapador{
    int contador_esperando = 0;
    int contador_paso = 0;

    condicion esperando;
    condicion esperando_liberar

    esperar(){
        miNumero = contador_esperando;
        contador_esperando++;
        esperando_liberar.signalAll()
        while (contador_paso <= miNumero){
            esperando.wait();
        }
    }

    liberar(N){
        while (contador_esperando - contador_paso < N) {
            esperando_liberar.wait();
        }
        
        contador_paso += N;
        esperando.signalAll();
        }

}
```


