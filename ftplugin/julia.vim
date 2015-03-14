function! Run(...)
	if (a:0 > 0)
		let args=join(a:000, ' ')
	else 
		let args=""
	endif

	execute "w"
	execute "!julia %"
endfunction

command! -nargs=* Run :call Run(<f-args>)
