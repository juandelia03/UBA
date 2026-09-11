# Ejercicio 8

Thread de los clientes

``` java
Thread Cliente(Bar bar) {
        bar.comer();
        pagar()
}
```

Hay uno o vario threads cocineros haciendo pizzas grandes y chicas

El monitor:

``` java
Monitor Bar {
    int grandes = 0;
    int chicas = 0;
    condition puedeComer;

    private bool puedeComer(){
        return grandes > 0 || chicas >= 2
    }

    comer(){
        while (!puedeComer()){
            puedeComer.wait();
        }
        if grandes > 0{
            grandes--;
            return
        }
        if chicas >= 2 {
            chicas -= 2
        }
    }

    grande(){
        grandes++;
        puedeComer.signalAll();
    }

    chica(){
        chicas++;
        puedeComer.signalAll();
    }
}
```