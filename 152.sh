#!/bin/bash
# script-detector.sh: Detects scripts within a directory.

TESTCHARS=2    # Test first 2 characters.
SHABANG='#!'   # Scripts begin with a "sha-bang."

directory=${1:-.}  # Use the provided directory or default to the current directory.

if [ ! -d "$directory" ]; then
  echo "Error: \"$directory\" is not a directory."
  exit 1
fi

for file in "$directory"/*  # Traverse all the files in the specified directory.
do
  if [[ -f "$file" && $(head -c$TESTCHARS "$file") = "$SHABANG"* ]]
  #             Check if it's a regular file and if it starts with the "sha-bang" sequence.
  then
    echo "File \"$file\" is a script."
  else
    echo "File \"$file\" is *not* a script."
  fi
done
  
exit 0

#  Exercises:
#  ---------
#  1) Modify this script to take as an optional argument
#+    the directory to scan for scripts
#+    (rather than just the current working directory).
#
#  2) As it stands, this script gives "false positives" for
#+    Perl, awk, and other scripting language scripts.
#     Correct this.

# Exercise 1:
# Modify this script to take as an optional argument
# the directory to scan for scripts.
# (rather than just the current working directory).

# Exercise 2:
# As it stands, this script gives "false positives" for
# Perl, awk, and other scripting language scripts.
# Correct this.

