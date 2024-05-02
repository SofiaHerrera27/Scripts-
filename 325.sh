#!/bin/bash
# logging-wrapper.sh
# Generic shell wrapper that performs an operation
# and logs it.

DEFAULT_LOGFILE=logfile.txt
OPERATION="ls -l"

LOGFILE=

if [ -z "$LOGFILE" ]; then
    LOGFILE="$DEFAULT_LOGFILE"
fi

OPTIONS="$@"

# Log it.
echo "$(date) - $(whoami) - $OPERATION $@" >> "$LOGFILE"

# Now, do it.
$OPERATION "$@"
