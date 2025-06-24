## Ejercicio 8 Probar que $PSPACE^{PSPACE} = PSPACE$ 

Es trivial que $PSPACE \subseteq PSPACE^{PSPACE}$

Veamos que $PSPACE^{PSPACE} \subseteq PSPACE$

Sea $\Pi \in PSPACE^{PSPACE}$ quiero ver que $\Pi \in PSPACE$

$\Pi$ es decidible con un oraculo con acceso a cualquier problema de pspace,
es decir que hay una maquina $M_{PSPACE}$ deterministica que corre en tiempo polinomial con acceso al oraculo y
reconoce $\Pi$.

Simulemos a esa maquina con la maquina $M_{PSPACE}$ con M, una maquina deterministica que usa espacio polinomial.

M va a ser igual a $M_{PSPACE}$ pero va a reemplazar cada llamada al oraculo por el llamado a la maquina que reconozca 
el lenguaje al que le esten preguntando al oraculo. Como el oraculo es de PSPACE la "maquina" a la que llamamos en su reemplazo
tambien es PSPACE, es decir que usa espacio polinomial.

Como los llamados nuevos que hace solo usan espacio polinomial (PSPACE es cerrada por composicion), 
sigue siendo PSPACE.

Podemos simular cualquier maquina de $PSPACE^{PSPACE}$ con una maquina PSPACE sin oraculo.
En conclusion $PSPACE^{PSPACE} = PSPACE$ 

