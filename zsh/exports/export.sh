export GOPATH=$HOME/workspace/Go
export GOROOT=/usr/local/opt/go/libexec

export PATH="$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cask/bin:/usr/local/MacGPG2/bin:/usr/local/share/npm/bin:/opt/local/bin:/usr/local/go/bin:$HOME/workspace/Go/bin:/usr/local/opt/go/libexec/bin:/usr/local/sbin:$HOME/miniconda3/bin:./"

export GREP_OPTIONS="--color=auto"
export CLICOLOR=1
export TERM=xterm-256color
export BYOBU_PREFIX="/usr/local"
export EDITOR="vim"
export VISUAL="vim"
export VIMCONFIG="$HOME/.vim"
export VIMDATA="$HOME/.vim"

export PROJECT_HOME="$HOME/Project"
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTENV="$HOME/.virtualenvs"
export PYTHONSTARTUP="$HOME/.dotfiles/config/pystartup"

export NODE_REPL_HISTORY_FILE="~/.node_history";
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL="ignoreboth";
export LESS_TERMCAP_md="${yellow}";
export MANPAGER="less -X";
export GREP_COLOR='1;33'
export JSLINTER="eslint"
export LINTFIX="true"
export HISTCONTROL=${HISTCONTROL:-ignorespace:erasedups} # erase duplicates; alternative option: export HISTCONTROL=ignoredups
export AUTOFEATURE=${AUTOFEATURE:-true autotest}         # Cucumber / Autotest integration

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# prevent ranger from loading default config
export RANGER_LOAD_DEFAULT_RC="FALSE"

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="task"

