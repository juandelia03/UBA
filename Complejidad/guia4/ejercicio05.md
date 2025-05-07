## Ejercicio 5 . Probar que la función H en la demostración del Teorema de Ladner es computable en tiempo $O(n^3)$

Para analizar la complejidad voy a escribir un pseudocodigo de las funciones:
```py
# de 0 a i chequo, para todo x de 0|1^logn si la maquina i en i.|x|^i pasos da lo mismo que la funcion caracteristaca de SATh
H(n):
    for i de 0 a log log n: #O(loglogn)
        valido = True
        for x cada posible:  {0,1}^logn: #O(2^logn)=O(n)
            v1 = simular Mi(x) por i.|x|^i pasos #O(i.|x|^i) = O((log log n) . (log n ^ (log log n))) = O(n)
            v2 = SATh(x) #ver complejidad...
            if(v1 != v2):
                valido = falso
        if valido:
            return True
    return log log n
```

Hasta aca tendriamos: O(log log n . (n.(n+complejidad sat h))).

Analicemos Sath, de vuelta pseudocodigo dudoso:
(sath es $\phi 01^{n^{H(n)}}$ phi tiene que ser satisfacible y n es la longitud de phi)
En la funcion llamo k a ese n para no mezclarme con la complejidad de arriba que esta respecto de un n
```py
Sath(x):
    k = calcular_longitud_phi() # O(|x|) = O(log n), es recorrer la palabra hasta llegar a un 0111...1 
                                # y la palabra es de longitud log n a lo sumo
    phi = x desde 0 hasta k # O(k) = O(log n)
    es_sat = SAT(phi) # O(2^|phi|) = O(2^log n) = O(n)
    #queda ver que al la longitud de los 1's del final es k^H(n)
    m = cantidad_de_unos_al_final(x) # se ve que es a lo sumo O(log n)  
    return es_sat and (m == k^{H(k)}) # H(k) puedo asumir que es O(1)? Ya  voy a haber calculado H(k) en la mayoria de los casos
                                      #porque k es a lo sumo log n, una vez que haya hecho la iteracion h(log k) el resto
                                      #puede estar memoizada asi que asintoticamente es O(1)
```

Si mi asuncion del final con H(k) es cierta $SAT_h$ es O(n)

Entonces la complejidad final de H(n) es:

O(log log n . (n.(n+n))) = O(log log n . n^2) = O(n^3)