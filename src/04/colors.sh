#!/bin/bash

# Маппинг цветов
map_color_scheme() {
    case "$1" in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
        *) echo "default" ;;
    esac
}
