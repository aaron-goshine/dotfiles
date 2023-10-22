call plug#begin('~/.vim/plug')


" Vim LSP Configuration
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('tsserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'tsserver',
        \ 'cmd': {server_info->['tsserver']},
        \ 'whitelist': ['javascript', 'typescript'],
        \ })
endif

if executable('lua-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'lua-lsp',
        \ 'cmd': {server_info->['lua-lsp']},
        \ 'whitelist': ['lua'],
        \ })
endif

Plug 'ctrlpvim/ctrlp.vim'

Plug 'tomtom/tcomment_vim'

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
"==============
Plug 'aaron-goshine/vim-follow-my-lead'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" Rest of your plugins...

call plug#end()
