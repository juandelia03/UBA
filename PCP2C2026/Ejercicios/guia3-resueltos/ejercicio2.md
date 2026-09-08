## Ejercicio 2

Asumo  E = W < S como java 

``` Java
monitor SecuenciadorTernario{
    condition primeroC
    condition segundoC
    condition terceroC
    int step = 1

    primero(){
        while(step != 1){
            primeroC.wait();
        }
        //hacer algo primero
        step++
        segundoC.signal();
    }

    segundo(){
        while(step != 2){
            segundoC.wait();
        }
        //ejecutar algo segundo
        step++
        terceroC.signal();
    }

    tercero(){
        while(step != 3){
            terceroC.wait();
        }
        //ejecutar algo tercero
        step = 1
        primeroC.signal();
    }

}
```