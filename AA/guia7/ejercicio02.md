## Ejercicio 2 Verdadero o Falso

### (a) Aumentar la cantidad de datos suele ayudar a contrarrestar problemas de varianza.

Falso. La varianza es: dado un algoritmo, cuánto esperamos que una predicción difiera del valor más común de dicho algoritmo (sobre todos los datasets de tamaño n). Agregar más datos no tendría porque reducir la diferencia
entre un valor dado y el promedio.

Si tengo un modelo con mucha varianza por ejemplo un árbol de altura máxima, no va a reducir la varianza darle más datos.

Podría ser verdadero si lo pienso como: Si tengo pocos datos capaz el modelo hace predicciones
muy distintas para casos correlacionados pero el patrón que las "linkea". Aumentando la cantidad de datos capaz aprende patrones que hace que haga prediciones mas razonables así bajando el sesgo.

### (b) Aumentar la cantidad de datos suele ayudar a contrarrestar problemas de sesgo.

Falso. El sesgo es: Dado un algoritmo, cuánto esperamos que una predicción difiera del valor real (técnicamente, del valor medio real) (sobre todos los datasets de tamaño n). Agregar más datos no tiene porque reducir
esa diferencia, tranquilamente con más datos el algoritmo podría sesgarse más todavía.

### (c) Un modelo muy complejo suele producir sesgo alto.

Falso. No necesariamente. Quizá aunque cambie el dataset todas las predicciones me den distintas, pero su
promedio me de cerca del valor real.

### (d) Un modelo muy complejo suele producir varianza alta.

Verdadero. Si el modelo es muy complejo a lo mejor aprende mucho del dataset de memoria. Si cambiamos el dataset
las predicciones pueden dar distinto entre si (asumí que modelo complejo puede implicar un poco de overfit).

### (e) Sesgo alto está asociado a problemas de undefitting.

Verdadero. Si un modelo esta underfiteado posbilemente no generaliza bien y es posible que sus predicciones
estén corridas todas para el mismo lado respecto al valor medio real.

### (f) Varianza alta está asociado a problemas de overfitting.

Verdadero. Si el modelo overfitea se puede aprender el dataset de memoria. Al cambiar el dataset las predicciones
pueden cambiar mucho, por lo tanto tiene alta varianza.
