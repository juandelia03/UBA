## Ejercicio 10 Probar que $NP^{NP \cap coNP} = NP$

La inclusion $NP \subseteq NP^{NP \cap coNP}$ es trivial, el oraculo es gratis.

Veamos que $NP^{NP \cap coNP} \subseteq NP$

Para esto hay que ver una maquina no deterministica con oraculo $NP \cap coNP$ que corre en tiempo polinomial puede ser simulada
por una maquina no determinista que corre en tiempo polinomial sin oraculo.

Notemos que si $\Pi \in NP \cap coNP \Rightarrow \Pi \in NP \land \overline{\Pi} \in NP$ 

Es decir existe un certificado c y un verificador $V_1$ tq $V_1$(x) = 1 $\iff$ $x \in \Pi$

y 

existe un certificado c y un verificador $V_2$ tq $V_2$(x) = 1 $\iff$ $x \in \overline{\Pi} \iff x \not\in \Pi$

Puedo simular los llamados de la maquina con oraculo sin usar oraculos con entrada x de la siguiente manera:

Simulo Maquina oracular:
    si hay una consulta al oraculo:
        adivina r respuesta del oraculo (1 o 0)
        si r = 1 (segun la query x pertenece):
            adivinar un certificado C
            si V_1(xc) rechaza, rechazar (para que pertenezca tiene que existir un cert para V_1)
        si r = 0 (analogo):
            adivinar un certificado C
            si V_2(xc) rechaza, rechazar (para que **no** pertenezca tiene que existir un cert para V_2)


Esto es una maquina no determinista polinomial.

Entonces podemos decir que cualquier maquina no deterministica con oraculo $NP \cap coNP$ que corre en tiempo polinomial,
puede ser simulada por una maquina no determinista que corre en tiempo polinomial sin oraculo.

$NP^{NP \cap coNP} = NP$

\newpage