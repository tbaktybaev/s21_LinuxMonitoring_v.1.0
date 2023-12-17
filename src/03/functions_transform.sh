# Проверка наличия 4 параметров
check_parameter() {
    if [ "$#" -ne 4 ]; then
        echo "Ошибка: Необходимо ввести 4 параметра."
        exit 1
    fi
}

# read_and_check_colors() {
#     local bg_hostname=$(map_color "$1")
#     local font_hostname=$(map_color "$2")
#     local bg_values=$(map_color "$3")
#     local font_values=$(map_color "$4")

#     # Проверка на совпадение цветов
#     if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
#         echo "Ошибка: Цвета фона и шрифта для одного столбца не должны совпадать."
#         exit 1
#     fi
}

# Маппинг цветов
map_color() {
    case "$1" in
        1) echo 15 ;;  # белый
        2) echo 1 ;;   # красный
        3) echo 2 ;;   # зеленый
        4) echo 4 ;;   # синий
        5) echo 5 ;;   # черный
        6) echo 0 ;;
        *) echo "Ошибка: Недопустимый цвет." ;;
    esac
}

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