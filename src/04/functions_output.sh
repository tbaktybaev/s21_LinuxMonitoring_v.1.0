# Вывод цветовой схемы
display_color_scheme() {
    echo -e "\nColor Scheme:"
    echo "Column 1 background = $bg_1 ($(map_color_scheme "$bg_1"))"
    echo "Column 1 font color = $ft_1 ($(map_color_scheme "$font_hostname"))"
    echo "Column 2 background = $bg_2 ($(map_color_scheme "$bg_2"))"
    echo "Column 2 font color = $ft_2 ($(map_color_scheme "$ft_2"))"
}
