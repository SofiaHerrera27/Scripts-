#!/bin/bash
# from.sh

#  Emulates the useful 'from' utility in Solaris, BSD, etc.
#  Echoes the "From" header line in all messages
#+ in your e-mail directory.

# Se recomienda usar comillas dobles para evitar problemas con nombres de archivos que contienen espacios u otros caracteres especiales.
MAILDIR=~/mail/*               #  Agregar comillas para manejar espacios en nombres de archivos.
# Añadir una comprobación para verificar si $MAILDIR existe y es un directorio.
if [ ! -d "$MAILDIR" ]; then
  echo "Error: $MAILDIR is not a directory or does not exist."
  exit 1
fi

GREP_OPTS="-H -A 5 --color"    #  Show file, plus extra context lines
                               #+ and display "From" in color.
TARGETSTR="^From"              # "From" at beginning of line.

# Usar comillas alrededor de "$file" y "$TARGETSTR" para manejar espacios u otros caracteres especiales en los nombres de archivos o en el patrón de búsqueda.
for file in $MAILDIR
do
  grep "$GREP_OPTS" "$TARGETSTR" "$file"
  echo
done

exit $?

#  You might wish to pipe the output of this script to 'more'
#+ or redirect it to a file . . .

