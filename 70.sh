#!/bin/bash
# userlist.sh

PASSWORD_FILE="/etc/passwd"
n=1           # Número de usuario

# Utilizamos `cut` en lugar de `awk` para extraer el primer campo del archivo /etc/passwd
while IFS=':' read -r username _; do
  echo "USER #$n = $username"
  ((n++))
done < "$PASSWORD_FILE"

exit $?
