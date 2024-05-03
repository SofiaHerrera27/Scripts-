#!/bin/bash
# wstrings.sh: "word-strings" (enhanced "strings" command)
#
# This script filters the output of "strings" by checking it
#+ against a standard word list file.
# This effectively eliminates gibberish and noise,
#+ and outputs only recognized words.
# ===========================================================
# Standard Check for Script Argument(s)
ARGS=1
E_BADARGS=85
E_NOFILE=86
if [ $# -ne $ARGS ]
then
echo "Usage: `basename $0` filename"
exit $E_BADARGS
fi
if [ ! -f "$1" ] # Check if file exists.
then
echo "File \"$1\" does not exist."
exit $E_NOFILE
fi
# ===========================================================
MINSTRLEN=3 # Minimum string length.
WORDFILE=/usr/share/dict/linux.words # Dictionary file.
# May specify a different word list file
#+ of one-word-per-line format.
# For example, the "yawl" word-list package,
# http://bash.deta.in/yawl-0.3.2.tar.gz
wlist=`strings "$1" | tr A-Z a-z | tr '[:space:]' Z | \
tr -cs '[:alpha:]' Z | tr -s '\173-\377' Z | tr Z ' '`
# Translate output of 'strings' command with multiple passes of 'tr'.
# "tr A-Z a-z" converts to lowercase.
# "tr '[:space:]'" converts whitespace characters to Z's.
# "tr -cs '[:alpha:]' Z" converts non-alphabetic characters to Z's,
#+ and squeezes multiple consecutive Z's.
# "tr -s '\173-\377' Z" converts all characters past 'z' to Z's
#+ and squeezes multiple consecutive Z's,
#+ which gets rid of all the weird characters that the previous
bash$ readlink /usr/bin/awk
../../bin/gawk
strings
Use the strings command to find printable strings in a binary or data file. It will list sequences of
printable characters found in the target file. This might be handy for a quick 'n dirty examination of a
core dump or for looking at an unknown graphic image file (strings image-file | more
might show something like JFIF, which would identify the file as a jpeg graphic). In a script, you
would probably parse the output of strings with grep or sed. See Example 11-8 and Example 11-10.
Example 16-34. An "improved" strings command
#!/bin/bash
# wstrings.sh: "word-strings" (enhanced "strings" command)
#
# This script filters the output of "strings" by checking it
#+ against a standard word list file.
# This effectively eliminates gibberish and noise,
#+ and outputs only recognized words.
# ===========================================================
# Standard Check for Script Argument(s)
ARGS=1
E_BADARGS=85
E_NOFILE=86
if [ $# -ne $ARGS ]
then
echo "Usage: `basename $0` filename"
exit $E_BADARGS
fi
if [ ! -f "$1" ] # Check if file exists.
then
echo "File \"$1\" does not exist."
exit $E_NOFILE
fi
# ===========================================================
MINSTRLEN=3 # Minimum string length.
WORDFILE=/usr/share/dict/linux.words # Dictionary file.
# May specify a different word list file
#+ of one-word-per-line format.
# For example, the "yawl" word-list package,
# http://bash.deta.in/yawl-0.3.2.tar.gz
wlist=`strings "$1" | tr A-Z a-z | tr '[:space:]' Z | \
tr -cs '[:alpha:]' Z | tr -s '\173-\377' Z | tr Z ' '`
# Translate output of 'strings' command with multiple passes of 'tr'.
# "tr A-Z a-z" converts to lowercase.
# "tr '[:space:]'" converts whitespace characters to Z's.
# "tr -cs '[:alpha:]' Z" converts non-alphabetic characters to Z's,
#+ and squeezes multiple consecutive Z's.
# "tr -s '\173-\377' Z" converts all characters past 'z' to Z's
#+ and squeezes multiple consecutive Z's,
#+ which gets rid of all the weird characters that the previous
Advanced Bash-Scripting Guide
Chapter 16. External Filters, Programs and Commands 266
#+ translation failed to deal with.
# Finally, "tr Z ' '" converts all those Z's to whitespace,
#+ which will be seen as word separators in the loop below.
# ***********************************************************************
# Note the technique of feeding/piping the output of 'tr' back to itself,
#+ but with different arguments and/or options on each successive pass.
# ***********************************************************************
for word in $wlist # Important:
# $wlist must not be quoted here.
# "$wlist" does not work.
# Why not?
do
strlen=${#word} # String length.
if [ "$strlen" -lt "$MINSTRLEN" ] # Skip over short strings.
then
continue
fi
grep -Fw $word "$WORDFILE" # Match whole words only.
# ^^^ # "Fixed strings" and
#+ "whole words" options.
done
exit $?
