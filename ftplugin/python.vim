function! PyRun(...)
	if (a:0 > 0)
		let args=join(a:000, ' ')
	else
		let args=""
	endif

	execute "w"
	execute "!python % ".args
endfunction

command! -nargs=* Run :call PyRun(<f-args>)
