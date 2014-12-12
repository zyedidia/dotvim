function! JRun(...)
	if (a:0 > 0)
		let args=a:1
	else 
		let args=""
	endif

	execute "w"
	execute "!javac %"
	execute "!java %:r ".args
endfunction

command! -nargs=* Run :call JRun(<f-args>)
