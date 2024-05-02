#!/bin/bash

echo "uninitialized_var = $uninitialized_var"
# uninitialized_var =

# However . . .
# if $BASH_VERSION ≥ 4.2; then

if [[ ! -v uninitialized_var ]]
then
  uninitialized_var=0   # Initialize it to zero!
fi
