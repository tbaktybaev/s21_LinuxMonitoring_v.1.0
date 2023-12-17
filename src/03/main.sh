# #!/bin/bash

# # Включение файлов с функциями
# source ../02/functions_output.sh
# source functions_output.sh

# if [ "$#" -ne 4 ]; then
#     echo "Usage: $0 <bg_color_names> <font_color_names> <bg_color_values> <font_color_values>"
#     exit 1
# fi

# # Вызов функций
# get_system_info
# display_info "$@"

#!/bin/bash

# Функция для получения системной информации
get_system_info() {
    HOSTNAME=$(hostname)
    TIMEZONE=$(timedatectl | awk '/Time zone/ {print $3, "UTC"}')
    USER=$(whoami)
    OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)
    DATE=$(date +"%d %b %Y %T")
    UPTIME=$(uptime -p)
    UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
    IP=$(ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d'/' -f1)
    MASK=$(ipcalc $(ip route | grep default | awk '{print $3}') | grep Netmask | awk '{print $2}')
    GATEWAY=$(ip route | grep default | awk '{print $3}')
    RAM_TOTAL=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $2/1024}')
    RAM_USED=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $3/1024}')
    RAM_FREE=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $4/1024}')
    SPACE_ROOT=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $2}')
    SPACE_ROOT_USED=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $3}')
    SPACE_ROOT_FREE=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $4}')
}

# Функция для вывода цветного текста
print_colored_text() {
    local text=$1
    local bg_color=$2
    local font_color=$3
    echo -e "\e[48;5;${bg_color}m\e[38;5;${font_color}m${text}\e[0m"
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
print_colored_text "HOSTNAME: $HOSTNAME" "$bg_hostname" "$font_hostname"
print_colored_text "TIMEZONE: $TIMEZONE" "$bg_values" "$font_values"
print_colored_text "USER: $USER" "$bg_hostname" "$font_hostname"
print_colored_text "OS: $OS" "$bg_values" "$font_values"
print_colored_text "DATE: $DATE" "$bg_hostname" "$font_hostname"
print_colored_text "UPTIME: $UPTIME" "$bg_values" "$font_values"
print_colored_text "IP: $IP" "$bg_hostname" "$font_hostname"
print_colored_text "MASK: $MASK" "$bg_values" "$font_values"
print_colored_text "GATEWAY: $GATEWAY" "$bg_hostname" "$font_hostname"
print_colored_text "RAM_TOTAL: $RAM_TOTAL" "$bg_values" "$font_values"
print_colored_text "RAM_USED: $RAM_USED" "$bg_hostname" "$font_hostname"
print_colored_text "RAM_FREE: $RAM_FREE" "$bg_values" "$font_values"
print_colored_text "SPACE_ROOT: $SPACE_ROOT" "$bg_hostname" "$font_hostname"
print_colored_text "SPACE_ROOT_USED: $SPACE_ROOT_USED" "$bg_values" "$font_values"
print_colored_text "SPACE_ROOT_FREE: $SPACE_ROOT_FREE" "$bg_hostname" "$font_hostname"
