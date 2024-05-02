#!/bin/bash

ARGCOUNT=1                     # Necesita el nombre como argumento.
E_WRONGARGS=65

if [ "$#" -ne "$ARGCOUNT" ]; then
  echo "Uso: $(basename "$0") nombre"
  exit "$E_WRONGARGS"
fi 

# Resto del código aquí...

exit 0


# Later on, substitute working code for the pseudo-code.

# Line 6 becomes:
if [ $# -ne "$ARGCOUNT" ]

# Line 12 becomes:
  echo "Usage: `basename $0` name"