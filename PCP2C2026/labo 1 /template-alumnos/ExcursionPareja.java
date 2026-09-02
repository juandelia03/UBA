// Volcan Lanin, parte 1.
import java.util.concurrent.Semaphore;

public class ExcursionPareja {
    static int STAGES = 5;

    Semaphore andrea = new Semaphore(0);
    Semaphore bernardo = new Semaphore(0);


    public void caminarAndrea() throws InterruptedException {
        System.out.println("Andrea llega a la pirca");
        andrea.release();
        bernardo.acquire();
        System.out.println("Andrea arranca el siguiente tramo");
    }

    public void caminarBernardo() throws InterruptedException {
        System.out.println("Bernardo llega a la pirca");
        bernardo.release();
        andrea.acquire();
        System.out.println("Bernardo arranca el siguiente tramo");
    }

    public static void main(String[] args) throws InterruptedException {
        ExcursionPareja excursion = new ExcursionPareja();
        
        for (int stage = 1; stage <= STAGES; stage++) {
            System.out.println("--- tramo " + stage + " ---");
            
            Thread a = new Thread(() -> {
                try {
                    excursion.caminarAndrea();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
            Thread b = new Thread(() -> {
                try {
                    excursion.caminarBernardo();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
            a.start();
            b.start();
            a.join();
            b.join();
        }
    }
}
