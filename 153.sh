#!/bin/bash
# rnd.sh: Outputs a 10-digit random number

# Genera un número aleatorio de 10 dígitos.
# Utiliza /dev/urandom para obtener bytes aleatorios, los convierte en enteros sin signo de 4 bytes (32 bits)
# y luego extrae el primer número de 4 dígitos de la salida.
head -c4 /dev/urandom | od -An -tu4 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]].*//' | head -n1


exit 0

