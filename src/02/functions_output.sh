# Вывод данных
# Вывод данных
display_info() {
    printf "%-20s %s\n" "HOSTNAME =" "$HOSTNAME"
    printf "%-20s %s\n" "TIMEZONE =" "$TIMEZONE"
    printf "%-20s %s\n" "USER =" "$USER"
    printf "%-20s %s\n" "OS =" "$OS"
    printf "%-20s %s\n" "DATE =" "$DATE"
    printf "%-20s %s\n" "UPTIME =" "$UPTIME"
    printf "%-20s %s\n" "UPTIME_SEC =" "$UPTIME_SEC"
    printf "%-20s %s\n" "IP =" "$IP"
    printf "%-20s %s\n" "MASK =" "$MASK"
    printf "%-20s %s\n" "GATEWAY =" "$GATEWAY"
    printf "%-20s %s\n" "RAM_TOTAL =" "$RAM_TOTAL"
    printf "%-20s %s\n" "RAM_USED =" "$RAM_USED"
    printf "%-20s %s\n" "RAM_FREE =" "$RAM_FREE"
    printf "%-20s %s\n" "SPACE_ROOT =" "$SPACE_ROOT"
    printf "%-20s %s\n" "SPACE_ROOT_USED =" "$SPACE_ROOT_USED"
    printf "%-20s %s\n" "SPACE_ROOT_FREE =" "$SPACE_ROOT_FREE"
}


save_to_file() {
    # Запись данных в файл
    read -p "Хотите сохранить данные в файл? (Y/N): " answer
    if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
        filename=$(date +"%d_%m_%y_%H_%M_%S.status")
        # echo -e "\n
        #          HOSTNAME = $HOSTNAME\n
        #          TIMEZONE = $TIMEZONE\n
        #          USER = $USER\n
        #          OS = $OS\n
        #          DATE = $DATE\n
        #          UPTIME = $UPTIME\n
        #          UPTIME_SEC = $UPTIME_SEC\n
        #          IP = $IP\n
        #          MASK = $MASK\n
        #          GATEWAY = $GATEWAY\n
        #          RAM_TOTAL = $RAM_TOTAL\n
        #          RAM_USED = $RAM_USED\n
        #          RAM_FREE = $RAM_FREE\n
        #          SPACE_ROOT = $SPACE_ROOT\n
        #          SPACE_ROOT_USED = $SPACE_ROOT_USED\n
        #          SPACE_ROOT_FREE = $SPACE_ROOT_FREE" > "$filename"
        display_info > "$filename"
        echo "Данные сохранены в файл: $filename"
    fi
}