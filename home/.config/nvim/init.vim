" vim: set foldenable foldlevel=1 nospell:
" File:          home/.config/nvim/init.vim
" Author:        Jacky Alciné <yo@jacky.wtf>
" Description:   The core of my configuration.
" Last Modified: 2016-10-14 21:31:43 PDT
"
" This is my personal setup for NeoVim. It works ~exactly~ the
" way I expect it to. Any different would trip me up.
"
" > Some stuff for Vint.
" vint: -ProhibitUnnecessaryDoubleQuote

" Don't talk to me.
set vbs=0

" Tell me everything.
" set verbose=15 verbosefile=~/.vimlog

" Set my leader to the comma key.
let g:mapleader=','

" Set buffer-local mappings to the key above <Enter>
let g:maplocalleader='\\'

" UTF-8 NWA style
set encoding=utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" {{{ Options
set laststatus=2
set noshowcmd
set exrc
set number relativenumber numberwidth=3
set path=.,/usr/local/include,/usr/include,$HOME/.local/include
set novisualbell
set errorbells
set noruler
set conceallevel=2 concealcursor=nvci
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set textwidth=80 nowrap
set updatetime=750

set complete=k,.,w,b,u,U,i,d,t
set completeopt=menu,longest
set nocursorline nocursorcolumn

set showmatch wrapscan
set nogdefault noignorecase
set showcmd
set showfulltag
set showmatch
set modeline modelines=5
set noshelltemp
set showtabline=2
set backspace=indent,eol,start

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

set matchtime=2

" Ignore a lot of stuff.
set wildignore+=*.swp,*.pyc,*.bak,*.class,*.orig
set wildignore+=.git,.hg,.bzr,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.svg
set wildignore+=build/*,tmp/*,vendor/cache/*,bin/*
set wildignore+=.sass-cache/*,*node_modules/*,*/target/*

set nobackup noswapfile
set undofile undodir=~/.config/nvim/undodir

set cpoptions+=d
set lazyredraw

set foldenable foldcolumn=1 foldlevel=2 foldminlines=3
      \ foldnestmax=5 foldlevelstart=1

set spelllang=en_us,fr,ar
set spellsuggest=double,5
set spellfile=~/.config/nvim/dict.custom.utf-8.add

set splitbelow splitright
set synmaxcol=0

set cinoptions+='JN'

if executable('ag')
  set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
  set grepformat=%f:%l:%c:%m
endif
" }}}

" {{{ White spacing and Characters
" A problem that plagued me for months, having visual cues for white spacing
" solves formatting problems a lot quicker. Also, we're using modern shells
" (right?) so using UTF-8 characters for symbols should be a given.
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-

" A visual cue for line-wrapping.
set showbreak=↪

" Visual cues when in 'list' model.
set list
set listchars+=eol:¬
set listchars+=extends:❯
set listchars+=precedes:❮
set listchars+=trail:⋅
set listchars+=nbsp:⋅
set listchars+=tab:\|\ 

" Keep some spacing.
set sidescrolloff=1
"}}}

call mappings#bind()
call abbreviations#bind()

let g:jalcine = {
      \ "plugins": {
      \ "dir": expand("$HOME/.config/nvim/plugins")
      \ }
      \ }

if filereadable(expand("$HOME/.config/nvim/local.vim"))
  source $HOME/.config/nvim/local.vim
endif

call jalcine#liftoff()

