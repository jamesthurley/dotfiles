#!/usr/bin/env bash

# Install Autojump for Zsh
sudo apt update
sudo apt install autojump -y

# Install FiraCode for Starship
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git    # warning: takes a while
cd nerd-fonts/
./install.sh FiraCode

# Install Starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

./install-zsh.sh
./link-dotfiles.sh
