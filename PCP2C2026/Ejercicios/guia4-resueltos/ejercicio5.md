# Ejercicio 5


``` java
esValido(v1, i){
    return v1 == tabla.get(i);
}

actualizarEntrada(int i){
    while (true){
        lock.lock();
        try{
            v1 = tabla.get(i);
        } finally{
            lock.unlock();
        }
        v2 = computacionalmenteCostoso(v1);
    
        lock .lock()
        try{
            if (esValido(v1,i)){
                tabla.remove(i);
                tabla.put(i,v2);
                break
            }
        } 
        finally {
            lock.unlock();
        }
    }
}
```

Asumo que la operacion computacionalmenteCostoso() no toca la tabla, por lo que no necesita estar en exclusion mutua.

Basta con ver que el valor que habia en $i$ siga siendo el mismo para que la postcondicion de la funcion sea la misma:

$v1' = v1 \Rightarrow computacionalmenteCostoso(v1) = computacionalmenteCostoso(v1')$

Siempre que computacionalmenteCostoso sea independiente de la tabla

## inciso b

Puede haber starvation:

1. $T_1$  quiere cambiar la posicion i. Se queda un rato en computacionalmente costoso
2. $T_2$ cambia la posicion i antes de que $T_1$ termine
3. $T_1$ reintenta y se pone a hacer el computo costoso de nuevo
4. $T_2$ le vuelve a ganar para la posicion i 
5. etc...