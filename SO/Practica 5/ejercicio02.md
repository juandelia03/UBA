## Ejercicio 2

Un cronómetro posee 2 registros de E/S:

- CHRONO_CURRENT_TIME que permite leer el tiempo medido,
- CHRONO_CTRL que permite ordenar al dispositivo que reinicie el contador.

El cronómetro reinicia su contador escribiendo la constante CHRONO_RESET en el registro de control.
Escribir un driver para manejar este cronómetro. Este driver debe devolver el tiempo actual cuando
invoca la operación read(). Si el usuario invoca la operación write(), el cronómetro debe reiniciarse.

Para el código voy a usar la API que hay al final de la práctica.
Estimo que tengo que tener cuidado con las race condition del cronometro así que voy a usar mutex.

```c
sema mutex;
int driver_init(){
    sema_init(&mutex,1);
}
```

```c
int driver_read(int *data){
    sema_wait(&mutex);
    int valor = IN(CHRONO_CURRENT_TIME);
    copy_to_user(data,&valor,sizeof(data));
    sema_wait(&mutex);
    return IO_OK;
}
```

```c
int driver_write(int *data){
    sema_wait(&mutex);
    OUT(CHRONO_CTRL,CHRONO_RESET);
    sema_signal(&mutex);
    return IO_OK
}
```

\newpage
