function! PyRun(...)
	if (a:0 > 0)
		let args=a:1
	else
		let args=""
	endif

	execute "w"
	execute "!python % ".args
endfunction

command! -nargs=* Run :call PyRun(<f-args>)
