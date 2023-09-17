#!/bin/bash

# Get the current directory
current_dir=$(pwd)

# Check if 'aliases' file exists in the current directory
if [[ -f "$current_dir/aliases" ]]; then
  # Ask the user whether to add the source command to ~/.aliases
  read -p "The 'aliases' file exists. Do you want to add it to ~/.profile? (y/n): " user_input

  if [[ $user_input == "y" || $user_input == "Y" ]]; then
    # Add the source command to ~/.aliases
    echo "source $current_dir/aliases" >> ~/.profile
    echo "Added 'source $current_dir/profile' to ~/.profile"
  else
    echo "Skipped adding 'aliases' to ~/.profile."
  fi
else
  echo "'profile' file does not exist in the current directory."
fi
