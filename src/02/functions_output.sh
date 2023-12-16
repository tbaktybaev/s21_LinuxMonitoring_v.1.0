# Вывод данных
display_info() {
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
}

save_to_file() {
    # Запись данных в файл
    read -p "Хотите сохранить данные в файл? (Y/N): " answer
    if [ "$answer" == "Y" ] || [ "$answer" == "y" ]; then
        filename=$(date +"%d_%m_%y_%H_%M_%S.status")
        # echo -e "HOSTNAME = $HOSTNAME\n
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