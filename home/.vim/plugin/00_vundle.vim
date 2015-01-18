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
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'SirVer/Ultisnips'
  Plugin 'gorodinskiy/vim-coloresque'
  Plugin 'bling/vim-airline'
  Plugin 'dbakker/vim-lint'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'fatih/vim-go'
  Plugin 'gmarik/github-search.vim'
  Plugin 'gmarik/vundle'
  Plugin 'godlygeek/tabular'
  Plugin 'honza/vim-snippets'
  Plugin 'int3/vim-extradite'
  Plugin 'jamescarr/snipmate-nodejs'
  Plugin 'jaxbot/github-issues.vim'
  Plugin 'brettof86/vim-swigjs'
  Plugin 'junegunn/vim-github-dashboard'
  Plugin 'kshenoy/vim-signature'
  Plugin 'majutsushi/tagbar'
  Plugin 'mattn/gist-vim'
  Plugin 'mattn/webapi-vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'mmozuras/vim-github-comment'
  Plugin 'pangloss/vim-javascript'
  Plugin 'parkr/vim-jekyll'
  Plugin 'pasela/unite-webcolorname'
  Plugin 'perl-support.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'syngan/vim-vimlint'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tfnico/vim-gradle'
  Plugin 'thinca/vim-localrc'
  Plugin 'tmux-plugins/vim-tmux'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'tsukkee/unite-tag'
  Plugin 'vim-perl/vim-perl'
  Plugin 'wellle/tmux-complete.vim'
  Plugin 'xolox/vim-easytags'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
  Plugin 'xolox/vim-publish'
  Plugin 'xolox/vim-session'
  Plugin 'yuku-t/unite-git'
  Plugin 'zepto/unite-tmux'
  "Plugin 'rayburgemeestre/phpfolding.vim'
  "Plugin 'shawncplus/phpcomplete.vim'
  Plugin 'heavenshell/vim-slack'
  Plugin 'gorkunov/smartgf.vim'
  Plugin 'idanarye/vim-vebugger'
  Plugin 'tpope/vim-rsi'
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'jszakmeister/vim-togglecursor'
  Plugin 'ajh17/VimCompletesMe'

  if filereadable(expand('~/.vim/vundle.local.vim'))
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
