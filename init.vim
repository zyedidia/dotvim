" Welcome to my vimrc

" Load all the plugins
source ~/.config/nvim/plugins.vim

"--------------------------
"|        Settings        |
"--------------------------

set showmatch         " Show matching braces
set hlsearch          " switch on highlighting for the last used search pattern
set showcmd           " Show the current command in the bottom right
set mat=1             " Set the time to show matching braces to 1 second
set ignorecase        " Ignore case on searches
set smartcase         " Use case sensitive search if there is a capital letter in the search
set undolevels=1000   " Set the number of undos that are remembered
set number            " Show line numbers
set tabstop=4         " Use 4 space tabs
set shiftwidth=4      " Use 4 space tabs
set guifont=Monaco:h13 " Use Menlo size 13 font
set incsearch         " Incremental search: jump to the first occurrence of search while the user is still searching
set mouse=a           " Enable the mouse
set autoindent        " Use autoindentation
set splitbelow        " Make horizontal splits below instead of above
set splitright        " Make vertical splits on the right
set scrolloff=3       " Start scrolling when the cursor is 3 lines away from the bottom of the window
set wrap              " Wrap long lines
set laststatus=2      " Always display the status line
set cursorline        " Highlight the current line
set autoread          " Automatically reload the file when it is changed from an outside program
set nohlsearch        " Don't highlight search results
set expandtab         " Use spaces instead of tabs
set omnifunc=syntaxcomplete#Complete " Enable omnicompletion
set nofoldenable
set autowrite

set tags=tags; " Look for tags files

filetype indent on    " Use filetype indentation
filetype plugin indent on " Allow plugins to use filetype indentation
syntax on             " Turn on syntax highlighting

set background=dark " Use a dark background
" colorscheme solarized " Use the solarized colorscheme
" let g:molokai_original = 1
colorscheme molokai " Use the molokai colorscheme

" Make an undo directory if it does not exist
if !isdirectory($HOME . "/.config/nvim/undo")
    call mkdir($HOME . "/.config/nvim/undo", "p")
endif
set undodir=~/.config/nvim/undo " Set the undo directory
set undofile " Turn on persistent undo
set undoreload=10000

set backup
if !isdirectory($HOME . "/.config/nvim/backup")
    call mkdir($HOME . "/.config/nvim/backup", "p")
endif
set backupdir=~/.config/nvim/backup

"--------------------------
"|        Mappings        |
"--------------------------

nnoremap <up> <C-w>k
nnoremap <down> <C-w>j
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

" Open the error that the cursor is on in the location list
nnoremap <CR> :execute "ll ".line('.')<CR>

" Split a line
nnoremap K i<Enter><Esc>

" Remap ctrl-c to esc
inoremap <C-c> <Esc>
nnoremap <C-c> <Esc>
nnoremap r<C-c> r<Esc>
nnoremap <C-w><C-c> <C-w><Esc>

" Make executing macros on selected lines easy by just pressing space
vnoremap <Space> :call ExecMacro()<CR>

" Remap ctrl-k and ctrl-j to go up and down in command-line-mode
cnoremap <C-k> <up>
cnoremap <C-j> <down>

" Remap 0 to ^ and ^ to 0
nnoremap 0 ^
nnoremap ^ 0
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap <Esc> <C-\><C-n>

" Remap j and k to operate on visual lines
nnoremap j gj
nnoremap k gk

" Indent the cursor correctly when going into insert mode on an empty line
nnoremap <expr> i IndentWithI()

" Correctly indent the entire file
nnoremap <Leader>= :call IndentFile()<CR>

" Open nvimrc file
nnoremap <Leader>v :vsp ~/.config/nvim/init.vim<CR>
" Source nvimrc file
nnoremap <Leader>sv :source ~/.config/nvim/init.vim<CR>

" Run the current file
nnoremap <Leader>r :Run<CR>
" Lint the current file (syntax check)
nnoremap <Leader>s :SynCheck<CR>
" Fix any syntax highlighting glitches
nnoremap <Leader>l :syntax sync fromstart<CR>
" Open the NERDTree with \n
map <Leader>n :NERDTreeToggle<CR>

" Location list pre
nnoremap <M-[> :lpr<CR>
" Location list next
nnoremap <M-]> :lne<CR> 

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " Use a bar in insert mode and a block in normal mode

"------------------------------
"|        Autocommands        |
"------------------------------

autocmd BufEnter,BufRead *.lang set syn=java " Highlight Lang as Java
autocmd BufEnter,BufRead *.elm set syn=haskell " Highlight Elm as Haskell
autocmd BufEnter,BufRead term://* call EnterTerminal() " Go into insert mode when the buffer switches to a terminal
" autocmd BufEnter,BufRead *.sv set shiftwidth=2
autocmd! BufWritePost * SynCheck " Check for syntax errors on file write
au BufWrite *.hx :Autoformat

augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif


"---------------------------------------
"|        Plugin Customizations        |
"---------------------------------------

set backspace=2
let delimitMate_expand_cr = 1 " Expand 1 line down on enter pressed

let g:go_fmt_command = "goimports" " Automatically run goimports on save

let loaded_matchparen = 1 " Don't source the match paren plugin

let g:formatdef_haxe = '"haxelib run formatter --stdin -s ."'
let g:formatters_haxe = ['haxe']

" Multiple cursors mappings to use Ctrl C instead of escape
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'

let g:move_key_modifier = 'M' " Use alt hjkl to move blocks around

let g:ctrlp_show_hidden = 1 " Show hidden files when searching with ctrlp
" Using Ag for ctrlp will speed it up (ag is much faster than grep)
if executable("ag")
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
endif

" Use the ctrlp python matcher to speed up ctrlp (python is faster than
" vimscript)
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Set some options for the lightline
let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], ['fugitive', 'relativepath', 'modified' ] ],
            \   'right': [ [ 'lineinfo'], ['percent'], ['filetype' ] ]
            \ },
            \ 'inactive': {
            \   'left': [ [ 'relativepath', 'modified' ] ],
            \   'right': [ [ 'lineinfo' ], [ 'percent' ] ]
            \ },
            \ 'component': {
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
            \ },
            \ 'component_visible_condition': {
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \ }
            \ }

" Use >> for errors and warnings in Neomake (with slightly different fonts)
let g:neomake_error_sign = {
            \ 'text': '>>',
            \ 'texthl': 'ErrorMsg',
            \ }

let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'WarningMsg',
            \ }

" Some additional options for tidy so it only shows errors
let g:neomake_html_tidy_maker = {
            \ 'args': ['-e', '-q', '--gnu-emacs', 'true', '--show-warnings', 'false'],
            \ 'errorformat': '%A%f:%l:%c: %trror: %m',
            \ }
let g:neomake_html_enabled_makers = ['tidy']

let g:pandoc#syntax#conceal#use = 0

" Set the comment type for julia
" call tcomment#Define('julia', '# %s')
" Set the comment type for lua
" call tcomment#Define('lua', '-- %s')
" call tcomment#Define('d', '// %s')

"------------------------------------
"|          User commands           |
"------------------------------------

command! SynCheck :call SynCheck() " Check for and report syntax errors

command! Vterm :vsp term://bash " Open a terminal in a vertical split
command! Hterm :sp term://bash " Open a terminal in a horizontal split

"---------------------------------------
"|          Helper functions           |
"---------------------------------------

" Put the cursor in the correct position when insert mode is activated
function! IndentWithI()
    if len(Trim(getline('.'))) == 0
        " cc will correctly indent the cursor and switch to insert mode
        return "cc"
    else
        return "i"
    endif
endfunction

" Trim a string
function! Trim(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" Put the cursor in the right place when it enters a terminal buffer
function EnterTerminal()
    exec "norm! gg"
    exec "startinsert"
endfunction

" Autoindent the file without moving the cursor
function! IndentFile()
    execute "normal! mqHmwgg=G`wzt`q"
endfunction

" Open all the files in the current file's directory
function! OpenAll(ext)
    execute "lcd %:p:h"
    execute "args *." . a:ext
    execute "tab all"
endfunction

" Check the file for syntax errors
function! SynCheck()
    execute "w"
    execute "Neomake"
endfunction

" Execute the last recorded macro (useful for using visual mode to execute
" macros)
function! ExecMacro()
    execute "normal @q"
endfunction

" Open the current setup in MacVim
function! OpenInMacVim()
    execute "mksession! ~/.session.vim"
    execute "silent !mvim -S ~/.session.vim"
    execute "wqa"
endfunction

" Increment a selection of numbers
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

" Show the branch in lightline
function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction
