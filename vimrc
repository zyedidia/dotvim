execute pathogen#infect()

"Sets
set showmatch "Show matching braces"
set ignorecase
set smartcase
set undolevels=1000
set number "Show the line numbers"
set tabstop=4 "Tab is 4 spaces"
set shiftwidth=4
set guifont=Menlo:h13
set incsearch "Use incremental search"
set mouse=a
set showcmd
set autoindent
set splitbelow
set ttyfast
set scrolloff=3

if (v:version > 703)
	set undodir=~/.vim/undo
	set undofile
	set undoreload=10000
endif

nnoremap j gj
nnoremap k gk

call tcomment#DefineType('java', '// %s')

let delimitMate_expand_cr = 1 "Expand 1 line down on enter pressed"
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateTrigger

filetype indent on
filetype plugin indent on

set background=light
colorscheme solarized

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map <Leader>f <Plug>(easymotion-f)
map <C-n> :NERDTreeToggle<CR>
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
nmap <up> <C-w>k
nmap <down> <C-w>j
nmap <left> <C-w>h
nmap <right> <C-w>l

syntax on

function! IndentWithI()
	if len(Trim(getline('.'))) == 0
		return "cc"
	else 
		return "i"
	endif
endfunction

function! Trim(input_string)
	return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function! IndentFile() 
	execute "normal! mqHmwgg=G`wzt`q"
endfunction

function! OpenAll()
	execute "lcd %:p:h"
	execute "args *.*" 
	execute "tab all"
endfunction

nnoremap <expr> i IndentWithI()
nnoremap <Leader>= :call IndentFile()<CR>
nnoremap <Leader>t :call OpenAll()<CR>

command SynCheck :w | :SyntasticCheck
