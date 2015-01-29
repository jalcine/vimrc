" File:          plugin/00_plugin.vim
" Author:        Jacky Alcine <me@jalcine.me>
" Description:   Setting up the plugins I'd use.
" Last Modified: 2015-01-23 18:50:27 EST

" TODO: Add check if this was sourced already.

func! s:install_plugin_manager()
  if !isdirectory(expand('~/.vim/bundle/Vundle.vim'))
    !git clone git://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
  endif
endfunc

func! s:init_plugins()
  " Load Vundle into Vim.
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  " List plugins.
  Plugin 'gmarik/Vundle.vim'
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
  Plugin 'rayburgemeestre/phpfolding.vim'
  Plugin 'shawncplus/phpcomplete.vim'
  Plugin 'heavenshell/vim-slack'
  Plugin 'gorkunov/smartgf.vim'
  Plugin 'idanarye/vim-vebugger'
  Plugin 'tpope/vim-rsi'
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'jszakmeister/vim-togglecursor'
  Plugin 'ajh17/VimCompletesMe'
  Plugin 'TagHighlight'
  Plugin 'taglist.vim'
  Plugin 'Keithbsmiley/investigate.vim'
  Plugin 'KabbAmine/zeavim.vim'
  Plugin 'tpope/vim-rbenv'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'rust-lang/rust.vim'

  " Add any additional plugins I'd be using on this local machine.
  if filereadable(expand('~/.vim/plugins.local.vim'))
    source ~/.vim/plugins.local.vim
  endif

  call vundle#end()
  filetype plugin indent on
  syntax enable
endfunc

call s:install_plugin_manager()
call s:init_plugins()
