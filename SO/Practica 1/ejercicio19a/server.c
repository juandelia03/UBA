#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

int main() {
    int server_socket;
    int client_socket;
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

    int contador = 0;
    client_socket = accept(server_socket,(struct sockaddr *) &client_addr, &clen);
    while(contador<50){
        printf("Proceso 1 envia a proceso 2 %d\n",contador);
        send(client_socket,&contador,sizeof(contador),0);
        //esperar el mensaje del cliente
        recv(client_socket,&contador,sizeof(contador),0);
        contador++;
    }
    close(client_socket);
    printf("cerrando servidor...");
    exit(EXIT_SUCCESS);
}