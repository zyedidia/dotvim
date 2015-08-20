function! Lit()
	exec "w"
	exec "silent !lit %"
endfunc

function! LitHTML_reload()
	call Lit()
	exec "silent !osascript ~/.nvim/ftplugin/refresh.scpt"
	exec "redraw!"
endfunc

function! LitPDF()
	call Lit()
	exec "silent !wkhtmltopdf --page-size Letter -R 0 -L 0 --header-right [page] --margin-top 2cm --margin-left 1cm --margin-right 1cm %:r.html %:r.pdf"
	exec "silent !open %:r.pdf"
	exec "redraw!"
endfunc

function! Exe(...)
	call LitCode()

	if (a:0 > 0)
		let args=join(a:000, ' ')
	else
		let args=""
	endif

	exec "Run ".args
	exec "q"
endfunc

function! LitHtml()
    exec "w"
    exec "silent !lit -html %"
    exec "silent !open -a \"Safari\" %:r.html"
    exec "redraw!"
endfunc

command! -nargs=* Exe :call Exe(<f-args>)

nnoremap <Leader>e :Exe<CR>
nnoremap <Leader>p :call LitPDF()<CR>
nnoremap <Leader>h :call LitHTML_reload()<CR>
nnoremap <Leader>o :call LitHtml()<CR>
