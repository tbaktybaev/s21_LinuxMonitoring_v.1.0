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