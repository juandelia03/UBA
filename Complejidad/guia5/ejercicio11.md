## 11 Probar que son LN-COMPLETOS

### a)

$$SCC = \{G:\text{G es fuertemente conexo}\}$$

**certificado**: Los caminos de cada nodo a todos los nodos en el grafo. Son n caminos de longitud
a lo sumo n para cada nodo $\rightarrow O(n^3)$ 

**verificador**: Por cada nodo chequea si puede llegar a todos, recorriendo los caminos especificados en el certificado
(podriamos imaginar un certificado de pinta {1:[[(1,2)],[(1,2),(2,5),(5,3)],...],...} el 1 tiene camino directo a 2,
el uno para llegar a 3 hace 1->2->5->3). 

Para hacer esto tiene que guardarse dos nodos, un "actual" que es el que usa para ir avanzando y un destino que es el que usa
para chequear que efectivamente llego al que estaba buscando, asi para cada nodo chequear que puede llegar a cualquier otro. 
Esto usa espacio O(log n) pues solo guarda dos nodos que se codifican como numeros. La cinta del certificado ademas se lee una unica vez.

**NL-Completo**

Voy a reducrir PATH a SCC:

$$ \langle g,s,t \rangle \in PATH \iff f(\langle g,s,t \rangle) \in SCC$$

f tiene que ser computable implicitamente en L.

f va a tomar una instancia de $PATH$ y la va a devolver un $G'$ de la siguiente manera:

- G' va a ser igual a G pero con dos nodos nuevos $t_{out}$ y $s_{in}$
- Ademas va a tener las aristas $t \rightarrow t_{out}$ y $s_{in} \rightarrow s$
- Para todo nodo v del grafo se van a agregar las aristas $t_{out} \rightarrow v$ y $v \rightarrow s_{in}$ 

Con esta reduccion cualquier nodo se va a poder "meter" al camino por $s_in$ y a la salida del camino puede ir
a cualquier otro por $t_{out}$ (solo si hay camino de s a t, sino llega a t cuando entra a s no puede ir a cualquier otro)

Construir este grafo es computable implicitamente en L, es copiar el grafo y agregar cosas no usamos nada en la cinta de trabajo.
A lo sumo iterar  por los nodos o algo por el estilo pero se hace con espacio logaritmico.

Veamos que vale:

$\Rightarrow$ Dada una instancia de PATH:

Como  ya explique arriba, dada una instancia de PATH si la transformo con f , G' va a ser fuertemente conexo. Si hay un camino de 
s a t cualquier nodo puede entrar a $s_{in}$ como hay camino puede llegar a $t_{out}$ y de ahi llegar a cualquier otro nodo.
(si no hubiera camino no habria forma de llegar de s a t asi que no seria fuertemente conexo)
$\Rightarrow$ G' es fuertemente conexo. 

$\Leftarrow$ Dada una instancia G' de SCC

Si la instancia G' esta en SCC es fuertemente conexo, como ya explique G' es fuertemente conexo si solo si G tiene camino de S a T
porque sino no se podria llegar a cualquier nodo.


### b)

$$\text{NFA-NO-VACIO} = \{ \langle A \rangle : \text{A es un automata no deterministico que reconoce un lenguaje no vacio}\}$$

**Pertenece a NL?**

**Certificado**: El camino que hace el automate de $q_0$ a algun $q_f$

**Verfificador**: Ir "caminando" el automata (lo pienso como un grafo, la unica diferencia es que 
hay un inicial, estado finales y transiciones. Recorrerlo es igual). Para caminarlo leo una unica vez el certificado 
avanzandoi un nodo "actual" al siguiente que indique el certificado. Verificando que existan las aristas que los conectan, 
que el nodo inicial sea $q_0$ y que el ultimo sea algun estado final.
Esto ocupa espacio log, solo guardo el nodo que pivotea.

**hardness**:

$$ \langle g,s,t \rangle \in PATH \iff f(\langle g,s,t \rangle) \in \text{NFA-NO-VACIO}$$

funcion de reduccion:
Copia el grafo como automata, el estado inicial es el nodo s $q_s$, el conjunto de estados finales solo tiene
a $q_t$ y en cada transicion se consume un 1 (podria ser cualquier cosa).

Veamos que vale:

$\Rightarrow$

$$
\langle g,s,t \rangle \in PATH \Rightarrow 
\text{En A se puede llegar desde } q_s \text{ (estado inicial) } \text{hasta } q_t \text{ (estado final)} \Rightarrow
A \in \text{NFA-NO-VACIO}
$$

$\Leftarrow$

$$
A \in \text{NFA-NO-VACIO} \Rightarrow 
\text{ Se llega desde el inicial } (q_s) \text{ hasta el unico estado final } (q_t) \Rightarrow
\text{Analogamente se llega de s a t en G} \Rightarrow
\langle g,s,t \rangle \in \text{PATH}
$$

\newpage