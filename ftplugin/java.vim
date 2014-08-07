function! JRun()
	execute "w"
	execute "!javac %"
	execute "!java %:r"
endfunction

command! JRun :call JRun()
