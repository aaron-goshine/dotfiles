" ----------------------------------------
" Mappings
" ----------------------------------------

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","
let maplocalleader = "\\"

" ----------------------------------------
" Abbreviation
" ----------------------------------------
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>
iabbrev clg console.log();<Left><Left>


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
" noremap  <silent> H ^
" noremap  <silent> L $
" Create newlines without entering insert mode
nnoremap  <silent> go o<Esc>k
nnoremap  <silent> gO O<Esc>j
" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" ---------------
" Window Movement
" ---------------
nnoremap <silent> 1 <c-w>w
nnoremap <silent> gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
nnoremap <silent> <M-h> :wincmd h<CR>
nnoremap <silent> gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
nnoremap <silent> gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
nnoremap <silent> <M-k> :wincmd k<CR>
nnoremap <silent> gl :WriteBufferIfNecessary<CR>:wincmd l<CR>
nnoremap <silent> <M-l> :wincmd l<CR>
nnoremap 1 <c-w>w

" Equal Size Windows
nnoremap <silent> g= :wincmd =<CR>
" Swap Windows
nnoremap <silent> gx :wincmd x<CR>
"save on enter
" nnoremap <silent> <return> :w<CR>

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

" ---------------
" Insert Mode Mappings
" ---------------

"Let's make escape better, together.
inoremap jk <Esc>
inoremap JK <Esc>

nnoremap <silent> § :e ~/.dotfiles/vim/vimrc.vim<CR>

" ---------------
" Leader Mappings
" ---------------
nnoremap <silent> <leader>e :Explore<CR>
nnoremap <silent> <leader>r :TernRename<CR>

nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>f :CtrlP<CR>

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

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
" Format a json file with Python's built in json.tool.
nnoremap <leader>fj :%!python -m json.tool<CR>
vnoremap <leader>fj :'<,'>!python -m json.tool<CR>

" Highlight search word under cursor without jumping to next
nnoremap <leader>h *<C-O>

" Toggle spelling mode with ,s
nnoremap <silent> <leader>s :set spell!<CR>

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

" Insert date
iabbrev ddate <C-R>=strftime("%Y-%m-%d")<CR>

" Insert a console statements
iabbrev clg console.log(
iabbrev cld debugger;
iabbrev clda console.debug(arguments

iabbrev clx /** Todo: remove before commit */
\<CR> console.log('=====>');
\<CR> console.log(value);
\<CR> console.log('=====x');

" Insert a jsdoc block
iabbrev jxx /**
\<CR> *
\<CR> *
\<CR> **/

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
nnoremap <silent> <CR> :w <CR>

nmap <silent> --s "=HaskellModuleSection()<CR>gp
nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>

" search current file for visually selected  word
vnoremap // y/<C-R>"<CR>

" Vim test these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

cnoreabbrev <expr> dd 'call vimspector#Launch()<CR>'
cnoreabbrev <expr> dx 'call vimspector#Reset()<CR>'
cnoreabbrev <expr> dc 'call vimspector#Continue()<CR>'
cnoreabbrev <expr> dt 'call vimspector#ToggleBreakpoint()<CR>'




nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
