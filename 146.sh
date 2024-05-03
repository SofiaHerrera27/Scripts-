#!/bin/bash
# rot13.sh: Classic rot13 algorithm,
<<<<<<< HEAD
# encryption that might fool a 3-year old
# for about 10 minutes.
# Usage: ./rot13.sh filename
# or ./rot13.sh <filename
# or ./rot13.sh and supply keyboard input (stdin)
cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M' # "a" goes to "n", "b" to "o" ...
# The cat "$@" construct
#+ permits input either from stdin or from files.
exit 0
=======
#           encryption that might fool a 3-year old
#           for about 10 minutes.

# Usage: ./rot13.sh filename
# or     ./rot13.sh <filename
# or     ./rot13.sh and supply keyboard input (stdin)

cat "$@" | tr 'a-zA-Z' 'n-za-mN-ZA-M'   # "a" goes to "n", "b" to "o" ...
#  The   cat "$@"   construct
#+ permits input either from stdin or from files.

exit 0
>>>>>>> fee48c047471f1f772d522c1318a88de60bd695e
