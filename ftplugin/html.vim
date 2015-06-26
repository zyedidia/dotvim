function! HRun()
	execute "w"
	execute "!open /Applications/Firefox.app %:p"
endfunction

command! -nargs=* Run :call HRun()
