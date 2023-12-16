#!/bin/bash

source functions_system.sh
source functions_output.sh

# Получение данных из системы
get_system_info
# Вывод данных
display_info
# Сохранение в файл данных
save_to_file