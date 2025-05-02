//no se si termine de entender la consigna, voy a aceptar 4 clientes y que cada cliente 
//se envie el siguiente numero pasando por el servidor

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <sys/un.h>

int main() {
    int server_socket;
    struct sockaddr_un server_addr;
    struct sockaddr_un client_addr;
    int slen = sizeof(server_addr);
    int clen = sizeof(client_addr);
    int num;

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, "unix_socket");
    unlink(server_addr.sun_path);

    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    bind(server_socket, (struct sockaddr *) &server_addr, slen);
    listen(server_socket, 1);

    printf("Servidor: esperando conexión del cliente...\n"); 

    int contador = -1;
    //inicializar sockets
    int client_sockets[3];
    for(int i=0;i<3;i++){
        client_sockets[i] = accept(server_socket,(struct sockaddr *) &client_addr, &clen);
        printf("cliente %d conectado\n",i);
    } 
   
    //envio el mensaje inicial
    send(client_sockets[0],&contador,sizeof(contador),0);
    
    for(int i=0;i<3;i++){
        pid_t pid = fork();
        if(pid == 0){
            while(contador < 50 && recv(client_sockets[i],&contador,sizeof(contador),0)){
                int p_siguiente = (i+1)%3;
                printf("el proceso %d le envia al proceso %d el valor %d\n",i+1,p_siguiente+1,contador);
                send(client_sockets[p_siguiente],&contador,sizeof(contador),0);
            }
            for(int j=0;j<3;j++){
                close(client_sockets[j]);
            }
            exit(EXIT_SUCCESS);
        }
    }

    for(int i = 0;i < 3;i++){
        close(client_sockets[i]);
    }

    wait(NULL);
    wait(NULL);
    wait(NULL);
    printf("cerrando servidor...\n");
    exit(EXIT_SUCCESS);
}