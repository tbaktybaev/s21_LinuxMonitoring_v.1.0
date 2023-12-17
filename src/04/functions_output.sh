# Вывод цветовой схемы
display_color_scheme() {
    echo -e "\nColor Scheme:"
    echo "Column 1 background = ${column1_background} (${bg_hostname:-default})"
    echo "Column 1 font color = ${column1_font_color} (${font_hostname:-default})"
    echo "Column 2 background = ${column2_background} (${bg_values:-default})"
    echo "Column 2 font color = ${column2_font_color} (${font_values:-default})"
}
