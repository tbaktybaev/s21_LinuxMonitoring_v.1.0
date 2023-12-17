#!/bin/bash

source ../02/functions_system.sh
source ../03/functions_output.sh
source ../03/functions_transform.sh
source colors.sh
source functions_output.sh

config_file="config.conf"

# Проверка наличия конфигурационного файла
if [ ! -f "$config_file" ]; then
    echo "Ошибка: Конфигурационный файл ($config_file) не найден."
    exit 1
fi
source "$config_file"

default_column1_background=4
default_column1_font_color=1
default_column2_background=4
default_column2_font_color=1

# Проверка заданности параметров и использование значений по умолчанию при необходимости
bg_hostname=$(map_color "${column1_background:-$default_column1_background}")
font_hostname=$(map_color "${column1_font_color:-$default_column1_font_color}")
bg_values=$(map_color "${column2_background:-$default_column2_background}")
font_values=$(map_color "${column2_font_color:-$default_column2_font_color}")

bg_1=${column1_background:-default_column1_background}
ft_1=${column1_font_color:-default_column1_font_color}
bg_2=${column2_background:-default_column2_background}
ft_2=${column2_font_color:-default_column2_font_color}

bg_1_def=${column1_background:-default}
ft_1_def=${column1_font_color:-default}
bg_2_def=${column2_background:-default}
ft_2_def=${column2_font_color:-default}

echo $bg_1_def
echo $ft_1_def
echo $bg_2_def
echo $ft_2_def

# Вывод цветовой схемы
display_color_scheme() {
    echo -e "\nColor Scheme:"
    echo "Column 1 background = $bg_1_def ($(map_color_scheme "$bg_1"))"
    echo "Column 1 font color = $ft_1_def ($(map_color_scheme "$ft_1"))"
    echo "Column 2 background = $bg_2_def ($(map_color_scheme "$bg_2"))"
    echo "Column 2 font color = $ft_2_def ($(map_color_scheme "$ft_2"))"
}

# Вызов функции для получения системной информации
get_system_info
display_info_colored
display_color_scheme
