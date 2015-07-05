function! Lit()
	execute "w"
	set shellcmdflag=-ic
	execute "silent !lit %"
	execute "vsp %:r.".b:codetype_ext
	set shellcmdflag=-c
endfunc
