#!/bin/bash

# Проверка, что передан ровно один параметр
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <text_parameter>"
    exit 1
fi

# Проверка, является ли параметр числом
if [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Invalid input: Parameter is a number."
else
    echo "Parameter value: $1"
fi

