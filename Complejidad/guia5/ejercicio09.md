## 9  Sea $\mathcal{L}$ el lenguaje de todas las expresiones con parentesis bien formadas. Probar que $\mathcal{L} \in L$

Para esto basta con dar un pseudocodigo que use espacio log.

```py
def balanced(x):
    abiertos = 0 
    for c in x:
        if c == "(":
            abiertos += 1
        elif c == ")":
            if abiertos == 0:
                return False
            abiertos -= 1
    
    if abiertos == 0:
        return True
    else:
        return False
```

Como las operaciones aritmeticas usan espacio logaritmico por lo unico que hay que preocuparse es el contador.
Como va a ser a lo sumo |x| (por ejemplo una cadena de solo parentesis que abren) el contado esta acotado por:

$O(log(|x|))$ pues los numeros se representan en base 2.

\newpage