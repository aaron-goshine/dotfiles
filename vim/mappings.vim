" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" ---------------
" Regular Mappings
" ---------------
" Yank entire buffer with gy
nnoremap  <silent> gy :0,$ y<cr>
" Select entire buffer
nnoremap  <silent> vy ggVG

" Make Y behave like other capital commands.
" Hat-tip http://vimbits.com/bits/11
nnoremap  <silent> Y y$

" Just to beginning and end of lines easier.
noremap  <silent> H ^
noremap  <silent> L $

" Create newlines without entering insert mode
nnoremap  <silent> go o<Esc>k
nnoremap  <silent> gO O<Esc>j

" remap U to <C-r> for easier redo
" from http://vimbits.com/bits/356
nnoremap  <silent> U <C-r>


" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
nnoremap <silent> gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> gl :WriteBufferIfNecessary<CR>:wincmd l<CR>
nnoremap <silent> <M-l> :wincmd l<CR>

"   4 Window Splits
"
"   -----------------
"   g1 | g2 | g3 | g4
"   -----------------
nnoremap <silent> 1 <c-w>w
nnoremap <silent> g1 :WriteBufferIfNecessary<CR>:wincmd t<CR>
nnoremap <silent> g2 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<CR>
nnoremap <silent> g3 :WriteBufferIfNecessary<CR>:wincmd t<bar>:wincmd l<bar>:wincmd l<CR>
nnoremap <silent> g4 :WriteBufferIfNecessary<CR>:wincmd b<CR>

" Previous Window
nnoremap <silent> gp :wincmd p<CR>
" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>

" ---------------
" Modifer Mappings
" ---------------

" Make line completion easier.
inoremap <C-l> <C-x><C-l>

" Scroll larger amounts with C-j / C-k
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz
vnoremap <C-j> 15gjzz
vnoremap <C-k> 15gkzz
nnoremap 1 <c-w>w

" ---------------
" Insert Mode Mappings
" ---------------

" Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>

" ---------------
" Leader Mappings
" ---------------

"nnoremap <silent> <leader><space>:noh<cr>:call clearmatches()<cr>
"nnoremap <silent> <leader>N <esc>:sbprevious<CR>
"nnoremap <silent> <leader>M <esc>:sbnext<CR>
"nnoremap <silent> <leader>n <esc>:bprevious<CR>
"nnoremap <silent> <leader>m <esc>:bnext<CR>
"nnoremap <silent> <leader>d <esc>:bdelete<CR>
"nnoremap <silent> <leader>b <esc>:ls<CR>
"vnoremap <silent> <leader>s :sort<CR>
"nnoremap <silent> <leader>w :w<CR>
"nnoremap <silent> <leader>l :set list!<CR>
"nnoremap <silent> <leader>e :Explore<CR>
"nnoremap <silent> <leader>f :CtrlP<CR>

nnoremap <Leader>pi :call PluginReloadAndRun("PluginInstall")<CR>
nnoremap <Leader>pu :call PluginReloadAndRun("PluginInstall!")<CR>
nnoremap <Leader>pc :call PluginReloadAndRun("PluginClean")<CR>
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>f :CtrlP<CR>

nnoremap <leader>af :Ag<space>
" Leader Commands
nnoremap <Leader>t= :Tabularize assignment<CR>
vnoremap <Leader>t= :Tabularize assignment<CR>
nnoremap <Leader>t: :Tabularize symbol<CR>
vnoremap <Leader>t: :Tabularize symbol<CR>
nnoremap <Leader>t, :Tabularize comma<CR>
vnoremap <Leader>t, :Tabularize comma<CR>

nnoremap <silent><leader>cc :TComment<CR>
vnoremap <silent><leader>cc :TComment<CR>
nnoremap <silent><leader>cb :TCommentBlock<CR>
vnoremap <silent><leader>cb :TCommentBlock<CR>

nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gca :Gcommit -a -v<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gvdiff<CR>
" Exit a diff by closing the diff window
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
" Start git command
nnoremap <leader>gi :Git<space>

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
" Format a json file with Python's built in json.tool.
nnoremap <leader>fj :%!python -m json.tool<CR>

" Format a json file with Python's built in json.tool.
vnoremap <leader>fj :'<,'>!python -m json.tool<CR>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Toggle spelling mode with ,s
nnoremap <silent> <leader>s :set spell!<CR>

" Quickly switch to last buffer
nnoremap <leader>, :e#<CR>

" Underline the current line with '-'
nnoremap <silent> <leader>ul :t.\|s/./-/\|:nohls<cr>

" Underline the current line with '='
nnoremap <silent> <leader>uul :t.\|s/./=/\|:nohls<cr>

" Surround the commented line with lines.
"
" Example:
"          # Test 123
"          becomes
"          # --------
"          # Test 123
"          # --------
nnoremap <silent> <leader>cul :normal "lyy"lpwvLr-^"lyyk"lP<cr>

" Format the entire file
nnoremap <leader>fef mx=ggG='x


" Split window vertically or horizontally *and* switch to the new split!
nnoremap <silent> <leader>hs :split<Bar>:wincmd j<CR>:wincmd =<CR>
nnoremap <silent> <leader>vs :vsplit<Bar>:wincmd l<CR>:wincmd =<CR>

" Close the current window
nnoremap <silent> <m-w> :close<CR>

" Toggle paste mode with F5
nnoremap <silent> <F5> :set paste!<CR>

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" Insert a console statements
iabbrev clg console.log
iabbrev cld console.debug
iabbrev clda console.debug(arguments
" Insert a jsdoc block
iabbrev jxx /** \r* \r* */

" copy current file name (relative/absolute) to system clipboard

if has("mac") || has("gui_macvim") || has("gui_mac")

  " relative path  (src/foo.txt)
  nnoremap <silent> <leader>yp :let @*=expand("%")<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <silent> <leader>yP :let @*=expand("%:p")<CR>

  " filename       (foo.txt)
  nnoremap <silent> <leader>yf :let @*=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <silent> <leader>yd :let @*=expand("%:p:h")<CR>
endif

inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


vnoremap <silent> < <gv
vnoremap <silent> > >gv
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv


nmap <silent> --s "=HaskellModuleSection()<CR>gp
nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>

" search current file for visually selected  word
vnoremap // y/<C-R>"<CR>

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
