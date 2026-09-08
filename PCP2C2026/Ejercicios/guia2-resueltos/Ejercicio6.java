import java.util.concurrent.Semaphore;

public class Ejercicio6 {
    static final int N = 7;

    int impar = N;
    int suma = 0;
    Semaphore computa = new Semaphore(1);
    Semaphore actualiza = new Semaphore(0);

    public void generador() throws InterruptedException {
        while (true) {
            actualiza.acquire();
            if (impar == 0){
                System.out.println(suma);
                break;
            }
            impar -= 1;
            computa.release();
        }
    }

    public void acumulador() throws InterruptedException {
        int iesimo = 1;
        while (true) {
            computa.acquire();
            if (impar == 0){
                actualiza.release();
                break;
            }
            suma += iesimo;
            iesimo += 2;
            actualiza.release();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        Ejercicio6 ejercicio = new Ejercicio6();

        Thread threadGenerador = new Thread(() -> {
            try {
                ejercicio.generador();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        Thread threadAcumulador = new Thread(() -> {
            try {
                ejercicio.acumulador();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });

        threadGenerador.start();
        threadAcumulador.start();

        threadGenerador.join();
        threadAcumulador.join();
    }
}
