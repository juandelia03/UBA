// Zorros grises de Saldungaray, parte 2 .
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class CaminoUnaViaFIFO {
    static int NUM_CARS = 12;
    static int BRIDGE_CAPACITY = 4; // K

    Semaphore fila_entrada = new Semaphore(1, true);
    Semaphore tomar_ruta = new Semaphore(1);
    Semaphore puede_salir = new Semaphore(1, true); // para que no se pasen?
    // es mala esta solucion de sobrepasos porque solo puede cruzar  uno a la vez. Pero no me queda claro por la consigna que es 
    // un sobrepaso, que uno salga antes que otro? Hay que meter una cola de autos en ese caso, o un array circular. e ir prendiendo el semaforo siguiente
    int[] cantidad_direccion = {0,0};
    Semaphore[] mutex_direcciones = {
        new Semaphore(1),
        new Semaphore(1)
    };



    // tendria que tener un contador de cuantos quedan esperando por capacidad? Hay un caso borde


    public void entrar(int direction) throws InterruptedException {
        fila_entrada.acquire();
        mutex_direcciones[direction].acquire();
        if(cantidad_direccion[direction] == 0){
            //si no hay nadie en mi puente trato de tomarlo (solo uno de cada direccion va a estar aca por el mutex)
            tomar_ruta.acquire();
        }
        cantidad_direccion[direction] ++;

        if (cantidad_direccion[direction] < BRIDGE_CAPACITY){
            // si hay capacidad en el puente dejo avanzar en la fila, sino no.
            fila_entrada.release();
        }
        mutex_direcciones[direction].release();
        //raro esto no entiendo la consigna igual
        puede_salir.acquire();
        cruzarPuente();

        salir(direction);

    }

    public void salir(int direction) throws InterruptedException {
        mutex_direcciones[direction].acquire();
        cantidad_direccion[direction]--;
        if (cantidad_direccion[direction] == 0){
            tomar_ruta.release();
        }
        // si la ruta estaba llena, entonces se bloqueo la barrera y no quedo nadie esperando. Cuando salga alguno dejar avanzar la fila
        if (cantidad_direccion[direction] == BRIDGE_CAPACITY - 1){
            fila_entrada.release();
        }
        // ahora si me puede pasar
        puede_salir.release();
        mutex_direcciones[direction].release();
    }

    // Simula el tiempo que tarda un auto en cruzar el desvio.
    private void cruzarPuente() throws InterruptedException {
        Thread.sleep(ThreadLocalRandom.current().nextInt(2));
    }

    public static void main(String[] args) throws InterruptedException {
        CaminoUnaViaFIFO route = new CaminoUnaViaFIFO();
        Thread[] cars = new Thread[NUM_CARS];

        for (int i = 0; i < NUM_CARS; i++) {
            int car = i;
            int direction = ThreadLocalRandom.current().nextInt(2);
            System.out.println("Auto " + car + " cruzando en sentido " + direction);

            cars[i] = new Thread(() -> {
            try {
                System.out.println("Auto " + car + " QUIERE cruzar en sentido " + direction);
                route.entrar(direction);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
            });
        }

        for (Thread t : cars) t.start();
        for (Thread t : cars) t.join();


    }
}
