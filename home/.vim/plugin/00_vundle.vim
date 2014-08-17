" File:          plugin/00_vundle_configuration.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Options for controlling and using Vundle, my plugin manager.
" Last Modified: June 21, 2014

if exists('g:jalcine_vundle')
  finish
else
  let g:jalcine_vundle=1
endif

func! s:install_vundle()
  call system('git clone git://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle')
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
endfunc

func! s:init_plugins()
  filetype off
  Plugin 'gmarik/vundle'
  Plugin 'bling/vim-airline'
  Plugin 'thinca/vim-localrc'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'xolox/vim-session'
  Plugin 'xolox/vim-misc'
  Plugin 'mhinz/vim-signify'
  Plugin 'int3/vim-extradite'
  Plugin 'majutsushi/tagbar'
  Plugin 'mattn/webapi-vim'
  Plugin 'reedes/vim-colors-pencil'
  Plugin 'jalcine/vim-polyglot'
  Plugin 'junegunn/goyo.vim'
  Plugin 'Raimondi/delimitMate'
  Plugin 'SirVer/Ultisnips'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-abolish'
  Plugin 'honza/vim-snippets'
  Plugin 'scrooloose/syntastic'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'godlygeek/tabular'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'reedes/vim-textobj-quote'
  Plugin 'dbakker/vim-lint'
  Plugin 'junegunn/vim-github-dashboard'
  Plugin 'ap/vim-css-color'
  Plugin 'junegunn/vader.vim'
  Plugin 'perl-support.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/neomru.vim'
  Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
  Plugin 'jalcine/cmake.vim'
  Plugin 'tsukkee/unite-tag'
  Plugin 'zepto/unite-tmux'
  Plugin 'yuku-t/unite-git'
  Plugin 'pasela/unite-webcolorname'
  Plugin 'badwolf'
  Plugin 'github-issues.vim'
  if v:version >= 702 | Plugin 'Chiel92/vim-autoformat' | endif
  if v:version >= 703 | Plugin 'Valloric/YouCompleteMe' | endif

  syntax enable
  filetype indent plugin on

endfunc

if !isdirectory('~/.vim/bundle/vundle')
  call s:install_vundle()
endif

call s:init_plugins()
