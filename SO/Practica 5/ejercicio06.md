## Ejercicio 6

¿Cuál debería ser el nivel de acceso para las syscalls IN y OUT? ¿Por qué?

Deben ser de nivel de kernel. Los usuarios no tienen que poder leer/escribir cualquier registro.
Por eso los drivers corren a nivel de kernel.

\newpage
