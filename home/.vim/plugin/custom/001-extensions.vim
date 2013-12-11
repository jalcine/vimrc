" vim: set fdm=marker tw=78 ft=vim

if exists("g:jalcine_plugin_loaded")
  finish
else
  let g:jalcine_plugin_loaded = 1
endif

let g:vundle_default_git_proto = 'git'

"{{{ Personal plug-in dev
let my_plugin_prefix = 'jalcine/'

if $VIM_PLUGIN_DEV
  let my_plugin_prefix = 'file:///home/jacky/Development/Projects/'
else
  let my_plugin_prefix = 'jalcine/'
end

" We turn off file-type detection for now, this is
" required for using Vundle.
filetype off

"{{{ Plug-ins
set rtp+=~/.vim/bundle/vundle

" Invoke the swag!
call vundle#rc()

"{{{ Coloring and UI
Bundle 'flazz/vim-colorschemes'
Bundle 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }
Bundle 'altercation/solarized', { 'rtp' : 'vim-colors-solarized' }
Bundle 'tpope/vim-haml'
Bundle 'spolu/dwm.vim'
Bundle 'vim-php/tagbar-phpctags.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'
Bundle 'justincampbell/vim-eighties'
Bundle 'kballenegger/vim-autoreadwatch'
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'mattn/webapi-vim'
Bundle 'mechatroner/minimal_gdb'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mklabs/vim-backbone'
Bundle 'mklabs/grunt.vim'
Bundle 'godlygeek/csapprox'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'moll/vim-node'
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "Raimondi/delimitMate"
Bundle 'Yggdroot/indentLine'
Bundle 'benmills/vimux'
Bundle 'guns/xterm-color-table.vim'
Bundle 'xolox/vim-session'
Bundle 'majutsushi/tagbar'
Bundle 't4ku/marktag'
"Bundle (my_plugin_prefix . 'android.vim')
Bundle (my_plugin_prefix . 'cmake.vim')
Bundle (my_plugin_prefix . 'vim-snippets')
Bundle (my_plugin_prefix . 'localrc.vim')
Bundle (my_plugin_prefix . 'vim-rdoc')
Bundle 'tpope/vim-speeddating'
Bundle 'godlygeek/tabular'
Bundle 'jamessan/vim-gnupg'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'aaronbieber/quicktask'
Bundle 'ValloricYouCompleteMe'
Bundle 'Chiel92/vim-autoformat'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mhinz/vim-signify'
Bundle 'int3/vim-extradite'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'helino/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'vim-perl/vim-perl'
Bundle 'othree/html5.vim'
Bundle 'skammer/vim-css-color'
Bundle 'dbext.vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rbenv'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'astashov/vim-ruby-debugger'
Bundle 'mattn/gist-vim'
Bundle 'gmarik/github-search.vim'
Bundle 'junegunn/vim-github-dashboard'
Bundle 'mmozuras/vim-github-comment'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'tpope/vim-abolish'
Bundle 'closetag.vim'
Bundle 'justinmk/vim-syntax-extra'

filetype plugin indent on
syntax on
