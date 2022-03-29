#!/usr/bin/env zsh

DOTFILES_DIR="$HOME/dotfiles"

function installHomebrew() {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew install git
}
installHomebrew

# symlink all dotfiles into ~/
if [[ ! -d "$DOTFILES_DIR" ]]; then
    git clone git@github.com:gsomoza/dotfiles.git $DOTFILES_DIR
fi
foreach piece (
    zshrc
    p10k.zsh
    vimrc
    tmux.conf
    gitignore
    gitconfig
) {
    [[ ! -L "$HOME/.$piece" ]] && ln -s $DOTFILES_DIR/$piece $HOME/.$piece 
}
[[ ! -L "$HOME/Brewfile" ]] && ln -s $DOTFILES_DIR/Brewfile $HOME/Brewfile

# Install from Brewfile
brew bundle install

# OSX settings
source $DOTFILES_DIR/osx.zsh