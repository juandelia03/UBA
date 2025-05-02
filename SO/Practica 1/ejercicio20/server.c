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
#include <math.h>


int esPrimo(int n){
    if(n<2){
        return 0;
    }
    for(int i = 2;i< n;i++){
        if(n%i ==0 ){
            return 0;
        }
    }
    return 1;
}

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

   int numero;
   for(int i=0;i<3;i++){
    int client_socket = accept(server_socket,(struct sockaddr *) &client_addr, &clen);
    if(fork()==0){
        recv(client_socket,&numero,sizeof(numero),0);
        printf("el servidor recibio el numero %d\n",numero);
        int p = esPrimo(numero);
        send(client_socket,&p,sizeof(p),0);
        close(client_socket);
        exit(EXIT_SUCCESS);
    }
   } 

    wait(NULL);
    wait(NULL);
    wait(NULL);
    printf("cerrando servidor...\n");
    return 0;
}