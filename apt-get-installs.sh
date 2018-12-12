sudo yes | sudo apt install activemq

sudo yes | sudo apt install libyaml

sudo yes | sudo apt install sqlite

sudo yes | sudo apt install freetype

sudo yes | sudo apt install fontconfig

sudo yes | sudo apt install gettext

sudo yes | sudo apt install libffi

sudo yes | sudo apt install glib

sudo yes | sudo apt install gobject-introspection

sudo yes | sudo apt install automake

sudo yes | sudo apt install xz

sudo yes | sudo apt install python

sudo yes | sudo apt install python-dev

sudo yes | sudo apt install python3

sudo yes | sudo apt install python3-dev

sudo yes | sudo apt install awscli

sudo yes | sudo apt install bdw-gc

sudo yes | sudo apt install boost

sudo yes | sudo apt install gmp

sudo yes | sudo apt install isl

sudo yes | sudo apt install cloog

sudo yes | sudo apt install cmake

sudo yes | sudo apt install cppunit

sudo yes | sudo apt install cscope

sudo yes | sudo apt install dialog

sudo yes | sudo apt install direnv

sudo yes | sudo apt install libgpg-error

sudo yes | sudo apt install libassuan

sudo yes | sudo apt install libgcrypt

sudo yes | sudo apt install libksba

sudo yes | sudo apt install pth

sudo yes | sudo apt install dirmngr

sudo yes | sudo apt install exercism

sudo yes | sudo apt install fasd

sudo yes | sudo apt install flow

sudo yes | sudo apt install fortune

sudo yes | sudo apt install fzf

sudo yes | sudo apt install mpfr

sudo yes | sudo apt install libmpc

sudo yes | sudo apt install gcc

sudo yes | sudo apt install jpeg

sudo yes | sudo apt install libtiff

sudo yes | sudo apt install git

sudo yes | sudo apt install icu4c

sudo yes | sudo apt install harfbuzz

sudo yes | sudo apt install pango

sudo yes | sudo apt install shared-mime-info

sudo yes | sudo apt install lua@5.1

sudo yes | sudo apt install lua

sudo yes | sudo apt install gmp@4

sudo yes | sudo apt install gnu-getopt

sudo yes | sudo apt install gnu-typist

sudo yes | sudo apt install nettle

sudo yes | sudo apt install gnutls

sudo yes | sudo apt install libusb

sudo yes | sudo apt install pinentry

sudo yes | sudo apt install gnupg, link: false

sudo yes | sudo apt install gnuplot

sudo yes | sudo apt install go

sudo yes | sudo apt install gpg-agent

sudo yes | sudo apt install gradle

sudo yes | sudo apt install libtool

sudo yes | sudo apt install graphviz

sudo yes | sudo apt install grc

sudo yes | sudo apt install haskell-stack

sudo yes | sudo apt install hh

sudo yes | sudo apt install highlight

sudo yes | sudo apt install htop

sudo yes | sudo apt install httpie

sudo yes | sudo apt install hub

sudo yes | sudo apt install iftop

sudo yes | sudo apt install isl@0.11

sudo yes | sudo apt install isl@0.12

sudo yes | sudo apt install jemalloc

sudo yes | sudo apt install oniguruma

sudo yes | sudo apt install jq

sudo yes | sudo apt install node

sudo yes | sudo apt install jsdoc3

sudo yes | sudo apt install leafnode

sudo yes | sudo apt install mpfr@2

sudo yes | sudo apt install links

sudo yes | sudo apt install luajit

sudo yes | sudo apt install maven

sudo yes | sudo apt install mhash

sudo yes | sudo apt install mcrypt

sudo yes | sudo apt install mercurial

sudo yes | sudo apt install s-lang

sudo yes | sudo apt install midnight-commander

sudo yes | sudo apt install mongodb

sudo yes | sudo apt install mycli

sudo yes | sudo apt install mysql, restart_service: true

sudo yes | sudo apt install ncurses

sudo yes | sudo apt install nano

sudo yes | sudo apt install ngrep

sudo yes | sudo apt install nmap

sudo yes | sudo apt install numpy, link: false

sudo yes | sudo apt install openssh

sudo yes | sudo apt install openssl@1.1

sudo yes | sudo apt install tree

sudo yes | sudo apt install pass

sudo yes | sudo apt install pcre2

sudo yes | sudo apt install perl

sudo yes | sudo apt install pgcli

sudo yes | sudo apt install ponysay

sudo yes | sudo apt install postgresql, restart_service: true

sudo yes | sudo apt install postgresql@9.4

sudo yes | sudo apt install pwgen

sudo yes | sudo apt install r

sudo yes | sudo apt install ranger

sudo yes | sudo apt install reattach-to-user-namespace

sudo yes | sudo apt install rlwrap

sudo yes | sudo apt install sbcl

sudo yes | sudo apt install sox

sudo yes | sudo apt install ssh-copy-id

sudo yes | sudo apt install swift

sudo yes | sudo apt install task

sudo yes | sudo apt install tcptraceroute

sudo yes | sudo apt install the_silver_searcher

sudo yes | sudo apt install thefuck

sudo yes | sudo apt install tig

sudo yes | sudo apt install tmux

sudo yes | sudo apt install typespeed

sudo yes | sudo apt install unar

sudo yes | sudo apt install unixodbc

sudo yes | sudo apt install utf8proc

sudo yes | sudo apt install watch

sudo yes | sudo apt install watchman

sudo yes | sudo apt install wget

sudo yes | sudo apt install mericurial
# Get the compile-dependencies of vim


sudo yes | sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

sudo apt remove vim vim-runtime gvim
sudo apt remove vim-tiny vim-common vim-gui-common vim-nox

cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
  --enable-multibyte \
  --enable-rubyinterp=yes \
  --enable-pythoninterp=yes \
  --with-python-config-dir=/usr/lib/python2.7/config \ # pay attention here check directory correct
  --enable-python3interp=yes \
  --with-python3-config-dir=/usr/lib/python3.5/config \
  --enable-perlinterp=yes \
  --enable-luainterp=yes \
  --enable-gui=gtk2 \
  --enable-gui=gnome2 \
  --enable-cscope \
  --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

# If you haven't got mercurial, get it

