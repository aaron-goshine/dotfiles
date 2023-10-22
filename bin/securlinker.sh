#! /bin/bash
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
symlinker
