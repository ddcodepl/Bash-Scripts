#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Update Homebrew
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

# Install the specified tools
tools=(
  "pyenv"
  "jq"
  "htop"
  "tty-clock"
  "task"
  "ncdu"
  "tldr"
  "neofetch"
  "speedtest-cli"
  "dnsmasq"
  "you-get"
  "chromedriver"
  "nvm"
  "screen"
  "wget"
  "docker-compose"
  "geckodriver"
  "mas"
  "curl"
  "ctop"
  "geoip"
  "ios-deploy"
  "unzip"
  "m-cli"
  "qrencode"
  "ios-sim"
  "ffmpeg"
  "webp"
  "imagemagick"
  "nikto"
  "x264"
  "x265"
  "xpdf"
  "fortune"
  "aircrack-ng"
  "terraform"
  "tree"
  "cask"
  "midnight-commander"
)

for tool in "${tools[@]}"; do
    echo "Installing $tool..."
    brew install $tool
done