## Ejercicio 9

### definir mejor corte

```py
# lista de instancias A atributos M medida de ganancia
def mejor_corte(S,A,M):

    mejor_atributo = None
    corte = None
    ganancia_maxima = 0
    for atributo in A:
        ganancia_maxima_atributo_actual = 0
        corte_actual = None
        #valores que toma el atributo en el dataset
        valores_unicos = eliminar_repetidos(S[atributo])
        #esta bien usarlo como umbral o deberia tirar una recta entre este y el que le sigue?
        for umbral in valores_unicos:
            ganancia = M(S,atributo,umbral)
            if ganancia > ganancia_maxima_atributo_actual:
                ganancia_maxima_atributo_actual = ganancia
                corte_actual = umbral

        if ganancia_maxima_atributo_actual > ganancia_maxima:
            ganancia_maxima = ganancia_maxima_atributo_actual
            mejor_atributo = atributo
            corte = corte_actual

    return (mejor_atributo,corte)
```

### modificacion para tener ganancia

Básicamente cuando hacemos un corte hay que sumarle al atributo que elegimos la ganancia que tuvo
ponderada por |S|

modifico el anterior:

```py
# lista de instancias A atributos M medida de ganancia
def mejor_corte(S,A,M):

    mejor_atributo = None
    corte = None
    ganancia_maxima = 0
    for atributo in A:
        ganancia_maxima_atributo_actual = 0
        corte_actual = None
        #valores que toma el atributo en el dataset
        valores_unicos = eliminar_repetidos(S[atributo])
        #esta bien usarlo como umbral o deberia tirar una recta entre este y el que le sigue?
        for umbral in valores_unicos:
            ganancia = M(S,atributo,umbral)
            if ganancia > ganancia_maxima_atributo_actual:
                ganancia_maxima_atributo_actual = ganancia
                corte_actual = umbral

        if ganancia_maxima_atributo_actual > ganancia_maxima:
            ganancia_maxima = ganancia_maxima_atributo_actual
            mejor_atributo = atributo
            corte = corte_actual

    return (mejor_atributo,corte, ganancia_maxima)
```

Y en el algoritmo original:

primero inicializamos un diccionario "importance" donde las claves son los atributos y los valores se inicializan todos en 0.

Antes de repetir para cada hijo tomamos la 3-upla que nos devolvió mejor_corte (mejor_atributo,corte, ganancia_maxima). Calculamos la importancia_a_sumar como ganancia_maxima \* (len(S_actual)/len(S_original))
y hacemos importance[mejor_atributo] += importancia_a_sumar
