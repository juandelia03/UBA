import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class Ejercicio8 {
    static final int CANTIDAD_GENERADORES = 2;
    static final int CANTIDAD_CONSUMIDORES = 2;
    static final int PRODUCCIONES_POR_GENERADOR = 4;
    static final int PARES_POR_CONSUMIDOR = 2;

    Semaphore crear = new Semaphore(CANTIDAD_GENERADORES);
    Semaphore tomar  = new Semaphore(0);
    Semaphore mutex = new Semaphore(1);

    public void generador(int generadorId) throws InterruptedException {
        int puntaje = 0;

        for (int i = 0; i < PRODUCCIONES_POR_GENERADOR; i++) {
            crear.acquire();
            // crear
            System.out.println("Generador " + generadorId + " crea una bolita");
            puntaje++;
            pausa(); // la pausa simula que las operaciones pueden tomar tiempo

            tomar.release();
        }

        System.out.println(
            "Generador " + generadorId + " termina con " + puntaje + " puntos"
        );
    }

    public void consumidor(int consumidorId) throws InterruptedException {
        int puntaje = 0;

        for (int i = 0; i < PARES_POR_CONSUMIDOR; i++) {
            // en java creo que se podria sacar este mutex y hacer acquire(2) que entiendo que es atomico igual
            // Si no es atomico hace falta porque podes tener el caso con #G = 2, #C = 2:
            // Cada generador agrega una bolita. Un consumidor toma una, el otro toma otra -> Deadlock.
            mutex.acquire();
            tomar.acquire();
            tomar.acquire();
            mutex.release();
            // tomar
            System.out.println("Consumidor " + consumidorId + " toma un par");
            puntaje++;
            pausa();

            crear.release(2);
        }

        System.out.println(
            "Consumidor " + consumidorId + " termina con " + puntaje + " puntos"
        );
    }

    private void pausa() throws InterruptedException {
        Thread.sleep(ThreadLocalRandom.current().nextInt(50, 201));
    }

    public static void main(String[] args) throws InterruptedException {
        Ejercicio8 juego = new Ejercicio8();

        Thread[] generadores = new Thread[CANTIDAD_GENERADORES];
        Thread[] consumidores = new Thread[CANTIDAD_CONSUMIDORES];

        for (int i = 0; i < CANTIDAD_GENERADORES; i++) {
            int generadorId = i;

            generadores[i] = new Thread(() -> {
                try {
                    juego.generador(generadorId);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (int i = 0; i < CANTIDAD_CONSUMIDORES; i++) {
            int consumidorId = i;

            consumidores[i] = new Thread(() -> {
                try {
                    juego.consumidor(consumidorId);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (Thread generador : generadores) {
            generador.start();
        }

        for (Thread consumidor : consumidores) {
            consumidor.start();
        }

        for (Thread generador : generadores) {
            generador.join();
        }

        for (Thread consumidor : consumidores) {
            consumidor.join();
        }
    }
}
