## Ejercicio 1
Explicar la diferencia entre los conceptos de fragmentación interna y externa.

__Fragmentacion externa__:

Cuando tenemos espacio libre disperso en la memoria que se desperdicia. Por ejemplo puedo tener 3 MB libres pero en particiones no contiguas de 1MB cada una. 
Si quiero darle 3MB a un proceso no puedo.

(Se resuelve separando la memoria en bloques fijos y a cada proceso se le asignan bloques, asi puede
usar espacio fisico no contiguo)

__Fragmentacion Interna__: 

Cuando en los bloques fijos que describi arriba se empieza a desperdiciar memoria tenemos
fragmentacion interna. Por ejemplo un proceso podria necesitar 1 MB de memoria, pero si 
los bloques son de 8MB, al asignarle un bloque se van a estar desperdiciando 7MB

\newpage