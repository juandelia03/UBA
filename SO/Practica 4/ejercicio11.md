## Ejercicio 11

Dado un sistema que no realiza copy on write, ¿cómo le agregaría esa funcionalidad? Considerar:

- Llamadas al sistema a modificar.

- Cambios de hardware.

- Cambios en el manejo de segmentos y páginas.

### Cambios de hardware.

Las paginas deben saber si mas de un proceso las leen, para eso se puede implementar un bit "S" que indica 
si mas de un proceso la esta leyendo. 
Ademas un contador para ver cuantos procesos referencian a la pagina.

### Cambios de manejo de segmento y paginas

Las paginas que tengan el bit S prendido deben marcarse como read-only para que nadie pueda escribir, 
solo se van a poder escribir las que tengan una unica referencia.

### Llamadas al sistema a modificar

Habria que modificar la rutina de atencion del page fault, para que cuando un proceso intente de escribir
una pagina con el bit S prendido suceda lo siguiente:

1. Restarle 1 al contador de procesos que referencian la pagina

2. Se cree una copia de la pagina que el proceso este intenando de escribrir. Ahora con el bit S apagado, 
permiso de escritura y con el contador en 1.

3. Si el contador original quedo en 1, sacarle el bit S a la pagina original y otorgarle permisos de escritura.

4. Se devuelva el control al proceso que se interrumpio para que escriba en la pagina nueva que se le asigno


Logicamente cada vez que se crea un proceso nuevo, no va a copiar las paginas del padre sino que va a referenciar a las mismas.
Esas paginas van a tener S prendido y seran read-only (toda la idea de copy on write es reusar esas paginas siempre que se pueda)