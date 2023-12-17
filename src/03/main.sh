#!/bin/bash
source ../02/functions_system.sh
source functions_output.sh

# Проверка наличия 4 параметров
if [ "$#" -ne 4 ]; then
    echo "Ошибка: Необходимо ввести 4 параметра."
    exit 1
fi

# Чтение параметров
bg_hostname=$1-1
font_hostname=$2-1
bg_values=$3-1
font_values=$4-1

# Проверка на совпадение цветов
if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
    echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
    exit 1
fi

# Вызов функции для получения системной информации
get_system_info
display_info_colored