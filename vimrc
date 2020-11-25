function HappyPython()
call setline(1, "#!/usr/bin/env python")
call append(1, "#-*- coding:utf8 -*-")
normal G
normal o
endf
autocmd bufnewfile *.py call HappyPython()
function HappyShell()
call setline(1, "#!/bin/bash")
normal G
normal o
endf
autocmd bufnewfile *.sh call HappyShell()


map <F4> ms:call AddAuthor()<cr>'s
 
function AddAuthor()
        let n=1
        while n < 5
                let line = getline(n)
                if line =~'^\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
                        call UpdateTitle()
                        return
                endif
                let n = n + 1
        endwhile
        call AddTitle()
endfunction
 
function UpdateTitle()
        normal m'
        execute '/* Last modified\s*:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@'
        normal "
        normal mk
        execute '/* Filename\s*:/s@:.*$@\=": ".expand("%:t")@'
        execute "noh"
        normal 'k
        echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
 
function AddTitle()
        call append(1,"############################################################")
        call append(2,"# Author        : Reid")
        call append(3,"# Email         : 122@163.com")
        call append(4,"# Last modified : ".strftime("%Y-%m-%d %H:%M"))
        call append(5,"# Filename      : ".expand("%:t"))
        call append(6,"# Description   : ")
        call append(7,"###########################################################")
        echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
