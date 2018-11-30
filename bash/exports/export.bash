export GOPATH=$HOME/workspace/Go
export GOROOT=/usr/local/opt/go/libexec

export PATH="$PATH:~/.local/bin:~/bin:~/.cask/bin:/usr/local/MacGPG2/bin:/usr/local/lib/node_modules/karma/bin:/usr/local/share/npm/bin:/opt/local/bin:/usr/local/go/bin:/usr/local/opt/php70/bin:~/workspace/Go/bin:/usr/local/opt/go/libexec/bin:/usr/local/sbin:./"

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
export PYTHONSTARTUP="$HOME/.dotfiles/xrc/pystartup"

export NODE_REPL_HISTORY_FILE="~/.node_history";
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL="ignoreboth";
export LESS_TERMCAP_md="${yellow}";
export MANPAGER="less -X";
export JSLINTER="eslint"
export LINTFIX="true"

shopt -s histappend                                      # append to bash_history if Terminal.app quits
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

  export NVM_DIR="~/.nvm"
  # . "/usr/local/opt/nvm/nvm.sh"


# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

