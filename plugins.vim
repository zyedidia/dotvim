if has('nvim')
    call plug#begin('~/.nvim/bundle')
else
    call plug#begin('~/.vim/bundle')

    if exists("g:csharp")
        Plug 'https://github.com/tpope/vim-dispatch.git'
        Plug 'https://github.com/OmniSharp/omnisharp-vim', { 'do': 'cd server && xbuild' }
        Plug 'https://github.com/scrooloose/syntastic.git'

        source ~/.vim/csharp_config.vim
    endif
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
" Lua
Plug 'https://github.com/xolox/vim-misc.git' | Plug 'https://github.com/xolox/vim-lua-ftplugin.git'
" Lua Indent
Plug 'https://github.com/raymond-w-ko/vim-lua-indent', { 'for': 'lua' }
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

call plug#end()
