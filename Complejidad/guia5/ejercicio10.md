## 10 Probar que 2-COLOREO esta en NL

Para este ejercicio pareceria mas sencillo ver que 2-COLOREO pertenezca a coNL, es decir que 2-COLOREO complemento pertenece a NL.
Esto es suficiente porque NL = coNL $\Rightarrow 2-COLOREO \in coNL = NL$

El complemento de 2-COLOREO son aquellos grafos que no son bipartitos.

G $\in$ 2-COLOREO complemento $\iff$ G no es bipartito $\iff$ G contiene un ciclo de longitud impar.


$\overline{2-COLOREO}$ = {G: G contiene un ciclo de longitud impar}

**Certificado:**

El certificado es la lista del conjunto de nodos que forman el ciclo (en el orden que forman el ciclo).
Es polinimial, a lo sumo tiene n nodos que se representan con log n bits $\Rightarrow O(nlogn)$ 

**Verfificador:**

Recorre la lista una unica vez. El primer nodo se lo guarda aparte por que al final necesita verificar que el ciclo termina con
el nodo que empezo.

Despues se va trayendo de a dos nodos en simultaneo (un actual y un anterior) y verifica que efectivamente los conecta una arista 
(leyendo el grafo). Finalmente chequea que el ultimo sea adyacente al primero. 

Todas las operaciones usan memoria logaritmica y solamente guardamos 3 nodos en la memoria, por lo que el verificador usa espacio
O(log n). Como lee una unica vez y de manera secuencial el certificado podemos afirma que $\overline{2-COLOREO} \in NL = coNL$

$\overline{2-COLOREO} \in coNL \Rightarrow \text{2-COLOREO} \in NL$

\newpage