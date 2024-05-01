#!/bin/bash
# symlinks.sh: Lists symbolic links in a directory.

directory="${1:-$(pwd)}"
#  Defaults to current working directory,
#+ if not otherwise specified.

echo "Symbolic links in directory \"$directory\":"

# Utilizamos comillas dobles alrededor de "$(find ...)" para manejar nombres de archivo con espacios
find "$directory" -type l | sort | while IFS= read -r file
do
  echo "$file"
done

exit 0

