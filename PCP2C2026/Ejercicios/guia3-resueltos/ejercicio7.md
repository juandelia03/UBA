# Ejercicio 7

## inciso a

``` java
Thread jugador (m, palabras, apuestas, cantidad) {
    i = 0;
    while (!m.concluido() && i < cantidad){
        res = m.apostar(palabras[i], apuestas[i]);
        if res == true{
            imprimirMensajeSalida(res, apuestas[i] * 10);
        } else {
            imprimirMensajeSalida(res, 0);
        }
        i++;
    }
}
```

## inciso b

``` java
Monitor Casino(string palabra) {
    bool termino = false;
    string acertijo = palabra;
    int ultimo = -1;
    condition aposteUltimo;

    apostar(palabra, apuesta){
        int miID = this.getThreadID() // id del thread que esta corriendo 
        while (ultimo == miID){
            aposteUltimo.wait();
        }
        if termino {
            return false
        }
        boolean gano = palabra == acertijo
        if gano {
            termino = true
        }
        ultimo = miID;
        aposteUltimo.signal()
        return gano
    }

    concluido(){
        return termino
    }
}
```