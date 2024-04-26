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
au FileType html,jsx,css,javascript,typescript,yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType python,php setlocal ts=4 sts=4 sw=4 expandtabau BufRead,BufNewFile *.yaml,*.yml setlocal nospell

au FileType yaml setlocal nospell
au FileType json setlocal nospell
au FileType yml setlocal nospell

au FileType javascript setlocal listchars=tab:\|\
au FileType typescript setlocal listchars=tab:\|\
au FileType css setlocal listchars=tab:\|\
au FileType html setlocal listchars=tab:\|\
au FileType python setlocal listchars=tab:\|\
au FileType yaml setlocal listchars=tab:\|\
au FileType rust setlocal listchars=tab:\|\

au BufNewFile * call LoadTemplate()
au BufEnter * silent! lcd %:p:h

" Add current directory to path
let s:default_path = escape(&path, '\ ')
autocmd BufRead *
      \ let s:tempPath=escape(expand("%:p:h"), ' ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path^=".s:tempPath

" Set syntax for *.html.twig files
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
