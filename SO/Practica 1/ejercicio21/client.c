#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <signal.h>


int server_socket;
int pid_hijo;
void int_handler(int signal){
    close(server_socket);
    kill(pid_hijo,SIGKILL);
    wait(NULL);
    exit(EXIT_SUCCESS);
}

int main() {
    struct sockaddr_un server_addr;

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, "unix_socket");

    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (connect(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
        perror("Error");
        exit(1);
    }

    signal(SIGINT,int_handler);
    pid_hijo =fork();
    if(pid_hijo == 0){ //proceso que escucha mensajes
        int mensaje;
        while(read(server_socket,&mensaje,sizeof(mensaje))){
            printf("recibio el mensaje %d\n",mensaje);
        }
    }    
    while(1){
        int envio;
        printf("enviar mensaje: ");
        scanf("%d",&envio);
        int b = write(server_socket,&envio,sizeof(envio));
        if(b == 0){
            break;
        }
    }
    close(server_socket);
    kill(pid_hijo,SIGKILL);
    wait(NULL);
    exit(EXIT_SUCCESS);
}
