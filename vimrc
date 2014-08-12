execute pathogen#infect()

set showmatch         "Show matching curly braces
set ignorecase        "Ignore case on searches
set smartcase         "Use case sensitive search if there is a capital letter in the search
set undolevels=1000   "Set the number of undos that are remembered
set number            "Show line numbers
set tabstop=4         "Use 4 space tabs
set shiftwidth=4      "Use 4 space tabs
set guifont=Menlo:h13 "Use Menlo size 13 font
set incsearch         "Incremental search: jump to the first occurrence of search while the user is still searching
set mouse=a           "Enable the mouse
set showcmd           "Show the current command in the bottom right
set autoindent        "Use autoindentation
set splitbelow        "Make horizontal splits below instead of above
set ttyfast           "We are using a fast terminal
set scrolloff=3       "Start scrolling when the cursor is 3 lines away from the bottom of the window

filetype indent on "Use filetype indentation
filetype plugin indent on "Allow plugins to use filetype indentation
syntax on "Turn on syntax highlighting

set background=light "Use a light background
colorscheme solarized "Use the solarized colorscheme

"Persistent undo isn't available on < vim 7.3
if (v:version > 703)
	"Make an undo directory if it does not exist
	if !isdirectory("undo")
		call mkdir("undo", "p")
	endif
	set undodir=~/.vim/undo "Set the undo directory
	set undofile "Turn on persistent undo
	set undoreload=10000
endif

"Mappings
map <Leader>f <Plug>(easymotion-f)
map <C-n> :NERDTreeToggle<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <up> <C-w>k
nmap <down> <C-w>j
nmap <left> <C-w>h
nmap <right> <C-w>l

imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateTrigger

inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

nnoremap j gj
nnoremap k gk
nnoremap <C-c> <Esc>
nnoremap <expr> i IndentWithI()
nnoremap <Leader>= :call IndentFile()<CR>
nnoremap <Leader>t :call OpenAll()<CR>

"Plugin customizations
call tcomment#DefineType('java', '// %s')
let delimitMate_expand_cr = 1 "Expand 1 line down on enter pressed
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"User defined commands
command SynCheck :w | :SyntasticCheck "Check for and report syntax errors

"---------------------------------------
"|          Helper functions           |
"---------------------------------------
"This will put the cursor in the correct position when insert mode is
"activated
function! IndentWithI()
	if len(Trim(getline('.'))) == 0
		"cc will correctly indent the cursor and switch to insert mode
		return "cc"
	else 
		return "i"
	endif
endfunction

"This will trim a string
function! Trim(input_string)
	return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

"This will autoindent the file without moving the cursor
function! IndentFile() 
	execute "normal! mqHmwgg=G`wzt`q"
endfunction

"This will open all the files in the current file's directory
function! OpenAll()
	execute "lcd %:p:h"
	execute "args *.*" 
	execute "tab all"
endfunction
