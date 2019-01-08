#!/bin/bash
source $HOME/.dotfiles/bash/libs/functions.bash

#==========================================================
t1=$(get_ultra_rule_str ' Ultra dotfiles installer ' 0 0)
echo "$t1"

DOTDIR="$HOME/.dotfiles"
TREW=1
BAD_FILE=85

#==========================================================
t1=$(get_ultra_rule_str ' Updating git sub modules ' 0 0)
echo "$t1"
git submodule update 
git submodule sync
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Creating symlinks for dot directories ' 0 0)
echo "$t1"
function slimlinker() {
  local BNAME="$HOME/.$(basename $1)"
  rm -rf $BNAME 2> /dev/null
  ln -s $1 $BNAME
}

slimlinker $DOTDIR/bin/
slimlinker $DOTDIR/vim/
slimlinker $DOTDIR/ipython/

# instead of symlinking gitconfig, copy safely 
rsync -a -v --ignore-existing  $DOTDIR/git/gitconfig ~/.gitconfig

for FILE in $(ls $DOTDIR/xrc/); 
do
  slimlinker $DOTDIR/xrc/$FILE
done;

# If you use icloud drive to sync various files across multiple systems
# By uncomment this block and running this script you can create symlinks
# to those files
# rm -rf ~/.task ~/.timewarrior ~/.gnupg ~/.password-store ~/bin 2> /dev/null
# ln -s $DOTDIR/bin/ ~/bin
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/timewarrior/ ~/.timewarrior
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
# ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store

success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing homebrew packages ' 0 0)
echo "$t1"
cd $DOTDIR
xcode-select --install
brew update
brew tap Homebrew/bundle
brew bundle dump 2> /dev/null
brew bundle 2> /dev/null
cd -
success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing global npm packages ' 0 0)

npm install -g babel-eslint
npm install -g eslint
npm install -g eslint-plugin-react
npm install -g jshint
npm install -g mocha 
npm install -g nodeunit 
npm install -g pm2 
npm install -g stylelint
npm install -g stylelint-config-recommended
npm install -g stylelint-config-styled-components
npm install -g stylelint-processor-styled-components
npm install -g tern


success "done"

#==========================================================
t1=$(get_ultra_rule_str ' Installing ruby gems ' 0 0)
gem install neovim 
success "done"

#==========================================================
t1=$(get_ultra_rule_str 'Installing vim config symlinks' 0 0)
echo "$t1"
# copy config directory to home folder

mkdir ~/.config 2> /dev/null

rsync -a -v --ignore-existing  ~/.dotfiles/config/ ~/.config/

ln -fs $DOTDIR/vim/vimrc.vim ~/.vimrc
ln -fs $DOTDIR/vim/vimrc.vim  ~/.config/nvim/init.vim

success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Installing vim plugins' 0 0)
echo "$t1"

git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac

if test $(which mvim)
then
  mvim -v +PackUpdate  +qall
else
  if test $(which vim)
  then
    vim +PackUpdate +qall
  else
    fail 'mvim or vim not found in path.'
  fi
fi

cd $DOTDIR/vim/
rm -rf .tmp .backup .temp .undo
mkdir  .tmp .backup .temp .undo
cd $DOTDIR/vim/pack/minpac/start/YouCompleteMe/
git submodule update 
npm install --production 
git submodule sync
python install.py --all
cd $DOTDIR/vim/pack/minpac/start/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production

cd $DOTDIR/vim/bundle/tern_for_vim/
npm install --production 

success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Enjoy' 0 0 '∿')
echo "$t1"
OPTIONS="KEEP_BSH_PROFILE REPLACE"
select opt in $OPTIONS; do
  if [ "$REPLY" = "1" ]; then
    t1=$(get_ultra_rule_str ' Keeping bash_profile but injecting source ' 0 0)
    echo "$t1"
    cat $DOTDIR/bash/bash_profile >> ~/.bash_profile
  elif [ "$REPLY" = "2" ]; then
    t1=$(get_ultra_rule_str ' replace bash_profile ' 0 0)
    echo "$t1"
    slimlinker $DOTDIR/bash/bash_profile
  fi
exit
done
unset DOTDIR
unset TREW
unset BAD_FILE
sleep 3
clear
