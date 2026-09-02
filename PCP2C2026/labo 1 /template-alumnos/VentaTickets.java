// Lollapallozers.

import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class VentaTickets {
    static int TYPES = 3;
    static int[] LIMIT = { 50, 30, 10 };
    static int BUYERS = 20;
    static int ATTEMPTS_PER_BUYER = 500;

    private int[] available = LIMIT.clone();

    //variables de sincronizacion.
    boolean hay_alguien_comprando = false;
    int cantidad_esperando = 0;
    Semaphore cola = new Semaphore(0, true);
    Semaphore mutex = new Semaphore(1);


    Semaphore comprando = new Semaphore(1);


    // Devuelve true si logro comprar un ticket del tipo dado, false si no quedan.
    public boolean comprar(int type) throws InterruptedException {
        // leer cantidad
        mutex.acquire();
        if(hay_alguien_comprando){
            cantidad_esperando+=1;
            mutex.release();
            cola.acquire();
        } else {
            mutex.release();
        }

        int cantidad_disponible = available[type];

        //efectuar la compra
        mutex.acquire();
        comprando.acquire();
        hay_alguien_comprando = true;
        mutex.release();
        // hay que ver que los que lei son los que efectivamente quedan
        boolean puede_comprar = (cantidad_disponible == available[type]) && cantidad_disponible > 0 ;
        if (puede_comprar){
            available[type]--;
        }

        mutex.acquire();
        hay_alguien_comprando = false;
        comprando.release();
        cola.release(cantidad_esperando);
        cantidad_esperando = 0;
        mutex.release();

        return puede_comprar;
    }

    public static void main(String[] args) throws InterruptedException {
        VentaTickets sale = new VentaTickets();
        int[] soldPerBuyer = new int[BUYERS];
        Thread[] buyers = new Thread[BUYERS];

        for (int i = 0; i < BUYERS; i++) {
            int buyer = i;
            buyers[i] = new Thread(() -> {
                try {
                    for (int attempt = 0; attempt < ATTEMPTS_PER_BUYER; attempt++) {
                        int type = ThreadLocalRandom.current().nextInt(TYPES);
                        if (sale.comprar(type)) {
                            soldPerBuyer[buyer]++;
                        }
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            });
        }

        for (Thread buyer : buyers) buyer.start();
        for (Thread buyer : buyers) buyer.join();

        int totalSold = 0;
        for (int v : soldPerBuyer) totalSold += v;

        int totalRemaining = 0;
        boolean oversold = false;
        for (int type = 0; type < TYPES; type++) {
            int remaining = sale.available[type];
            totalRemaining += remaining;
            if (remaining < 0) oversold = true;
        }

        int totalLimit = 0;
        for (int l : LIMIT) totalLimit += l;

        System.out.println("Vendidos: " + totalSold + ", restante: " + totalRemaining + ", total: " + totalLimit);
        boolean ok = !oversold && (totalSold + totalRemaining == totalLimit);
        System.out.println(ok ? "OK" : "MAL");
    }
}
