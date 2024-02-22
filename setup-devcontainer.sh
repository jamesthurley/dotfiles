#!/usr/bin/env bash

# Install Autojump for Zsh
sudo apt update
sudo apt install autojump -y

# Fonts should be installed in Windows for WSL
# sudo apt install fontconfig -y
# ./install-nerd-fonts.sh

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

./install-zsh.sh
./link-dotfiles.sh

# We now symlink a custom starship.toml.
#starship preset gruvbox-rainbow > ~/.config/starship.toml
