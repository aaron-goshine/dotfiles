# List directory contents

# Language aliases
alias ipy='ipython'
alias md='mkdir -p'
alias rd='rmdir'


# ...................................................
# Project specific alias
# ...................................................

# Shortcuts
alias doc="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias wk="cd ~/workspace"
alias gw="cd ~/workspace/Go"
alias gb="cd ~/GITHUB"
alias s="git status"
alias ga="git add --all && git commit --amend --no-edit && git push -f"
alias cm="git commit"
alias p="git push"
alias ic="cd ~/Library/Mobile\ Documents"
alias gitgone=" git add . && cm --no-edit --amend && p -f"
alias awsacc="grep   -Eo \"[[:digit:]]{12}\" ~/.aws/config | sort | uniq"

# Desktop Programs
alias o="open"
alias week='date +%V'
alias stopwatch='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
alias chrome-debugger='open chrome://inspect/#devices'
alias update='softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update'
alias pipudate='sudo pip freeze --local | sudo grep -v '^\-e' | cut -d = -f 1  | sudo xargs -n1 pip install -U'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
  unset jscbin;

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias k="clear && printf '\e[3J'"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

alias showdot="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedot="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

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

# Make Grunt print stack traces by default
command -v grunt > /dev/null && alias grunt="grunt --stack"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Reload the shell (i.e. invoke as a login shell)
alias reload="clear && exec $SHELL -l"

alias vi='vim'
alias v='vim'
alias dot='cd ~/.dotfiles/'
alias todo='cd ~/DAILY/'

alias icloudedir='vim  ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
# alias setvw='source /usr/local/bin/virtualenvwrapper.sh'
alias pysrv='python3 -m http.server'
alias srvr='python3 -m http.server'
alias psrv='php -S localhost:8000'

# Unix octal permision table, just a reminder.
# if you intend to mix your own, just be careful
# of who can write and execute f:ile
   # rwx e:
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

# Get rid of those pesky .DS_Store files recursively
alias dsclean='find . -type f -name .DS_Store -delete'

# Track who is listening to your iTunes music
alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'

# Flush your dns cache
alias flush='dscacheutil -flushcache'

# Show/hide hidden files (for Mac OS X Mavericks)
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE"

# From http://apple.stackexchange.com/questions/110343/copy-last-command-in-terminal
alias copyLastCmd='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

# Use Finder's Quick Look on a file (^C or space to close)
alias ql='qlmanage -p 2>/dev/null'

### list scripts portion of package json file
alias jqs="jq .scripts package.json"

alias chess="gnuchess -g "


# Desktop Programs
alias preview="open -a '$PREVIEW'"
alias safari="open -a safari"
alias firefox="open -a firefox"
alias chrome="open -a google\ chrome"
alias chromium="open -a chromium"
alias dashcode="open -a dashcode"
alias f='open -a Finder '
alias fh='open -a Finder .'
alias textedit='open -a TextEdit'

if [ -s /usr/bin/firefox ] ; then
  unalias firefox
fi

# Get rid of those pesky .DS_Store files recursively
alias dsclean='find . -type f -name .DS_Store -delete'

# Track who is listening to your iTunes music
alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'

# Flush your dns cache
alias flush='dscacheutil -flushcache'

# Show/hide hidden files (for Mac OS X Mavericks)
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE"

# From http://apple.stackexchange.com/questions/110343/copy-last-command-in-terminal
alias copyLastCmd='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

# Use Finder's Quick Look on a file (^C or space to close)
alias ql='qlmanage -p 2>/dev/null'

# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

# Pin to the tail of long commands for an audible alert after long processes
## curl http://downloads.com/hugefile.zip; lmk
alias lmk="say 'Process complete.'"

alias nf="npm init fastify  -- --integrate && npm install "
