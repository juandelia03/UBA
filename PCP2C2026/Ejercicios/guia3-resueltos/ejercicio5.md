## Ejercicio 5


## inciso a

``` java 
Monitor Pelu {
    int ticket = 0;
    condition noHayNadie;
    condition cortandose;
    set terminados = emptySet();
    cola clientes = emptyQueue();

    empezarCorte(){
        while ( clientes.empty() ){
            noHayNadie.wait();
        }
        pelu.actual.cliente = clientes.takeFirst() // saca el primero de la cola y lo retorna. Lo guarda en una var interna del thread
    }

    terminarCorte(){
        terminados.add(pelu.actual.cliente);
        cortandose.signalAll()
    }

    cortarseElPelo(){
        ticket++;
        int miTicket = ticket;
        clientes.add(miTicket) // me agrego. a la cola
        noHayNadie.signalAll(); // esto podria ser un signal ver inciso b
        while (! terminados.contains(miTicket)){
            cortandose.wait();
        }
        terminados.remove(miTicket) // para que no crezca al infinito el set
    }
}
```


## inciso b

Si junto todo en una misma condición sigue andando igual porque hago signalAll en los dos casos, así que siempre se levantan y chequean su condición. Si no es válida vuelven a dormir. 
Para el inciso A cuando llega un cliente podría hacer un signal nomás despertando a un único peluquero, eso no vale con una única condición.