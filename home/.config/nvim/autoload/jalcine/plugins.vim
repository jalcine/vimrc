" File:          jalcine/plugins.vim
" Description:   Setup the plugins I'll be using.
" Author:        Jacky Alcine <yo@jacky.wtf>
" Last Modified: August 24, 2017

" Options {{{
let g:jalcine.plugins = {
      \ 'root': expand('$HOME/.config/nvim/plugins'),
      \ }

func! jalcine#plugins#setup()
  call plug#begin(g:jalcine.plugins.root)

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-repeat'
  Plug 'benekastah/neomake'
  Plug 'janko-m/vim-test'
  Plug 'tpope/vim-dotenv'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rsi'
  Plug 'vim-utils/vim-husk'
  Plug 'tpope/vim-commentary' 
  Plug 'cbaumhardt/vim-commentary-boxed'
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
  Plug 'xolox/vim-shell'
  Plug 'tpope/vim-fugitive' 
  Plug 'tpope/vim-rhubarb'
  Plug 'tommcdo/vim-fugitive-blame-ext'
  Plug 'idanarye/vim-merginal'
  Plug 'direnv/direnv.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'embear/vim-localvimrc'
  Plug 'tpope/vim-scriptease'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
  Plug 'junegunn/fzf.vim'
  Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
  Plug 'chriskempson/base16-vim'
  Plug 'bogado/file-line'
  Plug 'Shougo/echodoc.vim'
  Plug 'tpope/vim-dispatch'
  Plug 'radenling/vim-dispatch-neovim'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'sheerun/vim-polyglot'
  Plug 'arnaud-lb/vim-php-namespace'
  Plug 'davidhalter/jedi-vim'
  Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
  Plug 'lambdalisue/vim-pyenv'
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'fisadev/vim-isort'
  Plug 'python-rope/ropevim'
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'craigemery/vim-autotag'
  Plug 'majutsushi/tagbar'
  Plug 'Yggdroot/indentLine'
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-surround'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-completion-manager'
  Plug 'roxma/nvim-cm-racer'
  Plug 'roxma/ncm-github'
  Plug 'Shougo/neco-vim'
  Plug 'brooth/far.vim'
  Plug 'roxma/vim-tmux-clipboard'
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-projectionist'
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  call plug#end()
endfunc
