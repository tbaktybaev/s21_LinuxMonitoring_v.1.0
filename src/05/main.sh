#!/bin/bash

# Проверка наличия аргумента
if [ $# -eq 0 ]; then
    echo "Please provide a directory path as an argument."
    exit 1
fi

# Получаем путь к директории из аргумента
directory="$1"

# Проверка существования директории
if [ ! -d "$directory" ]; then
    echo "The specified directory does not exist."
    exit 1
else 

. ./functions_output.sh

fi
