function! Run(...)
    if (a:0 > 0)
        let args=join(a:000, ' ')
    else 
        let args=""
    endif

    execute "w"
    echom "starting " . args
    if has('nvim')
        execute "sp"
        execute "term julia %" . args
    else
        echom "starting " . args
        execute "!julia %" . args
        echom "done"
    endif
endfunction

command! -nargs=* Run :call Run(<f-args>)
