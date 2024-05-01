#!/bin/bash
# Planets revisited.

# Associate the name of each planet with its distance from the sun.

# Usando un ciclo for con un array en lugar de una cadena para cada planeta.
planets=("Mercury 36" "Venus 67" "Earth 93" "Mars 142" "Jupiter 483")

for planet in "${planets[@]}"
do
  # Usar comillas dobles alrededor de $planet para evitar problemas con espacios en blanco.
  set -- "$planet"  # Parsea la variable "planet" y establece parámetros posicionales.
                    # Las comillas dobles son importantes para manejar espacios en blanco correctamente.

  # Guardar los parámetros posicionales originales en un array.
  original_params=("$@")

  echo "${original_params[0]}          ${original_params[1]},000,000 miles from the sun"
  # Agregar dos tabulaciones y concatenar ceros al parámetro ${original_params[1]}.
done

exit 0
