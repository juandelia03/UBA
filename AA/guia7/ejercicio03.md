## Ejercicio 3 Supongamos que se construyen cuatro clasificadores para discriminar grabaciones de conversaciones en inglés contra grabaciones de conversaciones en español. La siguiente tabla muestra los resultados obtenidos según cuatro algoritmos (para ser más específicos, 4 configuraciones, es decir algoritmos junto a sus hiperparámetros).

### (a) ¿Cuál de estos modelos parecen estar sobreajustando y cuáles subajustando?

Parecería que C1 está sobreajustando y C3 si bien dió 0.9 en training parece estar subajustando porque dió
mucho peor que el resto en validación.

### (b) ¿Qué intentarías hacer si pensás que un modelo sufre de subajuste o sobreajuste?

Si creo que un modelo subajusta o compejizaria y
si sobreajusta le reduciría su complejidad (capaz sirve darle más datos también).

### (c) ¿Cuáles de las configuraciones dirían que sufren de alto sesgo?

Posiblemente C3, las predicciones deben diferir bastante del valor real.

### (d) ¿Cuáles de las configuraciones dirían que sufren de alta varianza?

Posiblemente C1 tenga alta varianza, se ve que está sobreajustando por lo que el resultado de predecir
una instancia va a depender mucho del dataset con el que se haya entrenado.

### (e) ¿Dirías que alta varianza implica sobreajuste? ¿Dirías que sobreajuste implica alta varianza?

Alta varianza implica sobreajuste no me convence. Capaz tengo un árbol que no está sobreajustando pero
por la naturaleza de los árboles tiene mucha varianza, naturalmente depende mucho del dataset.

Que sobreajuste implica varianza parece verdadero

### (f) Si C1 y C2 fueran árboles, ¿qué características pensás que tendrían?

C1 debe ser un árbol con mayor altura que C2, lo que explica porque da mejor accuracy en entrenamiento. Quizá
más allá de eso los árboles son muy similares y por las variables que quedaron para validar justo dieron las
mismas predicciones.

### (g) Imaginen ahora que las grabaciones tienen mucho ruido de fondo y hasta un humano tiene problemas para detectar su origen, ¿dirían que la configuración C2 tiene sesgo alto? (suponer que los demás resultados no existen)

(Creo que no). Por definición tiene mucho sesgo si (esperanza sobre toda instancia x y todo dataset de temaño n)
la predicción de x difiera mucho del valor real de x. En este caso hay un accuracy grande así que creeriamos que
no difieren tanto.
