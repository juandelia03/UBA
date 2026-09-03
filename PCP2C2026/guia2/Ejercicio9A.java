import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class Ejercicio9A {
    static final int OESTE = 0;
    static final int ESTE = 1;
    static final int N = 3;
    static final int CANTIDAD_VIAJES = 4;

    final Semaphore[] costas = {
        new Semaphore(N),
        new Semaphore(0)
    };
    Semaphore mutex = new Semaphore(1);
    int arriba = 0;

    Semaphore lleno = new Semaphore(0);
    Semaphore bajar = new Semaphore(0);
    public void persona(int personaId, int costa) throws InterruptedException {
        System.out.println(
            "Persona " + personaId + " llega a la costa " + costa
        );

        costas[costa].acquire();
        System.out.println(
            "Persona " + personaId + " sube en la costa " + costa
        );

        mutex.acquire();
        arriba += 1;
        if (arriba == N){
            lleno.release();
        }
        mutex.release();
        bajar.acquire();
        System.out.println(
            "Persona " + personaId + " baja en la costa " + (1-costa)
        );
        mutex.acquire();
        arriba -= 1;
        if (arriba == 0) {
            costas[(costa + 1) % 2].release(N);
        }
        mutex.release();
    }

    public void transbordador() throws InterruptedException {
        int costaActual = OESTE;

        for (int viaje = 1; viaje <= CANTIDAD_VIAJES; viaje++) {
            lleno.acquire();

            int destino = 1 - costaActual;
            zarpar(costaActual, destino);
            costaActual = destino;

            bajar.release(N);
        }
    }

    private void zarpar(int origen, int destino) throws InterruptedException {
        System.out.println(
            "El transbordador zarpa de la costa " + origen
            + " hacia la costa " + destino
        );

        Thread.sleep(ThreadLocalRandom.current().nextInt(200, 501));

        System.out.println(
            "El transbordador llega a la costa " + destino
        );
    }

    public static void main(String[] args) throws InterruptedException {
        Ejercicio9A cruce = new Ejercicio9A();

        int cantidadPersonas = N * CANTIDAD_VIAJES;
        Thread[] personas = new Thread[cantidadPersonas];

        for (int i = 0; i < cantidadPersonas; i++) {
            int personaId = i;

            // Se crean N personas por cada viaje, alternando las costas.
            int costa = (i / N) % 2;

            personas[i] = new Thread(() -> {
                try {
                    cruce.persona(personaId, costa);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        Thread transbordador = new Thread(() -> {
            try {
                cruce.transbordador();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        for (Thread persona : personas) {
            persona.start();
        }

        transbordador.start();

        for (Thread persona : personas) {
            persona.join();
        }

        transbordador.join();
    }
}
