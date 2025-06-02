
# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install nerd fonts.
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Install tools.
brew install autojump
brew install starship
brew install iterm2
brew install jq
brew install --cask ghostty
brew install git-lfs

# Install apps.
brew install dropbox
brew install slack
brew install visual-studio-code
brew install whatsapp
brew install zoom
brew install orbstack
brew install qmk-toolbox
brew install 1password-cli

brew install --cask dotnet-sdk
brew install azure-cli

# Remove outdated versions from the cellar.
brew cleanup

# Install Zsh and link dotfiles.
./install-zsh.sh
./link-dotfiles.sh

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install cargo-insta
cargo install cargo-modules
cargo install cargo-public-api
cargo install cargo-typify
cargo install cargo-component

brew install cargo-binstall
cargo binstall cargo-nextest --secure

brew install just


# System settings

## Arc/Chrome should use installed NextDNS profile, not built-in DNS client.
defaults write company.thebrowser.Browser BuiltInDnsClientEnabled -bool false
defaults write com.google.Chrome BuiltInDnsClientEnabled -bool false

# Set up more useful home/end key bindings.
mkdir -p ~/Library/KeyBindings
cp ./mac/DefaultKeyBinding.dict ~/Library/KeyBindings/DefaultKeyBinding.dict
