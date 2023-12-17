#!/bin/bash
source ../02/functions_system.sh
source functions_output.sh
source functions_transform.sh

# Вызов функции для получения системной информации
read_and_check_colors "$1" "$2" "$3" "$4"
get_system_info
display_info_colored