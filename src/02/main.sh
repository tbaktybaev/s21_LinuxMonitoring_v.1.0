#!/bin/bash

# Получение данных
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
RAM_TOTAL=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $2}')
RAM_USED=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $3}')
RAM_FREE=$(free -h | awk '/^Mem/ {printf "%.3f GB\n", $4}')
SPACE_ROOT=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $2}')
SPACE_ROOT_USED=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $3}')
SPACE_ROOT_FREE=$(df -BM / | awk 'NR==2 {printf "%.2f MB\n", $4}')

# Вывод данных
echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

# Запись данных в файл
read -p "Хотите сохранить данные в файл? (Y/N): " answer
if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
    filename=$(date +"%d_%m_%y_%H_%M_%S.status")
    echo -e "HOSTNAME = $HOSTNAME\nTIMEZONE = $TIMEZONE\nUSER = $USER\nOS = $OS\nDATE = $DATE\nUPTIME = $UPTIME\nUPTIME_SEC = $UPTIME_SEC\nIP = $IP\nMASK = $MASK\nGATEWAY = $GATEWAY\nRAM_TOTAL = $RAM_TOTAL\nRAM_USED = $RAM_USED\nRAM_FREE = $RAM_FREE\nSPACE_ROOT = $SPACE_ROOT\nSPACE_ROOT_USED = $SPACE_ROOT_USED\nSPACE_ROOT_FREE = $SPACE_ROOT_FREE" > "$filename"
    echo "Данные сохранены в файл: $filename"
fi

