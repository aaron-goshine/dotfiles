#!/bin/bash

# Mission function to display purpose
mission() {
  echo "Mission: This script installs and sets up your dotfiles and associated packages."
}

# Function to print success message
success() {
  echo "Success: $1"
}

# Function to print rules with messages
print_ultra_rule() {
  echo "========== $1 =========="
}

# Mission statement
mission

# Variables
DOTDIR="$HOME/.dotfiles"

print_ultra_rule 'Ultra dotfiles installer'

# Generic symlink function

function slimlinker() {
  local BNAME="$HOME/.$(basename $1)"
  # Backup existing file if it exists
  if [ -f "$BNAME" ] || [ -h "$BNAME" ]; then
    mv $BNAME ${BNAME}.backup
  fi
  ln -sf $1 $BNAME
}

slimlinker "$DOTDIR/zsh/.zshrc"

# Update Git submodules
print_ultra_rule 'Updating git sub modules'
git submodule update
git submodule sync
success "Submodules updated"

# Create symlinks for dot directories
print_ultra_rule 'Creating symlinks for dot directories'
slimlinker "$DOTDIR/bin/"
slimlinker "$DOTDIR/vim/"
slimlinker "$DOTDIR/ipython/"
rsync -a -v --ignore-existing "$DOTDIR/git/gitconfig" ~/.gitconfig

# Symlink config files
for FILE in $(ls "$DOTDIR/config/"); do
  slimlinker "$DOTDIR/config/$FILE"
done

# Install Homebrew packages
print_ultra_rule 'Installing homebrew packages'
xcode-select --install
brew update
brew tap Homebrew/bundle
brew bundle dump 2>/dev/null
brew bundle 2>/dev/null
success "Homebrew packages installed"

# Install global npm packages
print_ultra_rule 'Installing global npm packages'
npm install -g babel-eslint eslint eslint-plugin-react jshint mocha nodeunit pm2 stylelint stylelint-config-recommended stylelint-config-styled-components stylelint-processor-styled-components tern
success "NPM packages installed"

# Install ruby gems
print_ultra_rule 'Installing ruby gems'
gem install neovim
success "Ruby gems installed"

# Final message and cleanup
print_ultra_rule 'Enjoy'
unset DOTDIR
sleep 3
clear
