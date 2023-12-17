# Вывод цветовой схемы
display_color_scheme() {
    echo -e "\nColor Scheme:"
    echo "Column 1 background = ${column1_background} (${$(map_color_scheme "$bg_hostname"):-default})"
    echo "Column 1 font color = ${column1_font_color} (${$(map_color_scheme "$font_hostname"):-default})"
    echo "Column 2 background = ${column2_background} (${$(map_color_scheme "$bg_values"):-default})"
    echo "Column 2 font color = ${column2_font_color} (${$(map_color_scheme "$font_values"):-default})"
}
