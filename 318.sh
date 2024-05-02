#!/bin/bash
echo "Here"
unix2dos $0 # Script changes itself to DOS format.
chmod 755 $0 # Change back to execute permission.
 # The 'unix2dos' command removes execute permission.
./$0 # Script tries to run itself again.
 # But it won't work as a DOS file.
echo "There"
exit 0