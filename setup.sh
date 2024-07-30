#!/bin/bash

# Check if Homebrew is installed
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if ! command -v brew &>/dev/null; then
        echo "Homebrew is not installed. Installing..."
        sudo apt-get update && sudo apt-get install build-essential curl file git -y

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo "Homebrew is already installed."
    fi
else
    echo "This script is only for MacOS and Ubuntu"
    exit 1
fi

## Update Homebrew
brew update

# Install Zsh
if ! command -v zsh &>/dev/null; then
   echo "Zsh is not installed. Installing..."
   brew install zsh
   # Make zsh the default shell, requires user password
   sudo sh -c "echo $(which zsh) >> /etc/shells"
   chsh -s $(which zsh)
   zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
else
   echo "Zsh is already installed."
fi

# Initialize an empty array
declare -a tools

# Read the file line-by-line and add each line to the tools array
while read -r line; do
   tools+=("$line")
done < "./config/brew-scripts"

for tool in "${tools[@]}"; do
   echo "Installing $tool..."
   brew install $tool
done

# Add aliases source to the ~/.profile
# if [ -f "./scripts/_init/aliases.sh" ]; then
#     echo "Executing aliases.sh..."
#     ./aliases.sh
# else
#     echo "Didn't find aliases.sh"
# fi

# Execute tf-check.sh if exists else show info that it don't exists
if [ -f "./scripts/_init/tf-check.sh" ]; then
   echo "Executing tf-check.sh..."
   ./scripts/_init/tf-check.sh
else
   echo "Didn't find tf-check.sh..."
fi
