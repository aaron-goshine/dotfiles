sudo apt install activemq

sudo apt install libyaml

sudo apt install readline

sudo apt install sqlite

sudo apt install ansible

sudo apt install aspcud

sudo apt install freetype

sudo apt install fontconfig

sudo apt install gettext

sudo apt install libffi

sudo apt install glib

sudo apt install cairo

sudo apt install pkg-config

sudo apt install gobject-introspection

sudo apt install autoconf

sudo apt install automake

sudo apt install xz

sudo apt install python

sudo apt install awscli

sudo apt install bats

sudo apt install bdw-gc

sudo apt install boost

sudo apt install ghc

sudo apt install cabal-install

sudo apt install cask

sudo apt install gmp

sudo apt install isl

sudo apt install cloog

sudo apt install cmake

sudo apt install cppunit

sudo apt install cscope

sudo apt install dialog

sudo apt install direnv

sudo apt install libgpg-error

sudo apt install libassuan

sudo apt install libgcrypt

sudo apt install libksba

sudo apt install pth

sudo apt install dirmngr

sudo apt install exercism

sudo apt install fasd

sudo apt install flow

sudo apt install fortune

sudo apt install fzf

sudo apt install mpfr

sudo apt install libmpc

sudo apt install gcc

sudo apt install jpeg

sudo apt install libtiff

sudo apt install git

sudo apt install icu4c

sudo apt install harfbuzz

sudo apt install pango

sudo apt install shared-mime-info

sudo apt install lua@5.1

sudo apt install lua

sudo apt install git-annex

sudo apt install gmp@4

sudo apt install gnu-getopt

sudo apt install gnu-typist

sudo apt install nettle

sudo apt install gnutls

sudo apt install libusb

sudo apt install pinentry

sudo apt install gnupg, link: false

sudo apt install gnuplot

sudo apt install go

sudo apt install gpg-agent

sudo apt install gradle

sudo apt install libtool

sudo apt install graphviz

sudo apt install grc

sudo apt install haskell-stack

sudo apt install hh

sudo apt install highlight

sudo apt install htop

sudo apt install httpie

sudo apt install hub

sudo apt install iftop

sudo apt install isl@0.11

sudo apt install isl@0.12

sudo apt install ispell

sudo apt install jemalloc

sudo apt install oniguruma

sudo apt install jq

sudo apt install jrnl

sudo apt install node

sudo apt install jsdoc3

sudo apt install klavaro

sudo apt install leafnode

sudo apt install leiningen

sudo apt install libcroco

sudo apt install libevent

sudo apt install libidn2

sudo apt install mpfr@2

sudo apt install libmpc@0.8

sudo apt install libnet

sudo apt install librsvg

sudo apt install libssh2

sudo apt install libtermkey

sudo apt install libupnp

sudo apt install libusb-compat

sudo apt install libvterm

sudo apt install libxml2

sudo apt install links

sudo apt install luajit

sudo apt install lynx

sudo apt install macvim

sudo apt install mad

sudo apt install maven

sudo apt install mhash

sudo apt install mcrypt

sudo apt install mercurial

sudo apt install s-lang

sudo apt install midnight-commander

sudo apt install mongodb

sudo apt install mycli

sudo apt install mysql, restart_service: true

sudo apt install ncurses

sudo apt install nano

sudo apt install unibilium

sudo apt install neovim

sudo apt install ngrep

sudo apt install nmap

sudo apt install numpy, link: false

sudo apt install nvm

sudo apt install opam

sudo apt install openssh

sudo apt install openssl@1.1

sudo apt install tree

sudo apt install pass

sudo apt install pcre2

sudo apt install perl

sudo apt install pgcli

sudo apt install ponysay

sudo apt install postgresql, restart_service: true

sudo apt install postgresql@9.4

sudo apt install pwgen

sudo apt install r

sudo apt install ranger

sudo apt install reattach-to-user-namespace

sudo apt install rlwrap

sudo apt install sbcl

sudo apt install sox

sudo apt install ssh-copy-id

sudo apt install swift

sudo apt install task

sudo apt install tcptraceroute

sudo apt install the_silver_searcher

sudo apt install thefuck

sudo apt install tig

sudo apt install tmux

sudo apt install typespeed

sudo apt install unar

sudo apt install unixodbc

sudo apt install utf8proc

sudo apt install vifm

sudo apt install vim

sudo apt install vit

sudo apt install w3m

sudo apt install watch

sudo apt install watchman

sudo apt install wget

sudo apt install z

sudo apt install composer


sudo apt install mericurial
# Get the compile-dependencies of vim
sudo apt-get build-dep vim
# If you haven't got mercurial, get it
sudo apt-get install mercurial
# Get the source
hg clone https://vim.googlecode.com/hg/ vim_source
# Compile it
cd vim_source
./configure \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-cscope \
    --enable-gui=auto \
    --enable-gtk2-check \
    --enable-gnome-check \
    --with-features=huge \
    --with-x \
    --with-compiledby="Your Name <youremail@domain.com>" \
    --with-python-config-dir=/usr/lib/python2.7/config
make && sudo make install
