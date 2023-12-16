#!/bin/bash

if [ "$#" -ne 1 ]; then 
    echo "Usage: $0 <text_parameter>"
    exit 1
fi

source functions.sh

check_and_display "$1"