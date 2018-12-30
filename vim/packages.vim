" ----------------------------------------
" Packages
" ----------------------------------------
set nocompatible
filetype off

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

"=========================================
call minpac#add('Valloric/YouCompleteMe')
" Plugin 'Valloric/YouCompleteMe'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers =  {
      \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'gitcommit' : ['#', ':'],
      \   'php' : ['::', '=>'],
      \ }

let g:ycm_filetype_blacklist = {
      \ 'notes': 1,
      \ 'unite': 1,
      \ 'tagbar': 1,
      \ 'pandoc': 1,
      \ 'qf': 1,
      \ 'vimwiki': 1,
      \ 'text': 1,
      \ 'infolog': 1,
      \ 'mail': 1
      \}
"=========================================
call minpac#add('w0rp/ale')
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0

if $LINTFIX == 'true'
  let g:ale_fixers = {
        \   'javascript': [$JSLINTER],
        \   'jsx': [$JSLINTER],
        \   'json': [$JSLINTER],
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
call minpac#add('ctrlpvim/ctrlp.vim')
let g:ctrlp_map = ''
let g:ctrlp_max_height = 10
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

"=========================================
call minpac#add('tomtom/tcomment_vim')
let g:tcomment_maps = 0
"=========================================
call minpac#add('vim-airline/vim-airline')
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
"=========================================
call minpac#add('aaron-goshine/vim-follow-my-lead')
let g:fml_all_sources = 1
"=========================================
call minpac#add('fatih/vim-go')
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"=========================================
call minpac#add('sheerun/vim-polyglot')
let g:polyglot_disabled = ['javascript', 'markdown', 'jsx']
let g:vim_json_syntax_conceal = 1
"=========================================
call minpac#add('aaron-goshine/colorv.vim')
let g:colorv_preview_ftype = 'css,javascript,scss,stylus,html,jsx'
"=========================================
call minpac#add('mileszs/ack.vim')
let g:ackprg = 'ag --vimgrep'
"=========================================
call minpac#add('ternjs/tern_for_vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('ervandew/supertab')
call minpac#add('godlygeek/tabular')
call minpac#add('pangloss/vim-javascript')
call minpac#add('elzr/vim-json')
call minpac#add('mxw/vim-jsx')
call minpac#add('tpope/vim-fugitive')
call minpac#add('aaron-goshine/swapvim')

