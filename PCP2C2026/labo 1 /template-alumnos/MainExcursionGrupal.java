// Volcan Lanin, parte 2.

import java.util.concurrent.Semaphore;

public class MainExcursionGrupal {
    static int PORTENIOS = 6;
    static int STAGES = 4;

    int cantidad_llegaron = 0;
    Semaphore mutex = new Semaphore(1);
    Semaphore avanzar = new Semaphore(0);
    Semaphore segundaBarrera = new Semaphore(0);
    public void esperarPirca() throws InterruptedException {
        mutex.acquire();
        cantidad_llegaron++;
        if (cantidad_llegaron == PORTENIOS){
            avanzar.release(PORTENIOS);
            cantidad_llegaron = 0;
        }
        mutex.release();
        avanzar.acquire();

        // segunda barrera
        mutex.acquire();
        cantidad_llegaron++;
        if (cantidad_llegaron == PORTENIOS){
            segundaBarrera.release(PORTENIOS);
            cantidad_llegaron = 0;
        }
        mutex.release();
        segundaBarrera.acquire();
    }

    public static void main(String[] args) throws InterruptedException {
        MainExcursionGrupal excursion = new MainExcursionGrupal();

        Thread[] group = new Thread[PORTENIOS];
        for (int i = 0; i < PORTENIOS; i++) {
            int id = i;
            group[i] = new Thread(() -> {
                try {
                    for (int stage = 1; stage <= STAGES; stage++) {
                        Thread.sleep((long) (Math.random() * 300));
                        System.out.println("porteno " + id + " llega a la pirca del tramo " + stage);
                        excursion.esperarPirca();
                        System.out.println("porteno " + id + " arranca el tramo " + (stage + 1));
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (Thread t : group) t.start();
        for (Thread t : group) t.join();
    }
}
