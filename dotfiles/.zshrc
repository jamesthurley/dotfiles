# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Disables Insecure completion error. No harm because https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390589452
ZSH_DISABLE_COMPFIX=true

# Set name of the theme to load.
ZSH_THEME="avit"

# Plugins
# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
export MACHINE

# Source aliases
# For a full list of active aliases, run `alias`.
if [[ "$MACHINE" == "Linux" ]];then
  source "$HOME/dotfiles/env/aliases-shared.sh"
  source "$HOME/dotfiles/env/aliases-linux.sh"
  source "$HOME/dotfiles/env/exports.sh"
  source "$HOME/dotfiles/env/functions.sh"
elif [[ "$MACHINE" == "Mac" ]]; then
  source "$HOME/dotfiles/env/aliases-shared.sh"
  source "$HOME/dotfiles/env/aliases-mac.sh"
  source "$HOME/dotfiles/env/exports.sh"
  source "$HOME/dotfiles/env/functions.sh"

  # Fix Homebrew path (required for M1 mac and above)
  export PATH="/opt/homebrew/bin:$PATH"
fi

export EDITOR="code --wait"

eval "$(starship init zsh)"

eval "$(atuin init zsh)"
