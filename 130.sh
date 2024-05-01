#!/bin/bash
# wf2.sh: Análisis de frecuencia de palabras en un archivo de texto.

# Usa 'xargs' para descomponer las líneas de texto en palabras individuales.
# Compara este ejemplo con el script "wf.sh" más adelante.

# Verifica si se proporcionó un archivo de entrada en la línea de comandos.
ARGS=1
E_BADARGS=85
E_NOFILE=86

if [ $# -ne "$ARGS" ]
# ¿Se pasó el número correcto de argumentos al script?
then
  echo "Uso: `basename $0` nombre_del_archivo"
  exit $E_BADARGS
fi

if [ ! -f "$1" ]       # ¿Existe el archivo?
then
  echo "El archivo \"$1\" no existe."
  exit $E_NOFILE
fi

#####################################################
cat "$1" | xargs -n1 | \
#  Lista el archivo, una palabra por línea.
tr A-Z a-z | \
#  Convierte los caracteres a minúsculas.
sed -e 's/\.//g'  -e 's/\,//g' -e 's/ /\
/g' | \
#  Filtra los puntos y las comas, y
#+ cambia el espacio entre palabras por un salto de línea,
sort | uniq -c | sort -nr
#  Finalmente, elimina duplicados, añade el recuento de ocurrencias como prefijo
#+ y ordena numéricamente.
#####################################################

#  Esto hace el mismo trabajo que el ejemplo "wf.sh",
#+ pero de manera un poco más ponderada, y se ejecuta más lentamente (¿por qué?).

exit $?