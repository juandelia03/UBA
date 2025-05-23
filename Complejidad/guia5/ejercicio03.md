## 3 Probar que $NP \subseteq PSPACE$

Si un lenguaje esta en NP hay una maquina N no deterministica que lo decide.

N tiene un arbol de computo que represeenta todos sus posibles computos. Con este arbol podria
simular deterministicamente a la maquina no deterministica N recorriendo cada computo. 

Como el tamaño de cada computo tiene altura polinomial puedo recorrer todo el arbol con espacio polinomial (al recorrer
un arbol solo se guarda de a una rama)