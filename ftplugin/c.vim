function! CRun()
	execute "w"
	execute "!make %:r"
	execute "!./%:r"
endfunction

command! CRun :call CRun()

