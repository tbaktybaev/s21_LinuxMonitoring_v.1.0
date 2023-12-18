#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Capture the start time
start_time=$(date +%s.%N)

# Directory path provided as argument
dir_path="$1"

# Function to calculate the size of a directory
calculate_dir_size() {
    du -sb "$1" | cut -f1
}

# Function to calculate the MD5 hash of a file
calculate_md5() {
    md5sum "$1" | cut -d' ' -f1
}

# Total number of folders (including all nested ones)
total_folders=$(find "$dir_path" -type d | wc -l)

# Top 5 folders with the maximum size
top_folders=$(du -h --max-depth=1 "$dir_path" | sort -rh | head -n 5)

# Total number of files
total_files=$(find "$dir_path" -type f | wc -l)

# Number of specific file types
config_files=$(find "$dir_path" -type f -name "*.conf" | wc -l)
text_files=$(find "$dir_path" -type f -exec file {} \; | grep "text" | wc -l)
executable_files=$(find "$dir_path" -type f -executable | wc -l)
log_files=$(find "$dir_path" -type f -name "*.log" | wc -l)
archive_files=$(find "$dir_path" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) | wc -l)
symbolic_links=$(find "$dir_path" -type l | wc -l)

# Top 10 files with the maximum size
top_files=$(find "$dir_path" -type f -exec du -h {} + | sort -rh | head -n 11)

# Top 10 executable files with the maximum size and MD5 hash
top_executables=$(find "$dir_path" -type f -executable -exec du -h {} + | sort -rh | head -n 11)

# Calculate script execution time
end_time=$(date +%s.%N)
execution_time=$(echo "$end_time - $start_time" | bc)
top_executables_with_md5=$(find "$dir_path" -type f -executable -exec bash -c 'calculate_md5 "$0" && echo " $0"' {} \; | sort -nr | head -n 10)

# Print the results
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
echo "$top_files" | awk '{print NR, "-", $2, $1, $3}'
echo "TOP 10 executable files of maximum size arranged in descending order (path, size and MD5 hash)"
echo "$top_executables_with_md5" | awk '{print NR, "-", $2, $1, $3}'
echo "Script execution time (in seconds) = $execution_time"
