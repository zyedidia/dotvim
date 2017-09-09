if has('nvim')
    call plug#begin('~/.config/nvim/bundle')
else
    call plug#begin('~/.vim/bundle')
endif

" Solarized
Plug 'https://github.com/zyedidia/vim-colors-solarized'
" Nerdtree
Plug 'https://github.com/scrooloose/nerdtree'
" Supertab
Plug 'https://github.com/ervandew/supertab'
" Multiple Cursors
Plug 'https://github.com/terryma/vim-multiple-cursors'
" Julia
Plug 'https://github.com/JuliaLang/julia-vim'
" DelimitMate
Plug 'https://github.com/Raimondi/delimitMate'
" Tcomment
Plug 'https://github.com/tomtom/tcomment_vim.git'
" Textobj Entire
Plug 'https://github.com/kana/vim-textobj-entire'
" Textobj User
Plug 'https://github.com/kana/vim-textobj-user'
" Vim Pasta
Plug 'https://github.com/sickill/vim-pasta'
" Snake
Plug 'https://github.com/zyedidia/vim-snake', { 'on': 'Snake' }
" Neomake
Plug 'https://github.com/benekastah/neomake'
" Move
Plug 'https://github.com/matze/vim-move'
" Ctrlp
Plug 'https://github.com/kien/ctrlp.vim'
" Ctrlp py matcher
Plug 'https://github.com/FelikZ/ctrlp-py-matcher.git'
" Literate
Plug 'https://github.com/zyedidia/literate.vim', { 'for': 'literate' }
" Lightline
Plug 'https://github.com/itchyny/lightline.vim.git'
" Julialint
Plug 'https://github.com/zyedidia/julialint.vim'
" Mundo
Plug 'https://github.com/simnalamburt/vim-mundo.git'
" Ag
Plug 'rking/ag.vim'
" Antlr
Plug 'https://github.com/jrozner/vim-antlr'
" Ctrlsf
Plug 'https://github.com/dyng/ctrlsf.vim'
" Fugitive
Plug 'https://github.com/tpope/vim-fugitive.git'
" Rust
Plug 'https://github.com/rust-lang/rust.vim.git'
" Html 5
Plug 'https://github.com/othree/html5.vim.git'
" Tagbar
Plug 'https://github.com/majutsushi/tagbar'
" Vim-go
Plug 'https://github.com/fatih/vim-go'

call plug#end()
