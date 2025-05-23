## Ejercicio 4

Reescribir el driver del ejercicio anterior para que utilice interrupciones en lugar de busy waiting.
Para ello, aprovechar que la tecla ha sido conectada a la línea de interrupción número 7.
Para indicar al dispositivo que debe efectuar una nueva interrupción al detectar una nueva pulsación
de la tecla, debe guardar la constante BTN_INT en el registro de la tecla.
Ayuda: usar semáforos.

```c
sema mutex;
sema int_7

void pressed_handler(){
    sema_signal(&int_7)
}
int driver_init(){
    sema_init(&mutex,1);
    sema_init(&int_7,0);
    request_irq(7,pressed_handler)
}
```

```c
int driver_read(*data){
    sema_wait(&mutex);
    sema_wait(&int_7);

    OUT(BTN_STATUS,BTN_INT);
    sema_signal(&mutex);
    int valor = BTN_PRESSED;
    copy_to_user(data,&valor,sizeof(data));
    return IO_OK
}
```

\newpage
