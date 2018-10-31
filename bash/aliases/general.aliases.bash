# List directory contents
alias sl=ls
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias ls="ls -1 ${colorflag}"
alias _="sudo"
alias c='clear'
alias k='clear'
alias cls='clear'
## grep color by default
alias grep="grep --color=auto"
alias edit="$EDITOR"

alias pager="$PAGER"

alias q='exit'

alias irc="$IRC_CLIENT"

# Language aliases
alias rb='ruby'
alias py='python'
alias ipy='ipython'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

alias md='mkdir -p'
alias rd='rmdir'


# ...................................................
# Project specific alias
# ...................................................

# Shortcuts
alias wk="cd ~/workspace"
alias gw="cd ~/workspace/Go"

# Desktop Programs
alias o="xdg-open"

# List all files colorized in long format

alias week='date +%V'
alias stopwatch='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias update='softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update'

alias pipudate='sudo pip freeze --local | sudo grep -v '^\-e' | cut -d = -f 1  | sudo xargs -n1 pip install -U'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Trim new lines and copy to clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
# Flush your dns cache
alias c="tr -d '\n' | xclip -selection clipboard"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias k="clear && printf '\e[3J'"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done


# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Reload the shell (i.e. invoke as a login shell)
alias reload="clear && exec $SHELL -l"

alias vi='vim'
alias dot='cd ~/.dotfiles/'
alias todo='vim ~/.dotfiles/todo/'

# alias setvw='source /usr/local/bin/virtualenvwrapper.sh'
alias pysrv='python -m SimpleHTTPServer 9000'
alias psrv='php -S localhost:8000'

alias e='emacs'
alias v='vim'

alias srvr='python -m SimpleHTTPServer 9000'

# Unix octal permision table, just a reminder.
# if you intend to mix your own, just be careful
# of who can write and execute file
   # rwx 7
   # rw- 6
   # r-x 5
   # r-- 4
   # -wx 3
   # -w- 2
   # --x 1
   # --- 0
# Change ownership and permission of the current directory recusively
alias myfiles="chown -R  `whoami` ./ && chmod -R 700 ./"

#ghost files, sudo you will need sudo to reset permission 
alias ghosf="chmod -R 000"

# change files or directory permission mode to to all read and ececute
# permission good for scripts
alias xxxf="chmod -R 755"

# change files or directory permission mode to all read 
alias rrrf="chmod -R 744"

# change files or directory permission mode to to all read and
# also allowing the file ower group to write
alias rwrf="chmod -R 764"
# Display whatever file is regular file or folder


# From http://apple.stackexchange.com/questions/110343/copy-last-command-in-terminal
alias copyLastCmd='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | xclip -selection clipboard'

## list scripts portion of package json file
alias jqs="jq .scripts package.json"

