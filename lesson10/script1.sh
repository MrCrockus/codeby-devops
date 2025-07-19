#!/bin/bash

folder_path="/home/$(whoami)/myfolder"

if [ -d $folder_path ]; then
rm -r $folder_path
fi
mkdir $folder_path

cd $folder_path

touch ./file1
echo -e "Hello world \n$(date)" > ./file1

touch ./file2
chmod 777 ./file2

touch ./file3
head /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*()_+=-' | head -c 20 > ./file3

touch ./file{4,5}
