#!/bin/bash
MY_PROMPT='$ '
while :
do
  echo -n "$MY_PROMPT"
  read line
  eval "$line"
  done

exit 0

# This example script, and much of the above explanation supplied by
# Stéphane Chazelas (thanks again).