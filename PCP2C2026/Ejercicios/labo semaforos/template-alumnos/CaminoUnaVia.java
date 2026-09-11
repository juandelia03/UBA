// Zorros grises de Saldungaray, parte 1 (ghostbusters).

import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;


// Y si al llegar apago el del otro ? o algo asi ?


public class CaminoUnaVia {
    static int NUM_CARS = 12;
    Semaphore barrera = new Semaphore(1, true );
    Semaphore tomar_ruta = new Semaphore(1);
    Semaphore[] mutex_direcciones = {
        new Semaphore(1),
        new Semaphore(1)
    };
    int[] cantidad_direccion = {0,0};

    public void entrar(int direction) throws InterruptedException {
        barrera.acquire();
        mutex_direcciones[direction].acquire();
        if (cantidad_direccion[direction] == 0) {
            tomar_ruta.acquire();
        }
        cantidad_direccion[direction]++;
        System.out.println(
            "ENTRA dirección " + direction
            + " | cruzando: " + cantidad_direccion[direction]
        );
        barrera.release();
        mutex_direcciones[direction].release();
        cruzarPuente();
        salir(direction);

    }

    public void salir(int direction) throws InterruptedException {
        mutex_direcciones[direction].acquire();
        cantidad_direccion[direction]--;
        System.out.println(
            "SALE dirección " + direction
            + " | quedan: " + cantidad_direccion[direction]
        );
        if(cantidad_direccion[direction] == 0){
            tomar_ruta.release();
        }
        mutex_direcciones[direction].release();
    }



    // Simula el tiempo que tarda un auto en cruzar el desvio.
    private void cruzarPuente() throws InterruptedException {
        Thread.sleep(ThreadLocalRandom.current().nextInt(2));
    }

    public static void main(String[] args) throws InterruptedException {
        CaminoUnaVia route = new CaminoUnaVia();
        Thread[] cars = new Thread[NUM_CARS];

        for (int i = 0; i < NUM_CARS; i++) {
            int car = i;
            int direction = ThreadLocalRandom.current().nextInt(2);

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

/*
Un smeaforo que avisa cuando puede cambiar el sentido del puente

*/
