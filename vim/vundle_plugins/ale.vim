if exists('g:vundle_installing_plugins')
  Plugin 'w0rp/ale'
  finish
endif

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
" Otherwise huge files might get linted and freeze.
let g:ale_lint_on_enter = 0


" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
      \   'javascript': ['standard'],
      \   'jsx': ['standard'],
      \   'json': ['standard'],
      \   'python': ['autopep8', 'yapf'],
      \}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \'jsx': ['standard'],
      \'css': ['stylelint'],
      \'sass': ['stylelint'],
      \'javascript': ['standard'],
      \'python': ['flake8', 'pylint'],
      \}
let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1
