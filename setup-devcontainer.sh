#!/usr/bin/env bash

# Install Autojump for Zsh
sudo apt update
sudo apt install autojump -y

./install-nerd-fonts.sh

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

./install-zsh.sh
./link-dotfiles.sh
