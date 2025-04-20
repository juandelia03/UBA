# Ejercicio 1 Probar que los siguientes lenguajes están en P

# a) COPRIME = {⟨a, b⟩ : (a : b) = 1, es decir, a y b son coprimos}

```
coprimo(a,b){
    tmp = 0
    while b != 0:
        tmp = b
        b = a % b
        a = tmp
    //hasta aca es el algoritmo de eculides para calcular mcd
    return mcd == 1
}
```

Es polinomial respecto de |a| + |b|. Con |a| = $log_2(a)$ y |b| = $log_2(b)$.
$\Rightarrow$ a = $2^{|a|}$

Con a > b la complejidad es:

O(log a) reemplazando con la def |a| $\rightarrow$ $O(log(2^{|a|})) = O(|a|.log(2)) = O(|a|)$

Notar que haciendo el algoritmo naive que es O(a):
$O(a) = O(2^{|a|})$

Que es exponencial al tamaño de la entrada

La moraleja de este ejercicio es que si la entrada es un numero, **iterar todo
el rango de ese numero es exponencial respecto a su tamaño**.

Es la idea que hay que usar en todos los incisos.

# c) TREE = {⟨G⟩ : G es un grafo conexo sin ciclos}

Algoritmo:

```
1. DFS en G marfcando los nodos, si encuentro uno ya marcado devuelvo falso.
2. Si termina el dfs, recorrer la lista de nodos y ver que esten todos marcados para devolver true, caso contrario falso.
```

Complejidad:
Si cada nodo se representa en logn y cada arista logm
Digamos |G| = |V|+|E| = nlogn+mlogm

1 $\rightarrow O((nlogn)^{2})$ en matriz de adyacencia
2 $\rightarrow O(nlogn)$ recorrer la lista de nodos

Es polinomial
