## Ejercicio 14 Demostrar que TAUTOLOGY es coNP-completo

$$TAUTOLOGY^{c} = \{\langle \phi \rangle: \exists v.\phi(v) \vdash F\}$$

Ver que TAUTOLOGY esta en coNP es ver que su complemento esta en np:

Certificado: Valuacion para $\phi$ que cuando se evalua da falso.

Verificador: reemplazar cada variable de $\phi$ por su valor en la valuacion. 
Claramente polinomial

Ahora hay que ver que $TAUTOLOGY^{c}$ es np hard. Voy a reducrir SAT a $TAUTOLOGY^{c}$:

$$
\phi \in SAT \iff f(\phi) \in TAUTOLOGY^{c}
$$

Si una formula es satisfacible, tiene al menos una valuacion que la hace verdadera. El complemento de esa formula
entonces tendra al menos una valuacion que la haga falsa.

Propongo f($\phi$) $\rightarrow \lnot \phi$ (negar una formula es polinomial)

veamos que vale:

$$
\phi \in SAT \iff \phi' = \lnot \phi \in TAUTOLOGY^{c}
$$

$\Rightarrow$)

$$
\phi \in SAT \Rightarrow
\exists v. \phi(v) \vdash V \Rightarrow
\lnot \phi(v) \vdash F \Rightarrow
\phi'(v) \vdash F \Rightarrow
\phi'(v) \in TAUTOLOGY^{C}
$$

$\Leftarrow$)

$$
\phi' \in TAUTOLOGY^{C} \Rightarrow
\lnot \phi \in TAUTOLOGY^{C} \Rightarrow
\exists v. \lnot \phi(v) \vdash F \Rightarrow
\phi(v) \vdash V \Rightarrow
\phi \in SAT
$$

\newpage
