# Вывод цветовой схемы
display_color_scheme() {
    echo -e "\nColor Scheme:"
    echo "Column 1 background = $bg_hostname ($(map_color_scheme "$bg_hostname"))"
    echo "Column 1 font color = $font_hostname ($(map_color_scheme "$font_hostname"))"
    echo "Column 2 background = $bg_values ($(map_color_scheme "$bg_values"))"
    echo "Column 2 font color = $font_values ($(map_color_scheme "$font_values"))"
}
