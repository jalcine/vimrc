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
  " Libraries (sort of)
  Plugin 'mattn/webapi-vim'
  Plugin 'xolox/vim-misc'

  " Utilities
  Plugin 'gmarik/vundle'
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'bling/vim-airline'
  Plugin 'xolox/vim-session'
  Plugin 'xolox/vim-publish'
  Plugin 'xolox/vim-easytags'
  Plugin 'xolox/vim-notes'
  Plugin 'sheerun/vim-polyglot'

  " Color
  Plugin 'jellybeans.vim'

  " Editor enhancements
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'SirVer/Ultisnips'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'majutsushi/tagbar'
  Plugin 'godlygeek/tabular'
  Plugin 'honza/vim-snippets'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'wellle/tmux-complete.vim'
  Plugin 'syngan/vim-vimlint'
  Plugin 'tmux-plugins/vim-tmux'

  " File support
  Plugin 'dbakker/vim-lint'
  Plugin 'perl-support.vim'

  " Web dev
  Plugin 'ap/vim-css-color'
  Plugin 'parkr/vim-jekyll'

  " Extra
  Plugin 'junegunn/vim-emoji'

  " Git and friends
  Plugin 'tpope/vim-fugitive'
  Plugin 'junegunn/vim-github-dashboard'
  Plugin 'int3/vim-extradite'
  Plugin 'jaxbot/github-issues.vim'
  Plugin 'mmozuras/vim-github-comment'
  Plugin 'gmarik/github-search.vim'
  Plugin 'mattn/gist-vim'
  Plugin 'thinca/vim-localrc'

  " Unite jazz
  Plugin 'tsukkee/unite-tag'
  Plugin 'yuku-t/unite-git'
  Plugin 'zepto/unite-tmux'
  Plugin 'pasela/unite-webcolorname'

  if v:version > 702 | Plugin 'Chiel92/vim-autoformat' | endif
  if v:version >= 703 | Plugin 'Valloric/YouCompleteMe' | endif

  if filereadable('~/.vim/vundle.local.vim')
    source ~/.vim/vundle.local.vim
  endif

  call vundle#end()

  syntax enable
  filetype indent plugin on

endfunc

if !isdirectory('~/.vim/bundle/vundle')
  call s:install_vundle()
endif

call s:init_plugins()
