#!/bin/bash

# Verificar si se proporciona un nombre de archivo como argumento
if [ $# -eq 0 ]; then
    echo "Usage: $(basename "$0") filename"
    exit 1
fi

filename=$1

# Verificar si el archivo de registro del sistema existe y tiene permisos de lectura
if [ ! -r "/var/log/messages" ]; then
    echo "Error: /var/log/messages is not readable."
    exit 1
fi

# Crear o limpiar el archivo
cat /dev/null > "$filename"
echo "Creating/cleaning out file: $filename"

# Leer las últimas líneas de /var/log/messages y escribirlas en el archivo especificado
tail /var/log/messages > "$filename"

echo "$filename contains tail end of system log."

exit 0

