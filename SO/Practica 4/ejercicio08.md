## Ejercicio 8
Une estudiante dijo: “Meh, los algoritmos básicos de reemplazo de página son idénticos, salvo por
el atributo utilizado para seleccionar la página a ser reemplazada”.

### a) ¿Qué atributo utiliza el algoritmo FIFO? ¿Y el algoritmo LRU? ¿Y Second Chance?

__FIFO__: Cuando fue cargada (se va la de fecha mas vieja)
__LRU__: Cuando fue referenciada por ultima vez (se va la de fecha mas vieja)
__Second chance__: Igual que FIFO pero ademas mira el bit R para decidir si le da otra oportunidad

### b) Pensar el algoritmo genérico para estos algoritmos de reemplazo de páginas.

```c
page_t desalojo(){
    while(1){
        page_t pagina_a_desalojoar = buscar_pagina_mas_vieja(atributo);
        //asumo que el bit R siempre esta implementado pero que por ejemplo en FIFO no se usa nunca
        if(pagina_a_desalojoar.R == 1){
            pagina_a_desalojar.R = 0;
            actualizar(pagina_a_desalojar)//si tenia S-C la mandamos al final de la cola/actualiza timestamp
        }else{
            mmu.desalojar(pagina_a_desalojar);
            return pagina_a_desalojar;
        }
    }
}
```

\newpage