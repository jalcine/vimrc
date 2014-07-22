" File:          plugin/00_vundle_configuration.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Options for controlling and using Vundle, my plugin manager.
" Last Modified: June 21, 2014

if exists('g:jalcine_vundle')
  finish
else
  let g:jalcine_vundle=1
endif

filetype off

" Megaman, POWER UP!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"{{{2 Plugin list
"{{{3 Core plugins
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
"}}}
"{{{3 Utility plugins
Plugin 'junegunn/goyo.vim'
Plugin 'guns/xterm-color-table.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/Ultisnips'
if v:version >= 702 | Plugin 'Chiel92/vim-autoformat' | endif
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
if v:version >= 703 | Plugin 'Valloric/YouCompleteMe' | endif
Plugin 'dbakker/vim-lint'
Plugin 'elzr/vim-json'
Plugin 'marijnh/tern_for_vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'moll/vim-node'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'junegunn/vim-github-dashboard'
Plugin 'rodjek/vim-puppet'
Plugin 'ap/vim-css-color'
Plugin 'junegunn/vader.vim'
Plugin 'perl-support.vim'
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
"}}}
"{{{3 Unite plugins
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'zepto/unite-tmux'
Plugin 'yuku-t/unite-git'
Plugin 'pasela/unite-webcolorname'
Plugin 'saihoooooooo/glowshi-ft.vim'
"}}}
"}}}
"
syntax enable
filetype indent plugin on
" }}}
