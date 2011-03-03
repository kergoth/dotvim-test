if !executable("gofmt")
  finish
endif

let bindirs = split(globpath(&runtimepath, 'bin'), '\n')
let $PATH = $PATH . ':' . join(bindirs, ':')
if !executable("mygofmt")
  finish
endif

function! Goformat()
  let regel=line(".")
  silent %!mygofmt
  call cursor(regel, 1)
endfunction

command! Gofmt call Goformat()

au BufWrite *.go :Gofmt
set equalprg=mygofmt
set nolist
set sw=4 ts=4 sts=0 noet
set comments=s1:/*,mb:*,ex:*/,://
set commentstring=//\ %s
set foldmethod=syntax

let g:go_highlight_space_tab_error = 0
let g:go_highlight_trailing_whitespace_error = 0
