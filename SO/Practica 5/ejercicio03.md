## Ejercicio 3

Una tecla posee un único registro de E/S : BTN_STATUS. Solo el bit menos significativo y el segundo
bit menos significativo son de interés:

- BTN_STATUS0: vale 0 si la tecla no fue pulsada, 1 si fue pulsada.
- BTN_STATUS1: escribir 0 en este bit para limpiar la memoria de la tecla.

Escribir un driver para manejar este dispositivo de E/S. El driver debe retornar la constante
BTN_PRESSED cuando se presiona la tecla. Usar busy waiting.

```c
sema mutex;
int driver_init(){
    sema_init(&mutex,1);
    return IO_OK
}
```

```c
int driver_read(int *data){
    sema_wait(&mutex);
    while(IN(BTN_STATUS) & 1 != 1); // esperar mientras no haya sido pulsada
    OUT(BTN_STATUS, ALGUNA MASCARA PARA ESCRIBIR 0);
    sema_signal(&mutex);
    int valor = BTN_PRESSED;
    copy_to_user(data,&valor,sizeof(data));
    return IO_OK;
}
```

\newpage
