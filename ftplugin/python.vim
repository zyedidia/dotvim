function! PyRun(...)
    if (a:0 > 0)
        let args=join(a:000, ' ')
    else
        let args=""
    endif

    execute "w"
    if has('nvim')
        exec "sp"
        execute "term python % ".args
    else
        execute "!python % ".args
    endif
endfunction

command! -nargs=* Run :call PyRun(<f-args>)
