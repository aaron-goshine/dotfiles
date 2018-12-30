" =============================================================================
" Author: Aaron Goshine
" Description: The Vim Configuration of Superheros
" Version: 0.0.1
" Inheritance: This vimrc is base on (dot_vim) with serious weight loss
" =============================================================================

" All of the plugins are installed with Vundle from this file.
" Small custom functions.
source ~/.vim/functions.vim

source ~/.vim/packages.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

" Platform (Windows, Mac, etc.) configuration.
source ~/.vim/platforms.vim
" All of the Vim configuration.
source ~/.vim/config.vim
" New commands
source ~/.vim/commands.vim
" All hotkeys, not dependant on plugins, are mapped here.
source ~/.vim/mappings.vim
" Auto commands.
source ~/.vim/autocmds.vim
