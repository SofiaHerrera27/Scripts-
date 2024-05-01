#!/bin/bash
# findstring.sh:
# Find a particular string in the binaries in a specified directory.

directory="/usr/bin/"
fstring="Free Software Foundation"  # See which files come from the FSF.

# Utilizamos "$directory" y comillas dobles para manejar nombres de directorio con espacios
for file in $(find "$directory" -type f -name '*' | sort)
do
  # Utilizamos comillas dobles alrededor de "$file" para manejar nombres de archivo con espacios
  strings -f "$file" | grep "$fstring" | sed -e "s%$directory%%"
  # En la expresión "sed", reemplazamos el delimitador "/" por "%" para evitar errores con nombres de archivo que contienen "/"
done  

exit $?
