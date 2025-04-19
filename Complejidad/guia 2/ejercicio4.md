# Probar que los siguientes problemas están en coNP

## a) PRIME= {n : n ∈ N es primo}

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