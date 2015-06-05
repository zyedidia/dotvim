let s:pluginpath = expand('<sfile>:p:h')
func! julialint#StartServer()
	call system("julia " . s:pluginpath . "/lintserver.jl >/dev/null 2>&1 &")
endfunction

func! julialint#EnableLinter()
	let g:neomake_julia_julia_maker = {
		\ 'args': [s:pluginpath . '/lintrequest.jl'],
		\ 'errorformat': '%f:%l %m',
		\ }
	let g:neomake_julia_enabled_makers = ['julia']
endfunction
