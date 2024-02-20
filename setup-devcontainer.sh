#!/usr/bin/env bash

sudo apt update
sudo apt install autojump -y

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
fc-cache -fv

curl -sS https://starship.rs/install.sh | sh -s -- -y

./install-zsh.sh
./link-dotfiles.sh
