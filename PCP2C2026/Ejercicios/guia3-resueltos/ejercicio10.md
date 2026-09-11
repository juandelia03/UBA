# Ejercicio 10

Lo hago en pseudocodigo

## inciso a

``` java
Monitor Administriador(queue<T> recursos) {
    queue<T> recursos = recursos;
    condition hayRecursos;
    
    T tomar(){
        while (recursos.empty()) {
            hayRecursos.wait();
        }
        T r = recursos.takeFirst();
        return r;
    }

    void liberar(T recurso){
        recursos.add(recurso);
        hayRecursos.signal();
    }

}
```

## inciso b

Hay que cambiar ambas funciones. La solución perjudica a hilos que pidan muchos recursos 
porque para adquirirlos tienen que conseguirlos todos.

Tenemos las mismas variables internas para la clase

``` java

T[] tomar(n){
    res = array.new(n); // arreglo de longitud n
    while (recursos.len() < n){
        hayRecursos.wait();
    }

    for(int i=0; i<n; i++){
        r = recursos.takeFirst();
        res[i] = r;
    }
    return res
}

void liberar(T[] recursos_a_liberar){
    for r in recursos_a_liberar{
        recursos.add(r)
    }
    hayRecursos.signalAll(); 
}


```

## inciso c

Se puede mantener una cola para que sea fair por orden de llegada.

Las variables internas de la clase son las mismas más tickets y turno y liberar no cambia.

``` java
tickets = 0
turno = 0

T[] tomar(n){
    res = array.new(n); // arreglo de longitud n
    miTicket = tickets;
    tickets++;
    while (miTicket != turno || recursos.len() < n){
        hayRecursos.wait();
    }
    turno++;
    for(int i=0; i<n; i++){
        r = recursos.takeFirst();
        res[i] = r;
    }
    hayRecursos.signalAll()
    return res
}

```

El liberar tiene que seguir haciendo signalAll asi se despierta el que tiene el turno.