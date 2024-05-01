#!/bin/bash
# list-glob.sh: Generating [list] in a for-loop, using "globbing" ...
# Globbing = filename expansion.

echo

# Primer bucle: Listar detalles de archivos en el directorio actual
for file in *
do
  if [ -e "$file" ]; then  # Verificar si el archivo existe
    ls -l "$file"          # Listar detalles del archivo
  else
    echo "El archivo \"$file\" no existe."  # Mensaje de archivo inexistente
  fi
done

echo
echo

# Segundo bucle: Eliminar archivos que comienzan con "j" o "x"
for file in [jx]*
do
  if [ -e "$file" ]; then  # Verificar si el archivo existe
    rm -f "$file"          # Eliminar archivo
    echo "Se eliminó el archivo \"$file\"."
  else
    echo "No se encontró ningún archivo que coincida con \"$file\"."
  fi
done

echo

exit 0
