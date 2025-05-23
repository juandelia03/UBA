## 13 Probar que  $NL \subseteq P$

Por definicion $NL = NSPACE(logn)$

Recordar que:

$$ NSPACE(S(n)) \subseteq DTIME(2^{O(S(n))}) $$

Entonces:

$$NL = NSPACE(log n) \subseteq DTIME(2^{log n}) \subseteq P$$

