#!/bin/bash
source ../02/functions_system.sh
source functions_output.sh
source functions_transform.sh

check_parameter

# Чтение параметров
bg_hostname=$(map_color "$1")
font_hostname=$(map_color "$2")
bg_values=$(map_color "$3")
font_values=$(map_color "$4")

# Проверка на совпадение цветов
if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
    echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
    exit 1
fi

# Вызов функции для получения системной информации

get_system_info
display_info_colored