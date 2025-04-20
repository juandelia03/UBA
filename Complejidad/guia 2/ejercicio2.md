# Ejercicio 3: Probar que la clase P está cerrada por unión, intersección y complemento

Tomo cualqueira $L_1, L_2 \in P$ y P1(x) P2(x) las maquinas que los reconocen en tiempo polinomial

Unión:

```
unionL1_L2(x):
    return p1(l1) || p2(x)
```

IntersecciónL1_L2:

```
interseccion(x):
    return p1(x) and p2(x)
```

Complemento:

```
complemento_L1(x):
    return not p1(x)
```

Son los tres polinomiales porque en python son polinomiales
