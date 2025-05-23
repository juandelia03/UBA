## 8 Probar que la relacion $\leq_L$ es transitiva

Quiero ver:

$$ A \leq_L B \land  B \leq_L C \Rightarrow A \leq_L C$$

Es decir:

$$ x \in A \iff f(x) \in B \land x \in B \iff g(x) \in C \Rightarrow x\in A \iff h(x) \in C$$

Desarrollo la hipotesis:

$$ (x \in A \iff f(x) \in B \land x \in B \iff g(x) \in C) \Rightarrow
   (x \in A \iff f(x) \in B) \Rightarrow 
   (x \in A \iff g(f(x)) \in C)
$$

Entonces existe la funcion h(x) = g(f(x)). Esta funcion es computable implicitamente en L porque f y g lo son 
y la composicion de dos funciones computables implicitamente en L es computableme implicitamente en L.

\newpage 