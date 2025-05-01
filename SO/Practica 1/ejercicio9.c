#include <signal.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

int contador = 0;
int pid_pong = 0;

void pong_handler(int sig){
    printf("pong\n");
    kill(getppid(),SIGUSR1);
}

void pong(){
    signal(SIGUSR2,pong_handler);
    while(1);
}


void ping_handler(int sig){
    if(contador < 3){
        printf("ping\n");
        kill(pid_pong,SIGUSR2);
        contador++;
    }
}

int main(){
    pid_pong = fork();
    if(pid_pong == 0){
        pong();
    }
    sleep(0.5);

    int seguir = 1;
    while(seguir){
        contador = 0;
        signal(SIGUSR1, ping_handler);
        kill(getpid(),SIGUSR1);
        while(contador < 3);
        printf("ingresar 1 para repetir: ");
        scanf("%d", &seguir);
        if(seguir != 1){
            seguir=0;
        }
    }

    kill(pid_pong, SIGKILL);
    wait(NULL);
    return 0;
}