"""""""""""""""""""""""""""""""""""""""
"" ViM configuration options.
"""""""""""""""""""""""""""""""""""""""

""" Spacing and indents.
" Make sure ViM automagically idents.
set smartindent
" Make sure our indenting and spacing is about 2 spaces.
set tabstop=2
set shiftwidth=2
set expandtab ts=2 sw=2 ai
" Make sure indents are easy to handle.
set cindent
set autoindent

"" Colors and Appearance
set background=dark
" Incremental searches are awesome.
set nocp incsearch
" We'd like to see our matches.
set showmatch
" About 5 matches in our search would be cool.
set mat=5

set list
set laststatus=2
set nocompatible

set backup
"" Paths and Directories.
set backupdir=~/.vim/backups
set directory=~/.vim/tmp

filetype off
filetype plugin indent on
syntax enable
set clipboard+=unnamed
set history=512
set autowrite
set ruler
set nu
set nowrap
set timeoutlen=250

set nocompatible
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Font patching
let g:Powerline_symbols = 'fancy'
"Bundles used in the system.
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-unimpaired'
Bundle 'Indent-Guides'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kchmck/vim-cmake-project'
Bundle 'perl-support.vim'
Bundle 'Align'
Bundle 'jQuery'
Bundle 'L9'
Bundle 'gmarik/github-search.vim'
Bundle 'DfrankUtil'
Bundle 'vimprj'
Bundle 'jiangmiao/auto-pairs'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'msanders/snipmate.vim'
Bundle 'cmake.vim'
