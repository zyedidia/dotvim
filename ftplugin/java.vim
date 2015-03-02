function! JRun(...)
	if (a:0 > 0)
		let args=join(a:000, ' ')
	else 
		let args=""
	endif

	execute "w"
	execute "!javac %"
	execute "!java %:r ".args
endfunction

command! -nargs=* Run :call JRun(<f-args>)
