set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin('~/.nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'zyedidia/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'JuliaLang/julia-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-user'
Plugin 'sickill/vim-pasta'
Plugin 'zyedidia/vim-snake'
Plugin 'benekastah/neomake'
Plugin 'matze/vim-move'
Plugin 'kien/ctrlp.vim'
Plugin 'zyedidia/literate.vim'
Plugin 'zyedidia/julialint.vim'
Plugin 'blueyed/vim-diminactive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
