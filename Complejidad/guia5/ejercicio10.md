## 10 Probar que 2-COLOREO esta en NL

**CONSULTAR NI IDEA COMO HACER MAQUINAS NO DETERMINISTICAS**

```py
nodo = -1
c = 0 
mientras c < |V|:
    nodo = inventar un nodo no deterministicamente
    nodo.color = inventarle un color no deterministicamente (color es 0 o 1)
    para cada v en vecindad(nodo):
        v.color = adivinar el color no deterministicamente
        si v.color == nodo.color:
            devolver q_no
devolver q_si
```




\newpage