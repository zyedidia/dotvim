function! DRun(...)
    if (a:0 > 0)
        let args=join(a:000, ' ')
    else
        let args=""
    endif

    execute "w"
    execute "!dmd %"
    if has('nvim')
        exec "sp"
        execute "term ./%:r ".args
    else
        execute "!./%:r ".args
    endif
endfunction

command! -nargs=* Run :call DRun(<f-args>)
