#!/bin/bash

#************************************************#
#                   xyz.sh                       #
#           written by Bozo Bozeman              #
#                July 05, 2001                   #
#                                                #
#           Clean up project files.              #
#************************************************#

E_BADDIR=85                       # No such directory.
projectdir=/home/bozo/projects    # Directorio a limpiar.

# --------------------------------------------------------- #
# cleanup_pfiles ()                                         #
# Elimina todos los archivos en el directorio designado.    #
# Parámetro: $target_directory                              #
# Devuelve: 0 en caso de éxito, $E_BADDIR si algo sale mal. #
# --------------------------------------------------------- #
cleanup_pfiles ()
{
  if [ ! -d "$1" ]  # Prueba si el directorio de destino existe.
  then
    echo "$1 no es un directorio válido."
    return $E_BADDIR
  fi

  rm -f "$1"/*
  return 0   # Éxito.
}  

# Verificar si el directorio existe antes de intentar limpiarlo.
if [ -d "$projectdir" ]
then
  cleanup_pfiles "$projectdir"
else
  echo "$projectdir no existe."
fi

exit $?
