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
  Plugin 'Chiel92/vim-autoformat'
  Plugin 'KabbAmine/vCoolor.vim'
  Plugin 'Shougo/neomru.vim'
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimproc.vim'
  Plugin 'SirVer/Ultisnips'
  Plugin 'SyntaxRange'
  Plugin 'TagHighlight'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'ajh17/VimCompletesMe'
  Plugin 'bling/vim-airline'
  Plugin 'brettof86/vim-swigjs'
  Plugin 'chase/vim-ansible-yaml'
  Plugin 'dbakker/vim-lint'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'farseer90718/vim-taskwarrior'
  Plugin 'fatih/vim-go'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'gmarik/Vundle.vim'
  Plugin 'gmarik/github-search.vim'
  Plugin 'godlygeek/tabular'
  Plugin 'gorodinskiy/vim-coloresque'
  Plugin 'guns/xterm-color-table.vim'
  Plugin 'heavenshell/vim-slack'
  Plugin 'honza/vim-snippets'
  Plugin 'int3/vim-extradite'
  Plugin 'jalcine/snipmate-nodejs'
  Plugin 'jaxbot/github-issues.vim'
  Plugin 'jszakmeister/vim-togglecursor'
  Plugin 'junegunn/vim-github-dashboard'
  Plugin 'justinmk/vim-syntax-extra'
  Plugin 'kana/vim-operator-user'
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'kshenoy/vim-signature'
  Plugin 'majutsushi/tagbar'
  Plugin 'marijnh/tern_for_vim'
  Plugin 'mattn/gist-vim'
  Plugin 'mattn/webapi-vim'
  Plugin 'mileszs/ack.vim'
  Plugin 'mmozuras/vim-github-comment'
  Plugin 'mrtazz/DoxygenToolkit.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'pasela/unite-webcolorname'
  Plugin 'perl-support.vim'
  Plugin 'peterhoeg/vim-qml'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'rayburgemeestre/phpfolding.vim'
  Plugin 'rhysd/vim-clang-format'
  Plugin 'ryanss/vim-hackernews'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'shawncplus/phpcomplete.vim'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'syngan/vim-vimlint'
  Plugin 'taglist.vim'
  Plugin 'terryma/vim-multiple-cursors'
  Plugin 'tfnico/vim-gradle'
  Plugin 'thinca/vim-localrc'
  Plugin 'tmatilai/vim-monit'
  Plugin 'tmux-plugins/vim-tmux'
  Plugin 'tpope/vim-dispatch'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-rbenv'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-rsi'
  Plugin 'tpope/vim-surround'
  Plugin 'tsukkee/unite-tag'
  Plugin 'vim-perl/vim-perl'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'wellle/tmux-complete.vim'
  Plugin 'xolox/vim-easytags'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-notes'
  Plugin 'xolox/vim-publish'
  Plugin 'xolox/vim-session'
  Plugin 'xolox/vim-shell'
  Plugin 'yuku-t/unite-git'
  Plugin 'zepto/unite-tmux'
  Plugin 'junegunn/vim-emoji'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'PotatoesMaster/i3-vim-syntax'
  Plugin 'mattn/emmet-vim'
  Plugin 'nsf/gocode', {'rtp': 'vim/'}
  Plugin 'easymotion/vim-easymotion'
  Plugin 'isRuslan/vim-es6'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'mhinz/vim-startify'
  Plugin 'mustache/vim-mustache-handlebars'

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

runtime! ftplugin/man.vim
runtime! autoload/tmux.vim " from unite-tmux.
