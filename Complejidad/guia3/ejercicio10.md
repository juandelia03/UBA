## Ejercicio 10 (consultar)

Considerar los siguientes dos lenguajes:

- **SUBSET-SUM** = { $\langle v_1, \ldots, v_n, k \rangle$ : existe un subconjunto $V \subseteq \{v_1, \ldots, v_n\}$ tal que $\sum_{v \in V} v = k$ }

- **UNARY-SUBSET-SUM** = { $\langle v_1, \ldots, v_n, 1^k \rangle$ : $\langle v_1, \ldots, v_n, k \rangle \in \text{SUBSET-SUM}$ }

### a)
Probar que $\text{SUBSET-SUM} \in \text{NPC}$.

Es NP?

Certificado: El subconjunto que suma k

Verificador: recorrer el certificado sumando cada elemento, hay que chequear que cada uno pertenece al
conjunto original y que sum(certificado) = k

__no le encuentro la vuelta a la reduccion__

### b)
Probar que $\text{UNARY-SUBSET-SUM} \in \text{P}$.

### c)
Concluir que la codificación de los números afecta la complejidad de los problemas.  
En general, si un problema sigue siendo NP-completo cuando los números de la entrada se representan en unario, entonces el problema se considera **fuertemente NP-completo**.

\newpage