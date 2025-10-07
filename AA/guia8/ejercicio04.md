## Ejercicio 4 Verdadero o Falso (justificar)

### (a) En Bagging, cada subconjunto tiene la misma cantidad de instancias que el dataset original.

Verdadero porque se hace bootstrap

### (b) En RF, cada subconjunto tiene la misma cantidad de instancias que el dataset original.

Verdadero RF es bootstrapping + randomizar atributos en cada split

### (c) En RF, cada árbol es entrenado sólo con un subconjunto de los atributos.

Falso, tiene todos los atributos disponibles pero en cada split mira un subconjunto. Es muy posible
que en toda la construcción del árbol haya mirado todos los atributos para splittear.

### (d) En Random Forest, tomar m = 1 significa que cada árbol tendría a lo sumo un nivel.

Falso, significa que a la hora de hacer cada split va a mirar un único atributo al azar

### (e) En Random Forest, tomar m = 1 significa que cada árbol tendría a lo sumo un atributo en todo el árbol.

Falso, significa que a la hora de hacer cada split va a mirar un único atributo al azar. En cada nivel
puedo mirar uno distinto.

### (f) En Random Forest, la importancia de atributos puede medirse como la suma (entre todos los árboles) de la ganancia obtenida en cada corte por cada atributo

Falso, falta promediar

### (g) En Random Forest, la importancia de atributos puede medirse como la suma (entre todos los árboles) de la ganancia obtenida en cada corte por cada atributo dividido B.

Verdaero así lo hace scklearn. (capaz sería razonable hacer algo más como ponderar la importancia de un atributo
en un árbol por que tan bien predice ese árbol)

### (h) La varianza que se reduce utilizando Bagging debería ser mayor que la que se reduce utilizando Random Forest.

Falso, RF reduce aún más la varianza porque no solo la reduce usando ensambles sino que también
disminuye la correlación entre modelos.

### (i) En Bagging, se puede estimar el error de generalización sólo utilizando un train set (sin necesidad de utilizar CrossVal) y los resultados seguramente estén sub-estimando el error real.

Falso. Seguramente no subestime el error, lo sobreestima (mirar (j) )

### (j) En Bagging, se puede estimar el error de generalización sólo utilizando un train set (sin necesidad de utilizar CrossVal) y los resultados seguramente estén sobre-estimando el error real.

Verdadero. Seguramente sobreestime el error porque lo va a estimar mirando solo unos pocos árboles y a priori
creemos que cada árbol no hace muy buenas predicciones. El modelo final seguramente tenga menos error porque
usa más modelos ensamblados
