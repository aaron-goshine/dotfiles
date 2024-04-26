" Set leader keys
let mapleader=","
let maplocalleader = ","

" General Mappings
nnoremap gy :0,$ y<cr>
nnoremap vy ggVG
nnoremap Y y$
nnoremap go o<Esc>k
nnoremap gO O<Esc>j
nnoremap * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

nnoremap H ^
nnoremap L $
vmap H ^
vmap L $

" Window Movement
nnoremap gh :WriteBufferIfNecessary<CR>:wincmd h<CR>
nnoremap gj :WriteBufferIfNecessary<CR>:wincmd j<CR>
nnoremap gk :WriteBufferIfNecessary<CR>:wincmd k<CR>
nnoremap gl :WriteBufferIfNecessary<CR>:wincmd l<CR>

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>

" Toggle comment on current line
nmap <Leader>c :TComment<CR>
vmap <Leader>c :TComment<CR>
nmap <Leader>cc :TCommentBlock<CR>
vmap <Leader>cc :TCommentBlock<CR>


" Modifer Mappings
inoremap <C-l> <C-x><C-l>
nnoremap <C-j> 15gjzz
nnoremap <C-k> 15gkzz

" Insert Mode Mappings
inoremap jk <Esc>
inoremap JK <Esc>

" Leader Mappings
nnoremap <leader>e :Explore<CR>
nnoremap <leader>r :TernRename<CR>

" Abbreviations
iabbrev ddate <C-R>=strftime("%d-%m-%Y")<CR>
iabbrev clg console.log();

" Copy current file name
if has("mac") || has("gui_macvim") || has("gui_mac")
  nnoremap <leader>yp :let @*=expand("%")<CR>
  nnoremap <leader>yP :let @*=expand("%:p")<CR>
endif

" Tests and Debugging
nmap t<C-n> :TestNearest<CR>
nmap t<C-f> :TestFile<CR>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
