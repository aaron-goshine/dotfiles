" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('gui_macvim')
  " Custom Source Code font for Powerline
  " From: https://github.com/Lokaltog/powerline-fonts
 set guifont=Source\ Code\ Pro\ for\ Powerline:h13
  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif
endif

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
