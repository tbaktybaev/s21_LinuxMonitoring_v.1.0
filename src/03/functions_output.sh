# Вывод информации с учетом цветов
display_info_colored() {
    print_colored_text "HOSTNAME = " "$HOSTNAME" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "TIMEZONE = " "$TIMEZONE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "USER = " "$USER" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "OS = " "$OS" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "DATE = " "$DATE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "UPTIME = " "$UPTIME" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "IP = " "$IP" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "MASK = " "$MASK" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "GATEWAY = " "$GATEWAY" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_TOTAL = " "$RAM_TOTAL" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_USED = " "$RAM_USED" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "RAM_FREE = " "$RAM_FREE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT = " "$SPACE_ROOT" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT_USED = " "$SPACE_ROOT_USED" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
    print_colored_text "SPACE_ROOT_FREE = " "$SPACE_ROOT_FREE" "$bg_hostname" "$font_hostname"  "$bg_values" "$font_values"
}