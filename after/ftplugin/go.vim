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
