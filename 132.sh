#!/bin/bash
# Ejercitando el comando 'date'

echo "El número de días desde el inicio del año es `date +%j`."
# Necesita un '+' al principio para invocar el formato.
# %j da el día del año.

echo "El número de segundos transcurridos desde el 01/01/1970 es `date +%s`."
#  %s devuelve el número de segundos desde que comenzó la "época UNIX",
#+ pero, ¿cómo es esto útil?

prefix=temp
suffix=$(date +%s)  # La opción "+%s" para 'date' es específica de GNU.
filename=$prefix.$suffix
echo "Nombre de archivo temporal = $filename"
#  Es genial para crear nombres de archivos temporales "únicos y aleatorios",
#+ incluso mejor que usar $$.

# Lee la página del manual de 'date' para más opciones de formato.

exit 0