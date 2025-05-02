## Ejercicio 10 Probar que NP $\subseteq$ RECURSIVE. Concluir que HALTING $\notin$ NP

**la demo esta basada en el apunte de santi, chequear la parte de maquinas no deterministicas**


Si un problema esta en NP, por definicion, hay una maquina no deterministica N que corre en tiempo polinomial tq:
L(n) = L (es decir, x pertenece a L sii existe un computo aceptador de N a partir de x).

Digamos que cada computo posible de la maquina N, corre a lo sumo en tiempo T(n). 
Podemos representar todos los posibles computos de N como un grafo, donde cada nodo es una configuracion. (en estas maquinas desde cada configuaricion hay dos transiciones posibles $\delta_1$ y $\delta_2$). Cada nodo tiene dos hijos que corresponden a una posible evolucion del siguiente paso de esa configuracion.

Notar que con esta idea de codificacion, cualquier computo posible de la maquina N se puede codificar como cadenas de 1 y 0. 
Siendo 0 avanzar a la izquierda y 1 a la derecha. 

Entonces todos los posibles computos se pueden simular de manera **deterministica** a partir de un nodo inicial.
Habria que analizar $2^t$ computos (porque son cadenas de 01* de longitud t), siendo t la longitud maxima de un computo.

Como cada computo toma a lo sumo t tiempo (t pasos a realizar), podemos simular todos los computos en $O(t.2^t)$

Esto significa que todos los computos de una maquina no deterministica se pueden simular (aunque sea en tiempo exponencial),
y como ya explique todo lenguaje en NP tiene una maquina no deterministica que lo decide.

En conclusion todo problema de NP, es decidible $\Rightarrow NP \subseteq RECURSIVE$ 

(Como halting no es decidible no pertenece a NP)