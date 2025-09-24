## Ejercicio 7 (lo hicimos en clase) La técnica de SOBREMUESTREO (oversampling) consiste en crear copias de instancias al azar (a veces agregando mínimas modificaciones en alguno de sus atributos) y asignarle la etiqueta original. Este proceso se utiliza mucho cuando las clases están muy desbalanceadas y no es suficiente la cantidad de instancias de alguna clase para entrenar un clasificador. En estos casos es normal, por ejemplo, sobremuestrear hasta lograr la misma cantidad de instancias para cada clase. Por ejemplo, dado el problema de clasificar entre GATOS, PERROS y CONEJOS, y dado que la cantidad de instancias es 100, 2000 y 20 respectivamente, generamos un nuevo dataset de 2000, 2000, y 2000 instancias, en donde las instancias agregadas son copias de instancias de la clase correspondiente elegidas al azar y a las que se le agrega un poco de ruido a sus columnas numéricas. Describir los pros y contras de aplicar la técnica en los siguientes pasos del proceso. Justificar en términos de posibilidades de sub o sobreestimar la performance de nuestros modelos y concluir cuál es la opción más segura:

Nos aclararon que la distribucion de los datos esta bien con respecto a la realidad.

### I : Antes de partir en desarrollo - evaluación

Contras:

- Cambiamos la distribucion de las clases, entonces cuando evaluemos la muestra no va a ser fiel a la realidad.

- Sea $C_i$ un conejo cualquiera y $C_i^{r}$ la instancia duplicada con ruido. Puede pasar que 
$C_i^r$ quede en held out y $C_i$ en desarrollo. De esta manera el algoritmo puede memorizar esas instancias y sobreajustar.

### II: Antes de partir en Folds en desarrollo.

Contras: 

- Igual a la segunda en **I**. Si oversampleo me van a quedar instancias casi repetidas entre los distintos
folds, entonces cada vez que entrene a un modelo es posible que sobre ajuste aprendiendoselas de memoria

(hay 20 conejos por ejemplo, lo mas probable es que tenga a todos (con ruido ) en todos )


### III (Luego de seleccionar los folds que se utilizarán para entrenar el modelo dentro de las iteraciones de K-fold crossval. Aplicarlo sólo a los datos de entrenamiento.) vs. IV (Luego de seleccionar los folds que se utilizarán para entrenar el modelo dentro de las iteraciones de K-fold cross val. Aplicarlo tanto a los datos de entrenamiento como a los de validación.) : 

Aca es mejor la opcion 3. No nos interesa oversamplear los datos con los que vamos a validar, preferimos
conservar la distribucion de los datos.

**Ganador: opcion 3**