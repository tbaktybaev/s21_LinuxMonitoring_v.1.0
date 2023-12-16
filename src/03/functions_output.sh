# Функция для вывода значений с цветами
print_colored_value() {
    local value=$1
    local font_color=$2
    local background_color=$3
    local reset_color='\e[0m'
    local colored_value='\e['"$font_color"';'"$background_color"'m'"$value"$reset_color

    echo -e "$colored_value"
}

# Вывод данных с цветами
display_info() {
    print_colored_value "HOSTNAME = $HOSTNAME" "$2" "$1"
    print_colored_value "TIMEZONE = $TIMEZONE" "$4" "$3"
    print_colored_value "USER = $USER" "$2" "$1"
    print_colored_value "OS = $OS" "$4" "$3"
    print_colored_value "DATE = $DATE" "$2" "$1"
    print_colored_value "UPTIME = $UPTIME" "$4" "$3"
    print_colored_value "UPTIME_SEC = $UPTIME_SEC" "$2" "$1"
    print_colored_value "IP = $IP" "$4" "$3"
    print_colored_value "MASK = $MASK" "$2" "$1"
    print_colored_value "GATEWAY = $GATEWAY" "$4" "$3"
    print_colored_value "RAM_TOTAL = $RAM_TOTAL" "$2" "$1"
    print_colored_value "RAM_USED = $RAM_USED" "$4" "$3"
    print_colored_value "RAM_FREE = $RAM_FREE" "$2" "$1"
    print_colored_value "SPACE_ROOT = $SPACE_ROOT" "$4" "$3"
    print_colored_value "SPACE_ROOT_USED = $SPACE_ROOT_USED" "$2" "$1"
    print_colored_value "SPACE_ROOT_FREE = $SPACE_ROOT_FREE" "$4" "$3"
}