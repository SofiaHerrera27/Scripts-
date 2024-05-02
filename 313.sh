#!/bin/bash

set -o verbose
# Command echoing on.
echo "This command is echoed."
# ...
echo "Another command echoed."

set +o verbose
# Command echoing off.
echo "This command is not echoed."

set -v
# Command echoing on.
echo "This command is echoed."
# ...
echo "Another command echoed."

set +v
# Command echoing off.
echo "This command is not echoed."

exit 0
