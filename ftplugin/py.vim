function! PyRun()
	execute "w"
	execute "!python %"
endfunction

command! PyRun :call PyRun()
