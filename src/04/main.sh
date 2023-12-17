#!/bin/bash

config_file = "config.txt"

source ../02/functions_system.sh
source ../03/functions_output.sh
source "$config_file"

# Проверка наличия конфигурационного файла
if [ ! -f "$config_file" ]; then
    echo "Ошибка: Конфигурационный файл ($config_file) не найден."
    exit 1
fi

default_column1_background=4
default_column1_font_color=15
default_column2_background=4
default_column2_font_color=15

# Проверка заданности параметров и использование значений по умолчанию при необходимости
bg_hostname=${column1_background:-$default_column1_background}
font_hostname=${column1_background:-$default_column1_font_color}
bg_values=${column1_background:-$default_column2_background}
font_values=${column1_background:-$default_column2_font_color}

# Вызов функции для получения системной информации
get_system_info
display_info_colored

# Вывод цветовой схемы
echo -e "\nColor Scheme:"
echo "Column 1 background = ${column1_background} (${bg_hostname:-default})"
echo "Column 1 font color = ${column1_font_color} (${font_hostname:-default})"
echo "Column 2 background = ${column2_background} (${bg_values:-default})"
echo "Column 2 font color = ${column2_font_color} (${font_values:-default})"