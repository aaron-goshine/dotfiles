#!/bin/bash
source $HOME/.dotfiles/bash/libs/functions.bash
# Get the latest versions from git, make sure you have git installed

# TODO: implement feature to update php global packages
# TODO: implement automation to up date PHP_CodeSniffer and
# git clone https://github.com/squizlabs/PHP_CodeSniffer.git phpcs
# git clone git://github.com/phpmd/phpmd.git
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
slimlinker $DOTDIR/config/ 
slimlinker $DOTDIR/tmux/
slimlinker $DOTDIR/vifm/
slimlinker $DOTDIR/vim/
slimlinker $DOTDIR/ipython/
slimlinker $DOTDIR/git/gitconfig

for FILE in $(ls $DOTDIR/xrc/); 
do
  slimlinker $DOTDIR/xrc/$FILE
done;

rm -rf ~/.task ~/.timewarrior ~/.gnupg ~/.password-store ~/bin 2> /dev/null
ln -s $DOTDIR/bin/ ~/bin
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/task/ ~/.task
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/timewarrior/ ~/.timewarrior
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.gnupg ~/.gnupg
ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs/roger/.password-store ~/.password-store

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

ln -fs $DOTDIR/vim ~/.config/nvim
ln -fs $DOTDIR/vim/vimrc.vim ~/.vimrc
ln -fs $DOTDIR/vim/vimrc.vim  ~/.config/nvim/init.vim

success "done"
#==========================================================
t1=$(get_ultra_rule_str 'Installing vim plugins' 0 0)
echo "$t1"

rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if test $(which mvim)
then
  mvim -v +PluginInstall +qall
  mvim -v +PluginUpdate +qall
else
  if test $(which vim)
  then
    vim +PluginInstall +qall
    vim +PluginUpdate +qall
  else
    fail 'mvim or vim not found in path.'
  fi
fi

cd $DOTDIR/vim/
rm -rf .tmp .backup .temp
mkdir .tmp .backup .temp
cd $DOTDIR/vim/bundle/YouCompleteMe/
git submodule update 
npm install
git submodule sync
python install.py --all
cd $DOTDIR/YouCompleteMe/third_party/ycmd/third_party/tern_runtime
npm install --production

cd $DOTDIR/vim/bundle/tern_for_vim/
npm install

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
