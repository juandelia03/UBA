# Ejercicio 9

Un thread bote y multiples threads pasajeros

``` java

Thread Bote(monitor b) {
    while (true){
        b.zarpar();
        // navega
        b.llegar();
    }
}


Thread Persona(costa) {
    subir(costa);
    bajar()
}

```

El monitor del bote toma la costa inicial y la capacidad en  el constructor. 

Lo armo directamente preservando orden en las costas

``` java 
Monitor Bote(costa, capacidad) {
    boolean autorizado = false;
    int subieron = 0;
    int capacidad = capacidad;
    int costa = costa; // 0 o 1 
    boolean navegando = false;
    int[] tickets = {0,0};
    int[] turnos = {0,0};
    boolean bajando = false;

    condition puedeNavegar;
    condition leTocaSubir;
    condition empezamosABajar;

    zarpar(){
        while (!autorizado || subieron < capacidad || bajando) {    
            puedeNavegar.wait();
        }
        navegando = true;
        autorizado = false;
    }

    autorizar(){
        autorizado = true;
        puedeNavegar.signal();
    }

    subir(enOrilla){
        miTicket =  tickets[enOrilla];
        tickets[enOrilla]++;

        // si no esta en mi orilla, esta lleno, hay gente bajando o no es mi turno. Espero
        while (costa != enOrilla || subieron >= capacidad || bajando || miTicket != turnos[enOrilla]){
            leTocaSubir.wait();
        }
        turnos[enOrilla]++;
        subieron++;
        puedeNavegar.singal(); // podria ir en un if esto y ahorro wakeups. igual es corrrecto
        leTocaSubir.signalAll();  // levanta a todos para que pase el que tiene el siguiente turno
    }

    llegar(){
        costa = obtenerCostaOpuesta(costa);
        autorizado = false;
        bajando = true;
        empezamosABajar.signalAll();
    }

    bajar(){
        // no hace falta chequear que este en la costa correcta, solo llaman bajar desepues de haber subido
        while (!bajando){
            empezamosABajar.wait();
        }
        subieron--;
        if (subieron == 0){
            bajando = false;
            leTocaSubir.signalAll(); // que suban los que corresponde que estaban esperando
        }
    }

}

```
