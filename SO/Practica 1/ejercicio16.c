#include <unistd.h>    
#include <stdio.h>      
#include <stdlib.h>    
#include <sys/types.h>  
#include <sys/wait.h>   
#include <fcntl.h>
#define READ 0
#define WRITE 1

//pipes
int ph1[2];
int h1h2[2];
int h2p[2];

//notar que la variable contador es distinta para cada proceso, no es compartida 
int contador = 0;

void hijo1(){
    //cerrar todos los pipes que no usa
    close(ph1[WRITE]);
    close(h1h2[READ]);
    close(h2p[WRITE]);
    close(h2p[READ]);
    //iteramos hasta EOF
    while(read(ph1[READ],&contador,sizeof(contador))){
        contador++;
        write(h1h2[WRITE],&contador,sizeof(contador));
        printf("Hijo 1 envia a Hijo 2 el valor %d\n",contador);
    }
    //cerrar los que no usa
    close(h1h2[WRITE]);
    close(ph1[READ]);
    exit(EXIT_SUCCESS);
}

void hijo2(){
    //cerrar todos los pipes que no usa
    close(ph1[WRITE]);
    close(ph1[READ]);
    close(h1h2[WRITE]);
    close(h2p[READ]);
    //iteramos hasta EOF
    while(read(h1h2[READ],&contador,sizeof(contador))){
        contador++;
        write(h2p[WRITE],&contador,sizeof(contador));
        printf("Hijo 2 envia a Padre el valor %d\n",contador);
    }
    //cerrar los que no usa
    close(h1h2[READ]);
    close(h2p[WRITE]);
    exit(EXIT_SUCCESS);
}
int main(){
    pipe(ph1);
    pipe(h1h2);
    pipe(h2p);
    //crear los procesos hijos
    int pid_1 = fork();
    if(pid_1 == 0){hijo1();};
    int pid_2 = fork();
    if(pid_2 == 0){hijo2();}
    //codigo padre
    //cierro todos los pipes que no uso
    close(ph1[READ]);
    close(h1h2[READ]);
    close(h1h2[WRITE]);
    close(h2p[WRITE]);
    // cuerpo general
    while(contador < 50){
        write(ph1[WRITE],&contador,sizeof(contador));
        printf("Padre envia al hijo 1 el valor %d\n", contador);
        read(h2p[READ],&contador,sizeof(contador));
    }
    //una vez que termina cerrar los pipes asi tenemos EOF
    close(ph1[WRITE]);
    close(h2p[READ]);
    // esperamos que temrinen los hijos para que no queden huerfanos
    wait(NULL);
    wait(NULL);    
    return 0;
}