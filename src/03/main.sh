# #!/bin/bash
# source ../02/functions_system.sh
# source functions_output.sh

# # Проверка наличия 4 параметров
# if [ "$#" -ne 4 ]; then
#     echo "Ошибка: Необходимо ввести 4 параметра."
#     exit 1
# fi

# # Чтение параметров
# bg_hostname=$1
# font_hostname=$2
# bg_values=$3
# font_values=$4

# # Проверка на совпадение цветов
# if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
#     echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
#     exit 1
# fi

# # Вызов функции для получения системной информации
# get_system_info
# display_info_colored

#!/bin/bash
source ../02/functions_system.sh
source functions_output.sh

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
if [ "$bg_hostname" -eq "$font_hostname" ] || [ "$bg_values" -eq "$font_values" ]; then
    echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
    exit 1
fi

# Вызов функции для получения системной информации
get_system_info
display_info_colored

# Функция для вывода цветного текста
print_colored_text() {
    local text=$1
    local info=$2
    local bg_hostname=$3
    local font_hostname=$4
    local bg_values=$5
    local font_values=$6
    local reset_color='\e[0m'

    printf "\e[48;5;%sm\e[38;5;%sm%-20s\e[0m\e[48;5;%sm\e[38;5;%sm%s\e[0m\n" "$bg_hostname" "$font_hostname" "$text" "$bg_values" "$font_values" "$info"
}

# Вывод информации с учетом цветов
display_info_colored() {
    print_colored_text "HOSTNAME = " "$HOSTNAME" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "TIMEZONE = " "$TIMEZONE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "USER = " "$USER" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "OS = " "$OS" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "DATE = " "$DATE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "UPTIME = " "$UPTIME" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "IP = " "$IP" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "MASK = " "$MASK" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "GATEWAY = " "$GATEWAY" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_TOTAL = " "$RAM_TOTAL" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_USED = " "$RAM_USED" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_FREE = " "$RAM_FREE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT = " "$SPACE_ROOT" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT_USED = " "$SPACE_ROOT_USED" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT_FREE = " "$SPACE_ROOT_FREE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
}
