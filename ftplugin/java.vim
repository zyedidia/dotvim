function! JRun(...)
	if (a:0 > 0)
		let args=join(a:000, ' ')
	else 
		let args=""
	endif

	execute "w"
	execute "!javac %"
    if has('nvim')
        exec "sp"
        execute "term java %:r ".args
    else
        execute "!java %:r ".args
    endif
endfunction

command! -nargs=* Run :call JRun(<f-args>)
