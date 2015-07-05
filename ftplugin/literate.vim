function! Lit()
	exec "w"
	set shellcmdflag=-ic
	exec "silent !lit %"
	set shellcmdflag=-c
	exec "vsp %:r.".b:codetype_ext
	exec "norm! G=gg"
	exec "w"
endfunc

function! LitHTML()
	exec "w"
	set shellcmdflag=-ic
	exec "silent !lit %"
	set shellcmdflag=-c
	exec "silent !open %:r.html"
	exec "redraw!"
endfunc

function! LitPDF()
	exec "w"
	set shellcmdflag=-ic
	exec "silent !lit %"
	set shellcmdflag=-c
	exec "silent !wkhtmltopdf %:r.html %:r.pdf"
	exec "silent !open %:r.pdf"
	exec "redraw!"
endfunc

function! Exe(...)
	call Lit()

	if (a:0 > 0)
		let args=join(a:000, ' ')
	else
		let args=""
	endif

	exec "Run ".args
	exec "q"
endfunc

command! -nargs=* Exe :call Exe(<f-args>)

nnoremap <Leader>e :Exe<CR>
nnoremap <Leader>p :call LitPDF()<CR>
