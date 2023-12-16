#!/bin/bash

# Включение файлов с функциями
source ../02/functions_output.sh
source functions_output.sh

if [ "$#" -ne 4]; then
    echo "Usage: $0 <bg_color_names> <font_color_names> <bg_color_values> <font_color_values>"
    exit 1
fi

# Вызов функций
get_general_info
get_system_info
display_info "$@"