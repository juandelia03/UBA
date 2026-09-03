import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class Ejercicio7 {
    static final int CANTIDAD_APARATOS = 4;
    static final int CANTIDAD_DISCOS = 20;
    final Semaphore[] aparatos = new Semaphore[CANTIDAD_APARATOS];
    final Semaphore discos = new Semaphore(CANTIDAD_DISCOS);
    final Semaphore mutex = new Semaphore(1, true);

    public Ejercicio7() {
        for (int i = 0; i < CANTIDAD_APARATOS; i++) {
            aparatos[i] = new Semaphore(1);
        }
    }

    public void realizarRutina(int clienteId, int[][] rutina)
            throws InterruptedException {
        for (int[] paso : rutina) {
            int aparato = paso[0];
            int cantidadDiscos = paso[1];

            // tomar recursos
            mutex.acquire();
            discos.acquire(cantidadDiscos);
            aparatos[aparato].acquire();
            mutex.release();

            ejercitar(clienteId, aparato, cantidadDiscos);

            // liberar los recursos
            discos.release(cantidadDiscos);
            aparatos[aparato].release();
        }
    }

    private void ejercitar(int clienteId, int aparato, int cantidadDiscos)
            throws InterruptedException {
        System.out.println(
            "Cliente " + clienteId
            + " comienza en aparato " + aparato
            + " con " + cantidadDiscos + " discos"
        );

        Thread.sleep(ThreadLocalRandom.current().nextInt(100, 401));

        System.out.println(
            "Cliente " + clienteId
            + " termina en aparato " + aparato
        );
    }

    public static void main(String[] args) throws InterruptedException {
        Ejercicio7 gimnasio = new Ejercicio7();

        // Cada par representa: {indiceDelAparato, cantidadDeDiscos}.
        int[][][] rutinas = {
            { {0, 4}, {2, 6}, {1, 2} },
            { {1, 8}, {3, 4} },
            { {2, 2}, {0, 6}, {2, 4} },
            { {3, 10}, {1, 4}, {0, 2} }
        };

        Thread[] clientes = new Thread[rutinas.length];

        for (int i = 0; i < rutinas.length; i++) {
            int clienteId = i;
            int[][] rutinaCliente = rutinas[i];

            clientes[i] = new Thread(() -> {
                try {
                    gimnasio.realizarRutina(clienteId, rutinaCliente);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (Thread cliente : clientes) {
            cliente.start();
        }

        for (Thread cliente : clientes) {
            cliente.join();
        }
    }
}
