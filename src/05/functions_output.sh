#!/bin/bash

start_time=$(date +%s)

dir_path="$1"

get_size() {
    du -sh "$1" | cut -f1
}

get_md5() {
    md5sum "$1" | cut -d' ' -f1
}

total_folders=$(find "$dir_path" -type d | wc -l)

top_folders=$(find "$dir_path" -type d -printf '%s %p\n' | sort -nr | head -n 5)

total_files=$(find "$dir_path" -type f | wc -l)


config_files=$(find "$dir_path" -type f -name "*.conf" | wc -l)
text_files=$(find "$dir_path" -type f -exec file {} \; | grep "text" | wc -l)
executable_files=$(find "$dir_path" -type f -executable | wc -l)
log_files=$(find "$dir_path" -type f -name "*.log" | wc -l)
archive_files=$(find "$dir_path" -type f -name "*.zip" -o -name "*.tar" -o -name "*.gz" | wc -l)
symbolic_links=$(find "$dir_path" -type l | wc -l)

top_files=$(find "$dir_path" -type f -printf '%s %p\n' | sort -nr | head -n 10)
top_files_with_type=$(find "$dir_path" -type f -exec file {} \; | grep -v "directory" | sort -k2 | head -n 10)

top_executables=$(find "$dir_path" -type f -executable -printf '%s %p\n' | sort -nr | head -n 10)
top_executables_with_md5=$(find "$dir_path" -type f -executable -exec bash -c 'get_md5 "$0" && echo " $0"' {} \; | sort -nr | head -n 10)


sleep 1
end_time=$(date +%s)
execution_time=$(echo "$end_time - $start_time" | bc -l)

echo "Total number of folders (including all nested ones) = $total_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_folders" | awk '{print NR, "-", $2, $1}'
echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $config_files"
echo "Text files = $text_files"
echo "Executable files = $executable_files"
echo "Log files (with the extension .log) = $log_files"
echo "Archive files = $archive_files"
echo "Symbolic links = $symbolic_links"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_files_with_type" | awk '{print NR, "-", $2, $1, $3}'
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$top_executables_with_md5" | awk '{print NR, "-", $2, $1, $3}'
echo "Script execution time (in seconds) = $execution_time"

