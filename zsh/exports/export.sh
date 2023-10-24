#! /bin/bash
# Author: Aaron
# Script: Your Script Name
# Date: (Today's Date)
# Description: (Brief description of the script)

export DOTS="$HOME/Library/Mobile Documents/com~apple~CloudDocs/dotsecure"
export ZSH="$DOT/zsh/oh-my-zsh/"
export ZSH_THEME="af-magic"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export EDITOR='vim'
export HH_CONFIG=hicolor
export GOPATH="$HOME/workspace/Go"
export GOROOT="/usr/local/opt/go/libexec"

export PATH="$PATH:$HOME/.local/bin:/usr/local/bin/:$HOME/bin:$HOME/.cask/bin:/usr/local/MacGPG2/bin:/usr/local/share/npm/bin:/opt/local/bin:/usr/local/go/bin:$HOME/workspace/Go/bin:/usr/local/opt/go/libexec/bin:/usr/local/sbin:$HOME/miniconda3/bin:./"

# Terminal Appearance
export GREP_OPTIONS="--color=auto"
export CLICOLOR=1
export TERM=xterm-256color
export LSCOLORS='Gxfxcxdxdxegedabagacad'
export GREP_COLOR='1;33'

# Editor and File Viewers
export EDITOR="vim"
export VISUAL="vim"
export VIMCONFIG="$HOME/.vim"
export VIMDATA="$HOME/.vim"

# BYOBU and Paging
export BYOBU_PREFIX="/usr/local"
export MANPAGER="less -X"

# Python Environment:
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTENV="$HOME/.virtualenvs"
export PYTHONSTARTUP="$HOME/.config/pystartup"

# Node Environment
export NODE_REPL_HISTORY_FILE="~/.node_history"

# History Settings
export HISTSIZE="32768"
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL="ignoreboth:erasedups"

# Less Colors
export LESS_TERMCAP_md="${yellow}"

# Linting and Testing
export JSLINTER="eslint"
export LINTFIX="true"
export AUTOFEATURE=${AUTOFEATURE:-true autotest}

# Miscellaneous
export TODO="task"
export RANGER_LOAD_DEFAULT_RC="FALSE"
unset MAILCHECK
