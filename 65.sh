#!/bin/bash

# Patrón para buscar archivos con extensión .txt
filename="*.txt"

# Verificar si hay archivos que coincidan con el patrón
if ! compgen -G "$filename" > /dev/null; then
  echo "No se encontraron archivos con la extensión .txt en el directorio actual."
  exit 1
fi

# Recorrer cada archivo encontrado
for file in $filename
do
  echo "Contenido de $file"
  echo "---"
  
  # Verificar si el archivo existe antes de intentar leer su contenido
  if [ -f "$file" ]; then
    cat "$file"
  else
    echo "El archivo $file no existe."
  fi
  
  echo
done

exit 0
