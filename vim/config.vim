" ==========================
" Color and Appearance
" ==========================
set background=dark
colorscheme jellybeans
hi! link cssAttr Constant
if $TERM =~ "-256color"
  set t_Co=256
endif
set ruler
set number
set showtabline=2
set laststatus=2
set cmdheight=2
set encoding=utf-8
set noshowmode
set title
if exists('+colorcolumn')
  set colorcolumn=80
endif

" ==========================
" File and Directory Settings
" ==========================
set backupdir=$HOME/.vim/.backup
set directory=$HOME/.vim/.temp
set undofile
set undodir=$HOME/.vim/.undo
set undolevels=1000
set undoreload=10000
set rtp+=/usr/local/opt/fzf

" ==========================
" UI and Behavior
" ==========================
syntax enable
set backup
set autoread
set wildmenu
set hidden
set history=1024
set cf
if has("clipboard")
  set clipboard=unnamed
  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif
set autowrite
set formatoptions=crql
set nostartofline
set scrolloff=3
set gdefault
set switchbuf=useopen
set autochdir
set timeout
set timeoutlen=750
set ttimeoutlen=250
set spell spelllang=en_gb

" ==========================
" Text Formatting
" ==========================
set tabstop=2
set backspace=indent,eol,start
set shiftwidth=2
set shiftround
set cindent
set autoindent
set smarttab
set expandtab
set linebreak
set smartindent

" ==========================
" Searching
" ==========================
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,\
  \.sass-cache,*.class,*.scssc,*.cssc,sprockets%*,*.lessc,*/node_modules/*,\
  \rake-pipeline-*

" ==========================
" Visual Indicators
" ==========================
set showmatch
set matchtime=2
set list
set listchars=tab:\|\
set listchars+=eol:¬
set listchars+=trail:•
set listchars+=extends:>
set listchars+=precedes:<

" ==========================
" Sounds and Mouse
" ==========================
set noerrorbells
set novisualbell
set t_vb=
set mousehide
set mouse=a
set complete=.,w,b,u,U
