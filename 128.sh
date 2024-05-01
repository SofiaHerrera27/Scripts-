#!/bin/bash
# copydir.sh

# Copia (de forma detallada) todos los archivos en el directorio actual ($PWD)
#+ al directorio especificado en la línea de comandos.

E_NOARGS=85

# Función para pedir el nombre del directorio al usuario
pedir_nombre_directorio() {
  read -p "Ingresa el nombre del directorio al que copiar: " nombre_directorio
  echo $nombre_directorio
}

# Llama a la función y guarda el resultado en una variable
directorio=$(pedir_nombre_directorio)

# Comprueba si el directorio existe
if [ ! -d "$directorio" ]; then
  echo "El directorio $directorio no existe."
  exit 1
fi

ls . | xargs -i -t cp ./{} $directorio
#            ^^ ^^      ^^
#  -t es la opción "detallada" (envía la línea de comandos a stderr).
#  -i es la opción "reemplazar cadenas".
#  {} es un marcador de posición para el texto de salida.
#  Esto es similar al uso de un par de llaves en "find".
#
#  Lista los archivos en el directorio actual (ls .),
#+ pasa la salida de "ls" como argumentos a "xargs" (opciones -i -t),
#+ luego copia (cp) estos argumentos ({}) al nuevo directorio ($directorio).  

return 0