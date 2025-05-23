## Ejercicio 1

¿Cuáles de las siguientes opciones describen el concepto de driver? Seleccione las correctas y
justifique.

### a) Es una pieza de software

Si se implementa por sw (es un .c)

### b) Es una pieza de hardware.

No es una pieza de hw, es la interfaz para una pieza de hw.

### c) Es parte del SO.

Si, es parte del SO. Es el encargado de que puedan hablar dispositivos externos con el sw.

### d) Dado que el usuario puede cambiarlo, es una aplicación de usuario.

No es una aplicación de usuario, corre a nivel kernel.

### e) Es un gestor de interrupciones.

No. A veces se vale de las interrupciones para implementar drivers.

### f) Tiene conocimiento del dispositivo que controla pero no del SO en el que corre.

Debe conocerlo porque cada SO tiene una API distinta.

### g) Tiene conocimiento del SO en el que corre y del tipo de dispositivo que controla, pero no de las particularidades del modelo específico.

Si cononce las particularidades del modelo específico. La idea es poder comunicar al SO con cualquier dispositivo.
(cada grafica distinta por ejemplo tiene su propio driver)

\newpage
