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