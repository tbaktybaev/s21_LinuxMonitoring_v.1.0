#!/bin/bash

# source ../02/functions_system.sh
# source ../03/functions_output.sh
# source ../03/functions_transform.sh

# config_file="./config.txt"

# # Проверка наличия конфигурационного файла
# if [ ! -f "$config_file" ]; then
#     echo "Ошибка: Конфигурационный файл ($config_file) не найден."
#     exit 1
# fi
# source "$config_file"

# default_column1_background=4
# default_column1_font_color=15
# default_column2_background=4
# default_column2_font_color=15

# # Проверка заданности параметров и использование значений по умолчанию при необходимости
# bg_hostname=$(map_color "${column1_background:-$default_column1_background}")
# font_hostname=$(map_color "${column1_background:-$default_column1_font_color}")
# bg_values=$(map_color "${column1_background:-$default_column2_background}")
# font_values=$(map_color "${column1_background:-$default_column2_font_color}")

# # Вызов функции для получения системной информации
# get_system_info
# display_info_colored

# Подключение модулей
source config.sh
source colors.sh
source system_info.sh

# Чтение конфигурационного файла
read_config "config.conf"

# Вывод информации о системе
get_system_info

# Пустая строка
echo

# Вывод цветовой схемы
display_color_scheme

