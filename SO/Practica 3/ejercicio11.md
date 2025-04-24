## Ejercicio 11

Se quiere simular la comunicación mediante pipes entre dos procesos usando las syscalls read() y
write(), pero usando memoria compartida (sin usar file descriptors). Se puede pensar al pipe como
si fuese un buffer de tamaño N, donde en cada posición se le puede escribir un cierto mensaje. El
read() debe ser bloqueante en caso que no haya ningún mensaje y si el buffer está lleno, el write()
también debe ser bloqueante. No puede haber condiciones de carrera y se puede suponer que el buffer
tiene los siguientes métodos: pop() (saca el mensaje y lo desencola), push() (agrega un mensaje al
buffer).

```c
//compartidas
buffer[n] //dado con push y pop
Sread = sem(0); //semaforo que indica cuantos elementos hay para leer
Swrite = sem(n); //semaforo que indica cuanto espacio queda en el buffer
mutex = sem(1);
```

```c
write(m){
    Swrite.wait() //si no hay lugar para escribir es bloqueante
    
    mutex.wait(); //para evitar el race condition, no se puede escribir y leer a la vez
    buffer.push(m);
    mutex.signal();
    
    Sread.signal(); // indica que hay un elemento para leer en el buffer
}

read(){
    Sread.wait(); // Si no hay nada que leer es bloqueante

    mutex.wait();//para evitar el race condition, no se puede escribir y leer a la vez
    res = buffer.pop();
    mutex.signal();
    
    Swrite.signal(); //le aviso que hay un lugar mas para escribir 
    return res
}
```
