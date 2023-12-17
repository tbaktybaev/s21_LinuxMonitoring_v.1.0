#!/bin/bash

# Устанавливаем значения по умолчанию
column1_background="default"
column1_font_color="default"
column2_background="default"
column2_font_color="default"

# Чтение конфигурационного файла
read_config() {
    source "$1"
}

# Вывод цветовой схемы
display_color_scheme() {
    echo "Column 1 background = $column1_background"
    echo "Column 1 font color = $column1_font_color"
    echo "Column 2 background = $column2_background"
    echo "Column 2 font color = $column2_font_color"
}
