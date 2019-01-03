
" ---------------
" Color
" ---------------
set background=dark
colorscheme jellybeans
" Force 256 color mode if available
hi! link cssAttr Constant
if $TERM =~ "-256color"
   set t_Co=256
endif

" -----------------------------
" File Locations
" -----------------------------
set backupdir=~/.vim/.backup " Double // causes backups to use full file path
set directory=~/.vim/.temp
" Persistent Undo

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" ---------------
" UI
" ---------------
set ruler          " Ruler on
set showtabline=2  " Tabs styles"
set number         " Line numbers on
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
set encoding=utf-8
set noshowmode     " Don't show the mode since Powerline shows it
set title          " Set the title of the window in the terminal to the file
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently as a wrapping guide.
endif
" Disable tooltips for hovering keywords in Vim
if exists('+ballooneval')
  " This doesn't seem to stop tooltips for Ruby files
  set noballooneval
  " 100 second delay seems to be the only way to disable the tooltips
  set balloondelay=100000
endif

" ---------------
" Behaviors #211212
" ---------------
syntax enable
set backup             " Turn on backups
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on Wild menu set hidden             " Change buffer - without saving
set history=1024       " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
set autowrite          " Writes on make/shell commands
set formatoptions=crql
set nostartofline      " Don't go to the start of the line after some commands
set scrolloff=3        " Keep three lines below the last line when scrolling
set gdefault           " this makes search/replace global by default
set switchbuf=useopen  " Switch to an existing buffer if one exists
set autochdir          " Switch vim to currnent working directory"
set timeout
set timeoutlen=750
set ttimeoutlen=250
set spell spelllang=en_gb
" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=indent,eol,start " Delete everything with backspace
set shiftwidth=2 " Tabs under smart indent
set shiftround
set cindent
set autoindent
set smarttab
set expandtab
set linebreak
set smartindent


" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,
  \rake-pipeline-*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
" Show invisible characters
set list

" Show trailing spaces as dots and carrots for extended lines.
" From Janus, http://git.io/PLbAlw

set listchars=""
" make tabs visible
set listchars+=tab:\| 
set listchars+=eol:¬
" show trailing spaces as dots
set listchars+=trail:•
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is off and the line
" continues beyond the right of the screen
set listchars+=precedes:<

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U
