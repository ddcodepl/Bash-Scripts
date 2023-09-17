#!/bin/bash

# Function to check if 'thefuck' is installed
check_thefuck_installed() {
    if command -v thefuck > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

# Function to add the alias to ~/.profile
add_alias() {
    echo "eval \$(thefuck --alias)" >> ~/.profile
    echo "Alias added successfully."
}

if check_thefuck_installed; then
    # Ask for user confirmation
    read -p "Do you want to add 'eval \$(thefuck --alias)' to your ~/.profile? [y/N]: " confirm

    case $confirm in
        [yY][eE][sS]|[yY])
            add_alias
            ;;
        *)
            echo "Operation cancelled."
            ;;
    esac
else
    echo "'thefuck' is not installed. Please install it first."
fi