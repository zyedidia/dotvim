function! HRun()
	execute "w"
	execute "silent !open /Applications/Firefox.app %:p"
    execute "redraw!"
endfunction

command! -nargs=* Run :call HRun()
