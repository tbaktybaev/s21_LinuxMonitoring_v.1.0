# Маппинг цветов
map_color() {
    case "$1" in
        1) echo 15 ;;  # белый
        2) echo 1 ;;   # красный
        3) echo 2 ;;   # зеленый
        4) echo 4 ;;   # синий
        5) echo 5 ;;   # черный
        6) echo 0 ;;
        *) echo 1 ;;
    esac
}