#!/bin/bash
source ../02/functions_system.sh
source functions_output.sh

# Проверка наличия 4 параметров
if [ "$#" -ne 4 ]; then
    echo "Ошибка: Необходимо ввести 4 параметра."
    exit 1
fi

# Маппинг цветов
map_color() {
    case "$1" in
        1) echo 15 ;;  # белый
        2) echo 1 ;;   # красный
        3) echo 2 ;;   # зеленый
        4) echo 4 ;;   # синий
        5) echo 0 ;;   # черный
        *) echo "Ошибка: Недопустимый цвет." ;;
    esac
}

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