#!/bin/bash
# ex56py.sh

# Shell commands may precede the Python script.
echo "This precedes the embedded Python script within \"$0.\""
echo "==============================================================="

# Verificar si python3 está disponible
if command -v python3 &>/dev/null; then
    # Ejecutar el primer comando de Python
    python3 -c 'print("This line prints from an embedded Python script.\n")'

    # Ejecutar el segundo comando de Python
    python3 -c 'input("Hit Enter to exit to outer script. ")'
else
    echo "Python 3 is not installed or not found. Please install Python 3."
fi

echo "==============================================================="
echo "However, the script may also contain shell and system commands."

exit 0
