" ----------------------------------------
" Plugins
" ----------------------------------------

if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif
filetype off

call plug#begin('~/.vim/plug')
"=========================================
Plug '~/.vimplugin/YouCompleteMe'
"=========================================
Plug 'w0rp/ale'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0

if $LINTFIX == 'true'
  let g:ale_fixers = {
        \   'javascript': [$JSLINTER],
        \   'jsx': [$JSLINTER],
        \   'json': [$JSLINTER],
        \   'css': ['stylelint'],
        \   'sass': ['stylelint'],
        \   'python': ['autopep8', 'yapf'],
        \}
endif

let g:ale_fix_on_save = 1
let g:ale_linters = {
      \'jsx': [$JSLINTER],
      \'javascript': [$JSLINTER],
      \'css': ['stylelint'],
      \'sass': ['stylelint'],
      \'python': ['flake8', 'pylint'],
      \}
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
let g:ale_pattern_options_enabled = 1

"=========================================
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = ''
let g:ctrlp_max_height = 10
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

"=========================================
Plug 'tomtom/tcomment_vim'
let g:tcomment_maps = 0
"=========================================
Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
"=========================================
Plug 'aaron-goshine/vim-follow-my-lead'
let g:fml_all_sources = 1
"=========================================

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"=========================================
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['javascript', 'markdown', 'jsx', 'python' ]
let g:vim_json_syntax_conceal = 1
"=========================================
Plug 'aaron-goshine/colorv.vim'
let g:colorv_preview_ftype = 'css,javascript,scss,stylus,html,jsx'
"=========================================
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep'
"=========================================
Plug 'airblade/vim-gitgutter'
set signcolumn=yes
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '!!'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '!-'
"=========================================
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
"=========================================
Plug 'ternjs/tern_for_vim'

Plug 'ryanoasis/vim-devicons'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'

"=========================================
Plug 'pangloss/vim-javascript'
"=========================================

Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'aaron-goshine/swapvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" go
"" Go Lang Bundle


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" lua
"" Lua Bundle
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'
'

" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" Rust.vim
Plug 'rust-lang/rust.vim'

" Async.vim
Plug 'prabirshrestha/async.vim'

" Vim lsp
Plug 'prabirshrestha/vim-lsp'


" typescript
Plug 'leafgarland/typescript-vim'

"*****************************************************************************


"=========================================
Plug 'puremourning/vimspector'
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_test_plugin_path = expand( '<sfile>:p:h:h' )
set noequalalways
let &runtimepath = &runtimepath . ',' . g:vimspector_test_plugin_path
"========================================
" test
Plug 'vim-test/vim-test'
"
" Copilot - A I Coding
Plug 'github/copilot.vim'

call plug#end()
