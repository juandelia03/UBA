# Ejercicio 9 (a consultar)

Si x pertenece a L quiero que f(x) termine asi pertenece a halting,
sino quiero que se cuelgue

Llamo L a la maquina que reconoce $L$

```
def f(x):
    if(L(x) == 1):
        return(<M,x>)
    else:
        return <M',x>

def M(x):
    return 1

def M'(x):
    while(true)
```
