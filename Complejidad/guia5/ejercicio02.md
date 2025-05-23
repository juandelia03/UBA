## 2 Probar que PSPACE está cerrado por complemento.

Tomemos un L cualquiera que esta en PSPACE, es decir una maquina M lo reconoce
con espacio polinomial

puedo definir a la maquina que reconoce $L^c$ como:


```py
M_c(x):
    return not M(x)
```

Lo unico que hace es negar el bit de salida, asi que no usa mas espacio que M. $\Rightarrow$ $L^c$ es PSPACE 