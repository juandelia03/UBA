## 12 

$$2-SAT \in NL$$

Como NL = coNL, si 2-SAT esta en coNL esta en NL.

2-SAT $\in$ coNL $\iff$ $\lnot$ 2-SAT $\in$ NL

Es decir si dada $\phi$, $\lnot \phi$ es satisfacible

Notar que si $phi$ es 2-SAT tiene pinta (algo $\lor$ algo) $\land$ (algo $\lor$ algo).

Si negamos algo de esa pinta usando de morgan llegamos a: 
($\lnot$ algo $\land$ $\lnot$ algo) $\lor$ ($\lnot$ algo $\land$ $\lnot$ algo)

Con esto en mente bastaria con que una de esas conjunciones sea verdadera para que toda la formula sea verdadera. 
(porque es una cadena de $\lor$).

**Certificado**: La asignacion de las dos variables $x_1$ y $x_2$ que hagan que alguna conjuncion sea verdadera.
(esto implica que toda la formula se vuelve verdadera)

**Verificador**: Nos copiamos del certificado a la cinta de trabajo las asignaciones ya que solo se puede leer una vez el
certificado. Esto va a ocupar espacio logaritmico porque solo es guardar una cantidad acotada de numeros, es decir O(log n).
Recorre la formula y en cada conjuncion chequea si asignando $x_1$ y $x_2$ se vuelve verdadera. Solo es neceario traerse de a
una conjuncion y como cada una tiene a lo sumo 2 literales sigue siendo O(log n). 