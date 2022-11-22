#!/bin/bash
#Simple script to add multiple users from a file

echo "################################"
echo "##                           ##"
echo "##   Automatic User Creator  ##"
echo "##                           ##"
echo "###############################"


#get file:
file=""

echo -e "\n"
read -p "Escriba el archivo:" file


#Reading the file:
while IFS=',' read -r loginname name
do
	echo "Creating new user: $loginname ......"
	useradd -c "$name" -m "$loginname" &>/dev/null	
done < "$file"

