## Ejercicio 10

Se tiene un disco formateado con FAT para el cual se quiere poder devolver el contenido de un
archivo a partir de su ruta absoluta. Para ello se debe implementar la función:

datos = cargar_archivo(directorios[])

donde directorios es la lista de los nombres de los directorios de la ruta (ordenados, incluyendo el nombre del archivo, y sin incluir al directorio raíz). Es decir, si el archivo a abrir es

\Documentos\Users\foto.png entonces directorios = [’Documentos’, ’Users’, ’foto.png’].
Para ello se cuenta con las siguientes funciones auxiliares:

- FAT_entry(block_address): devuelve la entrada de la tabla FAT de la posición block_address.
- raw_data = read_blocks(block_address1,block_address2,...): lee del disco todos los bloques indicados por parámetro, en orden.
- parse_directory_entries(raw_data): devuelve una lista de struct_entrada_directorio,
donde cada elemento representa los subdirectorios del directorio pasado en raw_data.
- raw_data = root_table(): devuelve los datos de la tabla de directorios de root.

### a
Enumerar tres campos que debe tener la estructura struct_entrada_directorio según este
tipo de filesystem.

Seguro va a necesitar el campo name para poder buscar por nombre.
Tambien va a necesitar el bloque inicial
Va a necesitar tambien un campo de data, que contenga todos los sub-directorios/archivos que contenga.

### b 

Escribir el pseudocodigo de cargar_archivo(directorios[])

```py
def cargar_archivo(path):
    directorio_actual = parse_directory_entries(root_table()) #aca tengo todas 
    #itero por cada elemento de la lista
    for dir_name in path:
        #recorro todos los subdirectorios del directorio que este explorando
        #hasta encontrar el que matchea con el actual de la lista
        for sub_directorio in directorio_actual:
            #Cuando lo encuentro actualizo
            if sub_directorio.name == dir_name:
                bloque_inicial = sub_directorio.first_block
                
                # me traigo entero el directorio, bloque a bloque
                directorio_actual = [] #reseteo el actual
                while(bloque_inicial != EOF):
                    directorio_actual.push(bloque_inicial)                
                    bloque_inicial = FAT_entry(bloque_inicial) #avanzo el bloque al que apunte en la FAT
                
                #aca ya cargue las direcciones de los bloques, me los traigo efectivamente de disco
                directorio_actual = read_blocks(directorio_actual)
                
                #si estoy en la ultima iteracion tengo que efectivamente cargar el archivo
                if(sub_directorio.name == path[-1]):
                    data = malloc(sub_directorio.size)
                    memcpy(data,directorio_actual,sub_directorio.size)
                    return data
                else:
                    #las parseo si no son el ultimo 
                    directorio_actual = parse_directory_entries(directorio_actual)
                    break
```