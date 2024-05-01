
#!/bin/bash

# Genera un archivo de registro en el directorio actual
# desde el final de /var/log/messages.

# Nota: /var/log/messages debe ser legible por todos
# si este script es invocado por un usuario ordinario.
#         #root chmod 644 /var/log/messages

LINES=5

( date; uname -a ) >>logfile
# Hora y nombre de la máquina
echo ---------------------------------------------------------- >>logfile
tail -n $LINES  'messages'$'\r'  | xargs | fmt -s >>logfile
echo >>logfile
echo >>logfile

exit 0

#  Nota:
#  ----
#  Como señala Frank Wang,
#+ las comillas no emparejadas (ya sean comillas simples o dobles) en el archivo fuente
#+ pueden causar indigestión a xargs.
#
#  Sugiere la siguiente sustitución para la línea 15:
#  tail -n $LINES /var/log/messages | tr -d "\"'" | xargs | fmt -s >>logfile




#  Exercise:
#  --------
#  Modify this script to track changes in /var/log/messages at intervals
#+ of 20 minutes.
#  Hint: Use the "watch" command. 