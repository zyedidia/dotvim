call plug#begin('~/.nvim/bundle')

Plug 'zyedidia/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'JuliaLang/julia-vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'sickill/vim-pasta'
Plug 'zyedidia/vim-snake', { 'on': 'Snake' }
Plug 'benekastah/neomake'
Plug 'matze/vim-move'
Plug 'kien/ctrlp.vim'
Plug 'zyedidia/literate.vim', { 'for': 'literate' }
Plug 'zyedidia/julialint.vim', { 'for': 'julia' }
Plug 'blueyed/vim-diminactive'
" Plug 'Valloric/YouCompleteMe', { 'for': 'python', 'do': './install.sh' }

" Plug 'https://github.com/Shougo/neocomplcache.vim'

call plug#end()
