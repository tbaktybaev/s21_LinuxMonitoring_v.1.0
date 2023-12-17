check_parameter() {
    if [ "$#" -ne 1 ]; then 
        echo "Usage: $0 <text_parameter>"
        exit 1
    fi
}

check_and_display() {
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "Invalid input: Parameter is a number."
    else
        echo "Parameter value: $1"
    fi
}

