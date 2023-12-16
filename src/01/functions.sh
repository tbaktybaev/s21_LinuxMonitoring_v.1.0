
check_and_display() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Invalid input: Parameter is a number."
    else
        echo "Parameter value: $1"
    fi
}