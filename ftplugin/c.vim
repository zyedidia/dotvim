function! CRun(...)
	if (a:0 > 0)
		let args=a:1
	else
		let args=""
	endif

	execute "w"
	execute "!make %:r"
	execute "!./%:r ".args
endfunction

command! -nargs=* Run :call CRun(<f-args>)

