#/bin/bash
#Using mktemp command
#Mr. Fana


file_name=''

read -p "Write temp file name here:" file_name
tmp_file=$(mktemp -t $file_name.XXXXXX)
echo "File $file_name created, the path is:"
echo ""
echo $tmp_file
