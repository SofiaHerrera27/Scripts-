#!/bin/bash
# symlinks.sh: Lists symbolic links in a directory.

OUTFILE="symlinks.list"                         # save-file

directory="${1:-$(pwd)}"
#  Defaults to current working directory,
#+ if not otherwise specified.


echo "Symbolic links in directory \"$directory\"" > "$OUTFILE"
echo "---------------------------" >> "$OUTFILE"

# Utilizamos comillas dobles alrededor de "$(find ...)" para manejar nombres de archivo con espacios
find "$directory" -type l | sort | while IFS= read -r file
do
  echo "$file"
done >> "$OUTFILE"                     # stdout of loop
#           ^^^^^^^^^^^^^                       redirected to save file.

# echo "Output file = $OUTFILE"

exit 0
