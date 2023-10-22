#! /bin/bash
# Author: Aaron
# Script: Your Script Name
# Date: (Today's Date)
# Description: (Brief description of the script)

# Symlink function for $DOTSECURE
export DOTSECURE="Library/Mobile Documents/com~apple~CloudDocs/dotsecure"
function symlinker() {
  local DOTSECURE_DIR="$HOME/$DOTSECURE"
  
  if [ -d "$DOTSECURE_DIR" ]; then
    for FILE in $(ls -A "$DOTSECURE_DIR"); do
      local DEST="$HOME/$FILE"
      local SOURCE="$DOTSECURE_DIR/$FILE"

      # Backup existing file if it exists
      if [ -f "$DEST" ] || [ -h "$DEST" ]; then
        mv "$DEST" "${DEST}.backup"
      fi

      ln -sf "$SOURCE" "$DEST"
      echo "Symlinked $FILE"
    done
  else
    echo "Directory $DOTSECURE_DIR does not exist."
  fi
}
mkdir ~/.vimplugin
npm install -g typescript
brew install lua
brew install luarocks
pip3 install python-language-server

ln -s -f ~/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/git/gitconfig ~/.gitconfig
ln -s -f ~/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/vim ~/.vim
ln -s -f ~/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/zsh/zshrc ~/.zshrc
ln -s -f ~/Library/Mobile\ Documents/com~apple~CloudDocs/dotfiles/bin ~/bin

symlinker
