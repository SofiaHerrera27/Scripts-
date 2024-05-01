#!/bin/bash
# bin-grep.sh: Locates matching strings in a binary file.

# A "grep" replacement for binary files.
# Similar effect to "grep -a"

E_BADARGS=65
E_NOFILE=66

if [ $# -ne 2 ]
then
  echo "Usage: $(basename "$0") search_string filename"
  exit "$E_BADARGS"
fi

if [ ! -f "$2" ]
then
  echo "File \"$2\" does not exist."
  exit "$E_NOFILE"
fi  

IFS=$'\n'       # Se utiliza $'\n' para el separador de campos para manejar adecuadamente los espacios en nombres de archivo.
for word in $(strings "$2" | grep "$1")
do
  echo "$word"  # Se envuelve "$word" entre comillas para manejar espacios en palabras encontradas.
done

# La sección anterior podría ser reemplazada con:
# strings "$2" | grep "$1" | while IFS= read -r word
# do
#   echo "$word"
# done

exit 0
