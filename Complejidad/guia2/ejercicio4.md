## Ejercicio 4 Probar que los siguientes problemas están en coNP

### a) PRIME= {n : n $\in$ N es primo}

```
PRIME esta en coNP si solo si PRIME complemento esta en NP.
El complemento es el lenguaje de los numeros naturales que no son primos.
Veo que este en NP:
Certificado: lista de su factorizacion en primos.
El certificado es polinomial, a lo sumo tiene O(log(n)) factores primos.
Y se verifica en tiempo polinomial con el siguiente pseudocodigo:
def verificar(n, cert):
    res = 1
    for e in certificado:
        // ver que un nro sea primo es polinommial
        if(!esPrimo(e)){return false} 
        res *= e
    return n == res and 1 not in cert and n not in cert

Corre en tiempo O(|cert|.polinomial) que es polinomial
```

### b) GIRTH= {⟨G, k⟩ : G es un grafo tal que todos sus ciclos simples tienen k o menos vértices}
```
El complemento de un para todo es un existe negando la propiedad. Entonces el complemento de girth es:
{<G,k> tq existe un ciclo simple con mas de k vertices}
Veo que sea NP:
Certificado: Camino de vertices de longitud > k que fomrman un ciclo. Tiene longitud O(nlogn) (n cantidad de nodos logn longitud de representacion) por lo que es polinomial.
Verificador:
Hay que recorrer la lista de nodos y verificar que forman un ciclo (ver que sean adyacentes en el grafo los nodos consecutivos en el certificado  y que el ultimo se adyacente al primero). Se verifica en O(|certificado|) que es  polinomial. 
Por ultimo hay que chequear que la longitud del certificado sea mayor a k y que no haya nodos repetidos (sino podria ir y venir de un nodo a otro y que cualquier ciclo sea de cualquier longitud repitiendo nodos en el certificado)
```

### c) TAUTOLOGY= {⟨$\phi$⟩ : $\phi$ es tautología}

El complemento es que exista una valuacion que haga la formula falsa.
Veo que sea NP:
Certificado: Una valuacion que al evaluarla en $\phi$ de falso. Su longitud es polinomial respecto a $\phi$, 
pues si $\phi$ tiene n varibles distintas el certificado tendra longitud n.
Verificador:
Recorre el certificado (es O(|certificado|)),  reemplaza cada una de las variables en $\phi$, evalua $\phi$ y verifica que sea falsa (polinomial respecto de $\phi$) 
