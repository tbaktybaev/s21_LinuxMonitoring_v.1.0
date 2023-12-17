#!/bin/bash

source ../02/functions_system.sh
source ../03/functions_output.sh
source ../03/functions_transform.sh
source colors.sh
source functions_output.sh

config_file="config.conf"
default="default.conf"

# Проверка наличия конфигурационного файла
if [ ! -f "$config_file" ]; then
    echo "Ошибка: Конфигурационный файл ($config_file) не найден."
    exit 1
fi
source "$config_file"
source "$default"

# Вызов функции для получения системной информации
check_and_set_variables
get_system_info
display_info_colored
display_color_scheme
