# simple history
function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}


# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}


# cd into whatever is the forefront Finder window.
function cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# cd into and show content of dir.
function cdl() {  # show content of current directory
  cd "$@" && ls -a1
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
  }


# Copy w/ progress
function cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}



# get gzipped size
function gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# whois a domain or a URL
function whois() {
  local domain=`echo "$1" | awk -F/ '{print $3}'` # get domain from URL
  if [ -z $domain ] ; then
    domain=$1
  fi
  echo "Getting whois record for: $domain …"

  # avoid recursion
  # this is the best whois server
  # strip extra fluff
  /usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
  }

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
if [ -f "$1" ] ; then
  local filename=$(basename "$1")
  local foldername="${filename%%.*}"
  local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
  local didfolderexist=false
  if [ -d "$foldername" ]; then
    didfolderexist=true
    read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
      return
    fi
  fi
  mkdir -p "$foldername" && cd "$foldername"
  case $1 in
    *.tar.bz2) tar xjf "$fullpath" ;;
    *.tar.gz) tar xzf "$fullpath" ;;
    *.tar.xz) tar Jxvf "$fullpath" ;;
    *.tar.Z) tar xzf "$fullpath" ;;
    *.tar) tar xf "$fullpath" ;;
    *.taz) tar xzf "$fullpath" ;;
    *.tb2) tar xjf "$fullpath" ;;
    *.tbz) tar xjf "$fullpath" ;;
    *.tbz2) tar xjf "$fullpath" ;;
    *.tgz) tar xzf "$fullpath" ;;
    *.txz) tar Jxvf "$fullpath" ;;
    *.zip) unzip "$fullpath" ;;
    *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
  esac
else
  echo "'$1' is not a valid file"
fi
}

# who is using the laptop's iSight camera?
function camerausedby() {
  echo "Checking to see who is using the iSight camera… 📷"
  usedby=$(lsof | grep -w "AppleCamera\|USBVDC\|iSight" | awk '{printf $2"\n"}' | xargs ps)
  echo -e "Recent camera uses:\n$usedby"
}


# animated gifs from any video
# from alex sexton   gist.github.com/SlexAxton/4989674
function gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
function webmify(){
  ffmpeg -i $1 -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y $2 $1.webm
}

function strip_diff_leading_symbols(){
  color_code_regex="(\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K])"
    # simplify the unified patch diff header
    sed -E "s/^($color_code_regex)diff --git .*$//g" | \
    sed -E "s/^($color_code_regex)index .*$/\n\1$(rule)/g" | \
    sed -E "s/^($color_code_regex)\+\+\+(.*)$/\1+++\5\n\1$(rule)\x1B\[m/g" |\

      # actually strips the leading symbols
    sed -E "s/^($color_code_regex)[\+\-]/\1 /g"
}

## Print a horizontal rule
function rule () {
  printf "%$(tput cols)s\n"|tr " " "~"
}

function change_shell() {
  chsh -s $(which $1)
}

function get_ultra_rule_str() {
  local ULTRASTRING=${1:-''}
  local MINWIDTH=${2:-60}
  local MARGIN_R=${3:-40}
  local RULE_CHAR=${4:-'-'}

  local ULSTRMAX=$(expr $(tput cols) - $MARGIN_R)

  if [  "$(tput cols)" -lt "$MINWIDTH"  ]
  then
    echo "$(printf "%*s\n" $ULSTRMAX | tr " " $RULE_CHAR)" && return;
  fi

  local ULTRAWIDTH=$(expr $ULSTRMAX - ${#ULTRASTRING})
  local PADD_L=$(expr $ULTRAWIDTH / 2)
  local PADD_R=$PADD_L

  if [  $(expr $ULTRAWIDTH  % 2) -eq 1 ]
  then
    PADD_R=$(expr $PADD_L + 1)
  fi

  local PADDCHARS_L=$(printf "%*s\n" $PADD_L | tr " " $RULE_CHAR)
  local PADDCHARS_R=$(printf "%*s\n" $PADD_R | tr " " $RULE_CHAR)
  echo "$PADDCHARS_L$1$PADDCHARS_R"
}

function message () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

function success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

function fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

function cleanup()
{
  /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/\
LaunchServices.framework/Versions/A/Support/\
lsregister -kill -r -domain local -domain user
  rm -rf "$HOME/$1"
  return 0   # Success.
} 

function ultra_title() {
  rule
  get_ultra_rule_str $1 0 0 '~'
  rule
}

# remove all docker stuff
function docx() {
  echo "Removing all docker images and containers"
  rule
  docker image rm -f `docker images -q | xargs`
  docker rm -f `docker container ls -a -q | xargs`
  docker rm -f $(docker ps -a -q | xargs)
  rule
  echo "done!"
}

