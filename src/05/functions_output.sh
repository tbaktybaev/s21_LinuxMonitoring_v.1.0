#!/bin/bash

# Начало отсчета времени выполнения скрипта
start_time=$(date +%s.%N)

# Общее число папок (включая вложенные)
total_folders=$(find "$directory" -type d | wc -l)

# Топ 5 папок с самым большим весом
top_folders=$(du -h --max-depth=1 "$directory" | sort -rh | head -n 5)

# Общее число файлов
total_files=$(find "$directory" -type f | wc -l)

# Число файлов по типам
config_files=$(find "$directory" -type f -name "*.conf" | wc -l)
text_files=$(find "$directory" -type f -exec file {} \; | grep -c "text")
executable_files=$(find "$directory" -type f -exec file {} \; | grep -c "executable")
log_files=$(find "$directory" -type f -name "*.log" | wc -l)
archive_files=$(find "$directory" -type f -exec file {} \; | grep -c "archive")
symbolic_links=$(find "$directory" -type l | wc -l)

# Топ 10 файлов с самым большим весом
top_files=$(du -h "$directory"/* | sort -rh | head -n 10)

# Топ 10 исполняемых файлов с хешем
top_executables=$(sudo find /var/log  -type f -exec file {} \; | grep exe | sort -k5 -rh | head -n 10)

# Рассчитываем время выполнения скрипта
end_time=$(date +%s.%N)
execution_time=$(echo "$end_time - $start_time" | bc)

# Выводим результаты
echo "Total number of folders (including all nested ones) = $total_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_folders" | awk '{printf "%d - %s, %s\n", NR, $2, $1}'
echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $config_files"
echo "Text files = $text_files"
echo "Executable files = $executable_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symbolic_links"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_files" | awk '{printf "%d - %s, %s, %s\n", NR, $2, $1, $NF}'
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
while IFS= read -r line; do
    path=$(echo "$line" | awk '{print $1}')
    size=$(echo "$line" | awk '{print $3}')
    hash=$(md5sum "$path" | awk '{print $1}')
    printf "%s - %s, %s, %s\n" "$(basename "$path")" "$size" "$hash"
done <<< "$top_executables"
echo "Script execution time (in seconds) = $execution_time"