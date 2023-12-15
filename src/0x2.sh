#!/bin/bash

# Получение данных
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, $4}')
USER=$(whoami)
OS=$(cat /etc/os-release | grep PRETTY_NAME | cut -d '"' -f 2)
DATE=$(date +"%d %b %Y %T")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}')
IP=$(ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d'/' -f1)
MASK=$(ip -4 addr show scope global | grep inet | awk '{print $2}' | cut -d'/' -f2)
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -h --si | grep Mem | awk '{print $2}')
RAM_USED=$(free -h --si | grep Mem | awk '{print $3}')
RAM_FREE=$(free -h --si | grep Mem | awk '{print $7}')
SPACE_ROOT=$(df -h / | awk 'NR==2 {print $2}')
SPACE_ROOT_USED=$(df -h / | awk 'NR==2 {print $3}')
SPACE_ROOT_FREE=$(df -h / | awk 'NR==2 {print $4}')

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

