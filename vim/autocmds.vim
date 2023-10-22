" Auto Commands
if has("autocmd")
  augroup MyAutoCommands
    autocmd!
    " No formatting on 'o' key newlines
    autocmd BufNewFile,BufEnter * setlocal formatoptions-=o
    " Save on focus loss
    autocmd FocusLost * silent! :wa
    " Jump to the last cursor position
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    " Strip trailing whitespace
    autocmd BufWritePre *.[py,js,rb,erb,md,scss,vim,Cakefile,hbs] silent! :StripTrailingWhiteSpace
    " Fix accidental indentation in HTML
    autocmd FileType html setlocal indentkeys-=*<Return>
    " Adjust for command-line window
    autocmd CmdwinEnter * unmap <cr>
    autocmd CmdwinLeave * call MapCR()
    " Resize splits
    autocmd VimResized * wincmd =
  augroup END
endif

" Language-specific settings
autocmd FileType html,jsx,css,javascript,typescript,yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python,php setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType [javascript,typescript,css,html,python,yaml,rust] setlocal listchars=tab:\|\
autocmd FileType yaml,json,go setlocal nospell
autocmd FileType * call LoadTemplate()
autocmd BufEnter * silent! lcd %:p:h

" Add current directory to path
let s:default_path = escape(&path, '\ ')
autocmd BufRead *
      \ let s:tempPath=escape(expand("%:p:h"), ' ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path^=".s:tempPath

" Set syntax for *.html.twig files
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
