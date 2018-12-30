#!/bin/bash
# export passwords to external file

prefix=${PASSWORD_STORE_DIR:-$HOME/.password-store}

for file in "$prefix"/*.gpg; do
  file="${file/$prefix//}"
  printf "%s\n" "Name: ${file%.*}" >> exported_passes
  pass "${file%.*}" >> exported_passes
  printf "\n\n" >> exported_passes
done
