#!/bin/bash

# Get the directory of the currently executing script
script_dir=$(dirname "$0")

# Navigate to the root directory of your project structure
#root_dir=$(realpath "$script_dir/../..")

root_dir=script_dir
# Check if 'aliases' file exists in the config directory
if [[ -f "$root_dir/config/aliases" ]]; then
    # Ask the user whether to add the source command to ~/.profile
    read -p "The 'config/aliases' file exists. Do you want to add it to ~/.profile? (y/n): " user_input

    if [[ $user_input == "y" || $user_input == "Y" ]]; then
        # Add the source command to ~/.profile
        echo "source $root_dir/config/aliases" >> ~/.profile
        echo "Added 'source $root_dir/config/aliases' to ~/.profile"
    else
        echo "Skipped adding 'aliases' to ~/.profile."
    fi
else
    echo "'aliases' file does not exist in the config directory."
fi
