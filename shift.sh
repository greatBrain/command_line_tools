#!/bin/bash
#Shift command in parameters to iterate through them

echo 
echo "Usando el comando Shift"

count=1

while [ -n "$1" ]
do
	echo "Parametro #$count = $1"
	count=$[ $count + 1 ]
	shift
done
echo
exit
