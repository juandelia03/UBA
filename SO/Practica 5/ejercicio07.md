## Ejercicio 7

no voy a copiar la consigna, es el de los discos.

## a

Implementar la función write(int sector, void \*data) del driver, que escriba los datos apuntados por data en el sector en formato LBA indicado por sector. Para esta primera implementación,
no usar interrupciones.

```c
int driver_write(int sector, void *data){
    sema_wait(&mutex);
    OUT(DOR_IO,1); //prendemos el bicho
    while(!IN(DOR_STATUS)) // esperamos a que se prenda
    valor;
    copy_from_user(&valor,data, sizeof(data));
    sleep(50); // hay q esperar 50ms antes de cualquier operacion despues de prendido
    // segun mi amigo gpt asi se calcula la pista y sector:
    int pista = sector / cantidad_de_sectores_por_pista();
    int s = sector % cantidad_de_sectores_por_pista();
    OUT(ARM,pista);
    OUT(SEEK_SECTOR,s);
    while(!IN(ARM_STATUS)); //esperamos que el brazo este ubicado
    escribir_datos(&valor);
    while(!IN(DATA_READY)); //esperamos a que termine de escribir el dato
    IN(DOR_IO,0); //apagamos el bicho
    sleep(200); //apagar puede demorar 200ms lo hacemos esperar
    sema_signal(&mutex);
    return IO_OK;
}
```

### b)

Modificar la función del inciso anterior utilizando interrupciones. La controladora del disco realiza
una interrupción en el IRQ 6 cada vez que los registros ARM_STATUS o DATA_READY toman el valor 1. Además, el sistema ofrece un timer que realiza una interrupción en el IRQ 7 una vez cada 50
ms. Para este inciso, no se puede utilizar la función sleep.

```c
int looking;
int writing;
sema mutex;
sema timer;
sema arm;
sema finished;
int ciclos;

void arm_handler(){
    if(looking){
        sema_signal(&arm);
    }
    if(writing){
        sema_signal(&finished);
    }
}

void timer_handler(){
    if(ciclos > 0){
        if(ciclos == 1){
            sema_signal(&timer)
        } else{
            ciclos --;
        }
    }
}

int driver_init(){
    sema_init(&mutex,1);
    //inicialzar a todo el resto de semaforos en 0...
    looking = 0;
    writing = 0;
    request_irq(6,arm_handler);
    request_irq(7,timer_handler);
}
```

```c
int driver_write(int sector, void *data){
    sema_wait(&mutex);
    valor;
    copy_from_user(&valor,data,sizeof(data));
    OUT(DOR_IO,1);
    while(!IN(DOR_STATUS)) // esperamos a que se prenda
    ciclos = 2; //hay que esperar 50 ms con un ciclo del timer no alcanza si lo enganchamos a la mitad
    sema_wait(&timer); // esperamos la interrupcion
    int pista = sector / cantidad_de_sectores_por_pista();
    int s = sector % cantidad_de_sectores_por_pista();
    OUT(ARM,pista);
    OUT(SEEK_SECTOR,s);
    looking = 1; //indico que estoy acomodando el brazo
    sema_wait(&arm); //espero la int de que se acomodo
    escribir_dato(valor);
    writing = 1; //indico que estoy escribiendo
    sema_wait(&finished); // espero la int que indica que termino
    IN(DOR_IO,0) // apago el bicho
    ciclos = 5;
    sema_wait(&timer) // espero 5 vueltas del timer (entre 200 y 250 ms)
    sema_signal(&mutex);
    return IO_OK;
}
```

\newpage
