#!/bin/bash

# Получение пути до папки myfolder пользователя
folder_path="/home/$(whoami)/myfolder"

# Если данная папка имеется, то удалет ее и ее содержимое
if [ -d "$folder_path" ]; then
rm -r "$folder_path"
fi

# Создание папки и переход в нее
mkdir "$folder_path"
cd "$folder_path" || exit

# Создание и настройка файла 1 в соответсвии с заданием
touch ./file1
echo -e "Hello world \n$(date)" > ./file1

# Создание и настройка файла 2 в соответсвии с заданием
touch ./file2
chmod 777 ./file2

# Создание и настройка файла 3 в соответсвии с заданием
touch ./file3
head /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*()_+=-' | head -c 20 > ./file3

# Создание пустых файлов 4 и 5
touch ./file{4,5}

exit 0