" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"==================================
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
command! ReloadVundle source ~/.vim/vundle.vim
function PluginReloadAndRun(command)
  :ReloadVundle
  execute a:command
endfunction
"==================================
Plugin 'L9'
"==================================
Plugin 'Valloric/MatchTagAlways'
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jsx' : 1,
      \ 'handlebars' : 1,
      \ 'eruby' : 1,
      \}
"==================================
Plugin 'Valloric/YouCompleteMe'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_filetype_specific_completion_to_disable = {
"     \ 'ruby' : 1,
"     \ 'javascript' : 1,
"     \ 'jsx' : 1,
"     \}
let g:ycm_semantic_triggers =  {
      \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'gitcommit' : ['#', ':'],
      \   'php' : ['::', '=>'],
      \ }
" Overwritten so we can allow markdown completion.
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
"==================================
Plugin 'w0rp/ale'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" Otherwise huge files might get linted and freeze.
let g:ale_lint_on_enter = 0
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.


if $LINTFIX == 'true'
  let g:ale_fixers = {
        \   'javascript': [$JSLINTER],
        \   'jsx': [$JSLINTER],
        \   'json': [$JSLINTER],
        \   'python': ['autopep8', 'yapf'],
        \}
endif
" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
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
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1
"==================================
Plugin 'ctrlpvim/ctrlp.vim'
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
" Fix fix new windows opening in split from startify
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_mruf_max = 350
let g:ctrlp_mruf_default_order = 0
" " Leader Commands
" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
" HatTip: http://robots.thoughtbot.com/faster-grepping-in-vim and
" @ethanmuller
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
"==================================
Plugin 'othree/html5.vim'
"==================================
Plugin 'indenthtml.vim'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"==================================
Plugin 'nanotech/jellybeans.vim'
hi! link cssAttr Constant
"==================================
Plugin 'aaron-goshine/swapvim'
"==================================
"==================================
Plugin 'tomtom/tcomment_vim'
let g:tcomment_maps = 0
"==================================
Plugin 'ternjs/tern_for_vim'
"==================================
Plugin 'freitass/todo.txt-vim'
"==================================
Plugin 'bling/vim-airline'
"let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_mode_map = {
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'VL',
      \ 'c'  : 'CMD',
      \ '' : 'VB',
      \ }
" Show the current working directory folder name
let g:airline_section_b = '%{substitute(getcwd(), ".*\/", "", "g")} '
" Just show the file name
let g:airline_section_c = '%t'
let g:airline_section_y = ''
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3'
let g:airline_section_z = '%3p%% %{substitute(line("."), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}|%{substitute(line("$"), "\\v(\\d)((\\d\\d\\d)+\\d@!)@=", "\\1,", "g")}'
"==================================
Plugin 'hail2u/vim-css3-syntax'
"==================================
Plugin 'chrisbra/csv.vim'
"==================================
Plugin 'aaron-goshine/vim-follow-my-lead'
let g:fml_all_sources = 1
"==================================
Plugin 'tpope/vim-fugitive'
" Undo the last commit
command! Gcundo :Git reset HEAD~1
"==================================
Plugin 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"==================================
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
"==================================
Plugin 'pangloss/vim-javascript'
"==================================
Plugin 'heavenshell/vim-jsdoc'
" Allow prompt for interactive input.
let g:jsdoc_allow_input_prompt = 1
"Prompt for a function description
let g:jsdoc_input_description = 1
"Prompt for a value for @name, add it to the JSDoc block comment along with the @function tag.
let g:jsdoc_additional_descriptions = 1
"Add the @return tag.
let g:jsdoc_return = 1
"Prompt for and add a type for the aforementioned @return tag.
let g:jsdoc_return_type = 1
"Prompt for and add a description for the @return tag.
let g:jsdoc_return_description = 1
"Set value to 1 to turn on access tags like @access <private|public>.
"Set value to 2 to turn on access tags like @<private|public>
let g:jsdoc_access_descriptions = 0
"Set value to 1 to turn on detecting underscore starting functions as private convention
let g:jsdoc_underscore_private = 0
"Characters used to separate @param name and description.
let g:jsdoc_param_description_separator = ' - '
"Override default type and description. See help more detail.
let g:jsdoc_custom_args_hook = {}
"When using custom_args_hook, only match against regexes
let g:jsdoc_custom_args_regex_only = 0
"Allow to insert default description depending on the type.
let g:jsdoc_type_hook = {}
"Enable to use ECMAScript6's Shorthand function, Arrow function.
let g:jsdoc_enable_es6 = 1
"==================================
Plugin 'elzr/vim-json'
"==================================
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0
"==================================
Plugin 'groenewege/vim-less'
"==================================
Plugin 'gabrielelana/vim-markdown'
"==================================
Plugin 'sheerun/vim-polyglot'
" I use the same repo, but I want it to be as up to date as possible.
let g:polyglot_disabled = ['javascript', 'markdown', 'jsx']
let g:vim_json_syntax_conceal = 1
"==================================
Plugin 'rust-lang/rust.vim'
"==================================
Plugin 'mhinz/vim-signify'
" Makes switching buffers in large repos have no delay
let g:signify_update_on_bufenter = 0
let g:signify_sign_overwrite = 0
"==================================
Plugin 'Shougo/vimproc.vim.git'
"==================================
Plugin 'artur-shaik/vim-javacomplete2'
"==================================
Plugin 'tpope/vim-classpath'
"==================================
if $FAST_MACHINE == 1
  "==================================
  Plugin 'ryanoasis/vim-devicons'
  "==================================
  Plugin 'ervandew/supertab'
  "==================================
  Plugin 'aaron-goshine/mathvim'
  "==================================
  Plugin 'aaron-goshine/colorv.vim'
  "==================================
  Plugin 'rking/ag.vim'
  let g:colorv_preview_ftype = 'css,javascript,scss,stylus,html,jsx'
  "==================================
  Plugin 'mattn/emmet-vim'
  "==================================
  Plugin 'godlygeek/tabular'
  "==================================
  Plugin 'blindFS/vim-taskwarrior'
  " default task report type
  let g:task_report_name     = 'next'
  " custom reports have to be listed explicitly to make them available
  let g:task_report_command  = []
  " whether the field under the cursor is highlighted
  let g:task_highlight_field = 1
  " can not make change to task data when set to 1
  let g:task_readonly        = 0
  " vim built-in term for task undo in gvim
  let g:task_gui_term        = 1
  " allows user to override task configurations. Seperated by space. Defaults to ''
  let g:task_rc_override     = 'rc.defaultwidth=999'
  " default fields to ask when adding a new task
  let g:task_default_prompt  = ['due', 'description']
  " whether the info window is splited vertically
  let g:task_info_vsplit     = 0
  " info window size
  let g:task_info_size       = 15
  " info window position
  let g:task_info_position   = 'belowright'
  " directory to store log files defaults to taskwarrior data.location
  let g:task_log_directory   = '~/.task'
  " max number of historical entries
  let g:task_log_max         = '20'
  " forward arrow shown on statusline
  let g:task_left_arrow      = ' <<'
  " backward arrow ...
  let g:task_left_arrow      = '>> '
  highlight default link taskwarrior_tablehead   Tabline
  highlight default link taskwarrior_field       IncSearch
  highlight default link taskwarrior_selected    Visual
  highlight default link taskwarrior_id          VarId
  highlight default link taskwarrior_project     String
  highlight default link taskwarrior_Status      Include
  highlight default link taskwarrior_priority    Class
  highlight default link taskwarrior_due         Todo
  highlight default link taskwarrior_end         Keyword
  highlight default link taskwarrior_description Normal
  highlight default link taskwarrior_entry       Special
  highlight default link taskwarrior_depends     Todo
  highlight default link taskwarrior_tags        Keyword
  highlight default link taskwarrior_uuid        VarId
  highlight default link taskwarrior_urgency     Todo
  "==================================
  Plugin 'SirVer/ultisnips'
  let g:UltiSnipsSnippetDirectories=['vim_ulti_snippets']
  let g:UltiSnipsExpandTrigger='<C-j>'
  let g:UltiSnipsJumpForwardTrigger='<C-j>'
  let g:UltiSnipsJumpBackwardTrigger='<C-h>'
  "==================================
  Plugin 'tpope/vim-eunuch'

endif

call vundle#end()
