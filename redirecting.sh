#!/bin/bash

#Author: Mr. Fana
#In this program i show how to redirect STDOUT and STDERR messages.

#STDOUT:

#I'm using command to redirect file descriptor 3 to an
#alternative file location without create a new proccess.
exec 3> error_log

echo "This a simple text that will be shown in screen" 
echo "This should be saved in a error log file" >&3
echo "Okay folks, we're back in the screen :)"


#An example if somthing were wrong (this file doesn't exist):
cat aim_not.txt &> log
