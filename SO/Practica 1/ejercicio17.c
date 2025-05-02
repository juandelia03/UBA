//NI IDEA SI FUNCIONA EL CODIGO, LA IDEA PARECE SER ESTA (NO TOQUE MAIN).

#include <signal.h>
#include <unistd.h>    
#include <stdio.h>      
#include <stdlib.h>    
#include <sys/types.h>  
#include <sys/wait.h>   
#include <fcntl.h>
#define READ 0
#define WRITE 1

int N;

int termino_nieto = 0;

int dameNumero(int pid) {
    // es un numero cualquiera
    return pid % 10;  // Ejemplo para pruebas
}

void informarResultado(int numero, int resultado) {
    //ponele
    printf("Resultado para %d: %d\n", numero, resultado);
}

void calcular(int numero, int fd[2]){
    //vamos a escribir el resultado en el pipe
    int res = numero * 2; //hace alguna cuenta
    write(fd[WRITE],&res,sizeof(res));
    close(fd[WRITE]);//termino con el pipe, lo cierra
    printf("super calculo intensivo terminado!\n");
    kill(getppid(),SIGUSR1);
    exit(EXIT_SUCCESS);
}

void calculo_terminado_handler(int signal){
    //de alguna forma hay que escribir en el pipe el resultado, prendo un bit para que lea el pipe
    termino_nieto = 1;

}

void ejecutarHijo(int i, int pipes[][2]){
    
    //debe crear un suproceso que haga el calculo y avise que termino
    signal(SIGUSR1,calculo_terminado_handler);
    //leemos el numero con el que hay que calcular
    int n;
    read(pipes[i][READ],&n,sizeof(n));
    //creo el nieto, va a escribir el resultado en un pipe que luego va a leer el padre
    int pipe_nieto[2];
    pipe(pipe_nieto);
    pid_t pid_nieto = fork();
    if(pid_nieto == 0){
        close(pipe_nieto[READ]); // el nieto solo escribe cierro el pipe read
        calcular(n,pipe_nieto);
    }
    //el hijo solo lee ciero el pipe escritura
    close(pipe_nieto[WRITE]);
    
    while(!termino_nieto);
    
    int res;
    read(pipe_nieto[READ],&res,sizeof(res));
    close(pipe_nieto[READ]);//cierro el pipe
    // si ya termino esta aca
    write(pipes[N+i][WRITE],&n,sizeof(n));
    write(pipes[N+i][WRITE],&res,sizeof(res));
    

    exit(EXIT_SUCCESS);

};

int main(int argc, char* argv[]) {
    if (argc < 2) {
        printf("Debe ejecutar con la cantidad de hijos como parametro\n");
        return 0;
    }

    N = atoi(argv[1]);
    int pipes[N * 2][2];

    for (int i = 0; i < N * 2; i++) {
        pipe(pipes[i]);
    }

    for (int i = 0; i < N; i++) {
        int pid = fork();
        if (pid == 0) {
            ejecutarHijo(i, pipes);
            return 0;
        } else {
            int numero = dameNumero(pid);
            write(pipes[i][1], &numero, sizeof(numero));
        }
    }

    int cantidadTerminados = 0;
    char hijoTermino[N];
    for (int i = 0; i < N; i++) hijoTermino[i] = 0;

    while (cantidadTerminados < N) {
        for (int i = 0; i < N; i++) {
            if (hijoTermino[i]) {
                continue;
            }

            char termino = 0;
            write(pipes[i][1], &termino, sizeof(termino));
            read(pipes[N + i][0], &termino, sizeof(termino));

            if (termino) {
                int numero, resultado;
                read(pipes[N + i][0], &numero, sizeof(numero));
                read(pipes[N + i][0], &resultado, sizeof(resultado));
                informarResultado(numero, resultado);
                hijoTermino[i] = 1;
                cantidadTerminados++;
            }
        }
    }

    wait(NULL);
    return 0;
}
