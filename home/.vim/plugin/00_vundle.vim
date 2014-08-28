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
  echomsg "[jalcine] Installing Vundle..."
  call system('git clone git://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle')
  set rtp+=~/.vim/bundle/vundle
  call vundle#rc()
endfunc

func! s:init_plugins()
  filetype off
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'SirVer/Ultisnips'
  Plugin 'ap/vim-css-color'
  Plugin 'bling/vim-airline'
  Plugin 'dbakker/vim-lint'
  Plugin 'github-issues.vim'
  Plugin 'gmarik/vundle'
  Plugin 'godlygeek/tabular'
  Plugin 'honza/vim-snippets'
  Plugin 'int3/vim-extradite'
  Plugin 'junegunn/seoul256.vim'
  Plugin 'junegunn/vim-emoji'
  Plugin 'junegunn/vim-github-dashboard'
  Plugin 'majutsushi/tagbar'
  Plugin 'mattn/webapi-vim'
  Plugin 'pasela/unite-webcolorname'
  Plugin 'perl-support.vim'
  Plugin 'reedes/vim-colors-pencil'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'thinca/vim-localrc'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tsukkee/unite-tag'
  Plugin 'wellle/tmux-complete.vim'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'
  Plugin 'yuku-t/unite-git'
  Plugin 'zepto/unite-tmux'
  Plugin 'file:///~/Development/Projects/Vim/cmake.vim'
  if v:version >= 702 | Plugin 'Chiel92/vim-autoformat' | endif
  if v:version >= 703 | Plugin 'Valloric/YouCompleteMe' | endif

  syntax enable
  filetype indent plugin on

endfunc

if !isdirectory('~/.vim/bundle/vundle')
  call s:install_vundle()
endif

call s:init_plugins()
