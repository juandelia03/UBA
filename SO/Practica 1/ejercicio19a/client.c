#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

int main() {
    int server_socket;
    struct sockaddr_un server_addr;

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path, "unix_socket");

    server_socket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (connect(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1) {
        perror("Error");
        exit(1);
    }

    int contador;
    while(read(server_socket,&contador,sizeof(contador))){
        contador++;
        printf("P2 envia a P1 %d\n",contador);
        write(server_socket,&contador,sizeof(contador));
    }

    close(server_socket);
    exit(EXIT_SUCCESS);
}
