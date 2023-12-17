#!/bin/bash
source ../02/functions_system.sh

# Функция для вывода цветного текста
print_colored_text() {
    local text=$1
    local info=$2
    local bg_hostname=$3
    local font_hostname=$4
    local bg_values=$5
    local font_values=$6
    local reset_color='\e[0m'

    echo -e "\e[48;5;${bg_hostname}m\e[38;5;${font_hostname}m${text}\e[48;5;${bg_values}m\e[38;5;${font_values}m ${info} ${reset_color}"
}

# Проверка наличия 4 параметров
if [ "$#" -ne 4 ]; then
    echo "Ошибка: Необходимо ввести 4 параметра."
    exit 1
fi

# Чтение параметров
bg_hostname=$1
font_hostname=$2
bg_values=$3
font_values=$4

# Проверка на совпадение цветов
if [ "$bg_hostname" -eq "$bg_values" ] || [ "$font_hostname" -eq "$font_values" ]; then
    echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
    exit 1
fi

# Вызов функции для получения системной информации
get_system_info

# Вывод информации с учетом цветов
print_colored_text "HOSTNAME =" "$HOSTNAME" 1 3 4 5
print_colored_text "TIMEZONE = " "$bg_hostname" "$font_hostname"
print_colored_text "$TIMEZONE" "$bg_values" "$font_values"
print_colored_text "USER = " "$bg_hostname" "$font_hostname"
print_colored_text "$USER" "$bg_values" "$font_values"
print_colored_text "OS = " "$bg_hostname" "$font_hostname"
print_colored_text "$OS" "$bg_values" "$font_values"
print_colored_text "DATE = " "$bg_hostname" "$font_hostname"
print_colored_text "$DATE" "$bg_values" "$font_values"
print_colored_text "UPTIME = " "$bg_hostname" "$font_hostname"
print_colored_text "$UPTIME" "$bg_values" "$font_values"
print_colored_text "IP = " "$bg_hostname" "$font_hostname"
print_colored_text "$IP" "$bg_values" "$font_values"
print_colored_text "MASK = " "$bg_hostname" "$font_hostname"
print_colored_text "$MASK" "$bg_values" "$font_values"
print_colored_text "GATEWAY = " "$bg_hostname" "$font_hostname"
print_colored_text "$GATEWAY" "$bg_values" "$font_values"
print_colored_text "RAM_TOTAL = " "$bg_hostname" "$font_hostname"
print_colored_text "$RAM_TOTAL" "$bg_values" "$font_values"
print_colored_text "RAM_USED = " "$bg_hostname" "$font_hostname"
print_colored_text "$RAM_USED" "$bg_values" "$font_values"
print_colored_text "RAM_FREE = " "$bg_hostname" "$font_hostname"
print_colored_text "$RAM_FREE" "$bg_values" "$font_values"
print_colored_text "SPACE_ROOT = " "$bg_hostname" "$font_hostname"
print_colored_text "$SPACE_ROOT" "$bg_values" "$font_values"
print_colored_text "SPACE_ROOT_USED = " "$bg_hostname" "$font_hostname"
print_colored_text "$SPACE_ROOT_USED" "$bg_values" "$font_values"
print_colored_text "SPACE_ROOT_FREE = " "$bg_hostname" "$font_hostname"
print_colored_text "$SPACE_ROOT_FREE" "$bg_values" "$font_values"