function! DRun(...)
	if (a:0 > 0)
		let args=join(a:000, ' ')
	else
		let args=""
	endif

	execute "w"
	execute "!dmd %"
	execute "!./%:r ".args
endfunction

command! -nargs=* Run :call DRun(<f-args>)
