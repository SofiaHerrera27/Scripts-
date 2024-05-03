#!/bin/bash
<<<<<<< HEAD
WIDTH=40 # 40 columns wide.
b=`ls /usr/local/bin` # Get a file listing...
echo $b | fmt -w $WIDTH
# Could also have been done by
# echo $b | fold - -s -w $WIDTH
exit 0
=======

WIDTH=40                    # 40 columns wide.

b=`ls /usr/local/bin`       # Get a file listing...

echo $b | fmt -w $WIDTH

# Could also have been done by
#    echo $b | fold - -s -w $WIDTH
 
exit 0
>>>>>>> fee48c047471f1f772d522c1318a88de60bd695e
