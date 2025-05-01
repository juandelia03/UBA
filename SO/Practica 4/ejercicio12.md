## Ejercicio 12

Se tienen dos sistemas embebidos:

A: Hace procesamiento secuencial de archivos. Los bloques se leen, se procesan y se escriben.

B: Medidor de clima. Hay un proceso principal que detecta fenómenos meteorológicos (lluvia, vientos, granizo, sol intenso) y lanza programas específicos para hacer mediciones apropiadas. El
clima puede cambiar abruptamente y cuando aparece el fenómeno nuevo se lo debe medir de
inmediato.

Indicar cuál de las siguientes políticas de reemplazo de páginas es más apropiada para cada uno.
Justificar.

- Bajar la página más recientemente usada.
- LRU.
- Segunda oportunidad + páginas estáticas.

### Sistema A

Va a mirar en orden los archivos, puedo pensar que primero va a usar las paginas de $A_1$ despues 
no las va a mirar mas  (al menos en su mayoria) y va a pasar las de $A_2$ y asi sucesivamente.

Idealmente querria mantener en los pageframe a las paginas del archivo que este manipulando en ese momento, para eso 
lo mas adecuado pareceria ser LRU.

Cuando este manipulando un $A_i$ y tenga que desalojar una pagina, cualquier pagina de $A_{i-k}$ (las paginas de archivos anteriores), va a tener un tiempo de acceso mas viejo que las que se hayan cargado de $A_i$. De esta manera logro ir desalojando
las de archivos viejos antes de reemplazar a las del actual.

### Sistema B

Para este sistema  puede ser util, Segunda oportunidad + páginas estáticas. 

Como hay un proceso principal que siempre esta corriendo seria interesante tenerlo en una pagina/paginas 
estatica para que nunca se desaloje.

El resto de los programas pueden ser necesitados en cualquier momento pero seguramente hay algunos que se ejecutan
mucho mas que otros. Por eso es util la segunda oportunidad, los procesos mas comunes tendrian segunda oportunidad
mientras los mas "raros" probablemente no, asi que posiblemente si tenemos que hacer un desalojo no se elija a uno frecuente si 
es que hay uno mas "raro" para desalojar. 

Mas aun si se pudiera estudiar que fenomenos son super comunes (capaz en la meteorologia se mide de manera muy 
frecuente la intensidad del sol o viento), a estos se les podria asignar paginas estaticas para mejorar aun mas la performance.

Ojo que este ultimo detalle va a depender de cuanta memoria tengamos, si nos vamos de mambo agregando paginas estaticas nos puede
quedar poco espacio para el resto de los fenomenos generando comportamientos de desalojo indeseables.


