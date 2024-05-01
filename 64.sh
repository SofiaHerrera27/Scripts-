#!/bin/bash
# fileinfo.sh

FILES=("/usr/sbin/accept"
       "/usr/sbin/pwck"
       "/usr/sbin/chroot"
       "/usr/bin/fakefile"
       "/sbin/badblocks"
       "/sbin/ypbind")     # List of files you are curious about.
                          # Threw in a dummy file, /usr/bin/fakefile.

echo

for file in "${FILES[@]}"
do
  if [ ! -f "$file" ]  # Check if file exists and is a regular file.
  then
    echo "$file does not exist or is not a regular file."
    echo
    continue  # On to next file.
  fi

  ls -l "$file" | awk '{ print $9 "         file size: " $5 }'  # Print filename and size.
  
  # Check if whatis database is set up.
  if command -v whatis &>/dev/null
  then
    whatis "$(basename "$file")"  # File info.
  else
    echo "whatis database is not set up."
  fi
  
  echo
done  

exit 0
