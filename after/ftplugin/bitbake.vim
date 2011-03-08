set commentstring=#\ %s
set suffixesadd+=.bbclass
set suffixesadd+=.bb
set suffixesadd+=.inc
set suffixesadd+=.conf
setlocal path+=./classes;
setlocal path+=./conf;
setlocal path+=;
if exists('$BBPATH')
    for dir in split($BBPATH, ":")
        let &l:path += dir
        let &l:path += dir . "/classes"
    endfor
endif
