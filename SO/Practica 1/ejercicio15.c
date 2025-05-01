#include <unistd.h>    
#include <stdio.h>      
#include <stdlib.h>    
#include <sys/types.h>  
#include <sys/wait.h>   
#include <fcntl.h>
#define READ 0
#define WRITE 1

int fd[2];

void ls(){
    dup2(fd[WRITE],STDOUT_FILENO);
    close(fd[WRITE]);
    close(fd[READ]);
    char *args[] = {"ls","-al",NULL};
    execvp("ls",args);
}

void wc(){
    dup2(fd[READ],STDIN_FILENO);
    close(fd[WRITE]);
    close(fd[READ]);
    char *args[] = {"wc","-l",NULL};
    execvp("wc",args);
}

int main(){
    pipe(fd);
    int p_ls = fork();
    if(p_ls == 0){
        ls();
    } 
 
    int p_wc;
    p_wc =fork();
    if(p_wc == 0){
        wc();
    }

    close(fd[READ]);
    close(fd[WRITE]);
}