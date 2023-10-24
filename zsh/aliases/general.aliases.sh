#! /bin/bash
# Author: Aaron
# Script: Your Script Name
# Date: (Today's Date)
# Description: (Brief description of the script)

# Navigation
alias wk="cd ~/workspace"
alias dot="cd '$DOT'"
alias dots="cd '$DOTS'"

# Git Operations
alias s="git status"
alias ga="git add --all && git commit --amend --no-edit && git push -f"
alias cm="git commit"
alias p="git push"
alias gitgone="git add . && cm --no-edit --amend && p -f"

# AWS
alias awsacc="grep -Eo '[[:digit:]]{12}' ~/.aws/config | sort | uniq"

# IP Operations
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | awk '/inet6? /{print $2}'"

# Maintenance
alias update="softwareupdate -i -a; brew update; brew upgrade; brew cleanup"
alias pipupdate="pip list --outdated --format=freeze | cut -d = -f 1 | xargs -n1 pip install -U"
alias cleanup="find . -type f -name '*.DS_Store' -delete"
alias reload="clear &&exec env -i zsh &&  reset; source $HOME/.zshrc"
alias k="clear &&exec env -i zsh &&  reset; source $HOME/.zshrc"


# Quick Views and Edits
alias vi='vim'
alias v='vim'
alias o='open'
alias ql='qlmanage -p 2>/dev/null'

# Development Tools
alias jqs="jq .scripts package.json"
alias nf="npm init fastify -- --integrate && npm install"

# System Utilities
alias flush="dscacheutil -flushcache"
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

# Other
alias lmk="say 'Process complete.'"
alias chess="gnuchess -g"
