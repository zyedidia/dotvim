" Welcome to my vimrc
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
set wrap              "Wrap long lines
set mat=1             "Set the time to show matching braces to 1 second
set laststatus=2      "Always display the status line
set cursorline        "Highlight the current line
set autoread          "Automatically reload the file when it is changed from an outside program

filetype indent on    "Use filetype indentation
filetype plugin indent on "Allow plugins to use filetype indentation
syntax on             "Turn on syntax highlighting

set background=light  "Use a light background
colorscheme solarized "Use the solarized colorscheme

"Persistent undo isn't available on < vim 7.3
if (v:version > 703)
	"Make an undo directory if it does not exist
	if !isdirectory($HOME . "/.vim/undo")
		call mkdir($HOME . "/.vim/undo", "p")
	endif
	set undodir=~/.vim/undo "Set the undo directory
	set undofile "Turn on persistent undo
	set undoreload=10000
endif

"Mappings
map <Leader>f <Plug>(easymotion-f)
map <C-n> :NERDTreeToggle<CR>

"Create a line above the cursor from normal mode
nnoremap <S-Enter> O<Esc>
"Create a line below the cursor from normal mode
nnoremap <CR> o<Esc>
"Split a line
nnoremap K i<Enter><Esc>
"Remap the arrow keys to change split windows
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

"Remap some snipmate triggers
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateTrigger
imap <C-d> <Plug>snipMateBack

"Remap ctrl-c to esc
inoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
"Make executing macros on selected lines easy by just pressing space
vnoremap <Space> :call ExecMacro()<CR>
"Remap ctrl-k and ctrl-j to go up and down in command-line-mode
cnoremap <C-k> <up>
cnoremap <C-j> <down>

"Remap j and k to operate on visual lines
nnoremap j gj
nnoremap k gk
nnoremap <C-c> <Esc>
"Indent the cursor correctly when going into insert mode on an empty line
nnoremap <expr> i IndentWithI()
nnoremap <Leader>= :call IndentFile()<CR>
nnoremap <Leader>t :call OpenAll()<CR>

"Plugin customizations
call tcomment#DefineType('java', '// %s')
let delimitMate_expand_cr = 1 "Expand 1 line down on enter pressed
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

"User defined commands
command SynCheck :call SynCheck() "Check for and report syntax errors

"---------------------------------------
"|          Helper functions           |
"---------------------------------------
"Put the cursor in the correct position when insert mode is activated
function! IndentWithI()
	if len(Trim(getline('.'))) == 0
		"cc will correctly indent the cursor and switch to insert mode
		return "cc"
	else 
		return "i"
	endif
endfunction

"Trim a string
function! Trim(input_string)
	return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

"Autoindent the file without moving the cursor
function! IndentFile() 
	execute "normal! mqHmwgg=G`wzt`q"
endfunction

"Open all the files in the current file's directory
function! OpenAll()
	execute "lcd %:p:h"
	execute "args *.*" 
	execute "tab all"
endfunction

"Check the file for syntax errors
function! SynCheck()
	execute "w"
	execute "SyntasticCheck"
endfunction

"Execute the last recorded macro (useful for using visual mode to execute
"macros
function! ExecMacro()
	execute "normal @@"
endfunction

"Open the current setup in MacVim
function! OpenInMacVim()
	execute "mksession! ~/.session.vim"
	execute "silent !mvim -S ~/.session.vim"
	execute "wqa"
endfunction

"Google search a word
function! GoogleSearch(searchterm)
	exec "!open /Applications/Firefox.app/ http://google.com/?gws_rd=ssl\\#q=".a:searchterm
endfunction

"Search for documentation of word
function! DocSearch(searchterm)
	exec "!open /Applications/Firefox.app/ http://google.com/?gws_rd=ssl\\#q=".a:searchterm."+".split(expand("%"), "\\.")[1]
endfunction
