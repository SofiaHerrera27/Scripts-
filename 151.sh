#!/bin/bash
# wf.sh: Crude word frequency analysis on a text file.
# This is a more efficient version of the "wf2.sh" script.


# Check for input file on command-line.
ARGS=1
E_BADARGS=85
E_NOFILE=86

if [ $# -ne "$ARGS" ]  # Correct number of arguments passed to script?
then
  echo "Usage: $(basename "$0") filename"
  exit $E_BADARGS
fi

if [ ! -f "$1" ]       # Check if file exists.
then
  echo "File \"$1\" does not exist."
  exit $E_NOFILE
fi



########################################################
# main ()
sed -e 's/[[:punct:]]//g' -e 's/  */\n/g' "$1" | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr
#                           =========================
#                            Frequency of occurrence

#  Filter out punctuation, and
#+ change multiple spaces and other whitespace to linefeed,
#+ then shift characters to lowercase, and
#+ finally prefix occurrence count and sort numerically.

# Exercises:
# ---------
# 1) Add 'sed' commands to filter out other punctuation,
#+   such as semicolons.
sed -e 's/[[:punct:]]//g' -e 's/  */\n/g' -e 's/;/\n/g' "$1" | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr

# 2) Modify the script to also filter out multiple spaces and
#+   other whitespace.
sed -e 's/[[:punct:]]//g' -e 's/  */\n/g' -e 's/;/\n/g' -e 's/[[:space:]]\+/ /g' "$1" | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr

