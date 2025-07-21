#!/bin/bash

# Получение пути до папки myfolder пользователя
folder_path="/home/$(whoami)/myfolder"

# Если данной папки нет, то вывод того, что данной папки не существует
if [ ! -d "$folder_path" ]; 
	then echo "$folder_path not exist"
else
# Переход в папку если она существует
	cd "$folder_path" || exit
	#Вывод кол-ва файлов в папке (ls - выведет перечнь файлов + директорий grep - позволит выбрать только файлы wc - подсчет)
	echo "Количество файлов в папке myfolder: $(ls -l | grep "^-"| wc -l)"

	#Изменение прав на file2
	if [ -f ./file2 ]; 
	then 
	chmod 664 ./file2
	echo "File rights on File = 664"
	else echo "File2 not exist"
	fi

	#Определяет пустой файл или нет. Если файл не пустой, то с помощью head вытенем 1 строку и перезапишем файл. Если файл пустой, то удаляем файл с помощью rm.
	for i in ./*; do
		if [ ! -s "$i" ];
		then 
		echo "File $i is empty"
		rm -f "$i"
		else
		echo "File $i is not empty"
		str=$(head -n 1 "$i")
		echo "$str" > "$i"
		fi
	done
fi